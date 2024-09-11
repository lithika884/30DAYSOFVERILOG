`timescale 1ns / 1ps


module serial_shiftregister(

input clk,rst,
input sin,
output sout,
output [3:0] pout

    );
    
//Module instantiation

//Serial in serial out
siso s1( .clk(clk),
          .rst(rst),
          .sin_siso(sin),
          .sout_siso(sout)
          );
         
// Serial in parallel out
sipo s2 ( .clk(clk),
          .rst(rst),
          .sin_sipo(sin),
          .pout(pout )
          
          );
          
          
endmodule
