`timescale 1ns / 1ps

module multiportram_tb;

// Inputs
reg clk;
reg rst;
reg [5:0] we_addr;
reg [5:0] re_addr;
reg [7:0] din;
reg we_en;
reg rd_en;

// Outputs
wire [7:0] dout;

// Instantiate the Unit Under Test (UUT)
multiportram uut (
    .clk(clk),
    .rst(rst),
    .we_addr(we_addr),
    .re_addr(re_addr),
    .din(din),
    .dout(dout),
    .we_en(we_en),
    .rd_en(rd_en)
);

initial begin
    // Initialize Inputs
    $dumpfile("dump.vcd");
    $dumpvars;
    clk = 0;
    rst = 1;
    we_addr = 0;
    re_addr = 0;
    din = 0;
    we_en = 0;
    rd_en = 0;

    // Reset the RAM
    #10 rst = 0;
    #10 rst = 1;
    #10 rst = 0;

    // Write data to the RAM
    #10 we_en = 1;
    we_addr = 6'd0;
    din = 8'hAA; // Write 0xAA to address 0
    #10 we_addr = 6'd1;
    din = 8'hBB; // Write 0xBB to address 1
    #10 we_addr = 6'd2;
    din = 8'hCC; // Write 0xCC to address 2
    
    #10 we_en = 0; // Disable write enable after writing is done
    din = 8'h00;  // Ensure din is stable (can set it to a known value like 00)

    // Read data from the RAM
    #10 rd_en = 1;
    re_addr = 6'd0;
    #10 $display("Address 0: dout = %h (Expected: AA)", dout);
    #10 re_addr = 6'd1;
    #10 $display("Address 1: dout = %h (Expected: BB)", dout);
    #10 re_addr = 6'd2;
    #10 $display("Address 2: dout = %h (Expected: CC)", dout);
    rd_en = 0;

    // Finish simulation
    #20 $finish;
end

// Clock generation
always #5 clk = ~clk;

endmodule
