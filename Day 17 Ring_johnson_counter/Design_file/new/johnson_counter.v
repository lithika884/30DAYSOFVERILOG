`timescale 1ns / 1ps

//Johnson counter - the output of the complemented output of last flipflop is connected to the first flipflop
module johnson_counter(
input clk , rst ,
output reg [0:2] out_j
    );
    
    
always@(posedge clk) begin

//If reset is asserted then the out signal is set to 0

if(rst)  out_j <= 4'b0000;

//If reset is Low then left shifting is take place

else begin

  out_j <= { ~out_j[2],out_j[0:1] } ;

end

end
endmodule
