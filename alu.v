`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/16/2025 01:48:49 PM
// Design Name: 
// Module Name: alu
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
module alu(
    input  [31:0] a, b,
    input  [31:0] in,
    input         load_en,
    input  [2:0]  sel,
    input  [2:0]  sel1, sel2, sel3,
    input  [4:0]  shift,
    output reg [31:0] result
);wire [31:0] result1, result2, result3;
    wire out;
    reg  [1:0] unit_sel;
    wire [31:0] a_in = load_en ? in : a;
    arithmetic au (
        .a(a_in),
        .b(b),
        .sel1(sel1),
        .result(result1),
        .out(out)   );
    logic lu (
        .a(a_in),
        .b(b),
        .sel2(sel2),
        .result(result2)  );
    shift su (
        .a(a_in),
        .b(b),
        .sel3(sel3),
        .shift(shift),
        .result(result3) );
    always @(*) begin
        case (sel)
            3'b000, 3'b001, 3'b010: unit_sel = 2'b01; // Arithmetic
            3'b011, 3'b100:         unit_sel = 2'b10; // Logic
            3'b111:                 unit_sel = 2'b11; // Shift
            default:                unit_sel = 2'b00; // Default (invalid)
        endcase
    end
    always @(*) begin
        case (unit_sel)
            2'b01: result = result1;
            2'b10: result = result2;
            2'b11: result = result3;
            default: result = 32'b0;
        endcase
    end
endmodule
