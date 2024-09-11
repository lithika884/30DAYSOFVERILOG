`timescale 1ns / 1ps

module parallel_shiftregister(

input clk , rst , en,
input [3:0] pin,
output sout_piso,
output [3:0] pout 

    );
    
 //Instantaite the module
 
 
 piso s1 ( .clk(clk),
 .rst(rst),
 .en(en),
 .pin_piso(pin),
 .sout_piso(sout_piso)
 );
 
  pipo s2 ( .clk(clk),
 .rst(rst),
 .pin_pipo(pin),
 .pout_pipo(pout)
 );
 
 
endmodule
