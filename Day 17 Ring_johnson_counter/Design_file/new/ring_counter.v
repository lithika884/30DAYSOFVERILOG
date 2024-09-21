`timescale 1ns / 1ps

//Ring counter - The output of the last flipflop is connnected to the first flipflop
module ring_counter(

input clk , rst ,
output reg [0:2] out_r 
    );
    
    
always@(posedge clk) begin

//If reset is asserted then the out signal is set to 1

if(rst)  out_r <= 4'b0001;

//If reset is Low then left shifting is take place

else begin

  out_r <= { out_r[2],out_r[0:1] } ;

end

end
endmodule
