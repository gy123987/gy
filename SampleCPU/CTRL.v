`include "lib/defines.vh"
module CTRL(
    input wire rst,
    input wire stallreq_for_ex,
    input wire stallreq_for_load,
    input wire stallreq_for_bru,

    //output reg flush,
    //output reg [31:0] new_pc,
    output reg [`StallBus-1:0] stall
);  
    always @ (*) begin
        if (rst) begin
            stall = `StallBus'b0;
        end
        else if(stallreq_for_load) begin
            stall = `StallBus'b000011;
        end
        else if(stallreq_for_bru) begin
            stall = `StallBus'b000111;
        end
        else if(stallreq_for_ex) begin
            stall = `StallBus'b001111;
        end
        else begin
            stall = `StallBus'b0;
        end
    end

endmodule