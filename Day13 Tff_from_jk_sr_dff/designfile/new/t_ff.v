`timescale 1ns / 1ps

module t_ff(
    input t, clk, rst,
    output q_d, q_sr, q_jk
);

wire w1, w2, w3;
wire q_d_internal, qbar_d_internal;
wire q_sr_internal, qbar_sr_internal;
wire q_jk_internal, qbar_jk_internal;

assign w1 = t & (~q_sr_internal);
assign w2 = t & (q_sr_internal);
assign w3 = t ^ q_d_internal;

d_ff D(
    .d(w3), 
    .clk(clk), 
    .rst(rst), 
    .q_d(q_d_internal), 
    .qbar_d(qbar_d_internal)
);

sr_ff SR(
    .s(w1), 
    .r(w2), 
    .clk(clk), 
    .rst(rst), 
    .q_sr(q_sr_internal), 
    .qbar_sr(qbar_sr_internal)
);

jkff JK(
    .j(t), 
    .k(t), 
    .clk(clk), 
    .rst(rst), 
    .q_jk(q_jk_internal), 
    .qbar_jk(qbar_jk_internal)
);

assign q_d = q_d_internal;
assign q_sr = q_sr_internal;
assign q_jk = q_jk_internal;

endmodule
