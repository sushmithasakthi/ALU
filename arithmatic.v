`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/16/2025 02:03:50 PM
// Design Name: 
// Module Name: arithmatic
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


module arithmetic (
    input [15:0] a,            // 16-bit input a
    input [15:0] b,            // 16-bit input b
    input [2:0] sel1,          // 3-bit selector for operation
    output reg [31:0] result,  // 32-bit result
    output reg out             // Carry/overflow flag (set as 0 for most operations)
);

    always @(*) begin
        out = 0;  // Default output for carry/overflow flag
        case(sel1)
            3'b000: {out, result} = a + b;         // Addition of a and b
            3'b001: {out, result} = a + (-b);      // a + (-b), effectively a - b
            3'b010: result = a + 1;                // Increment a by 1
            3'b011: result = b + 1;                // Increment b by 1
            3'b100: result = a - 1;                // Decrement a by 1
            3'b101: result = b - 1;                // Decrement b by 1
            3'b110: result = (a == b) ? b : a;     // If a == b, set result = b, else result = a
            3'b111: result = (a > b) ? a : b;      // If a > b, set result = a, else result = b
            default: result = 32'b0;               // Default case (optional)
        endcase
    end

endmodule
