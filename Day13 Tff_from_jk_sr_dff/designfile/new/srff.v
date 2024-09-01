`timescale 1ns / 1ps

module sr_ff(
    input s, r, clk, rst,
    output reg q_sr, 
    output qbar_sr
);

always @(posedge clk or posedge rst) begin
    if (rst) begin
        q_sr <= 1'b0;
    end else begin
        case ({s, r})
            2'b00 : q_sr <= q_sr;
            2'b01 : q_sr <= 0;
            2'b10 : q_sr <= 1;
            2'b11 : q_sr <= 1'bx;
        endcase
    end
end

assign qbar_sr = ~q_sr;

endmodule
