`timescale 1ns / 1ps
// Code your testbench here
// or browse Examples
module tb_frequencydivider();
  reg clk,start;
  wire [1:0] count;
  
  frequencydivider dut( .clk(clk),
                        .start(start),
                        .count(count)
                       );
  
  initial begin
    
    clk = 1'b0;
    forever #5 clk = ~clk;
    
    

  end
  
  initial begin
    
   
    start = 1;
    #10
    start = 0;
    #10;
    start = 1;
    
    #10
    start = 0;
    
    
    #20;
    
    $finish();
    
    
  end
  
  always@(posedge clk)begin
    $display(" time = %0d , clk = %0d, count = %0d", $time,clk,count); 
             
    
    
  end
  
 
  
  
  initial 
  begin
    
    $dumpfile("dump.vcd");
    $dumpvars(1);
   
    
    
  end
  
  
  
endmodule