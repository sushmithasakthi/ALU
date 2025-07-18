`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/17/2025 11:55:15 AM
// Design Name: 
// Module Name: shift
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

module shift (
    input [31:0] a,          // 32-bit input a
    input [31:0] b,          // 32-bit input b
    input [4:0] shift,       // 5-bit shift amount (0 to 31)
    input [2:0] sel3,        // Selector for the shift operation
    output reg [31:0] result // 32-bit result
);

    always @(*) begin
        case(sel3)
            3'b000: result = a << shift;                          // Left shift a
            3'b001: result = a >> shift;                          // Right shift a
            3'b010: result = b << shift;                          // Left shift b
            3'b011: result = b >> shift;                          // Right shift b
               
            default: result = 32'b0;
        endcase
    end

endmodule

