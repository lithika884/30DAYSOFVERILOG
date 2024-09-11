`timescale 1ns / 1ps


module sipo(
input clk, rst ,
input  sin_sipo,
output [3:0]pout

    );
    
    
 reg [3:0] temp;
 
 
 always@(posedge clk)begin
 
 if(rst)  temp <= 4'b0000;
 
 else begin
 
 
 temp <= {temp[2:0], sin_sipo}; 
 
 end

 end
 
 assign pout = temp;
endmodule
