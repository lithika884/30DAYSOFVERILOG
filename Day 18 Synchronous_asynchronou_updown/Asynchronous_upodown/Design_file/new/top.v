`timescale 1ns / 1ps

// Asynchronous Up/Down Counter Design
module async_upordowncounter(
    input clk, rst, t, up,
  output [1:0] q,
  output [1:0] qbar
);
  
  // First T Flip-Flop
  t_ff t1 (.clk(clk), .rst(rst), .t(t), .q(q[0]), .qbar(qbar[0]));

  // Generate the remaining T Flip-Flops
  genvar k;
  generate
    for (k = 1; k < 2; k = k + 1) begin 
      
      wire clk_up_down;
     
        assign clk_up_down = up ? qbar[k-1] : q[k-1];

      

      t_ff t_up (
        .clk(clk_up_down),
        .rst(rst),
        .t(t),
        .q(q[k]),
        .qbar(qbar[k])
      );
    end
  endgenerate

endmodule
