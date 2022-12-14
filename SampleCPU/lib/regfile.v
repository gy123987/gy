`include "defines.vh"
module regfile(
    input wire clk,
    input wire rst,
    input wire [4:0] raddr1,
    output wire [31:0] rdata1,
    input wire [4:0] raddr2,
    output wire [31:0] rdata2,
    
    input wire we,
    input wire [4:0] waddr,
    input wire [31:0] wdata,

    input wire hi_we,
    input wire [31:0] hi_i,
    input wire lo_we,
    input wire [31:0] lo_i,

    output wire [31:0] hi_o,
    output wire [31:0] lo_o
);
    reg [31:0] reg_array [31:0];
    reg [31:0] hi_reg,lo_reg;
    // write
    always @ (posedge clk) begin
        if (we && waddr!=5'b0) begin
            reg_array[waddr] <= wdata;
        end
    end

    always @ (posedge clk) begin
        if (rst) begin
            hi_reg<=32'b0;
            lo_reg<=32'b0;
        end
        else if(hi_we & lo_we)begin
            hi_reg<=hi_i;
            lo_reg<=lo_i;
        end
        else if(hi_we & ~lo_we)begin
            hi_reg<=hi_i;
        end
        else if(~hi_we & lo_we)begin
            lo_reg<=lo_i;
        end
    end
    assign hi_o=hi_reg;
    assign lo_o=lo_reg;
    // read out 1
    assign rdata1 = (raddr1 == 5'b0) ? 32'b0 : reg_array[raddr1];

    // read out2
    assign rdata2 = (raddr2 == 5'b0) ? 32'b0 : reg_array[raddr2];
endmodule