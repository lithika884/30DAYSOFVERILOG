`timescale 1ns/1ps

module encoder_decoder_tb();
  
  reg[3:0]original_in;
  wire[3:0]final_out;
  
  encoder_decoder dut (
    .original_in(original_in),
    .final_out(final_out)
  );
  
  initial begin
    
    $dumpfile("dump.vcd");
     $dumpvars;
    
    original_in = 4'b0001;
    #10
    
    original_in = 4'b0010;
    #10
    
    original_in = 4'b0100;
    
    #10
    
    original_in = 4'b1000;
    
    #10
    
    $finish();
    
  end
  
endmodule