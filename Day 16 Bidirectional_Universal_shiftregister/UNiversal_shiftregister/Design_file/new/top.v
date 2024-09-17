//Day 16 update ; Universal shift register
/*

Universal shift register can do 
1. shift left 2.shift right 3. parallel loading 

The difference between the universal and bidirectional shift register is the use of paraallel loading
in bidirectional shift register.

*/
`timescale 1ns / 1ps

module universal_shiftregister(
input wire [3:0] p_din,
input clk , rst , 
input [ 1:0] sel ,
input wire s_left_din, s_right_din,
output reg [3:0] p_dout

    );
    
    
//behavioral modelling 


always@(posedge clk)begin
if(!rst) p_dout <= 0;   

else begin
case(sel) 

    2'b00: p_dout <= p_dout;              // Hold (no change)
      2'b01: p_dout <= {p_dout[2:0], s_left_din};  // Shift left
     2'b10: p_dout <= {s_right_din, p_dout[3:1]}; // Shift right
    2'b11: p_dout <= p_din;               // Parallel load
     default: p_dout <= p_dout;  
  
  endcase 


end

end
endmodule


Time resolution is 1 ps
time = 5000 | sel = 11 | p_din = 1101 | s_left_din = x | s_right_din = x | p_dout = xxxx
time = 15000 | sel = 1 | p_din = 1101 | s_left_din = 1 | s_right_din = x | p_dout = 1101
time = 25000 | sel = 10 | p_din = 1101 | s_left_din = 1 | s_right_din = 1 | p_dout = 1011
time = 35000 | sel = 1 | p_din = 1101 | s_left_din = 1 | s_right_din = 1 | p_dout = 1101
time = 45000 | sel = 0 | p_din = 1101 | s_left_din = 1 | s_right_din = 1 | p_dout = 1011
time = 55000 | sel = 0 | p_din = 1101 | s_left_din = 1 | s_right_din = 1 | p_dout = 1011
$finish called at time : 60 ns : File 

