`timescale 1ns / 1ps

// Code your testbench here
// or browse Examples
module tb_synchronous_upordowncounter();
  
  
  reg clk , rst , sel ;
  wire [2:0] cnt ;
  
 //Instantiation of design file 
  synchronous_upordowncounter  dut(  .clk(clk),
                              .rst(rst),
                              .sel(sel),
                              .cnt(cnt)
                              
                             );
  
 //Initializing all the signals
  
  //Testcases
  initial begin
    clk  = 1'b0 ; rst = 1'b0; sel = 1'b0;
    
  end
  
  
  //Generating the clock signals
  always #5 clk = ~clk ;
  
  initial begin
    
    #10 rst = 1'b1; //Resetting the  count to zero
    
    #10 rst = 1'b0;
    
    #10 sel = 1'b0;
    
    //Up counter counts for 20 clock cycles
    
    
    #70 sel = 1'b1;
    
    
    //Down counter counts for 20 clock cycles 
    
    
    #90;
    
    $finish();
    
    
    
  end
  
 
  
  //Displaying the contents
  always@(posedge clk)begin
    
    $display("time = %0t , clk = %0d , rst = %0d , sel = %0d , cnt = %b", $time,clk,rst,sel,cnt);
    
  end
  
  
  //Dumping the file
  
  initial begin
   
    $dumpfile("dump.vcd");
    $dumpvars(1);
    
  end
  
  
endmodule