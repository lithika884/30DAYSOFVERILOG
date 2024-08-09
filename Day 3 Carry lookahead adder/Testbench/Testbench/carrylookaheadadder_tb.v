`timescale 1ns / 1ps



module cla16bit_tb;

reg [3:0] a,b;
reg cin ;
wire[3:0]sum ;
wire cout ;
wire [4:0] add ;
// Instantiation

/*Instantiation can be done in two ways 
1.Implicit 
2.Explicit
*/
cla dut
(
            .a(a),
            .b(b) ,
            .cin(cin) ,
            .sum(sum),
            .cout(cout)
            );
            

assign add = {cout ,sum };         
initial
 begin
a = 1;
b = 6;
cin = 0;

#20

a = 2;
b = 4 ;
cin = 1;

#20

a = 3;
b = 4;
cin = 0;
#20

a = 4;
b = 7;
cin = 0;

#20 

a = 9 ;
b = 3 ;
cin = 1;
#20
$finish();
end
endmodule
