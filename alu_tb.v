`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/16/2025 01:49:28 PM
// Design Name: 
// Module Name: alu_tb
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

module test_alu;

    reg [31:0] a, b, in;
    reg load_en;
    reg [2:0] sel, sel1, sel2, sel3;
    reg [4:0] shift;
    wire [31:0] result;

    alu uut (
        .a(a),
        .b(b),
        .in(in),
        .load_en(load_en),
        .sel(sel),
        .sel1(sel1),
        .sel2(sel2),
        .sel3(sel3),
        .shift(shift),
        .result(result)
    );

    initial begin
        
        a = 32'd10; b = 32'd20; in = 32'd0; load_en = 0;
        sel = 3'b000; sel1 = 3'b000; // Arithmetic: Add
        #10;
        sel1 = 3'b001; // Subtraction
        #10;
        sel1=3'b010;//a increment
        #10;
        sel1=3'b011;//b increment
        #10;
         sel1=3'b100;//a decrement
        #10;
         sel1=3'b101;//b decrement
        #10; 
        sel1=3'b110;//greater
        #10;
         sel1=3'b111;//lesser
        #10;
        
        
        sel = 3'b011; sel2 = 3'b000; // Logic: AND
        #10;
       
        sel2 = 3'b001; // OR
        #10;
        sel2 = 3'b010; // nor
        #10;
        sel2 = 3'b011; // xor
        #10;
        sel2 = 3'b100; // xnor
        #10;
        sel2 = 3'b101; // not a
        #10;
        sel2 = 3'b110; // not b
        #10;
        
       

        // Test: Shift Left (a << shift)
        sel = 3'b111; 
        sel3 = 3'b000; shift = 5'd2;
        #10;
        sel3 = 3'b001; shift = 5'd2; //shift right (a>>shift)
        #10;
        sel3 = 3'b010; shift = 5'd2; //shift left (b<<shift)
        #10;
        sel3 = 3'b011; shift = 5'd2; //shift right (b>>shift)
        #10;

        // Test: Load input `in` instead of `a`
        in = 32'd100; load_en = 1; sel = 3'b000; sel1 = 3'b010; // Increment
        #10;
        
        $finish;
    end

endmodule

