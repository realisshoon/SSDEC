module I2C 	#(		parameter 	Hz_counter=10  //120

			 ) 

(
	input									clk				,
	input									n_rst			,
	
	// input       wire	[31:0]		        data0	        , // for simulation mem[0]
	input		   wire [31:0] 				addr			,
	
	// input       wire	[31:0]		        data1	        , // for simulation mem[1]
	input       wire	[31:0]		        wdata        , 
	
	// input       wire	[31:0]		        data2	        , // for simulation mem[2]
	input       wire	[31:0]				rdata			,
				
	inout		wire						sda		     	,
	output		wire						scl			

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
					rr_r_data_a		= 20 ;
					
	
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
	//assign sda = sda_out ? 1'b1 : 1'b0;


	//assign	f_edge_det = ~sdl_dly1 & sdl_dly2;
	
	reg					data_flag		;
	reg		[2:0]		counter_data	;
	reg					ack_flag		;
	reg					state_flag		;
	reg		[1:0]		counter_page	;
	reg					page_flag		;
	
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
	
	
	always @(posedge clk) begin
		
		if ((scl == 0) && (data_flag == 1)) begin
			if (counter_clr == 1) begin
			    if (counter_data == 0) begin
				    //counter_data <= 0;
				    data_flag <= 0;
				    state_flag <= 1;
				end
				else begin
				    counter_data <= counter_data - 1 ;
				end
			end
		end
		
	end
	
	/*
	always @(posedge clk, negedge n_rst) begin // f_edge_det == sdl fall catch
	
		if (!n_rst) begin
			sdl_dly1 <= 0;
			sdl_dly2 <= 0;
		end
		
		else begin		
			sdl_dly1 <= sda;
			sdl_dly2 <= sdl_dly1;
		end
		
	end
	*/
	
	always @(posedge clk, negedge n_rst) begin // output, state reset
	
		if(!n_rst) begin
			sda_out <= 1;
			scl_o <= 1;
			scl_en <= 1;

            mem[0] <= 32'h0000;
            mem[1] <= 32'h0000;
            mem[2] <= 32'h0000;
			
			data_flag <= 0;
			ack_flag <= 0;
			state_flag <= 0;
			counter_data <= 7;
			counter_page <= 0;
			page_flag <= 0;
			state <= idle;
			nxt <= idle;
		end
		else begin
			state <= nxt;
		end
			
	end
	
	
	
	always @(*) begin
	
		case (state) 
		
			idle : begin
		        
		        mem[0] <= data0 ;
			    mem[1] <= data1 ;
		        
				if (mem[0][31] == 1) begin
					sda_out <= 0;
				end
				
				if ((mem[0][31] == 1) && (sda == 0)) begin
					scl_o <= 0;
					//scl_en <= 1;
				end
				
				/*
				if (f_edge_det) begin
					scl_o <= 0;
					//scl_en <= 1;
				end
				*/
				
				if ((sda == 0) && (scl == 0)) begin
				    nxt <= start ;
				end
				else begin
					nxt <= idle;
				end
				
			end
			
			
			start: begin
				scl_en <= 0;
				
				if (scl == 0) begin
					if (counter_half) begin
						sda_out <= mem[0][counter_data]; //device address [7]
						data_flag <= 1;
					end		
					if (counter_clr) begin;
						if (mem[0][0] == 0) begin	
							nxt <= w_d_addr;
						end
						else if (mem[0][0] == 1) begin
							if (mem[0][16] == 0) begin
								nxt <= r_d_addr;
							end
							else begin
								nxt <= rr_w_d_addr;
							end
						end
					end		
				end
				/*
				if ((sda == 1) || (scl ==1)) begin
					nxt <= idle;
					sda_out <= 1;
					scl_o <= 1;
					scl_en <= 1;
				end
				*/
			end
		
		
			w_d_addr: begin
			
				if (scl == 0) begin
					if (counter_half) begin
						sda_out <= mem[0][counter_data]; //device address [6]~[0]
					end
					/*
					if ((counter_data == 0) && (counter_clr == 1)) begin
						state_flag <= 1;
					end	
                    */
					if ((counter_clr == 1) && (state_flag == 1)) begin
						counter_data <= 7;
						state_flag <= 0;
						sda_out <= 1;
						//sda_out <= 1;
						nxt <= w_d_addr_a;
					end		
				end
			
			end
		
		
			w_d_addr_a: begin
			
				if ((scl == 1) && (sda == 0)) begin
					ack_flag <= 1;
				end
				
				if (ack_flag == 1) begin
						if (scl == 0) begin
							if (counter_half) begin
								sda_out <= mem[0][counter_data]; //word address [7]
							end		
							if (counter_clr) begin
								nxt <= w_w_addr;
							    data_flag <= 1;
								//counter_data <= counter_data - 1 ;
								ack_flag <= 0;
							end
						end	
					end
				
			end
		
		
			w_w_addr: begin
				if (scl == 0) begin
					if (counter_half) begin
						sda_out <= mem[0][counter_data]; //device address [6]~[0]
					end
					/*
					if ((counter_data == 0) && (counter_clr == 1)) begin
						state_flag <= 1;
					end	
                    */
					if ((counter_clr == 1) && (state_flag == 1)) begin
						data_flag <= 1;
						counter_data <= 7;
						state_flag <= 0;
						sda_out <= 1;
						//sda_out <= 1;
						nxt <= w_w_addr_a;
					end		
				end
			end
		
		
			w_w_addr_a: begin
				if (sda == 0) begin
					if (scl == 0) begin
						if (counter_half) begin
							sda_out <= mem[1][counter_data]; //word address [7]
						end		
						if (counter_clr) begin
							counter_data <= counter_data - 1 ;
							nxt <= w_data;
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
							nxt <= w_data_a;
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
			
				if (sda == 0) begin
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
									sda_out <= 1;
									page_flag <= 0;
									counter_page <= 0;
									nxt <= idle;
								end	
							end
							else begin
								if (counter_half) begin
							    	sda_out <= mem[1][counter_data + (counter_page << 3)]; //device address [7]
							    end		
							    if (counter_clr) begin
							    	counter_data <= counter_data - 1 ;
							    	nxt <= w_data;
							    end
							end
						end
						
						else if ( (1 <= counter_page) && (counter_page <= 3) ) begin
							if (counter_half) begin
						    	sda_out <= mem[1][counter_data + (counter_page << 3)]; //device address [7]
						    end		
						    if (counter_clr) begin
						    	counter_data <= counter_data - 1 ;
						    	nxt <= w_data;
						    end
						end
			    		
			    		else if (3 < counter_page) begin
			    			if (counter_half) begin
								scl_o <= 1;
								scl_en <= 1;
			    			end
			    			if (counter_clr) begin
			    				sda_out <= 1;
			    				page_flag <= 0;
								counter_page <= 0;
			    				nxt <= idle;
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
							sda_out <= 0;  // ack
						end
					end
					if (counter_clr) begin
						if (state_flag == 1) begin
							nxt <= r_d_addr_a;
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
			
				if (sda == 0) begin
					if (scl == 0) begin
						if (counter_clr) begin
							nxt <= r_data;
						end
					end	
				end
				
			end
		
		
			r_data: begin
			
				if (scl == 1) begin
					if (counter_half) begin
						mem[2][counter_data + (counter_page * 8)] <= sda; //read data [7]~[0]
						if (counter_data == 0 && (counter_clr == 1)) begin
								state_flag <= 1;
						end
					end
				end		
		
				if (scl == 0) begin
					if (counter_half) begin
						if (state_flag == 1) begin
							if (counter_page < 3) begin
								sda_out <= 0;  // ack
							end
							else begin
								sda_out <= 1; // ack
							end
						end
					end
					if (counter_clr) begin
						if (state_flag == 1) begin
							nxt <= r_data_a;
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
				if (sda == 0) begin
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
									sda_out <= 1;
									page_flag <= 0;
									counter_page <= 0;
									nxt <= idle;
								end	
							end
							else begin	
							    if (counter_clr) begin
							    	nxt <= r_data;
							    end
							end
						end
						
						else if ( (1 <= counter_page) && (counter_page <= 3) ) begin		
						    if (counter_clr) begin
						    	nxt <= r_data;
						    end
						end
			    		
			    		else if (3 < counter_page) begin
			    			if (counter_half) begin
								scl_o <= 1;
								scl_en <= 1;
			    			end
			    			if (counter_clr) begin
			    				sda_out <= 1;
			    				page_flag <= 0;
								counter_page <= 0;
			    				nxt <= idle;
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
		
		
	end
	
	
	
endmodule
