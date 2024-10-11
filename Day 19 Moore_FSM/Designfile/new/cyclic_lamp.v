`timescale 1ns / 1ps
module cyclic_lamp(  
    input clk,  
    output reg [2:0] light  
);  

    // State definitions  
    parameter RED = 3'b100;  
    parameter GREEN = 3'b010;  
    parameter YELLOW = 3'b001;  

    parameter S0 = 0, S1 = 1, S2 = 2;  
    
    reg [1:0] state; // Declare the state variable  

    always @(posedge clk) begin  
        case(state)  
            S0: state <= S1;  
            S1: state <= S2;  
            S2: state <= S0;  
            default: state <= S0; // Reset state  
        endcase  
    end  

    always @(state) begin  
        case(state)  
            S0: light = RED;  
            S1: light = GREEN;  
            S2: light = YELLOW;  
            default: light = RED; // Default to RED  
        endcase  
    end  
endmodule