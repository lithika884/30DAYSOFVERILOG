`timescale 1ns / 1ps


module bin_gray_tb();
reg [3:0]b_in;
wire [3:0]g_out;

//instantiation 

bin_gray dut (b_in , g_out);
integer i ;
initial 

begin


b_in = 1;
#10
b_in = 2;
#10
b_in = 3;
#10
b_in = 4;
#10
b_in = 5;
#10
$finish();

end 

endmodule
