`ifndef I2C_TASKS_V
`define I2C_TASKS_V
//------------------------------------------------------------------------------
// i2c_rst
// i2c_enable
// i2c_init()
// i2c_read_d7r8()   7-bit dev-addr, 8-bit reg-addr
// i2c_write_d7r8()  7-bit dev-addr, 8-bit reg-addr
// i2c_csr
//------------------------------------------------------------------------------
localparam CSRA_BASE      =   32'hD000_0000;
localparam CSRA_VERSION   =(CSRA_BASE+8'h00)
         , CSRA_CONTROL   =(CSRA_BASE+8'h04)// enable, interrupt, reset
         , CSRA_STATUS    =(CSRA_BASE+8'h08)
         , CSRA_CONFIG    =(CSRA_BASE+8'h0C)
         , CSRA_SEL       =(CSRA_BASE+8'h10)

         , CSRA_CLK_FREQ  =(CSRA_BASE+8'h20)// read only (CLK freq)
         , CSRA_I2C_SPEED =(CSRA_BASE+8'h24)// for reference
         , CSRA_CLKDIV    =(CSRA_BASE+8'h28)// 
         , CSRA_RUN       =(CSRA_BASE+8'h30)// single/conti, go
         , CSRA_TX_DATA   =(CSRA_BASE+8'h40)
         , CSRA_RX_DATA   =(CSRA_BASE+8'h50)
         ;
//------------------------------------------------------------------------------
task csr_read;
     input  [31:0] addr;
     output [31:0] data;
begin
     axi_lite_read(addr, data);
end
endtask
//------------------------------------------------------------------------------
task csr_write;
     input  [31:0] addr;
     input  [31:0] data;
begin
     axi_lite_write(addr, data);
end
endtask
//------------------------------------------------------------------------------
task i2c_rst;
     input rst; // 1: reset, 0: normal
     reg [31:0] data;
begin
     csr_read(CSRA_CONTROL, data);
     data[31] = rst;
     csr_write(CSRA_CONTROL, data);
end
endtask
//------------------------------------------------------------------------------
task i2c_enable;
     input      en; // 1: enable, 0: disable
     reg [31:0] data;
begin
     csr_read(CSRA_CONTROL, data);
     data[0] = en;
     csr_write(CSRA_CONTROL, data);
end
endtask
//------------------------------------------------------------------------------
task i2c_busy;
     output     busy; // 1: busy
     reg [31:0] data;
begin
     csr_read(CSRA_STATUS, data);
     busy = data[30];
end
endtask
//------------------------------------------------------------------------------
task i2c_sel;
     input [3:0] sel ; // 0 by default
     reg   [31:0] data;
begin
     data = {28'h0,sel};
     csr_write(CSRA_SEL, data);
end
endtask
//------------------------------------------------------------------------------
// It should be called when disalbed
task i2c_config;
     input [3:0]  pre ; // 1 by default
     input [3:0]  mid ; // 1 by default
     input [3:0]  post; // 1 by default
     input [3:0]  gap ; // 1 by default
     reg   [31:0] data;
begin
     data[31:24] = 16'h0;
     data[15:12] = gap ;
     data[11: 8] = post;
     data[ 7: 4] = mid ;
     data[ 3: 0] = pre ;
     csr_write(CSRA_CONFIG, data);
end
endtask
//------------------------------------------------------------------------------
task i2c_init;
     input [31:0] i2c_freq;
     input        enable;// enable or not
     reg   [31:0] clkfreq;
     real         Fclkdiv;
     reg   [31:0] Iclkdiv;
begin
     i2c_enable(1'b0); // disable
     csr_read (CSRA_CLK_FREQ, clkfreq);
     Fclkdiv = $itor(clkfreq)/$itor(i2c_freq);
     Iclkdiv = $rtoi(Fclkdiv);
     csr_write(CSRA_CLKDIV, Iclkdiv);
     csr_write(CSRA_I2C_SPEED, i2c_freq);
     i2c_enable(enable);
end
endtask
//------------------------------------------------------------------------------
// dataW[11]   =1'b0;//stop
// dataW[10]   =1'b0;//receive
// dataW[ 9]   =1'b1;//drive
// dataW[ 8]   =1'b1;//start
// following byte will be driven
`define DEV_ADDR_SND(d)\
     dataW[31:13]= 'h0;\
     dataW[12]   =1'b0; /*repeat */\
     dataW[11]   =1'b0; /*stop   */\
     dataW[10]   =1'b0; /*receive*/\
     dataW[ 9]   =1'b1; /*drive  */\
     dataW[ 8]   =1'b1; /*start  */\
     dataW[ 7:0] = {d,1'b0};\
     csr_write(CSRA_TX_DATA, dataW)
// following byte will be received
`define DEV_ADDR_RCV(d)\
     dataW[31:13]= 'h0;\
     dataW[12]   =1'b0; /*repeat */\
     dataW[11]   =1'b0; /*stop   */\
     dataW[10]   =1'b0; /*receive*/\
     dataW[ 9]   =1'b1; /*drive  */\
     dataW[ 8]   =1'b1; /*start  */\
     dataW[ 7:0] = {d,1'b1};\
     csr_write(CSRA_TX_DATA, dataW)
// drive 8-bit regisger address
`define REG_ADDR_SND(a,s,r)\
     dataW[31:13]= 'h0;\
     dataW[12]   =r; /*repeat */\
     dataW[11]   =s; /*stop   */\
     dataW[10]   =1'b0; /*receive*/\
     dataW[ 9]   =1'b1; /*drive  */\
     dataW[ 8]   =1'b0; /*start  */\
     dataW[ 7:0] = a;\
     csr_write(CSRA_TX_DATA, dataW)
// receiver 8-bit regisger data
`define REG_DATA_RCV(s)\
     dataW[31:13]= 'h0;\
     dataW[12]   =1'b0; /*repeat */\
     dataW[11]   =s; /*stop   */\
     dataW[10]   =1'b1; /*receive*/\
     dataW[ 9]   =1'b0; /*drive  */\
     dataW[ 8]   =1'b0; /*start  */\
     dataW[ 7:0] =8'h0;\
     csr_write(CSRA_TX_DATA, dataW)
// drive 8-bit register data
`define REG_DATA_SND(d,s)\
     dataW[31:13]= 'h0;\
     dataW[12]   =1'b0; /*repeat */\
     dataW[11]   =s; /*stop   */\
     dataW[10]   =1'b0; /*receive*/\
     dataW[ 9]   =1'b1; /*drive  */\
     dataW[ 8]   =1'b0; /*start  */\
     dataW[ 7:0] =d;\
     csr_write(CSRA_TX_DATA, dataW)
// go n transactions
`define GO_I2C(n)\
     dataW[31:24] = n;\
     dataW[23: 1] ='h0;\
     dataW[    0] ='h1;\
     csr_write(CSRA_RUN, dataW)
// wait until done
`define WAIT_I2C(n,p)\
     dataR =~32'h0;\
     while (dataR[0]==1'b1) csr_read(CSRA_RUN, dataR);\
     if (dataR[23:16]!=n) $display("%d %m ERROR received %d, but %d expected",\
                                    $time, dataR[23:16], n);\
     if (p) begin /*pop when 1*/\
        for (idx=0; idx<n; idx=idx+1) begin\
             csr_read(CSRA_RX_DATA, dataR);\
             if (dataR[8]==1'b0) begin\
                 debug = debug + 1;\
                 $display("%d %m ACK error", $time);\
             end\
        end\
     end
//------------------------------------------------------------------------------
integer debug=0;
//------------------------------------------------------------------------------
// 7-bit dev-addr; 8-bit reg-addr
task i2c_read_d7r8;
     input  [ 6:0] dev_addr;
     input  [ 7:0] reg_addr;
     output [ 7:0] reg_data;
     reg    [31:0] dataW, dataR;
     integer idx, num;
begin
     //----------------------------------------------
     // fill SND-FIFO
     `DEV_ADDR_SND(dev_addr);
     `REG_ADDR_SND(reg_addr,1'b0,1'b1); // stop(0),repeat(1)
     `DEV_ADDR_RCV(dev_addr);
     `REG_DATA_RCV(1'b1); // stop
     num = 4;
     `GO_I2C(num);
     `WAIT_I2C(num,1'b0)
     for (idx=0; idx<(num-1); idx=idx+1) begin
          csr_read(CSRA_RX_DATA, dataR);
          if (dataR[8]==1'b0) begin
              $display("%d %m ACK error", $time);
          end
     end
     csr_read(CSRA_RX_DATA, dataR);
     if (dataR[8]==1'b1) begin
         $display("%d %m NACK error (end of read should be NACK)", $time);
     end
     reg_data = dataR[7:0];
end
endtask
//------------------------------------------------------------------------------
// 7-bit dev-addr; 8-bit reg-addr
task i2c_write_d7r8;
     input  [ 6:0] dev_addr;
     input  [ 7:0] reg_addr;
     input  [ 7:0] reg_data;
     reg    [31:0] dataR, dataW;
     integer idx, num;
begin
     //----------------------------------------------
     // fill SND-FIFO
     `DEV_ADDR_SND(dev_addr);
     `REG_ADDR_SND(reg_addr,1'b0,1'b0); // not stop yet
     `REG_DATA_SND(reg_data,1'b1); // stop
     num = 3;
     `GO_I2C(num);
     //----------------------------------------------
     `WAIT_I2C(num,1'b1)
end
endtask
//------------------------------------------------------------------------------
reg [7:0] reg_data_cont[0:127];
//------------------------------------------------------------------------------
// 7-bit dev-addr; 8-bit reg-addr
task i2c_read_d7r8_cont;
     input  [ 6:0] dev_addr;
     input  [ 7:0] reg_addr;//starting address
     input  [ 7:0] reg_num ;
     reg    [31:0] dataW, dataR;
     integer idx, num;
     integer idy;
begin
     //----------------------------------------------
     // fill SND-FIFO
     `DEV_ADDR_SND(dev_addr);
     `REG_ADDR_SND(reg_addr,1'b0,1'b1); // stop(0), repeat
     `DEV_ADDR_RCV(dev_addr);
     for (idy=0; idy<(reg_num-1); idy=idy+1) begin
         `REG_DATA_RCV(1'b0); // not stop
     end
     `REG_DATA_RCV(1'b1); // stop
     num = 3 + reg_num;
     `GO_I2C(num);
     `WAIT_I2C(num,1'b0)
     for (idx=0; idx<(num-reg_num); idx=idx+1) begin
          csr_read(CSRA_RX_DATA, dataR);
          if (dataR[8]==1'b0) $display("%d %m ACK error", $time);
     end
     for (idy=0; idy<(reg_num-1); idy=idy+1) begin
          csr_read(CSRA_RX_DATA, dataR);
          if (dataR[8]==1'b0) $display("%d %m ACK error", $time);
          reg_data_cont[idy] = dataR[7:0];
     end
     csr_read(CSRA_RX_DATA, dataR);
     if (dataR[8]==1'b1) $display("%d %m NACK error (end of read should be NACK)", $time);
     reg_data_cont[idy] = dataR[7:0];
end
endtask
//------------------------------------------------------------------------------
// 7-bit dev-addr; 8-bit reg-addr
task i2c_write_d7r8_cont;
     input  [ 6:0] dev_addr;
     input  [ 7:0] reg_addr;//starting address
     input  [ 7:0] reg_num ;//num of registers
     reg    [31:0] dataR, dataW;
     integer idx, num;
     integer idy;
begin
     //----------------------------------------------
     // fill SND-FIFO
     `DEV_ADDR_SND(dev_addr);
     `REG_ADDR_SND(reg_addr,1'b0,1'b0); // not stop yet
     for (idy=0; idy<(reg_num-1); idy=idy+1) begin
           `REG_DATA_SND(reg_data_cont[idy],1'b0); // not stop
     end
     `REG_DATA_SND(reg_data_cont[idy],1'b1); // stop
     num = 2+reg_num;
     `GO_I2C(num);
     `WAIT_I2C(num,1'b1)
end
endtask
//------------------------------------------------------------------------------
// 7-bit dev-addr; 16-bit reg-addr
task i2c_read_d7r16;
     input  [ 6:0] dev_addr;
     input  [15:0] reg_addr;
     output [ 7:0] reg_data;
     reg    [31:0] dataW, dataR;
     integer idx, num;
begin
     //----------------------------------------------
     // fill SND-FIFO
     `DEV_ADDR_SND(dev_addr);
     `REG_ADDR_SND(reg_addr[15:8],1'b0,1'b0);
     `REG_ADDR_SND(reg_addr[ 7:0],1'b0,1'b1);
     `DEV_ADDR_RCV(dev_addr);
     `REG_DATA_RCV(1'b1);
     num = 5;
     `GO_I2C(num);
     `WAIT_I2C(num,1'b0)
     for (idx=0; idx<(num-1); idx=idx+1) begin
          csr_read(CSRA_RX_DATA, dataR);
          if (dataR[8]==1'b0) $display("%d %m ACK error", $time);
     end
     csr_read(CSRA_RX_DATA, dataR);
     if (dataR[8]==1'b1) $display("%d %m NACK error (end of read should be NACK)", $time);
     reg_data = dataR[7:0];
end
endtask
//------------------------------------------------------------------------------
// 7-bit dev-addr; 16-bit reg-addr
task i2c_write_d7r16;
     input  [ 6:0] dev_addr;
     input  [15:0] reg_addr;
     input  [ 7:0] reg_data;
     reg    [31:0] dataR, dataW;
     integer idx, num;
begin
     //----------------------------------------------
     // fill SND-FIFO
     `DEV_ADDR_SND(dev_addr);
     `REG_ADDR_SND(reg_addr[15:8],1'b0,1'b0);
     `REG_ADDR_SND(reg_addr[ 7:0],1'b0,1'b0);
     `REG_DATA_SND(reg_data,1'b1);
     num = 4;
     `GO_I2C(num);
     `WAIT_I2C(num,1'b1)
end
endtask
//------------------------------------------------------------------------------
// 7-bit dev-addr; 16-bit reg-addr
task i2c_read_d7r16_cont;
     input  [ 6:0] dev_addr;
     input  [15:0] reg_addr;//starting address
     input  [ 7:0] reg_num ;
     reg    [31:0] dataW, dataR;
     integer idx, num;
     integer idy;
begin
     //----------------------------------------------
     // fill SND-FIFO
     `DEV_ADDR_SND(dev_addr);
     `REG_ADDR_SND(reg_addr[15:8],1'b0,1'b0); // stop
     `REG_ADDR_SND(reg_addr[ 7:0],1'b0,1'b1); // stop
     `DEV_ADDR_RCV(dev_addr);
     for (idy=0; idy<(reg_num-1); idy=idy+1) begin
         `REG_DATA_RCV(1'b0); // not stop
     end
     `REG_DATA_RCV(1'b1); // stop
     num = 4 + reg_num;
     `GO_I2C(num);
     `WAIT_I2C(num,1'b0)
     for (idx=0; idx<(num-reg_num); idx=idx+1) begin
          csr_read(CSRA_RX_DATA, dataR);
          if (dataR[8]==1'b0) $display("%d %m ACK error", $time);
     end
     for (idy=0; idy<(reg_num-1); idy=idy+1) begin
          csr_read(CSRA_RX_DATA, dataR);
          if (dataR[8]==1'b0) $display("%d %m ACK error", $time);
          reg_data_cont[idy] = dataR[7:0];
     end
     csr_read(CSRA_RX_DATA, dataR);
     if (dataR[8]==1'b1) $display("%d %m NACK error (end of read should be NACK)", $time);
     reg_data_cont[idy] = dataR[7:0];
end
endtask
//------------------------------------------------------------------------------
// 7-bit dev-addr; 16-bit reg-addr
task i2c_write_d7r16_cont;
     input  [ 6:0] dev_addr;
     input  [15:0] reg_addr;//starting address
     input  [ 7:0] reg_num ;//num of registers
     reg    [31:0] dataR, dataW;
     integer idx, num;
     integer idy;
begin
     //----------------------------------------------
     // fill SND-FIFO
     `DEV_ADDR_SND(dev_addr);
     `REG_ADDR_SND(reg_addr[15:8],1'b0,1'b0); // not stop yet
     `REG_ADDR_SND(reg_addr[ 7:0],1'b0,1'b0); // not stop yet
     for (idy=0; idy<(reg_num-1); idy=idy+1) begin
           `REG_DATA_SND(reg_data_cont[idy],1'b0); // not stop
     end
     `REG_DATA_SND(reg_data_cont[idy],1'b1); // stop
     num = 3 + reg_num;
     `GO_I2C(num);
     `WAIT_I2C(num,1'b1)
end
endtask
//------------------------------------------------------------------------------
task read_and_check;
     input   [31:0]     addr;
     input   [8*20-1:0] str;
     input   [31:0]     expextX;
     reg     [31:0]     data; // 0: OK
begin
     csr_read (addr, data); // data is justified
     $write("%s A:0x%08X D:0x%08X E:0x%08X ", str, addr, data, expextX);
     if (data!==expextX) begin
         $display(" Mis-match");
     end else begin
         $display(" Match");
     end
end
endtask
//------------------------------------------------------------------------------
task i2c_csr;
     reg [31:0] expextX;
begin
   read_and_check(CSRA_VERSION  , "VERSION  ", `I2C_MASTER_VERSION);
   read_and_check(CSRA_CONTROL  , "CONTROL  ", 32'h0000_0000);
   @ (posedge axil_aclk);
   expextX = {4'h0 // 31-28
            ,4'h0 // 27-24
            ,u_i2c_master.P_RX_DEPTH[7:0] //23-16
            ,u_i2c_master.P_TX_DEPTH[7:0] //15-8
            ,8'h0};
   read_and_check(CSRA_STATUS   , "STATUS   ",expextX);
   @ (posedge axil_aclk);
   expextX = {u_i2c_master.u_csr.P_I2C_NUM[3:0]
            ,12'h0
            ,u_i2c_master.u_csr.csr_conf_gap
            ,u_i2c_master.u_csr.csr_conf_post
            ,u_i2c_master.u_csr.csr_conf_mid
            ,u_i2c_master.u_csr.csr_conf_pre
            };
   read_and_check(CSRA_CONFIG   , "CONFIG   ",expextX);
   read_and_check(CSRA_SEL      , "SEL      ",32'h0000_0000);
   read_and_check(CSRA_CLK_FREQ , "CLK_FREQ ", u_i2c_master.u_csr.P_CLK_FREQ);
   read_and_check(CSRA_I2C_SPEED, "I2C_SPEED", u_i2c_master.u_csr.P_I2C_SPEED);
   read_and_check(CSRA_CLKDIV   , "CLKDIV   ", u_i2c_master.u_csr.P_CLK_DIV);
   expextX = {16'h0,u_i2c_master.u_csr.P_TX_DEPTH[7:0],8'h0};
   read_and_check(CSRA_RUN      , "RUN      ", expextX);
end
endtask
//------------------------------------------------------------------------------
`endif
