`timescale 1ns/1ps
// 세환님 가장 최근 코드
module I2C #(		parameter 	Hz_counter=10  //120

			 ) 

(
	input									clk				,
	input									n_rst			,
	
	input       wire	[31:0]		        data0	        , // for simulation mem[0]
	// input				[7:0]				addr			,
	
	input       wire	[31:0]		        data1	        , // for simulation mem[1]
	
	output      reg	[31:0]		            data2	        , // for simulation mem[2]
	output      reg                         status_busy    ,
	output      reg                         status_ack_error,
	output      reg                         status_done    ,
	output      reg                         status_data_ready,
				
	inout		wire						sda		     	,
	output		wire					    scl			

);

/*

/		/		/		/ 		/	[2] read    mem <- eeprom
/		/		/		/ 		/	[1] write   mem -> eeprom
/		/		/		/ 		/	[0] 0: device address  1: word address  2: mem[0][16] == 1 random, mem[0][17] == 1 page O  3: [31] == 1 -> sda == 0
   [3]     [2]     [1]     [0]

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
					rr_r_data_a		= 20 ,
					stop			= 21 ;
					
	
	// 이걸 카운터 돌려서 반복할까 state 넣어서 할까 state 넣으면 너무 복잡해지는데
	reg		[31:0]		mem		[2:0]	; // 0: addr & function / 1: write / 2: read 이 부분은 내부 메모리로 바꾸고 axi4 lite에 연결
	
	reg					clk_k			;
	

	//reg					sdl_dly1		;
	//reg					sdl_dly2		;

	
	reg		[4:0]		state			;
	reg		[4:0]		nxt				;
	
	reg		[6:0]		counter			;	
	wire	counter_clr = (counter == Hz_counter);
	wire	counter_half = (counter == (Hz_counter/2));
	
	//wire	f_edge_det;
	
	/*
	// 8bit serial read data save -> rdata_8bit
	reg		rdata_0		;
	reg		rdata_1		;
	reg		rdata_2		;
	reg		rdata_3		;
	reg		rdata_4		;
	reg		rdata_5		;
	reg		rdata_6		;
	reg		rdata_7		;
	
	// 32bit read sdata save -> mem[2]
	reg		[7:0]	rdata_8bit_0	;
	reg		[7:0]	rdata_8bit_1	;
	reg		[7:0]	rdata_8bit_2	;
	reg		[7:0]	rdata_8bit_3	;
	*/
	
    
    reg sda_out;         // 1이면 SDA를 구동, 0이면 해제
    assign sda = sda_out ? 1'bz : 1'b0;

	
	reg					data_flag		;
	reg					state_flag		;
	reg					ack_flag		;	
	reg					page_flag		;
	
	reg		[2:0]		counter_data	;
	reg		[2:0]		counter_page	;

reg					prev_start_bit	;
reg					start_cmd		;
reg					cmd_is_read		;

	assign scl = clk_k;

wire start_edge    = data0[31] & ~prev_start_bit;
wire start_allowed = start_edge & ~status_busy;
wire expecting_ack = (state == w_d_addr_a)  ||
                     (state == w_w_addr_a)  ||
                     (state == w_data_a)    ||
                     (state == r_d_addr_a)  ||
                     (state == r_data_a)    ||
                     (state == rr_w_d_addr_a) ||
                     (state == rr_w_w_addr_a) ||
                     (state == rr_r_d_addr_a) ||
                     (state == rr_r_data_a);
	
	
	always @(posedge clk, negedge n_rst) begin
        if(!n_rst) begin
            counter <= 0;
            clk_k <= 1;
        end
        else if (state == idle) begin
            counter <= 0;
            clk_k <= 1;
        end
        else if (state == stop) begin
            // clk_k는 1 유지 (SCL high 유지)
            clk_k <= 1;
            counter <= counter + 1;  // <-- stop 상태에서도 counter는 증가시킴
        end
        else if (counter_clr) begin
            clk_k <= ~clk_k;
            counter <= 0;
        end
        else begin
            counter <= counter + 1;
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
	
	
always @(posedge clk, negedge n_rst) begin
	if (!n_rst) begin
		prev_start_bit   <= 1'b0;
		start_cmd        <= 1'b0;
		cmd_is_read      <= 1'b0;
		status_busy      <= 1'b0;
		status_ack_error <= 1'b0;
		status_done      <= 1'b0;
		status_data_ready<= 1'b0;
	end
	else begin
		prev_start_bit <= data0[31];

		if (start_allowed) begin
			start_cmd        <= 1'b1;
			status_busy      <= 1'b1;
			status_ack_error <= 1'b0;
			status_done      <= 1'b0;
			status_data_ready<= 1'b0;
			cmd_is_read      <= data0[0];
		end
		else if (state == start) begin
			start_cmd <= 1'b0;
		end

		if (state == stop && (scl == 1) && (counter_clr == 1)) begin
			status_busy       <= 1'b0;
			status_done       <= 1'b1;
			status_data_ready <= cmd_is_read;
		end

		if (status_done && start_allowed) begin
			status_done       <= 1'b0;
			status_data_ready <= 1'b0;
		end

		if (expecting_ack && (scl == 1) && (counter_half == 1) && (sda == 1)) begin
			status_ack_error <= 1'b1;
		end
	end
end
	
	
	always @(posedge clk, negedge n_rst) begin // output, state reset
	
		if(!n_rst) begin
			state <= idle;
		end
		else begin
			state <= nxt;
		end
			
	end
	
	
	
	always @(*) begin
	
		case (state) 
		
			idle : begin
		        
		        data_flag = 0;
				state_flag = 0;
			    ack_flag = 0;
			    page_flag = 0;
			    
		        
		        mem[0] = data0 ;
			    mem[1] = data1 ;
			    data2 = mem[2];
		        
				if (start_cmd == 1) begin
					sda_out = 1;  // idle에서는 SDA HIGH 유지
					// START 조건은 start 상태에서 생성
					nxt = start;
				end
				else begin
					sda_out = 1;
					nxt = idle;
				end
				
			end
			
			
			start: begin

				mem[2] = 32'h00000000;
				
				// I2C START 조건 생성: rr_start 상태와 동일한 방식
				// SCL이 HIGH일 때 counter_half에서 SDA를 LOW로 설정
				if ((scl == 1) && (counter_half == 1)) begin
					sda_out = 0;  // START 조건: SCL HIGH일 때 SDA LOW
				end
				
				// START 조건 완료 후 데이터 전송 시작
				if (scl == 0) begin
					// SCL이 LOW이면 데이터 비트 출력
					if (counter_half) begin
						sda_out = mem[0][counter_data]; //device address [7]
						data_flag = 1;
					end		
					if (counter_clr) begin;
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
						sda_out = mem[0][counter_data]; //device address [6]~[0]
					end
					
					if ((counter_clr == 1) && (state_flag == 1)) begin
						state_flag = 0;
						sda_out = 1;
						nxt = w_d_addr_a;
					end		
				end
			
			end
		
		
			w_d_addr_a: begin
			
				if ((scl == 1) && (sda == 0)) begin
					ack_flag = 1;
				end
				
				if (ack_flag == 1) begin
						if (scl == 0) begin
							if (counter_half) begin
								sda_out = mem[0][counter_data + 8]; //word address [7]
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
						sda_out = mem[0][counter_data + 8]; //word address [6]~[0]
					end

					if ((counter_clr == 1) && (state_flag == 1)) begin
						state_flag = 0;
						sda_out = 1;
						nxt = w_w_addr_a;
					end		
				end
			end
		
		
			w_w_addr_a: begin
			
				if (mem[0][17] == 0) begin
					page_flag = 1;
				end
				
				if ((scl == 1) && (sda == 0)) begin
					ack_flag = 1;
				end
				
				if (ack_flag == 1) begin
						if (scl == 0) begin
							if (counter_half) begin
								sda_out = mem[1][counter_data + (counter_page * 8)]; //write data [7]
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
						sda_out = mem[1][counter_data + (counter_page * 8)]; //write data [6]~[0]
					end
	
					if ((counter_clr == 1) && (state_flag == 1)) begin
						state_flag = 0;
						sda_out = 1; // 이거 누가 ack 주느냐에 따라서 바꿔야 할수도 있다.
						nxt = w_data_a;
					end
	
				end
				
			end
		
		
			w_data_a: begin
				
				if ((scl == 1) && (sda == 0)) begin
					ack_flag = 1;
				end
				
				if (ack_flag == 1) begin
					if (scl == 0) begin
					
					   if (page_flag == 1) begin
					           sda_out = 0;
							if (counter_clr) begin
								ack_flag = 0;
								nxt = stop;
							end
						end
						else begin
							if (counter_page < 3 ) begin
								if (counter_half) begin
									sda_out = mem[1][counter_data + (counter_page * 8)]; //write data [7 + 8*counterpage]
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
						sda_out = mem[0][counter_data]; //device address [6]~[0]
					end
		
				if ((counter_clr == 1) && (state_flag == 1)) begin
						state_flag = 0;
						sda_out = 1;
						nxt = r_d_addr_a;
					end			
				end
				
			end
		

			r_d_addr_a: begin
				
				if (mem[0][17] == 0) begin
					page_flag = 1;
				end
			
				if ((scl == 1) && (sda == 0)) begin
					ack_flag = 1;
				end
				
				if ((ack_flag == 1) && (scl == 0)) begin
					if (counter_clr) begin
							nxt = r_data;
							sda_out = 1;
						    data_flag = 1;
							ack_flag = 0;
					end	
				end
				
			end
		
		
			r_data: begin
			
				if ((scl == 1) && (data_flag == 1)) begin
					if (counter_clr == 1) begin
						if (counter_data == 0) begin
							data_flag = 0;
							state_flag = 1;
						end
					end
				end
				
				if (scl == 1) begin
					if (counter_half) begin
						mem[2][counter_data + (counter_page * 8)] = sda; //read data [7]~[0]
					end
				end
				
		
				if ((scl == 0) && (state_flag == 1)) begin
					if (counter_half) begin
						
						if (page_flag == 1) begin
							sda_out = 1; // no ack
						end
						else begin
							sda_out = 0; // ack
						end
						
					end
					else if (counter_clr) begin
						state_flag = 0;
						ack_flag = 1;
						nxt = r_data_a;
					end	
				end
				
				
			end
		
		
			r_data_a: begin
				
			
				if (ack_flag == 1) begin
					if (scl == 0) begin
						
						if (page_flag == 1) begin
					           sda_out = 0;
							if (counter_clr) begin
								ack_flag = 0;
								nxt = stop;
							end
						end
						
						else begin
							if (counter_page < 3 ) begin
								if (counter_half) begin
									sda_out = 1;
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
							sda_out = ~mem[0][counter_data]; //device address ~[0]
						end
						else begin
							sda_out = mem[0][counter_data]; //device address [6]~[1]
						end
					end

					if ((counter_clr == 1) && (state_flag == 1)) begin
						state_flag = 0;
						sda_out = 1;
						nxt = rr_w_d_addr_a;
					end		
				end
				
			end
		
		
			rr_w_d_addr_a: begin
				if ((scl == 1) && (sda == 0)) begin
					ack_flag = 1;
				end
				
				if (ack_flag == 1) begin
						if (scl == 0) begin
							if (counter_half) begin
								sda_out = mem[0][counter_data + 8]; //word address [7]
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
						sda_out = mem[0][counter_data + 8]; //word address [6]~[0]
					end

					if ((counter_clr == 1) && (state_flag == 1)) begin
						state_flag = 0;
						sda_out = 1;
						nxt = rr_w_w_addr_a;
					end		
				end
			end
		
		
			rr_w_w_addr_a: begin
				if ((scl == 1) && (sda == 0)) begin
					ack_flag = 1;
				end
				
				if (ack_flag == 1) begin
						if (scl == 0) begin
							if (counter_half) begin
								sda_out = 1; //start
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
					sda_out = 0;
				end
				
				if (scl == 0) begin
					if (counter_half) begin
						sda_out = mem[0][counter_data]; //device address [7]
						data_flag = 1;
					end	
					if (counter_clr) begin;
						nxt = rr_r_d_addr;
					end
				end
					
			end
		
		
			rr_r_d_addr: begin
			
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
						sda_out = mem[0][counter_data]; //device address [6]~[0]
					end
		
				if ((counter_clr == 1) && (state_flag == 1)) begin
						state_flag = 0;
						sda_out = 1;
						nxt = rr_r_d_addr_a;
					end			
				end
			end
		
		
			rr_r_d_addr_a: begin
			
				if (mem[0][17] == 0) begin
					page_flag = 1;
				end
			
				if ((scl == 1) && (sda == 0)) begin
					ack_flag = 1;
				end
				
				if ((ack_flag == 1) && (scl == 0)) begin
					if (counter_clr) begin
							nxt = rr_r_data;
							sda_out = 1;
						    data_flag = 1;
							ack_flag = 0;
					end	
				end
			end
		
		
			rr_r_data: begin
			
				if ((scl == 1) && (data_flag == 1)) begin
					if (counter_clr == 1) begin
						if (counter_data == 0) begin
							data_flag = 0;
							state_flag = 1;
						end
					end
				end
			
				if (scl == 1) begin
					if (counter_half) begin
						mem[2][counter_data + (counter_page * 8)] = sda; //read data [7]~[0]
					end
				end
				
		
				if ((scl == 0) && (state_flag == 1)) begin
					if (counter_half) begin
						
						if (page_flag == 1) begin
							sda_out = 1; // no ack
						end
						else begin
							sda_out = 0; // ack
						end
						
					end
					else if (counter_clr) begin
						state_flag = 0;
						ack_flag = 1;
						nxt = rr_r_data_a;
					end	
				end
			end
		
		
			rr_r_data_a: begin
				if (ack_flag == 1) begin
					if (scl == 0) begin
						
						if (page_flag == 1) begin
					           sda_out = 0;
							if (counter_clr) begin
								ack_flag = 0;
								nxt = stop;
							end
						end
						
						else begin
							if (counter_page < 3 ) begin
								if (counter_half) begin
									sda_out = 1;
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
			data2 = mem[2];  // stop에서도 data2 출력
			if ((scl == 1) && (counter_clr == 1)) begin
				nxt = idle;
				sda_out = 1;
				page_flag = 0;
				ack_flag = 0;
				data_flag = 0;
			    //mem[0] = 32'h0000_0000;  // 클리어하지 않음!
                //mem[1] = 32'h0000_0000;
                //mem[2] = 32'h0000_0000;
			end
			else begin
				nxt = stop;
			end
		end
			
			default : nxt = idle;
			
		endcase	
		
		
	end
	
	
	
endmodule
