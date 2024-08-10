
module binary2graycode();
reg clk;
reg rst;
reg[3:0]gray;
reg [3:0] binarycounter;

//Clock signal generation
initial begin
clk = 0;
rst = 0;
gray = 0;
#100 rst = 1;
forever #10 clk = ~clk;
end
// Counter implementation - Increement the value of binary number at every positive edge of the signal
always@(posedge clk or negedge rst)
begin

if(!rst)
begin 
binarycounter <= 4'b00;  
end

else 
begin
binarycounter <= binarycounter + 1;
gray <= binary2gray(binarycounter);
$monitor("Binary code : %b , Gray code : %b " , binarycounter,gray);
end
    
end

// Binary 2gray code conversion
function[5:0] binary2gray;
    input[5:0] value;
    integer i;
    begin 
        binary2gray[5] = value[5];
        for (i=5; i>0; i = i - 1)
            binary2gray[i-1] = value[i] ^ value[i - 1];
    end
endfunction

endmodule
