//Day 16 Update

`timescale 1ns / 1ps

/*Bidirectional shiftregister

if dir = 0 ; shift left else shift right

Parallel loading of data takes place in bidirectional shift register

*/
module tb_bidirectional_shiftregister();

parameter size = 16;
reg clk,rst,en,dir,d;
wire [size - 1:0] out ;


//Mapping module and testbench signals
//Explicit declarqation
bidirectional_shift #(size) dut ( .clk(clk),
                                          .rst(rst),
                                          .en(en),
                                          .dir(dir),
                                          .d(d),
                                          .out(out)

);




//Initiation
initial begin

clk = 1'b0; rst = 1'b0; en = 1'b0; dir = 1'b0 ; d = 1'b1;

end

//Clock generation
//Clock period 10 ns
initial begin

clk = 1'b0;
forever #5 clk = ~clk;

end


//Testcases 

initial begin

#10 rst = 1'b1;  //Asserting the reset signal
#10 en = 1'b1;  //Asserting the load condition


repeat(7) @(posedge clk)  d <= ~d; // Left shift operation

#10 dir = 1'b1;

repeat(7) @(posedge clk) d <= ~d; //Right shift operation

#10
repeat(7) @(posedge clk)  //Displaying without shift operation

#20;

$finish();   //terminating the simulation


end

//Print the values 


always@(posedge clk) begin

$display("time = %0t , clk = %0d, rst = %0d , en = %0d , dir = %0d , d = %0d , out = %b " , $time,clk,rst,en,dir,d,out);
end


endmodule
