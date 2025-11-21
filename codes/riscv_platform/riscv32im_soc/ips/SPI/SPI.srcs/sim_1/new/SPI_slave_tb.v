`timescale 1ns/1ns

module SPI_slave_tb;
    
    reg clk;
    reg rst;
    // Chip Select
    reg cs;
    // Serial Clock
    reg sck;
    // Master Out Slave In
    reg mosi;
    // Master In Slave Out
    wire miso;

    SPI_slave uut (
        .clk (clk),
        .rst (rst),
        .cs (cs),
        .sck (sck),
        .mosi (mosi),
        .miso (miso)
    );

    initial clk = 0;
    always #10 clk = ~clk;
    
    initial begin
        #10 rst = 1;
        #50 rst = 0;
        #1500 $finish;
    end

    initial begin
        $dumpfile("./temp/SPI_Slave_tb.vcd");
        $dumpvars(0,spi_slave_tb);
    end

endmodule