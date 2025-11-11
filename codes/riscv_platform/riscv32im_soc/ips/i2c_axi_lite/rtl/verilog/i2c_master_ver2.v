//////////////////////////////////////////////////I2C////////////////////////////////////////////

module I2C 	#(		parameter 	Hz_counter=10  //120

			 ) 

(
	input					clk			,
	input					n_rst			,
	
	input       wire	[31:0]	        i2c_ctrl        , // Control register (was data0)
	
	input       wire	[31:0]	        wdata	        , // Write data (was data1)
	
	output      reg	[31:0]	        rdata	        , // Read data (was data2)
			
	input		wire				sda_i		    , // SDA input
	output		wire				sda_o		    , // SDA output (always 0)
	output		wire				sda_t		    , // SDA tri-state enable
	output		wire			    scl		        , // SCL output
	output		wire			    i2c_idle        // I2C Master가 idle 상태인지 (트랜잭션 완료 감지용)

);
/*

/ 		/ 		/ 		/ 		/ 	[2] read    mem <- eeprom
/ 		/ 		/ 		/ 		/ 	[1] write   mem -> eeprom
/ 		/ 		/ 		/ 		/ 	[0] 0: device address  1: word address  2: mem[0][16] == 1 random, mem[0][17] == 1 page O  3: [31] == 1 -> sda == 0
   [3]     [2]     [1]     [0]

*/

	localparam	idle 			= 0	,
				start		= 1 ,
									
									// byte write & page write
									
				w_d_addr 		= 2	,
				w_d_addr_a		= 3 ,
							
				w_w_addr		= 4 ,
				w_w_addr_a	= 5 ,
				w_data		= 6 ,
				w_data_a		= 7 ,
							
									// current address read & sequential read
									
				r_d_addr		= 8 ,
				r_d_addr_a	= 9 ,
							
				r_data		= 10 ,
				r_data_a		= 11 ,
							
									// random read
									
				rr_w_d_addr	= 12 ,
				rr_w_d_addr_a 	= 13 ,
							
				rr_w_w_addr	= 14 ,
				rr_w_w_addr_a	= 15 ,

				rr_start		= 16 ,
				rr_r_d_addr	= 17 ,
				rr_r_d_addr_a	= 18 ,
							
				rr_r_data		= 19 ,
				rr_r_data_a	= 20 ,
				stop		= 21 ;
						
	
	// 이걸 카운터 돌려서 반복할까 state 넣어서 할까 state 넣으면 너무 복잡해지는데
	reg		[31:0]		mem		[2:0]	; // 0: addr & function / 1: write / 2: read 이 부분은 내부 메모리로 바꾸고 axi4 lite에 연결
	
	reg				clk_k			;
	

	//reg				sdl_dly1		;
	//reg				sdl_dly2		;

	
	reg		[4:0]		state			;
	reg		[4:0]		nxt			;
	
	reg		[8:0]		counter			;
	wire	counter_clr = (counter == Hz_counter);
	wire	counter_half = (counter == (Hz_counter/2));
	
    reg sda_out;         // 0이면 Low 출력 (구동), 1이면 High 출력 (High-Z, 풀업)
    assign sda_o = 1'b0;  // Always drive low when enabled (오픈 드레인)
    assign sda_t = sda_out;  // sda_out=0이면 구동(Low), sda_out=1이면 High-Z(풀업으로 High)

	reg				data_flag		;
	reg				state_flag		;
	reg				ack_flag		;	
	reg				page_flag		;
	
	reg		[2:0]		counter_data	;
	reg		[2:0]		counter_page	;


	assign scl = clk_k;
	
	// I2C Master가 idle 상태인지 출력 (트랜잭션 완료 감지용)
	// state가 idle이고, mem[0][31]이 0이면 트랜잭션이 완료된 상태
	// 또는 state가 stop에서 idle로 전환되었을 때도 트랜잭션 완료로 간주
	reg state_prev;
	always @(posedge clk or negedge n_rst) begin
		if (!n_rst) begin
			state_prev <= idle;
		end
		else begin
			state_prev <= state;
		end
	end
	
	// I2C Master가 idle 상태이고 트랜잭션이 완료된 상태를 감지
	// 1. state가 stop에서 idle로 전환되면 트랜잭션 완료
	// 2. state가 idle이고 mem[0][31]이 0이면 트랜잭션 완료 (control_reg[0]이 클리어됨)
	// 3. 단, 트랜잭션이 시작되지 않은 초기 상태도 idle로 간주
	reg transaction_started;
	always @(posedge clk or negedge n_rst) begin
		if (!n_rst) begin
			transaction_started <= 1'b0;
		end
		else begin
			// mem[0][31]이 1이 되면 트랜잭션 시작
			if (mem[0][31] == 1'b1 && state == idle) begin
				transaction_started <= 1'b1;
			end
			// state가 stop에서 idle로 전환되면 트랜잭션 완료
			else if (state_prev == stop && state == idle) begin
				transaction_started <= 1'b0;
			end
		end
	end
	
	// I2C Master가 완전히 idle 상태인지 판단
	// 1. state가 idle이고
	// 2. (트랜잭션이 시작되지 않았거나, mem[0][31]이 0이면 완료)
	assign i2c_idle = (state == idle) && (
		!transaction_started ||  // 트랜잭션이 시작되지 않았으면 idle
		(mem[0][31] == 1'b0)     // mem[0][31]이 0이면 완료 (control_reg[0]이 클리어됨)
	);
	
	
	always @(posedge clk, negedge n_rst) begin
        if(!n_rst) begin
            counter <= 0;
            clk_k <= 1;  // Reset 시 SCL High (Idle 상태)
        end
        else if (state == idle) begin
            // idle 상태에서는 SCL High 유지 (START 조건 준비)
            counter <= 0;
            clk_k <= 1;  // SCL High 유지
        end
        else if (state == stop) begin
            // clk_k는 1 유지 (SCL high 유지, STOP 조건 후)
            clk_k <= 1;
            counter <= 0;
        end
        else begin
            // start, w_d_addr, w_data 등 모든 상태에서 counter 증가
            // I2C 클록 생성
            if (counter_clr) begin
                clk_k <= ~clk_k;
                counter <= 0;
            end
            else begin
                counter <= counter + 1;
            end
        end
    end
	
	
	always @(posedge clk, negedge n_rst) begin // adress & data 8bit counter
					
		if(!n_rst) begin
			counter_data <= 7;
		end
		else if (state == idle) begin
			counter_data <= 7;
		end
		else begin
			case (scl)
				0: begin
					if (state_flag) begin
						counter_data <= 7;
					end
					else begin
						counter_data <= counter_data;
					end
				end
				
				1: begin
					if ((data_flag) && (counter_clr == 1)) begin
						counter_data <= counter_data - 1 ; 
					end
					else begin
						counter_data <= counter_data;
					end
				end
				
				default: counter_data <= 7;
			endcase
		end
		
	end
	
	
	always @(posedge clk, negedge n_rst) begin // page counter
		
		if (!n_rst) begin
			counter_page <= 0;
		end
		
		else if (state == idle) begin
			counter_page <= 0;
		end
		
		else begin
			case (mem[0][17])
				
				0: begin
					counter_page <= 0;
				end
				
				1: begin
					if (((state == w_data_a || state == r_data_a || state == rr_r_data_a)) && (ack_flag == 1)) begin
						if (scl == 0) begin
							if (counter_half == 1) begin
								counter_page <= counter_page + 1;
							end
						end
					end
				end
				
				default : counter_page <= 0;
				
			endcase
		end
		
	end
	
	
	// sda_out_next: combinational logic에서 계산된 다음 값
	reg sda_out_next;
	
	always @(posedge clk, negedge n_rst) begin // output, state reset
	
		if(!n_rst) begin
			state <= idle;
			sda_out <= 1'b1;  // Reset 시 High-Z (풀업으로 High)
		end
		else begin
			state <= nxt;
			sda_out <= sda_out_next;  // combinational logic에서 계산된 값 사용
		end
			
	end
	
	
	
	// idle 상태에서 입력 데이터를 mem에 로드 (동기식)
	always @(posedge clk, negedge n_rst) begin
		if (!n_rst) begin
			mem[0] <= 32'h0;
			mem[1] <= 32'h0;
			mem[2] <= 32'h0;
			rdata <= 32'h0;
		end
		else if (state == idle) begin
			mem[0] <= i2c_ctrl;
			mem[1] <= wdata;
			rdata <= mem[2];
		end
		else if (state == r_data) begin
			if (scl == 1) begin
				// SCL High일 때 데이터 샘플링
				// counter_half보다는 counter_clr 직전에 샘플링하여 더 안정적인 타이밍 확보
				// 또는 counter_half를 사용하되 data_flag가 설정되어 있을 때만 샘플링
				if (data_flag == 1) begin
					// SCL High 구간에서 안정적인 타이밍에 샘플링
					// counter_half는 SCL High 구간의 중간이므로 적절한 타이밍
					if (counter_half) begin
						mem[2][counter_data + (counter_page * 8)] <= sda_i;
					end
				end
			end
		end
		else if (state == rr_r_data) begin
			if (scl == 1) begin
				// SCL High일 때 데이터 샘플링 (Random Read)
				if (data_flag == 1) begin
					if (counter_half) begin
						mem[2][counter_data + (counter_page * 8)] <= sda_i;
					end
				end
			end
		end
		else begin
			rdata <= mem[2];
		end
	end
	
	always @(*) begin
		// 기본값 설정 (래치 방지)
		nxt = state;  // 기본적으로 현재 상태 유지
		sda_out_next = 1'b1;  // 기본적으로 High-Z (풀업으로 High)
		data_flag = 0;
		state_flag = 0;
		ack_flag = 0;
		page_flag = 0;
		
		case (state) 
		
			idle : begin
		        
		        data_flag = 0;
				state_flag = 0;
			    ack_flag = 0;
			    page_flag = 0;
			    counter_data = 7;  // 비트 카운터 초기화
		        
				if (mem[0][31] == 1) begin
					// START 조건 생성 순서:
					// 1. idle 상태에서는 SCL이 High로 유지됨 (clk_k = 1)
					// 2. SDA를 High->Low로 변경 (START 조건)
					// 3. START 조건이 완성되면 start 상태로 전이
					// 4. start 상태에서 SCL을 Low로 내려서 데이터 전송 시작
					
					// SCL이 High일 때 SDA를 Low로 설정 (START 조건)
					if (scl == 1) begin
						sda_out_next = 0;  // SDA Low (START 조건)
						// START 조건 완성, start 상태로 전이
						// start 상태에서 SCL을 Low로 내려서 데이터 전송 시작
						nxt = start;
					end
					else begin
						// SCL이 Low이면 High로 만들고 대기
						sda_out_next = 1;  // SDA High-Z (풀업으로 High)
						nxt = idle;  // SCL High가 될 때까지 대기
					end
				end
				else begin
					sda_out_next = 1;  // High-Z (풀업으로 High)
					nxt = idle;
				end
				
			end
			
			
			start: begin
				// START 조건: SCL이 High일 때 SDA를 Low로 설정 (이미 idle에서 설정됨)
				// 이제 SCL을 Low로 내려서 데이터 전송 준비
				// SDA는 Low로 유지 (START 조건 유지)
				sda_out_next = 0;
				
				// SCL이 Low일 때 device address 비트 출력
				if (scl == 0) begin
					if (counter_half) begin
						sda_out_next = mem[0][counter_data]; //device address MSB first
						data_flag = 1;
					end		
					// counter_clr에서 상태 전환하지 않고, 데이터 전송 완료 후 전환
				end
				else begin
					// SCL이 High일 때
					if ((data_flag == 1) && (counter_clr == 1)) begin
						// 첫 번째 비트 전송 완료, 다음 상태로 전환
						if (mem[0][0] == 0) begin	
							nxt = w_d_addr;
						end
						else if (mem[0][0] == 1) begin
							if (mem[0][16] == 0) begin
								nxt = r_d_addr;
							end
							else begin
								nxt = rr_w_d_addr;
							end
						end
					end
					else begin
						// SCL이 High일 때는 대기 (START 조건 유지)
						nxt = start;
					end
				end
			
			end
		
		
			w_d_addr: begin
			
				if ((scl == 1) && (data_flag == 1)) begin
					if (counter_clr == 1) begin
						if (counter_data == 0) begin
							data_flag = 0;
							state_flag = 1;
						end
					end
				end
			
				if (scl == 0) begin
					if (counter_half) begin
						sda_out_next = mem[0][counter_data]; //device address [6]~[0]
					end
					
					if ((counter_clr == 1) && (state_flag == 1)) begin
						state_flag = 0;
						sda_out_next = 1;
						nxt = w_d_addr_a;
					end		
				end
			
			end
		
		
			w_d_addr_a: begin
			
				if ((scl == 1) && (sda_i == 0)) begin
					ack_flag = 1;
				end
				
				if (ack_flag == 1) begin
						if (scl == 0) begin
							if (counter_half) begin
								sda_out_next = mem[0][counter_data + 8]; //word address [7]
							end		
							if (counter_clr) begin
								nxt = w_w_addr;
							    data_flag = 1;
								ack_flag = 0;
							end
						end	
					end
				
			end
		
		
			w_w_addr: begin
			
				if ((scl == 1) && (data_flag == 1)) begin
					if (counter_clr == 1) begin
						if (counter_data == 0) begin
							data_flag = 0;
							state_flag = 1;
						end
					end
				end
				
				if (scl == 0) begin
					if (counter_half) begin
						sda_out_next = mem[0][counter_data + 8]; //word address [6]~[0]
					end

					if ((counter_clr == 1) && (state_flag == 1)) begin
						state_flag = 0;
						sda_out_next = 1;
						nxt = w_w_addr_a;
					end		
				end
			end
		
		
			w_w_addr_a: begin
			
				if (mem[0][17] == 0) begin
					page_flag = 1;
				end
				
				if ((scl == 1) && (sda_i == 0)) begin
					ack_flag = 1;
				end
				
				if (ack_flag == 1) begin
						if (scl == 0) begin
							if (counter_half) begin
								sda_out_next = mem[1][counter_data + (counter_page * 8)]; //write data [7]
							end		
							if (counter_clr) begin
								nxt = w_data;
							    data_flag = 1;
								ack_flag = 0;
							end
						end	
					end
			end
		
		
			w_data: begin
				if ((scl == 1) && (data_flag == 1)) begin
					if (counter_clr == 1) begin
						if (counter_data == 0) begin
							data_flag = 0;
							state_flag = 1;
						end
					end
				end
			
				if (scl == 0) begin
	
					if (counter_half) begin
						sda_out_next = mem[1][counter_data + (counter_page * 8)]; //write data [6]~[0]
					end
	
					if ((counter_clr == 1) && (state_flag == 1)) begin
						state_flag = 0;
						sda_out_next = 1; // 이거 누가 ack 주느냐에 따라서 바꿔야 할수도 있다.
						nxt = w_data_a;
					end
	
				end
				
			end
		
		
			w_data_a: begin
				
				if ((scl == 1) && (sda_i == 0)) begin
					ack_flag = 1;
				end
				
				if (ack_flag == 1) begin
					if (scl == 0) begin
					
					   if (page_flag == 1) begin
					           sda_out_next = 0;
							if (counter_clr) begin
								ack_flag = 0;
								nxt = stop;
							end
						end
						else begin
							if (counter_page < 3 ) begin
								if (counter_half) begin
									sda_out_next = mem[1][counter_data + (counter_page * 8)]; //write data [7 + 8*counterpage]
								end		
								if (counter_clr) begin
									nxt = w_data;
									data_flag = 1;
									ack_flag = 0;
								end
							end
						
							else begin
								if (counter_clr) begin
									nxt = w_data;
									page_flag = 1;
									data_flag = 1;
									ack_flag = 0;
								end			
							end
						end
					end
				end
			
			end
			
		
		
			r_d_addr: begin
			
				if ((scl == 1) && (data_flag == 1)) begin
					if (counter_clr == 1) begin
						if (counter_data == 0) begin
							data_flag = 0;
							state_flag = 1;
						end
					end
				end
			
				if (scl == 0) begin
					if (counter_half) begin
						sda_out_next = mem[0][counter_data]; //device address [6]~[0]
					end
		
				if ((counter_clr == 1) && (state_flag == 1)) begin
						state_flag = 0;
						sda_out_next = 1;
						nxt = r_d_addr_a;
					end			
				end
				
			end
		

			r_d_addr_a: begin
				
				if (mem[0][17] == 0) begin
					page_flag = 1;
				end
			
				if ((scl == 1) && (sda_i == 0)) begin
					ack_flag = 1;
				end
				
				if ((ack_flag == 1) && (scl == 0)) begin
					if (counter_clr) begin
							nxt = r_data;
							sda_out_next = 1;
							data_flag = 1;
							state_flag = 1;  // counter_data를 7로 초기화하기 위한 플래그
							ack_flag = 0;
					end	
				end
				
			end
		
		
			r_data: begin
				// Master는 데이터를 읽는 상태
				// 데이터 샘플링은 별도의 always 블록에서 처리됨 (posedge clk)
				// 여기서는 data_flag와 state_flag만 관리
				
				// SCL High일 때: 데이터는 이미 샘플링됨, bit counter 관리
				if (scl == 1) begin
					if (counter_clr == 1 && data_flag == 1) begin
						if (counter_data == 0) begin
							// 8비트 모두 읽음
							data_flag = 0;
							state_flag = 1;
						end
					end
				end
				
				// SCL Low일 때 ACK/NACK 준비 및 SDA 제어
				if (scl == 0) begin
					if (state_flag == 1) begin
						// 8비트 읽기 완료, ACK/NACK 출력
						if (counter_half) begin
							if (page_flag == 1) begin
								sda_out_next = 1; // no ack (High-Z, NACK)
							end
							else begin
								sda_out_next = 0; // ack (Low)
							end
						end
						if (counter_clr) begin
							state_flag = 0;
							ack_flag = 1;
							nxt = r_data_a;
						end
					end
					else begin
						// 데이터 읽는 중, SDA를 High-Z로 유지 (Slave가 구동)
						sda_out_next = 1;
					end
				end
			end
		
		
			r_data_a: begin
				
			
				if (ack_flag == 1) begin
					if (scl == 0) begin
						
						if (page_flag == 1) begin
					           sda_out_next = 0;
							if (counter_clr) begin
								ack_flag = 0;
								nxt = stop;
							end
						end
						
						else begin
							if (counter_page < 3 ) begin
								if (counter_half) begin
									sda_out_next = 1;
								end		
								if (counter_clr) begin
									nxt = r_data;
									data_flag = 1;
									ack_flag = 0;
								end
							end
							else begin
								if (counter_clr) begin
									nxt = r_data;
									page_flag = 1;
									data_flag = 1;
									ack_flag = 0;
								end			
							end
						end
						
					end
				end
			end
		
			/////////////////////////////////randomread////////////////////////////////////////////
		
			rr_w_d_addr: begin
			
				if ((scl == 1) && (data_flag == 1)) begin
					if (counter_clr == 1) begin
						if (counter_data == 0) begin
							data_flag = 0;
							state_flag = 1;
						end
					end
				end
				
				if (scl == 0) begin
					if (counter_half) begin
						if (counter_data == 0) begin
							sda_out_next = ~mem[0][counter_data]; //device address ~[0]
						end
						else begin
							sda_out_next = mem[0][counter_data]; //device address [6]~[1]
						end
					end

					if ((counter_clr == 1) && (state_flag == 1)) begin
						state_flag = 0;
						sda_out_next = 1;
						nxt = rr_w_d_addr_a;
					end		
				end
				
			end
		
		
			rr_w_d_addr_a: begin
				if ((scl == 1) && (sda_i == 0)) begin
					ack_flag = 1;
				end
				
				if (ack_flag == 1) begin
						if (scl == 0) begin
							if (counter_half) begin
								sda_out_next = mem[0][counter_data + 8]; //word address [7]
							end		
							if (counter_clr) begin
								nxt = rr_w_w_addr;
							    data_flag = 1;
								ack_flag = 0;
							end
						end	
				end
			end
		
		
			rr_w_w_addr: begin
			
				if ((scl == 1) && (data_flag == 1)) begin
					if (counter_clr == 1) begin
						if (counter_data == 0) begin
							data_flag = 0;
							state_flag = 1;
						end
					end
				end
			
				if (scl == 0) begin
					if (counter_half) begin
						sda_out_next = mem[0][counter_data + 8]; //word address [6]~[0]
					end

					if ((counter_clr == 1) && (state_flag == 1)) begin
						state_flag = 0;
						sda_out_next = 1;
						nxt = rr_w_w_addr_a;
					end		
				end
			end
		
		
			rr_w_w_addr_a: begin
				if ((scl == 1) && (sda_i == 0)) begin
					ack_flag = 1;
				end
				
				if (ack_flag == 1) begin
						if (scl == 0) begin
							if (counter_half) begin
								sda_out_next = 1; //start
							end		
							if (counter_clr) begin
								nxt = rr_start;
								ack_flag = 0;
							end
						end	
					end
			end
		
		
			rr_start: begin
				if ((scl == 1) &&(counter_half == 1)) begin
					sda_out_next = 0;
				end
				
				if (scl == 0) begin
					if (counter_half) begin
						sda_out_next = mem[0][counter_data]; //device address [7]
						data_flag = 1;
					end	
					if (counter_clr) begin;
						nxt = rr_r_d_addr;
					end
				end
					
			end
		
		
			rr_r_d_addr: begin
				// Random Read의 두 번째 트랜잭션: Device Address + R/W=1 (Read)
				// mem[0][7:1]은 Device Address, mem[0][0]은 R/W 비트
				// 하지만 Random Read의 두 번째 트랜잭션에서는 R/W=1 (Read)이어야 함
				// 따라서 mem[0][0]을 무시하고 R/W=1로 강제
				
				if ((scl == 1) && (data_flag == 1)) begin
					if (counter_clr == 1) begin
						if (counter_data == 0) begin
							data_flag = 0;
							state_flag = 1;
						end
					end
				end
			
				if (scl == 0) begin
					if (counter_half) begin
						if (counter_data == 0) begin
							// LSB (R/W 비트): Read 모드이므로 1
							sda_out_next = 1'b1;  // R/W = 1 (Read)
						end
						else begin
							// Device Address 비트: mem[0][counter_data] 사용
							sda_out_next = mem[0][counter_data]; //device address [6]~[1]
						end
					end
		
					if ((counter_clr == 1) && (state_flag == 1)) begin
						state_flag = 0;
						sda_out_next = 1;
						nxt = rr_r_d_addr_a;
					end			
				end
			end
		
		
			rr_r_d_addr_a: begin
			
				if (mem[0][17] == 0) begin
					page_flag = 1;
				end
			
				if ((scl == 1) && (sda_i == 0)) begin
					ack_flag = 1;
				end
				
				if ((ack_flag == 1) && (scl == 0)) begin
					if (counter_clr) begin
							nxt = rr_r_data;
							sda_out_next = 1;
							data_flag = 1;
							state_flag = 1;  // counter_data를 7로 초기화하기 위한 플래그
							ack_flag = 0;
					end	
				end
			end
		
		
			rr_r_data: begin
				// Master는 데이터를 읽는 상태 (Random Read)
				// 데이터 샘플링은 별도의 always 블록에서 처리됨 (posedge clk)
				// 여기서는 data_flag와 state_flag만 관리
				
				// SCL High일 때: 데이터는 이미 샘플링됨, bit counter 관리
				if (scl == 1) begin
					if (counter_clr == 1 && data_flag == 1) begin
						if (counter_data == 0) begin
							// 8비트 모두 읽음
							data_flag = 0;
							state_flag = 1;
						end
					end
				end
				
				// SCL Low일 때 ACK/NACK 준비 및 SDA 제어
				if (scl == 0) begin
					if (state_flag == 1) begin
						// 8비트 읽기 완료, ACK/NACK 출력
						if (counter_half) begin
							if (page_flag == 1) begin
								sda_out_next = 1; // no ack (High-Z, NACK)
							end
							else begin
								sda_out_next = 0; // ack (Low)
							end
						end
						if (counter_clr) begin
							state_flag = 0;
							ack_flag = 1;
							nxt = rr_r_data_a;
						end
					end
					else begin
						// 데이터 읽는 중, SDA를 High-Z로 유지 (Slave가 구동)
						sda_out_next = 1;
					end
				end
			end
		
		
			rr_r_data_a: begin
				if (ack_flag == 1) begin
					if (scl == 0) begin
						
						if (page_flag == 1) begin
					           sda_out_next = 0;
							if (counter_clr) begin
								ack_flag = 0;
								nxt = stop;
							end
						end
						
						else begin
							if (counter_page < 3 ) begin
								if (counter_half) begin
									sda_out_next = 1;
								end		
								if (counter_clr) begin
									nxt = rr_r_data;
									data_flag = 1;
									ack_flag = 0;
								end
							end
								
							else begin
								if (counter_clr) begin
									nxt = rr_r_data;
									page_flag = 1;
									data_flag = 1;
									ack_flag = 0;
								end			
							end
						end
						
					end
				end
			end
			
			
			stop: begin
				if ((scl == 1) && (counter_clr == 1)) begin
					nxt = idle;
					sda_out_next = 1;
					page_flag = 0;
					ack_flag = 0;
					data_flag = 0;
				    mem[0] = 32'h0000_0000;
				end
			end
			
			default : nxt = idle;
			
		endcase	
		
		
	end
	
	
	
endmodule





