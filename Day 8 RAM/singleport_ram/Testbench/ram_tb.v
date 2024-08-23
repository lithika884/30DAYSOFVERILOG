
module ram_tb;
  // Testbench signals
  reg clk;
  reg rst;
  reg [7:0] din;
  reg [5:0] addr;
  reg we;
  wire [7:0] dout;

  // Instantiate the RAM module
  ram uut (
    .clk(clk),
    .rst(rst),
    .din(din),
    .addr(addr),
    .we(we),
    .dout(dout)
  );

  // Clock generation
  always #5 clk = ~clk;  // Generate a clock with 10 time units period
  
  initial begin
      $dumpfile("dump.vcd");
      $dumpvars;
      
    end
    

  // Testbench sequence
  initial begin
    // Initialize signals
    clk = 0;
    rst = 1;
    din = 8'h00;
    addr = 6'h00;
    we = 0;
    
    // Reset the RAM
    #10 rst = 0;
    
    
    // Write data 0xAA to address 0x01
    #10 we = 1;
        din = 8'hAA;
        addr = 6'h01;
        
    // Write data 0x55 to address 0x02
    #10 addr = 6'h02;
        din = 8'h55;

    // Write data 0xFF to address 0x03
    #10 addr = 6'h03;
        din = 8'hFF;

    // Stop writing and start reading
    #10 we = 0;
        
    
    // Read data from address 0x01
    addr = 6'h01;
    
    // Read data from address 0x02
    #10 addr = 6'h02;

    // Read data from address 0x03
    #10 addr = 6'h03;

    // Finish simulation
    #10 $finish;
  end

  // Monitor signals
  initial begin
    $monitor("Time = %0t | rst = %b | we = %b | addr = 0x%0h | din = 0x%0h | dout = 0x%0h", 
             $time, rst, we, addr, din, dout);
  end

endmodule
