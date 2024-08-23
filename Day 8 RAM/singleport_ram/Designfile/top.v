// Code your design here
//Single port RAM 

module ram (
  input clk,
  input rst,
  input [7:0] din,
  input [5:0] addr,
  input we,
  output reg[7:0] dout 
);
  
  //8 bit width and stack size is 64
  reg [7:0] mem [63 :0];
  integer i;
 
  always@(posedge clk)
    begin
      
      if(rst == 1'b1)
        begin
          for(i = 0; i < 64 ; i = i+1)
            begin
              mem[i] = 8'h00;
            end
          dout <= 8'h00;   //Allocating memory to dout
             
        end
       
      
    
  
    else if(we == 1'b1)
    begin
      mem[addr] <= din; 
          // writing the data in the memory 
    end
   else 
     dout <= mem[addr];  // reading the data from the memory 
      
 
    end 
endmodule