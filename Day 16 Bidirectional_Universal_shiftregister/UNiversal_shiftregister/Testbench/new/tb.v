`timescale 1ns / 1ps

module tb_universal_shiftregister();
    reg clk, rst;
    reg [1:0] sel;
    reg [3:0] p_din;
    reg s_left_din, s_right_din;
    wire [3:0] p_dout;

    // Instantiate the universal shift register
    universal_shiftregister dut (
        .clk(clk),
        .rst(rst),
        .sel(sel),
        .p_din(p_din),
        .s_left_din(s_left_din),
        .s_right_din(s_right_din),
        .p_dout(p_dout)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // Clock with 10 ns period
    end

    // Test cases
    initial begin
        // Apply reset
        rst = 1'b1;
       
        
        // Parallel load operation
        p_din = 4'b1101;
        sel = 2'b11;  // Parallel load
        #10;

        // Shift left
        s_left_din = 1'b1;
        sel = 2'b01;
        #10;
        
        

        // Shift right
        s_right_din = 1'b1;
        sel = 2'b10;
        #10;
        sel = 2'b01;
        
        #10
        // Hold the value
        sel = 2'b00;
        #20;

        $finish;
    end

    // Monitor outputs
    always @(posedge clk) begin
        $display("time = %0t | sel = %0b | p_din = %0b | s_left_din = %0b | s_right_din = %0b | p_dout = %0b", 
                  $time, sel, p_din, s_left_din, s_right_din, p_dout);
    end
endmodule
