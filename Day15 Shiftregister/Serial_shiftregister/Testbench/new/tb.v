`timescale 1ns / 1ps


module tb_serial_shiftregister();

reg  clk , rst ;
reg sin;
wire sout ;
wire [3:0 ] pout;


//Mapping the port signals 


serial_shiftregister dut ( .clk(clk),
                           .rst(rst),
                           .sin(sin),
                           .sout(sout),
                           .pout(pout)
                           );


//Clock signal generation
initial begin

clk = 1'b0 ; rst = 1'b0; 
forever #5 clk = ~clk;

end

//Testcases 

initial begin
rst = 1'b1; sin = 1;  // Start with reset
#10

rst = 1'b0 ; sin = 1;
#10 rst = 1'b0; sin = 0;
#10 rst = 1'b0 ; sin = 0;
#10 rst = 1'b0; sin = 1;

#20;

$finish();


end


always@(posedge clk) begin

$display("time = %0t , clk = %0d , rst = %0d , sin = %0b , sout = %0b ,pout = %0b", $time, clk, rst, sin , sout,pout);

end
endmodule
