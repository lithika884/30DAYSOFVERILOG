`timescale 1ns/1ps
module tb_t_ff();

  // Testbench signals
  reg t, clk, rst;
  wire q_d, q_sr, q_jk;

  // Instantiate the T flip-flop module
  t_ff dut (
      .t(t),
      .clk(clk),
      .rst(rst),
      .q_d(q_d),
      .q_sr(q_sr),
      .q_jk(q_jk)
  );

  // Generate clock signal with 10ns period
  initial begin
    clk = 1'b0;
    forever #5 clk = ~clk;  // Toggle clock every 5ns
  end

  // Stimulus process
  initial begin
    // Initialize the inputs
    t = 1'b0;
    rst = 1'b1;
    #10 rst = 1'b0;

    // Apply test vectors
    #10 t = 1'b1;
    #10 t = 1'b0;
    #10 t = 1'b1;
    #10 t = 1'b0;
    #10 t = 1'b1;

    #20 $finish();  // End simulation
  end

  // Monitor the outputs
  initial begin
    $monitor("time = %0t, clk = %b, t = %b, q_d = %b, q_sr = %b, q_jk = %b", $time, clk, t, q_d, q_sr, q_jk);
  end

  // Dump waveforms for analysis
  initial begin
    $dumpfile("dump.vcd");  // Output file
    $dumpvars(1, tb_t_ff);  // Dump all variables
  end

endmodule
