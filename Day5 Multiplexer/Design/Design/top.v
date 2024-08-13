// Code your design here
`timescale 1ns / 1ps

//Bottom Level Approach 

module mux8(
input [7:0] in,
input [2:0] s,
output out );

assign out = in[s];
endmodule

module mux2(
input in0,
input in1,
  input s,
output out
);

  assign out = s ? in0 : in1;
endmodule



module mux16(
input [15:0]in,
input [3:0] s,
output out 

    );
 wire out1,out2;
    
//Instantiation 

//Explicit declaration - Mapping by name

mux8 m1(
    .in(in[7:0]),
    .s(s[2:0]),
    .out(out1)
    
     );
     
 mux8 m2(
    .in(in[15:8]),
    .s(s[2:0]),
    .out(out2)
    
     );
     
  mux2 m3(
    .in0(out1),
    .in1(out2),
    .s(s[3]),
    .out(out));
endmodule
