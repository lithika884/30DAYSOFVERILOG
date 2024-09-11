`timescale 1ns / 1ps

// Day 16 serial in serial out
module siso(
input clk, rst , 
input sin_siso,
output sout_siso 

    );
    
reg [3:0] temp;


always@(posedge clk)begin

if(rst) temp <= 4'b0000;

else begin

temp <= {temp[2:0],sin_siso};


end

end

assign sout_siso = temp[3];
endmodule
