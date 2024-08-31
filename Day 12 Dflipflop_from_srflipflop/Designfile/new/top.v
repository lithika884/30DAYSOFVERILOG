`timescale 1ns / 1ps
// Realization of SR Flip-Flop
`timescale 1ns/1ps
module sr_flipflop (
  input  s, 
  input  r,
  input  clk,
  output  q,
  output  q_bar
);
    wire s_in, r_in;

    // NAND gates for SR flip-flop inputs
  
    nand g1(s_in, s, clk);
    nand g2(r_in, r, clk);

    // SR Latch
    nand g3(q, s_in, q_bar);
    nand g4(q_bar, r_in, q);

endmodule

// Realization of D Flip-Flop using SR Flip-Flop
module d_flipflop(
  input d,
  input clk,
  output  q, 
  output q_bar
);
    wire s, r;

    // Assigning D flip-flop inputs to SR flip-flop inputs
    assign s = d;
    assign r = ~d;

    // Instantiate SR flip-flop
    sr_flipflop sr_inst (
        .s(s),
        .r(r),
        .clk(clk),
        .q(q),
        .q_bar(q_bar)
    );
  
  
  
endmodule
