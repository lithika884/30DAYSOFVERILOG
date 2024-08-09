`timescale 1ns / 1ps


// 16 bit carry look ahead adder

module cla16bit( a,b,cin ,sum , cout);
input [15:0] a,b;
input cin ;
output [15 : 0] sum;
output cout ;
wire c1,c2,c3;


// Explicit declaration 

cla cla1 (.a(a[3:0]) , .b(b[3:0]), .cin(cin) , .sum(sum[3:0]) , .cout(cout) );
cla cla2(.a(a[7:4]) , .b(b[7:4]) , .cin(c1) , .sum(sum[7:4]) , .cout(cout) );
cla cla3 (.a(a[11:8]) , .b(b[11:8]) , .cin(c2) , .sum(sum[11:8]) , .cout(cout) );
cla cla4 (.a(a[15:12]) , .b(b[15:12]) , .cin(c3) , .sum(sum[15:12]) , .cout(cout) );

endmodule


// 4 bit carry look ahead adder 



module cla(
input [3:0] a , b ,
input cin ,
output [3:0] sum ,
output cout
    );
// P - Propagate , G - Generate , C - Carry 
    
  wire [3:0] p,g,c;
  
  assign p = a^b;
  assign g = a&b;
  
  assign c[0] = cin;
  assign c[1] = g[0] | (p[0] & c[0]);
  assign c[2] = g[1] | (p[1] & g[0]) | p[1]&p[0]&c[0] ;
  assign c[3] = g[2] | (p[2] & g[1] ) | (p[2] & p[1] & g[0]) | p[2]&p[1]&p[0]&c[0] ;
  assign cout = g[3] | (p[3] & g[2] ) | (p[3] & p[2] & g[1] ) | p[3]& p[2]&p[1]&g[0] | p[3]&p[2]&p[1]&p[0]&c[0];
  assign sum = a^b^c;
endmodule
