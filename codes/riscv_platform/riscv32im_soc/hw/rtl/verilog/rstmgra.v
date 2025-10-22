
module rstmgra
(
      input  wire         clk
    , input  wire         rstn

    , output wire  [15:0] GPIN
    , input  wire  [15:0] GPOUT

    , output wire         bus_resetn
    , output wire         cpu_resetn
);
    localparam RN=5;
    reg  [RN-1:0] cpu_resetn_reg;
    integer idx;
    always @ (posedge clk or negedge rstn) begin
        if (rstn==1'b0) begin
            cpu_resetn_reg <= {RN{1'b0}};
        end else begin
            cpu_resetn_reg[0] <= bus_resetn;
            for (idx=0; idx<RN-1; idx=idx+1) begin
                cpu_resetn_reg[idx+1] <= cpu_resetn_reg[idx];
            end
        end // if
    end // always
    assign GPIN ={GPOUT[15:2],cpu_resetn,bus_resetn};
    assign bus_resetn= rstn&~GPOUT[0];
    assign cpu_resetn=(&cpu_resetn_reg)&~GPOUT[1];
endmodule
