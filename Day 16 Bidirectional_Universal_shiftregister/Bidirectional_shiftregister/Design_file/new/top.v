//Day 16 Update : Bidirectiona shift register

`timescale 1ns / 1ps

module bidirectional_shift #(parameter size = 4)(
input wire clk,rst,en,dir,d,
output reg [size - 1:0]out 
);

// 0 = shift left 1= shift right

//direction refers to load condition

always@(posedge clk) begin

if(!rst) out <= 0;

else begin

if (en) begin

case (dir)

  0 : out <= { out[size - 2:0] , d};   //shift left
  1 : out <= { d , out[size - 3:1]};   //shift right
  
  endcase
end
 else    out <= out ;

end
end
endmodule


# run 1000ns
time = 5000 , clk = 1, rst = 0 , en = 0 , dir = 0 , d = 1 , out = xxxxxxxxxxxxxxxx 
time = 15000 , clk = 1, rst = 1 , en = 0 , dir = 0 , d = 1 , out = 0000000000000000 
time = 25000 , clk = 1, rst = 1 , en = 1 , dir = 0 , d = 1 , out = 0000000000000000 
time = 35000 , clk = 1, rst = 1 , en = 1 , dir = 0 , d = 0 , out = 0000000000000001 
time = 45000 , clk = 1, rst = 1 , en = 1 , dir = 0 , d = 1 , out = 0000000000000010 
time = 55000 , clk = 1, rst = 1 , en = 1 , dir = 0 , d = 0 , out = 0000000000000101 
time = 65000 , clk = 1, rst = 1 , en = 1 , dir = 0 , d = 1 , out = 0000000000001010 
time = 75000 , clk = 1, rst = 1 , en = 1 , dir = 0 , d = 0 , out = 0000000000010101 
time = 85000 , clk = 1, rst = 1 , en = 1 , dir = 0 , d = 1 , out = 0000000000101010 
time = 95000 , clk = 1, rst = 1 , en = 1 , dir = 1 , d = 0 , out = 0000000001010101 
time = 105000 , clk = 1, rst = 1 , en = 1 , dir = 1 , d = 1 , out = 0000000000101010 
time = 115000 , clk = 1, rst = 1 , en = 1 , dir = 1 , d = 0 , out = 0010000000010101 
time = 125000 , clk = 1, rst = 1 , en = 1 , dir = 1 , d = 1 , out = 0001000000001010 
time = 135000 , clk = 1, rst = 1 , en = 1 , dir = 1 , d = 0 , out = 0010100000000101 
time = 145000 , clk = 1, rst = 1 , en = 1 , dir = 1 , d = 1 , out = 0001010000000010 
time = 155000 , clk = 1, rst = 1 , en = 1 , dir = 1 , d = 0 , out = 0010101000000001 
time = 165000 , clk = 1, rst = 1 , en = 1 , dir = 1 , d = 1 , out = 0001010100000000 
time = 175000 , clk = 1, rst = 1 , en = 1 , dir = 1 , d = 1 , out = 0010101010000000 
time = 185000 , clk = 1, rst = 1 , en = 1 , dir = 1 , d = 1 , out = 0011010101000000 
time = 195000 , clk = 1, rst = 1 , en = 1 , dir = 1 , d = 1 , out = 0011101010100000 
time = 205000 , clk = 1, rst = 1 , en = 1 , dir = 1 , d = 1 , out = 0011110101010000 
time = 215000 , clk = 1, rst = 1 , en = 1 , dir = 1 , d = 1 , out = 0011111010101000 
time = 225000 , clk = 1, rst = 1 , en = 1 , dir = 1 , d = 1 , out = 0011111101010100 
time = 235000 , clk = 1, rst = 1 , en = 1 , dir = 1 , d = 1 , out = 0011111110101010 
time = 245000 , clk = 1, rst = 1 , en = 1 , dir = 1 , d = 1 , out = 0011111111010101 
time = 255000 , clk = 1, rst = 1 , en = 1 , dir = 1 , d = 1 , out = 0011111111101010 
time = 265000 , clk = 1, rst = 1 , en = 1 , dir = 1 , d = 1 , out = 0011111111110101 
time = 275000 , clk = 1, rst = 1 , en = 1 , dir = 1 , d = 1 , out = 0011111111111010 
time = 285000 , clk = 1, rst = 1 , en = 1 , dir = 1 , d = 1 , out = 0011111111111101 
time = 295000 , clk = 1, rst = 1 , en = 1 , dir = 1 , d = 1 , out = 0011111111111110 
$finish called at time : 305 ns : File 
