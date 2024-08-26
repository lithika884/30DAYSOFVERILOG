`timescale 1ns / 1ps


module sr_latch(
    input s,
    input r,
    output reg q,
    output reg qbar
);
    always @(*) begin
        if (s == 1'b1 && r == 1'b1) begin
            q = 1'bx;        // Undefined state
            qbar = 1'bx;
        end else begin
            q = ~(s & qbar);
            qbar = ~(r & q);
        end
    end
endmodule





module gated_srlatch(
    input s,
    input r,
    input en,
    output q,
    output qbar
);

    // Internal signals for NAND gate inputs
    wire s_in, r_in;

    // Enable-controlled signals
    nand g3(s_in, s, en);
    nand g4(r_in, r, en);

    // SR latch behavior with NAND gates
    nand g1(q, s_in, qbar);
    nand g2(qbar, r_in, q);

endmodule


module sr_flipflop_dataflow (
    input       clk,        // Clock
    input       s,          // Inputs
    input       r,          // 
    output      q,          // Output
    output      qbar);      //

    // INTERNAL WIRES
    wire        s_in, r_in;
  
    // NAND3
    nand (s_in, s, clk);

    // NAND4
    nand (r_in, r, clk);

    // SR- LATCH -------------------------------------
    
    // NAND1
    nand (q, s_in, qbar);

    // NAND2
    nand (qbar, r_in, q);

endmodule



module sr_flipflop(
    input s,
    input r,
    input clk,
    input en,
    output q,
    output qbar
);

    // Internal wires
    wire q_latch, qbar_latch;
    
    // Instantiate SR latch
    sr_latch latch (
        .s(s),
        .r(r),
        .q(q_latch),
        .qbar(qbar_latch)
    );
    
    // Instantiate gated SR latch
    gated_srlatch gated_latch (
        .s(s),
        .r(r),
        .en(en),
        .q(q),
        .qbar(qbar)
    );
    
    // Instantiate SR flip-flop dataflow
    sr_flipflop_dataflow dataflow_flipflop (
        .clk(clk),
        .s(s),
        .r(r),
        .q(q_latch),
        .qbar(qbar_latch)
    );

endmodule
