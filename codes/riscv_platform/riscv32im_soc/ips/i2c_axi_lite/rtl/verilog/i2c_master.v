module I2C 	#(		parameter 	Hz_counter=120

			 ) 

( //----------------외부 입력 신호 정의
	input									clk				,
	input									n_rst			,

	// [변경] ver2 의도: 외부에서 START 제어 가능하도록 i2c_ctrl[31] 비트를 START 트리거로 사용
	// i2c_ctrl[31] : START trigger (1->0 falling edge로 I2C 트랜잭션 시작)
	// i2c_ctrl[17] : Page mode (1=4바이트 page, 0=1바이트)
	// i2c_ctrl[16] : Random read mode (1=random read, 0=sequential read)
	// i2c_ctrl[15:8]: Memory address (EEPROM word address)
	// i2c_ctrl[7:0] : Device address with R/W bit
	input       wire	[31:0]		        i2c_ctrl        , 
	
	// [변경] ver2 의도: 명확한 변수명 사용 (i2c_wdata -> wdata)
	input       wire	[31:0]		        wdata		    , // Write data (32-bit for page write)
	
	// [변경] ver2 의도: Read data를 output으로 변경하여 외부에서 직접 읽을 수 있도록 함
	// 기존에는 input이었으나, EEPROM에서 읽은 데이터를 출력하려면 output이어야 함
	output      reg     [31:0]		        rdata		    , // Read data from EEPROM (output)
	
	input		wire						sda_i	     	,
	output		wire						sda_o	     	,
	output		wire						sda_t	     	,
	output		wire						scl			

);

/*

/*
i2c_ctrl 비트 필드:
   [31]    : START trigger (Rising edge로 I2C 트랜잭션 시작)
   [17]    : Page mode (1=4바이트 page write/read, 0=1바이트)
   [16]    : Random read mode (1=random read, 0=sequential read)
   [15:8]  : Memory address (EEPROM word address)
   [7:0]   : Device address with R/W bit
*/

	localparam		idle 			= 0	,
					start			= 1 ,
					
											// byte write & page write
					
					w_d_addr 		= 2	,
					w_d_addr_a		= 3 ,
						
					w_w_addr		= 4 ,
					w_w_addr_a		= 5 ,
					w_data			= 6 ,
					w_data_a		= 7 ,
					
											// current address read & sequential read
					
					r_d_addr		= 8 ,
					r_d_addr_a		= 9 ,
						
					r_data			= 10 ,
					r_data_a		= 11 ,
					
											// random read
					
					rr_w_d_addr		= 12 ,
					rr_w_d_addr_a 	= 13 ,
					
					rr_w_w_addr		= 14 ,
					rr_w_w_addr_a	= 15 ,

					rr_start		= 16 ,
					rr_r_d_addr		= 17 ,
					rr_r_d_addr_a	= 18 ,
					
					rr_r_data		= 19 ,
					rr_r_data_a		= 20 ;
					
	// ----------------내부 레지스터 정의 -----
	// 이걸 카운터 돌려서 반복할까 state 넣어서 할까 state 넣으면 너무 복잡해지는데
	reg		[31:0]		mem		[2:0]	; // 0: addr & function / 1: write / 2: read 이 부분은 내부 메모리로 바꾸고 axi4 lite에 연결
	
	reg					clk_k			;
	

	// reg					sdl_dly1		;
	// reg					sdl_dly2		;

	
	reg		[4:0]		state			;

	reg		[6:0]		counter			;	
	wire	counter_clr = (counter == Hz_counter);
	wire	counter_half = (counter == (Hz_counter/2));
	
	// Fall edge detection 제거하고 i2c_ctrl[31] 비트의 rising edge를 START 트리거로 사용
	// 소프트웨어에서 명시적으로 제어 가능 (더 예측 가능한 동작)
	reg start_trigger_prev;
	wire start_trigger = mem[0][31] & ~start_trigger_prev;  // Rising edge of mem[0][31]
    


    // da_out (1=high-z, 0=low) + 데이터 비트 그대로 (mem[0][bit])
    // I2C는 오픈 드레인이므로 1=High-Z(풀업), 0=Low(구동)이 직관적
    reg sda_out;         // 1이면 High-Z (해제), 0이면 Low (구동)
    assign sda_o = 1'b0;
    assign sda_t = sda_out;

	
	reg                 data_flag		; // 8비트 데이터 전송 완료 감지(데이터 전송 중 1로 설정, 완료시 0으로 클리어)
	reg		[2:0]		counter_data	; // 8비트 데이터 전송 시 비트 위치 추적 (MSB : 7 -> 6 ... -> 0)
	reg                 ack_flag		; // ACK 신호 감지(슬레이브로부터 ack(sda_i == 0 )받으면 1로 설정)
	reg					state_flag		; // 상태 내에서의 단계 구분
	reg		[1:0]		counter_page	; // 페이지 쓰기/읽기 시 바이트 카운터 
	reg					page_flag		; // 페이지 모드 종료 조건 표시(addr[17] == 1)
	
	reg 	scl_en; 
	reg		scl_o; 
	assign scl = scl_en ? scl_o : clk_k;
	
	always @(posedge clk, negedge n_rst) begin	// counter <= 400Khz (clk_k)
	
		if(!n_rst) begin
			counter <= 0;
			clk_k <= 0;
		end
		
		else if (state == idle) begin
			counter <= 0;
			clk_k <= 0;
		end
		
		else if (counter_clr) begin
			clk_k <= ~clk_k;
			counter <= 0;
		end
		
		else
			counter <= counter + 1;
			
	end
	
	
	// START 트리거의 rising edge 검출
	// i2c_ctrl[31]의 rising edge 검출  (소프트웨어에서 명시적 제어)
	always @(posedge clk, negedge n_rst) begin
		if (!n_rst) begin
			start_trigger_prev <= 0;
		end
		else begin		
			start_trigger_prev <= mem[0][31];
		end
	end
	
	
	// 입력 데이터 관리 및 출력 추가
	// Sequential logic for mem registers
	always @(posedge clk, negedge n_rst) begin
		if(!n_rst) begin
			mem[0] <= 32'h0000;
			mem[1] <= 32'h0000;
			mem[2] <= 32'h0000;
			rdata <= 32'h0000; 
		end
		else begin

			// i2c_ctrl -> addr, i2c_wdata -> wdata
			if (state == idle) begin
				mem[0] <= i2c_ctrl;   
				mem[1] <= wdata;  
			end
			
			else if (state == r_data) begin
				if (scl == 1'b1 && counter_half) begin
					mem[2][counter_data + (counter_page * 8)] <= sda_i;
				end
			end
			
			
			rdata <= mem[2];
		end
	end
	
	always @(posedge clk, negedge n_rst) begin // output, state reset
	
		if(!n_rst) begin
			sda_out <= 1;  // High-Z (해제)
			scl_o <= 1;
			scl_en <= 1;
			
			state_flag <= 0;
			counter_data <= 7;
			counter_page <= 0;
			page_flag <= 0;
			state <= idle;
		end
		
		else begin
	
		case (state) 
		
			idle : begin
				// I2C START 조건을 소프트웨어에서 직접 제어
				// addr[31] 비트로 명시적 제어

				
				// I2C START 조건 순서:
				// 1. SCL이 High인 상태에서 SDA를 High->Low로 변경
				// 2. 이후 SCL을 Low로 변경
				//
				// START condition: Pull SDA low when triggered
				if (start_trigger) begin
					sda_out <= 0;  // Pull SDA Low (START condition begins)
					scl_o <= 1;    // Keep SCL High initially
					scl_en <= 1;
				end
				
				// After SDA is low, pull SCL low and move to start state
				if (mem[0][31] && sda_i == 0 && scl == 1) begin
					scl_o <= 0;    // Pull SCL Low
					scl_en <= 1;
					state <= start;
				end
			end
			
			
			start: begin
				scl_en <= 0;
				
				if (scl == 0) begin
					if (counter_half) begin
						// SDA 데이터 비트 직접 출력
				
						sda_out <= mem[0][counter_data]; //device address [7]
					end		
					if (counter_clr) begin
						counter_data <= counter_data - 1 ;
						if (mem[0][7] == 0) begin	
							state <= w_d_addr;
						end
						else if (mem[0][7] == 1) begin
							if (mem[0][16] == 0) begin
								state <= r_d_addr;
							end
							else begin
								state <= rr_w_d_addr;
							end
						end
					end		
				end
			
			end
		
		
			w_d_addr: begin
			
				if (scl == 0) begin
					if (counter_half) begin
						sda_out <= mem[0][counter_data]; //device address [6]~[0]
						if ((counter_data == 0) && (counter_clr == 1)) begin
							state_flag <= 1;

						end
					end		
				end
		
				if (scl == 0) begin
					if (counter_clr) begin
						if (state_flag == 1) begin
							state <= w_d_addr_a;
							counter_data <= 7 ;
							state_flag <= 0;
						end
						else begin
							counter_data <= counter_data - 1 ;
						end
					end		
				end
			
			end
		
		
			w_d_addr_a: begin
				
				if (sda_i == 0) begin
					if (scl == 0) begin
						if (counter_half) begin
							sda_out <= mem[0][counter_data]; //word address [7]
						end		
						if (counter_clr) begin
							counter_data <= counter_data - 1 ;
							state <= w_w_addr;
						end
					end	
				end
				
			end
		
		
			w_w_addr: begin
				if (scl == 0) begin
					if (counter_half) begin
						sda_out <= mem[0][counter_data]; //word address [6]~[0]
						if (counter_data == 0 && (counter_clr == 1)) begin
							state_flag <= 1;

						end
					end		
				end
		
				if (scl == 0) begin
					if (counter_clr) begin
						if (state_flag == 1) begin
							counter_data <= 7 ;
							state_flag <= 0;
							state <= w_w_addr_a;
						end
						else begin
							counter_data <= counter_data - 1 ;
						end
					end		
				end
			end
		
		
			w_w_addr_a: begin
				if (sda_i == 0) begin
					if (scl == 0) begin
						if (counter_half) begin
							sda_out <= mem[1][counter_data]; //word address [7]
						end		
						if (counter_clr) begin
							counter_data <= counter_data - 1 ;
							state <= w_data;
						end
					end	
				end
			end
		
		
			w_data: begin
			
				if (scl == 0) begin
					if (counter_half) begin
						sda_out <= mem[1][counter_data +(counter_page * 8)]; //write data [7]~[0]
						if (counter_data == 0 && (counter_clr == 1)) begin
								state_flag <= 1;
						end
					end
				end		
		
				if (scl == 0) begin
					if (counter_clr) begin
						if (state_flag == 1) begin
							state <= w_data_a;
							counter_data <= 7 ;
							state_flag <= 0;
						end
						else begin
							counter_data <= counter_data - 1 ;
						end
					end		
				end
				
			end
		
		
			w_data_a: begin
			
				if (sda_i == 0) begin
					if (scl == 0) begin
						if ( mem[0][17] != 0) begin
								counter_page <= counter_page + 1;
						end
						else begin
							page_flag <= 1;
						end
						
						if (counter_page == 0 ) begin
							if (page_flag == 1) begin
								if (counter_half) begin
									scl_o <= 1;
									scl_en <= 1;
								end
								if (counter_clr) begin
									sda_out <= 1;  // Release SDA (High-Z)
									page_flag <= 0;
									counter_page <= 0;
									state <= idle;
								end	
							end
							else begin
								if (counter_half) begin
							    	sda_out <= mem[1][counter_data + (counter_page << 3)]; //device address [7]
							    end		
							    if (counter_clr) begin
							    	counter_data <= counter_data - 1 ;
							    	state <= w_data;
							    end
							end
						end
						
						else if ( (1 <= counter_page) && (counter_page <= 3) ) begin
							if (counter_half) begin
						    	sda_out <= mem[1][counter_data + (counter_page << 3)]; //device address [7]
						    end		
						    if (counter_clr) begin
						    	counter_data <= counter_data - 1 ;
						    	state <= w_data;
						    end
						end
			    		
			    		else if (3 < counter_page) begin
			    			if (counter_half) begin
								scl_o <= 1;
								scl_en <= 1;
			    			end
			    			if (counter_clr) begin
			    				sda_out <= 1;  // Release SDA (High-Z)
			    				page_flag <= 0;
								counter_page <= 0;
			    				state <= idle;
			    		    end	
			    		end
					end
			    end
			
			end
			
		
		
			r_d_addr: begin
			
				if (scl == 0) begin
					if (counter_half) begin
						sda_out <= mem[0][counter_data]; //device address [6]~[0]
						if (counter_data == 0 && (counter_clr == 1)) begin
							state_flag <= 1;

						end
					end		
				end
		
				if (scl == 0) begin
					if (counter_half) begin
						if (state_flag == 1) begin
							sda_out <= 1;  // Release for ACK check
						end
					end
					if (counter_clr) begin
						if (state_flag == 1) begin
							state <= r_d_addr_a;
							counter_data <= 7 ;
							state_flag <= 0;
						end
						else begin
							counter_data <= counter_data - 1 ;
						end
					end		
				end
				
			end
		

			r_d_addr_a: begin
			
				if (sda_i == 0) begin
					if (scl == 0) begin
						if (counter_clr) begin
							state <= r_data;
						end
					end	
				end
				
			end
		
		
		r_data: begin
		
			if (scl == 1) begin
				if (counter_half) begin
					// mem[2] capture is handled in separate always block
					if (counter_data == 0 && (counter_clr == 1)) begin
							state_flag <= 1;
					end
				end
			end		
	
			if (scl == 0) begin
				if (counter_half) begin
					if (state_flag == 1) begin
						// ACK/NACK 로직 변경
						// 변경: sda_out <= 0 (ACK), sda_out <= 1 (NACK)
						// 이유: sda_out 의미 변경에 따른 로직 반전
						//       ACK는 SDA를 Low로 구동 (sda_out=0)
						//       NACK는 SDA를 High-Z로 해제 (sda_out=1, 풀업으로 High)
						if (counter_page < 3) begin
							sda_out <= 0;  // ACK (pull low)
						end
						else begin
							sda_out <= 1;  // NACK (release)
						end
					end
				end
				if (counter_clr) begin
					if (state_flag == 1) begin
						state <= r_data_a;
						counter_data <= 7 ;
						state_flag <= 0;
					end
					else begin
						counter_data <= counter_data - 1 ;
					end
				end		
			end
			
		end
		
		
			r_data_a: begin
				if (sda_i == 0) begin
					if (scl == 0) begin
						if ( mem[0][17] != 0) begin
								counter_page <= counter_page + 1;
						end
						else begin
							page_flag <= 1;
						end
						
						if (counter_page == 0 ) begin
							if (page_flag == 1) begin
								if (counter_half) begin
									scl_o <= 1;
									scl_en <= 1;
								end
								if (counter_clr) begin
									sda_out <= 1;  // Release SDA (High-Z)
									page_flag <= 0;
									counter_page <= 0;
									state <= idle;
								end	
							end
							else begin	
							    if (counter_clr) begin
							    	state <= r_data;
							    end
							end
						end
						
						else if ( (1 <= counter_page) && (counter_page <= 3) ) begin		
						    if (counter_clr) begin
						    	state <= r_data;
						    end
						end
			    		
			    		else if (3 < counter_page) begin
			    			if (counter_half) begin
								scl_o <= 1;
								scl_en <= 1;
			    			end
			    			if (counter_clr) begin
			    				sda_out <= 1;  // Release SDA (High-Z)
			    				page_flag <= 0;
								counter_page <= 0;
			    				state <= idle;
			    		    end	
			    		end
					end
			    end
			end
		
			/*
		
			rr_w_d_addr: begin
		
			end
		
			rr_w_d_addr_a: begin
		
			end
		
		
			rr_w_w_addr: begin
		
			end
		
		
			rr_w_w_addr_a: begin
		
			end
		
		
			rr_start: begin
		
			end
		
		
			rr_r_d_addr: begin
		
			end
		
		
			rr_r_d_addr_a: begin
	
			end
		
		
			rr_r_data: begin
			
			end
		
		
			rr_r_data_a: begin
	
			end
			*/
			
		endcase	
		
		end // else
	end // always
	

endmodule
