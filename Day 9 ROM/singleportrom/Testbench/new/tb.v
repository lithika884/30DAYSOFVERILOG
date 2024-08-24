`timescale 1ns / 1ps

module tb_rom();
  reg clk , rst;
  reg [3:0] addr;
  reg en;
  wire [3:0] dout ;
  
  
  //Instantiate the design file
  
  rom dut ( .clk(clk),
           .rst(rst),
           .en(en),
           .addr(addr),
           .dout(dout)
          );
  
  //Generate the clock signals for a time period of 10 seconds
  
  initial begin
    
    $dumpfile("dump.vcd");
    $dumpvars(1,tb_rom);
    
    clk = 1'b0;
    forever #5 clk = ~clk;
    
  end
  
  //Test cases - Generating the  random values from 0 to 15 after 10 delays 
  //Run for 100 periods
  integer i;
  
  initial begin
    
    
    rst = 1'b1;
    en = 1'b1;
    
    #10
    en = 1'b0;
    
    #10
    
    rst = 1'b0;
    en = 1'b1;
    for(i = 0; i <16 ; i = i + 1)
      begin
        addr = $urandom_range(0,15);
        #10;
      end
  
    
    #10;
    
    $finish();
    
  end
  
  initial begin
     $monitor("time : %0t , dout : %d",$time,dout); 
    
  end
  
endmodule
