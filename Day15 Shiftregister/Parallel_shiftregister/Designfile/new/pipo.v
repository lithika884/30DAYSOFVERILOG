`timescale 1ns / 1ps
module pipo (
input clk,rst,
output [3:0]pin_pipo,
output [3:0]pout_pipo

);

reg [3:0] temp;

always@(posedge clk)begin

if(rst)  temp <= 4'b0000;

else begin

temp  <= pin_pipo;

end


end

assign pout_pipo = pin_pipo;

endmodule