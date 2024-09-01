`timescale 1ns / 1ps

module d_ff(
    input d, clk, rst,
    output reg q_d, 
    output qbar_d
);

always @(posedge clk or posedge rst) begin
    if (rst) begin
        q_d <= 0;
    end else begin
        q_d <= d;
    end
end

assign qbar_d = ~q_d;

endmodule
