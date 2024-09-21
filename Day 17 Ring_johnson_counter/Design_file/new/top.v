`timescale 1ns / 1ps

module ring_johnson(
    input clk, rst,
    output [0:2] out_r, out_j
);

// Instantiating the ring and johnson counters
ring_counter r1 (
    .clk(clk),
    .rst(rst),
    .out_r(out_r)
);

johnson_counter j1 (
    .clk(clk),
    .rst(rst),
    .out_j(out_j)
);

endmodule

