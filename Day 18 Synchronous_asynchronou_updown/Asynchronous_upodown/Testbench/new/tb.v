`timescale 1ns / 1ps
// Testbench for Asynchronous Up/Down Counter
module tb_async_upordowncounter();
  reg clk, rst, t, up;
  wire [1:0] q, qbar;
  
  async_upordowncounter dut (
    .clk(clk),
    .rst(rst),
    .t(t),
    .up(up),
    .q(q),
    .qbar(qbar)
  );
  
 initial begin
    clk = 1'b0;
    forever #5 clk = ~clk;  // 10 time units clock period
  end
  // Stimulus generation
  initial begin
    // Initialize signals
    rst = 1'b1; t = 1'b0; up = 1'b0;
    #1
    // Reset the counter
    rst = 1'b0; // Test up counting
    up = 1'b1; t = 1'b1;   // Enable counting (up)
    #80;// Test down counting
    up = 1'b0;             // Switch to down counting
    #80;
     $finish();
  end
  // Monitor outputs
  always @(posedge clk) begin
    $display("time = %0t, clk = %b, rst = %b, t = %b, up = %b, q = %b, qbar = %b",
             $time, clk, rst, t, up, q, qbar);
  end
  
  // VCD dump for waveform analysis
initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1, tb_async_upordowncounter);
end
  
endmodule
