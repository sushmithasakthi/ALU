`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/16/2025 02:07:42 PM
// Design Name: 
// Module Name: logic
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module logic(
    input  [2:0] sel2,    
    input  [31:0] a,    
    input  [31:0] b,      
    output reg [31:0] result 
);
    always @(*) begin
        case (sel2)
            3'b0000: result = a & b;           
            3'b0001: result = a | b;           
            3'b0010: result = ~(a | b);        
            3'b0011: result = a ^ b;           
            3'b0100: result = ~(a ^ b);        
            3'b0101: result = ~a;             
            3'b0110: result = ~b;              
                  
        endcase
    end

endmodule

