`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.01.2026 21:50:31
// Design Name: 
// Module Name: cla_top
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

module cla_top(
    input  wire [31:0] a,
    input  wire [31:0] b,
    input  wire        cin,
    output wire [31:0] sum,
    output wire        cout
);
  wire [8:0] carry;

    assign carry[0] = cin;

    // 8 blocks of 4bit CLA
    cla_4bit U0(a[3:0],   b[3:0],   carry[0], sum[3:0], carry[1]);
    cla_4bit U1(a[7:4],   b[7:4],   carry[1], sum[7:4],  carry[2]);
    cla_4bit U2(a[11:8],  b[11:8],  carry[2], sum[11:8],  carry[3]);
    cla_4bit U3(a[15:12], b[15:12], carry[3], sum[15:12], carry[4]);
    cla_4bit U4(a[19:16], b[19:16], carry[4], sum[19:16], carry[5]);
    cla_4bit U5(a[23:20], b[23:20], carry[5], sum[23:20], carry[6]);
    cla_4bit U6(a[27:24], b[27:24], carry[6], sum[27:24], carry[7]);
    cla_4bit U7(a[31:28], b[31:28], carry[7], sum[31:28], carry[8]);

    assign cout = carry[8];
  
endmodule

module cla_4bit(
    input  wire [3:0] a,
    input  wire [3:0] b,
    input  wire       cin,
    output wire [3:0] sum,
    output wire       cout
);
    wire [3:0] p, g;
    wire c1, c2, c3, c4;

    assign p = a ^ b;
    assign g = a & b;

    // Carry lookahead inside 4-bit block
    assign c1 = g[0] | (p[0] & cin);
    assign c2 = g[1] | (p[1] & g[0]) | (p[1] & p[0] & cin);
    assign c3 = g[2] | (p[2] & g[1]) | (p[2] & p[1] & g[0]) | (p[2] & p[1] & p[0] & cin);
    assign c4 = g[3] | (p[3] & g[2]) | (p[3] & p[2] & g[1]) | (p[3] & p[2] & p[1] & g[0]) |
                (p[3] & p[2] & p[1] & p[0] & cin);

    assign sum[0] = p[0] ^ cin;
    assign sum[1] = p[1] ^ c1;
    assign sum[2] = p[2] ^ c2;
    assign sum[3] = p[3] ^ c3;

    assign cout = c4;

endmodule