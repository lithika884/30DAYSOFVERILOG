`timescale 1ns / 1ps

module priorityenc(
    input [3:0] in,
    output reg [1:0] out,
    output reg valid
);
    always @(*) begin
        casex(in)
            4'b1xxx: begin
                out = 2'b11;
                valid = 1'b1;
            end
            4'b01xx: begin
                out = 2'b10;
                valid = 1'b1;
            end
            4'b001x: begin
                out = 2'b01;
                valid = 1'b1;
            end
            4'b0001: begin
                out = 2'b00;
                valid = 1'b1;
            end
            4'b0000: begin
                out = 2'bxx;
                valid = 1'b0;
            end
        endcase
    end
endmodule




module priorityencdata(
    input [3:0] in,
    output [1:0] out,
    output valid
);
    assign out[1] = in[3] | in[2];
    assign out[0] = in[3] | (~in[2] & in[1]);
    assign valid = |in;
endmodule




module priority_encoder_gate(
    input [3:0] in,
    output [1:0] out,
    output valid
);
    wire in2_bar, t1;

    or o1(out[1], in[3], in[2]);
    not n1(in2_bar, in[2]);
    and a1(t1, in2_bar, in[1]);
    or o2(out[0], in[3], t1);

    or o3(valid, in[3], in[2], in[1], in[0]);
endmodule
