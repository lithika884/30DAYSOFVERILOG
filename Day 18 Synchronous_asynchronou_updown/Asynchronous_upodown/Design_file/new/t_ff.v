`timescale 1ns / 1ps
// T Flip-Flop Design
module t_ff (
    input clk, rst, t,
    output reg q,
    output qbar
);

  always @(posedge clk or posedge rst) begin
    if (rst)
      q <= 1'b0;  // Reset output to 0
    else if (t)
      q <= ~q;    // Toggle when T is 1
    // If t = 0, q remains unchanged
  end
  
  assign qbar = ~q;  // qbar is the complement of q

endmodule

