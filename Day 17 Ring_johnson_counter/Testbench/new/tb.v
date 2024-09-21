`timescale 1ns / 1ps

module tb_ring_johnson;  // Testbench for Ring and Johnson counters

    // Inputs
    reg clk;
    reg rst;

    // Outputs
    wire [0:2] out_r;  // Output of the ring counter
    wire [0:2] out_j;  // Output of the Johnson counter

    // Instantiate the Unit Under Test (UUT)
    ring_johnson uut (
        .clk(clk),
        .rst(rst),
        .out_r(out_r),
        .out_j(out_j)
    );

    // Clock generation: Toggle every 10ns
    always #5 clk = ~clk;

    // Stimulus block
    initial begin
        // Initialize inputs
        clk = 0;
        rst = 1;

        // Apply reset
        #10;
        rst = 0;  // Release reset after 10ns

        // Simulate for a total of 100ns
        #100;
        
        // End simulation
        $stop;
    end

    // Monitor block to display outputs at every clock edge
    initial begin
        $monitor("Time: %0t | Ring Counter: %b | Johnson Counter: %b", $time, out_r, out_j);
    end

endmodule
