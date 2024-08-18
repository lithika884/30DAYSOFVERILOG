`timescale 1ns / 1ps

module priority_encoder_tb();
    reg [3:0] in;
    wire [1:0] out_gate, out_behv, out_data;
    wire valid_gate, valid_data, valid_behv;

    // Instantiate Behavioral Model
    priorityenc g3(
        .in(in),
        .out(out_behv),
        .valid(valid_behv)
    );

    // Instantiate Dataflow Model
    priorityencdata g1(
        .in(in),
        .out(out_data),
        .valid(valid_data)
    );
            
    // Instantiate Gate-Level Model
    priority_encoder_gate g2(
        .in(in),
        .out(out_gate),
        .valid(valid_gate)
    );

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars;

        in = 4'b0000; #10;
        in = 4'b0001; #10;
        in = 4'b0010; #10;
        in = 4'b0100; #10;
        in = 4'b1000; #10;
        in = 4'b0110; #10;
        in = 4'b1100; #10;
        in = 4'b1111; #10;

        $finish;
    end
endmodule
