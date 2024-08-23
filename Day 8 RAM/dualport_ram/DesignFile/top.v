// Code your design here
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.08.2024 23:15:53
// Design Name: 
// Module Name: multiport_ram
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module multiportram(

input clk,rst,
input [5:0] we_addr,re_addr,
input  [7:0] din,
output reg[7 :0] dout ,
input we_en,rd_en  

 );
 
 reg [7:0] mem [63 :0];
 integer i;
 
 always@(posedge clk)
 begin
 if(rst == 1'b1)
 begin
    for(i = 0;i < 64 ; i = i+1)
    begin
        mem[i] <= 8'h00;
        dout <= 8'h00;
     end
  end
  
  else 
  if(we_en == 1'b1)
    mem[we_addr] <= din;
    
  else
    mem[we_addr] <= 8'h00;
   
  
  if(rd_en == 1'b1)
  begin
  dout <= mem[re_addr];
  end
  
 end
endmodule
