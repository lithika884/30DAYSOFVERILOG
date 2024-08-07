`timescale 1ns / 1ps

module ripplecarryadder_tb;
reg [3:0] A ,B;
reg cin ;
wire [3:0]sum , Cout;
wire [4:0] add ;

// Instatntiation
ripplecarrryadder  rca(A,B,cin,sum ,Cout);
assign add = {Cout, sum};

initial 
begin
$display("A = %b, B = %b,cin = %b , sum = %b , Cout = %b , addition = %0d",A,B,cin ,sum ,Cout[3],add);
cin = 0;
A = 1;
B = 2;
#10
A= 4;
B = 6;
#10
A = 7;
B = 2;
#10
A = 8;
B = 1;
#10
$finish();

end 
endmodule
