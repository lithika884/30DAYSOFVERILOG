`timescale 1ns / 1ps

module full_adder (
input A , B,
input cin ,
output sum,
output Cout
);
assign sum= A ^ B^cin;
assign Cout = ((A & B) | (B&cin) | (A & cin));

endmodule

// Dataflow modelling 
module ripplecarrryadder  #(parameter SIZE = 4)   
// Parameter is a keyword used to define the  size of the input .Using Parameter can implement N bit addition 
(

input [SIZE-1:0] A,B,
input cin ,
output [SIZE-1:0] sum ,Cout 

);
 // generate is a keyword mostly used in looping statement 
genvar k;
// Instantiation of full adder
full_adder fa0(A[0],B[0],cin,sum[0],Cout[0]);
generate 
for(k = 1 ; k <SIZE ; k= k+1)
begin
full_adder fa(A[k],B[k],Cout[k-1],sum[k],Cout[k]);
end 
endgenerate

endmodule
