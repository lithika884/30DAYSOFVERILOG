`timescale 1ns/1ps

module encoder (
  input [3:0] in ,
  output reg [1:0] out 
);
  
  always@(*)
    begin
      case(in)
        4'b0001 : out = 2'b00;
        4'b0010 : out = 2'b01;
        4'b0100 : out = 2'b10;
        4'b1000 : out = 2'b11;
        
        default : out = 2'b00;
      endcase
    end
endmodule


module decoder (
  input [1:0] in,
  output reg [3:0] out );
  
  always@(*)
    begin
      case(in)
        2'b00 : out = 4'b0001;
        2'b01 : out = 4'b0010;
        2'b10 : out = 4'b0100;
        2'b11 : out = 4'b1000;
        default : out = 4'b0000;
      endcase
    end
  
endmodule


module encoder_decoder(
  input [3:0] original_in,
  output [3:0] final_out);
  
  wire [1:0] enc_out;
  
  encoder u1(
    .in(original_in),
        .out(enc_out)
        
       
       );
  
        decoder u2(
          .in(enc_out),
          .out(final_out)
        );
        
        
 endmodule