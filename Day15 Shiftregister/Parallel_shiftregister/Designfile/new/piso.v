`timescale 1ns / 1ps

module piso (
  input clk,    // Clock signal
  input rst,    // Reset signal
  input en,     // Enable signal (parallel load enable)
  input [3:0] pin_piso,  // Parallel input (4 bits)
  output sout_piso   // Serial output (1 bit)
);

  reg [3:0] temp;  // 4-bit shift register

  always @(posedge clk or posedge rst) begin
    if (rst) begin
      temp <= 4'b0000;  // Reset the shift register
    end else if (en) begin
      temp <= pin_piso;  // Parallel load when enable is high
    end else begin
      temp <= {temp[2:0], 1'b0};  // Shift right, insert 0 at MSB
    end
  end

  // Assign the LSB of the shift register as the serial output
  assign sout_piso = temp[0];

endmodule
