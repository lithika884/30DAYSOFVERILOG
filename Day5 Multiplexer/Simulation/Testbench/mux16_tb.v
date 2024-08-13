// Code your testbench here
// or browse Examples
`timescale 1ns / 1ps

module tb_mux16;
    reg [15:0] in;
    reg [3:0] s;
    wire out;

    // Instantiate the 16x1 MUX
    mux16 uut (
        .in(in),
        .s(s),
        .out(out)
    );

    // Test vector generation
    initial begin
        // Monitor signals
        $monitor("Time = %0d : sel = %b, in = %b, out = %b", $time, s, in, out);
        
        $dumpfile("dump.vcd");
        $dumpvars(0); // Dump all levels from top

        // Test case 1: Select input 0
        in = 16'b1010101010101010; // Random input pattern
        s = 4'b0000; #10;
        
        // Test case 2: Select input 1
        s = 4'b0001; #10;

        // Test case 3: Select input 2
        s = 4'b0010; #10;

        // Test case 4: Select input 3
        s = 4'b0011; #10;

        // Test case 5: Select input 4
        s = 4'b0100; #10;

        // Test case 6: Select input 5
        s = 4'b0101; #10;

        // Test case 7: Select input 6
        s = 4'b0110; #10;

        // Test case 8: Select input 7
        s = 4'b0111; #10;

        // Test case 9: Select input 8
        s = 4'b1000; #10;

        // Test case 10: Select input 9
        s = 4'b1001; #10;

        // Test case 11: Select input 10
        s = 4'b1010; #10;

        // Test case 12: Select input 11
        s = 4'b1011; #10;

        // Test case 13: Select input 12
        s = 4'b1100; 
        #10;
        
        $finish();
        
     end
        
 endmodule
