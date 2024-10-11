`timescale 1ns / 1ps

module tb_cyclic_lamp();
reg clk ;
wire [2:0] light;

cyclic_lamp LAMP ( .clk(clk) ,
                    .light(light)
                    
                    );
                    
 initial begin
  clk = 1'b0;
 
 end
 
 always #5 clk = ~clk;
 
 initial begin
 
 #100;
 $finish();
 
 end
 
 always@(posedge clk) begin
 $display("time = %0t , clk = %d , light = %b" , $time , clk , light );
 end
endmodule
