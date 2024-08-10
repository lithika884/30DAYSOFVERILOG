module bin_gray
#(parameter WIDTH = 4)
 ( b_in , g_out );
input [WIDTH-1:0] b_in ;
output [WIDTH-1:0] g_out ;


assign g_out[3] = b_in[3];
assign g_out[2] = b_in[3] ^ b_in[2];
assign g_out[1] = b_in[2] ^ b_in[1];
assign g_out[0] = b_in[1] ^ b_in[0]; 

endmodule