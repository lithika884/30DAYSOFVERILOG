`timescale 1ns / 1ps
// Behavioral code of frequency divider
module frequencydivider(
  input clk,
  input start,
  output reg [1:0] count
);
  always @(posedge clk) begin
    if (start) begin
      if (count == 2)
        count <= 0;  // Reset count when it reaches 2
      else
        count <= count + 1;  // Increment count otherwise
    end
    else begin
      count <= 0;  // Reset count when start is not active
    end
  end
endmodule