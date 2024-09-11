`timescale 1ns / 1ps


module tb_parallel_shiftregister();

reg clk,rst,en;
reg [3:0] pin;
wire sout_piso;
wire [3:0]pout;


//Mapping the signals 
parallel_shiftregister dut ( .clk(clk),
                              .rst(rst),
                              .pin(pin),
                              .en(en),
                              .sout_piso(sout_piso),
                              .pout(pout)
                              );


  // Clock generation: Toggle every 5 time units
  initial begin
    clk = 1'b0;
    forever #5 clk = ~clk;
  end

  // Enable toggling every 20 time units
  always #20 en = ~en;

  // Test cases
  initial begin
  // Initial reset and disable
  rst = 1; en = 0; pin = 4'b0000;
  #10 rst = 0;  // Release reset

  // Load parallel data when enable is high
  #10 pin = 4'b1011; en = 1;
  #10 en = 0; // Start shifting the data serially
  #80;        // Wait for 8 shifts to fully observe the serial output

  // Load new parallel data
  #10 pin = 4'b1100; en = 1;
  #10 en = 0; // Start shifting the new data
  #80;        // Wait for 8 shifts

  // Finish simulation
  $finish();
end


  // Monitor and display the signals
  always @(posedge clk) begin
    $display("Time = %0t | clk = %b | rst = %b | en = %b | pin = %b | pout = %b,sout = %b", 
              $time, clk, rst, en, pin, pout,sout_piso);
  end



endmodule
