`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.01.2026 12:36:42
// Design Name: 
// Module Name: tb_bk_adder_32
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

module tb_bk_adder_32;

  reg  [31:0] a;
  reg  [31:0] b;
  reg         cin;    
  wire [31:0] sum;
  wire        cout;
  
  reg         add_sub;   // 1 = ADD, 0 = SUB
  
  //Subtraction 2's complement logic
  wire [31:0] b_eff;
  assign b_eff  = (add_sub) ? b : (~b)+1;

  // Instantiating design
  bk_adder_32 dut (
    .a(a),
    .b(b_eff),
    .cin(cin),
    .sum(sum),
    .cout(cout)
  );

  initial begin

    add_sub = 1;  //ADD

    a = 32'h10000000; b = 32'h0000000A; cin = 1'b0; #10;
    a = 32'h0001000A; b = 32'h00020A01; cin = 1'b1; #10;  //Carry
    a = 32'hFFFFFFFF; b = 32'h0000D000; cin = 1'b0; #10;
    a = 32'h12340000; b = 32'hFEDC0000; cin = 1'b1; #10;  //Carry
    a = 32'hAAAAAAAA; b = 32'h55555555; cin = 1'b0; #10;

    add_sub = 0; //SUB

    a = 32'h00000010; b = 32'h00000004; cin = 1'b0; #10;  // 16 - 4
    a = 32'h00000020; b = 32'h00000009; cin = 1'b0; #10;  // 32 - 9
    a = 32'h00000008; b = 32'h00000001; cin = 1'b0; #10;  // 8 - 1
    a = 32'h00000000; b = 32'h00000001; cin = 1'b0; #10;  // 0 - 1 (underflow)
    a = 32'h12340000; b = 32'h00010000; cin = 1'b0; #10;  // subtraction test

    $display("Testbench complete.");
    #10;
    $finish;
  end


  initial begin
    $dumpfile("bk_adder_32.vcd");
    $dumpvars(1, tb_bk_adder_32);
  end

endmodule
