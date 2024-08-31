`timescale 1ns / 1ps


// Code your testbench here
// or browse Examples
`timescale 1ns/1ps 
module tb_d_flipflop();
  reg d,clk;
  
  wire q,q_bar;
  
  // Instantiate D Flip-Flop  
d_flipflop dut (  
    .d(d),  
    .clk(clk),  
    .q(q),  
    .q_bar(q_bar)  
);  
  // Dump the wavefile 
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1,tb_d_flipflop);
              
    //Initialize the values 
    clk =1'b0;
    d = 1'b0;
    
    forever #5 clk = ~clk;
    
  end 
              
  //Testcases
              
   initial begin
     d = 1'b0;
     
     #10
     
     d = 1'b1;
     
     #10
     
     d = 1'b0;
     
     #10
     
     d = 1'b1;
     
     #10
     
     d = 1'b0;
     
     #10
     
     d = 1'b1;
     
     #20;
     
     $finish();
     
     
   end
              
  //Display the values 
              
   initial begin
     
     $monitor(" time = %0t,clk= %d,d = %b , q = %b , q_bar = %b ", $time,clk,d,q,q_bar );
     
     
   end
              
              
              
endmodule