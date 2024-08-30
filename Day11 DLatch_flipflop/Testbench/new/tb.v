`timescale 1ns / 1ps
// Testbench module for D Latch and D Flip-Flop
module tb_d_latch_flipflop();
    reg d, en, clk;
    wire q_latch, q_bar_latch, q_flipflop, q_bar_flipflop;

    d_global dut(
                    .d(d),
                    .en(en),
                    .clk(clk),
                    .q_latch(q_latch),
                    .q_flipflop(q_flipflop),
                    .q_bar_latch(q_bar_latch),
                    .q_bar_flipflop(q_bar_flipflop)
                    );
    // Generate clock signal
    initial begin
      $dumpfile("dump.vcd");
      $dumpvars(1,tb_d_latch_flipflop);
        clk = 0;
        forever #10 clk = ~clk;  // Toggle clk every 10 time units
    end 

    // Testcases
    initial begin
        // Initialize inputs
        en = 1'b0;
        d = 1'b0;

        // Apply test vectors
        #5 en = 1'b1; d = 1'b1;   // Set `d` to 1, enable D latch
        #15 en = 1'b0;            // Disable D latch
        #10 d = 1'b0;             // Change `d` while latch is disabled
        #10 en = 1'b1;            // Enable D latch again
        #15 d = 1'b1;
        #25 d = 1'b0;

        $finish();
    end 

    // Monitor outputs at every positive edge and negative edge of clk
    always @(posedge clk) begin
        $display("time = %d, posedge clk: d = %b, q_flipflop = %b, q_bar_flipflop = %b", $time, d, q_flipflop, q_bar_flipflop);
    end
    
    always @(negedge clk) begin
        $display("time = %d, negedge clk: d = %b, q_flipflop = %b, q_bar_flipflop = %b", $time, d, q_flipflop, q_bar_flipflop);
    end

    // Display outputs for D Latch
    always @* begin
        $display("time = %d, en = %b, d = %b, q_latch = %b, q_bar_latch = %b", $time, en, d, q_latch, q_bar_latch);
    end

endmodule
