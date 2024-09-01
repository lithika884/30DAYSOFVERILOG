//JK Flipflop

`timescale 1ns/1ps

module jkff(
input j,k,clk,rst,
output reg q_jk,
output qbar_jk
);

always@(posedge clk)begin
if(rst)begin
q_jk = 1'b0;
end


if(clk)
    begin
    case({j,k})
    2'b00 : q_jk <= q_jk;
    2'b01 : q_jk <= 0;
    2'b10 : q_jk <= 1;
    2'b11 : q_jk <= ~q_jk;
   
    endcase
   end

end

assign qbar_jk = ~q_jk;
endmodule
