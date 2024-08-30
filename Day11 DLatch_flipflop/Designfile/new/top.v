`timescale 1ns / 1ps
// D Latch module (Gate Level Modeling)
module d_latch(  
    input d,  
    input en,  
    output q_latch,  
    output q_bar_latch  
);  
    wire d_bar, t1, t2;

    // Generate complement of d
    not g1(d_bar, d);

    // Generate intermediate signals
    and g2(t1, en, d);        // t1 = en & d
    and g3(t2, en, d_bar);    // t2 = en & ~d

    // NOR gates for the latch
  nor g4(q_latch, q_bar_latch, t2);     // q = ~(q_bar | t2)
  nor g5(q_bar_latch, q_latch, t1);     // q_bar = ~(q | t1)

endmodule
// D Flip-Flop module (Gate Level Modeling)
module d_flipflop(  
    input d,   
    input clk,  
    output q_flipflop,  
    output q_bar_flipflop   
);  
    wire d_bar, t1, t2, t3, t4;

    // Generate complement of d
    not g1(d_bar, d);

    // NAND gates for master latch
    nand g2(t1, d, clk);        // t1 = ~(d & clk)
    nand g3(t2, d_bar, clk);    // t2 = ~(~d & clk)

    // NAND gates for slave latch
  nand g4(q_flipflop, t1, q_bar_flipflop);      // q = ~(t1 & q_bar)
  nand g5(q_bar_flipflop, t2, q_flipflop);      // q_bar = ~(t2 & q)

endmodule


module d_global(
  input d,   
    input clk,en,  
    output q_latch,q_flipflop,
    output q_bar_latch,q_bar_flipflop 
);
  
  d_latch d1( .d(d),
              .en(en),
             .q_latch(q_latch),
             .q_bar_latch(q_bar_latch)
            );
  
  d_flipflop d2( .d(d),
                .clk(clk),
                .q_flipflop(q_flipflop),
                .q_bar_flipflop(q_bar_flipflop)
               );
  
endmodule 
  