`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.01.2026 12:34:18
// Design Name: 
// Module Name: bk_adder_32
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


`timescale 1ns / 1ps

module bk_adder_32(
  input  [31:0] a,
  input  [31:0] b,
  input         cin,   
  output [31:0] sum,
  output        cout
);
    
  wire [31:0] g, p;

  wire g_0;
  wire g_1_0;
  wire g_3_2,   p_3_2;
  wire g_5_4,   p_5_4;
  wire g_7_6,   p_7_6;
  wire g_9_8,   p_9_8;
  wire g_11_10, p_11_10;
  wire g_13_12, p_13_12;
  wire g_15_14, p_15_14;
  wire g_17_16, p_17_16;
  wire g_19_18, p_19_18;
  wire g_21_20, p_21_20;
  wire g_23_22, p_23_22;
  wire g_25_24, p_25_24;
  wire g_27_26, p_27_26;
  wire g_29_28, p_29_28;
  wire g_31_30, p_31_30;

  wire g_3_0;
  wire g_7_4,   p_7_4;
  wire g_11_8,  p_11_8;
  wire g_15_12, p_15_12;
  wire g_19_16, p_19_16;
  wire g_23_20, p_23_20;
  wire g_27_24, p_27_24;
  wire g_31_28, p_31_28;

  wire g_7_0;
  wire g_15_8,  p_15_8;
  wire g_23_16, p_23_16;
  wire g_31_24, p_31_24;

  wire g_15_0;
  wire g_31_16, p_31_16;

  wire g_31_0, g_23_0, g_11_0, g_19_0, g_27_0, g_5_0,  g_9_0,  g_13_0, g_17_0, g_21_0, g_25_0, g_29_0,
       g_2_0,  g_4_0,  g_6_0,  g_8_0,  g_10_0, g_12_0, g_14_0, g_16_0, g_18_0, g_20_0, g_22_0, g_24_0,
       g_26_0, g_28_0, g_30_0;


  //PG Block generation stage
  assign p = a^b;
  assign g = a&b;
  
  //Stage 1 of BK Adder
  greybox gr0(.g1(g[0]),  .p1(p[0]),  .g0(cin),   .gout(g_0));       	
  greybox gr1(.g1(g[1]),  .p1(p[1]),  .g0(g_0),    .gout(g_1_0));                                 
  blackbox bk1(.g1(g[3]),  .p1(p[3]),  .g0(g[2]),  .p0(p[2]),  .gout(g_3_2),   .pout(p_3_2)); 
  blackbox bk2(.g1(g[5]),  .p1(p[5]),  .g0(g[4]),  .p0(p[4]),  .gout(g_5_4),   .pout(p_5_4));  
  blackbox bk3(.g1(g[7]),  .p1(p[7]),  .g0(g[6]),  .p0(p[6]),  .gout(g_7_6),   .pout(p_7_6));  
  blackbox bk4(.g1(g[9]),  .p1(p[9]),  .g0(g[8]),  .p0(p[8]),  .gout(g_9_8),   .pout(p_9_8)); 
  blackbox bk5(.g1(g[11]), .p1(p[11]), .g0(g[10]), .p0(p[10]), .gout(g_11_10), .pout(p_11_10)); 
  blackbox bk6(.g1(g[13]), .p1(p[13]), .g0(g[12]), .p0(p[12]), .gout(g_13_12), .pout(p_13_12)); 
  blackbox bk7(.g1(g[15]), .p1(p[15]), .g0(g[14]), .p0(p[14]), .gout(g_15_14), .pout(p_15_14)); 
  blackbox bk8(.g1(g[17]), .p1(p[17]), .g0(g[16]), .p0(p[16]), .gout(g_17_16), .pout(p_17_16)); 
  blackbox bk9(.g1(g[19]), .p1(p[19]), .g0(g[18]), .p0(p[18]), .gout(g_19_18), .pout(p_19_18)); 
  blackbox bk10(.g1(g[21]), .p1(p[21]), .g0(g[20]), .p0(p[20]), .gout(g_21_20), .pout(p_21_20)); 
  blackbox bk11(.g1(g[23]), .p1(p[23]), .g0(g[22]), .p0(p[22]), .gout(g_23_22), .pout(p_23_22)); 
  blackbox bk12(.g1(g[25]), .p1(p[25]), .g0(g[24]), .p0(p[24]), .gout(g_25_24), .pout(p_25_24)); 
  blackbox bk13(.g1(g[27]), .p1(p[27]), .g0(g[26]), .p0(p[26]), .gout(g_27_26), .pout(p_27_26)); 
  blackbox bk14(.g1(g[29]), .p1(p[29]), .g0(g[28]), .p0(p[28]), .gout(g_29_28), .pout(p_29_28)); 
  blackbox bk15(.g1(g[31]), .p1(p[31]), .g0(g[30]), .p0(p[30]), .gout(g_31_30), .pout(p_31_30)); 
  
  //Stage 2 of BK adder
  greybox gr2(.g1(g_3_2), .p1(p_3_2), .g0(g_1_0), .gout(g_3_0)); 
  blackbox bk16(.g1(g_7_6), .p1(p_7_6), .g0(g_5_4), .p0(p_5_4), .gout(g_7_4), .pout(p_7_4));  
  blackbox bk17(.g1(g_11_10), .p1(p_11_10), .g0(g_9_8), .p0(p_9_8), .gout(g_11_8), .pout(p_11_8)); 
  blackbox bk18(.g1(g_15_14), .p1(p_15_14), .g0(g_13_12), .p0(p_13_12), .gout(g_15_12), .pout(p_15_12)); 
  blackbox bk19(.g1(g_19_18), .p1(p_19_18), .g0(g_17_16), .p0(p_17_16), .gout(g_19_16), .pout(p_19_16)); 
  blackbox bk20(.g1(g_23_22), .p1(p_23_22), .g0(g_21_20), .p0(p_21_20), .gout(g_23_20), .pout(p_23_20)); 
  blackbox bk21(.g1(g_27_26), .p1(p_27_26), .g0(g_25_24), .p0(p_25_24), .gout(g_27_24), .pout(p_27_24)); 
  blackbox bk22(.g1(g_31_30), .p1(p_31_30), .g0(g_29_28), .p0(p_29_28), .gout(g_31_28), .pout(p_31_28)); 

  //Stage 3 of BK adder
  greybox gr3(.g1(g_7_4), .p1(p_7_4), .g0(g_3_0), .gout(g_7_0));  
  blackbox bk24(.g1(g_15_12), .p1(p_15_12), .g0(g_11_8), .p0(p_11_8), .gout(g_15_8), .pout(p_15_8));
  blackbox bk25(.g1(g_23_20), .p1(p_23_20), .g0(g_19_16), .p0(p_19_16), .gout(g_23_16), .pout(p_23_16)); 
  blackbox bk26(.g1(g_31_28), .p1(p_31_28), .g0(g_27_24), .p0(p_27_24), .gout(g_31_24), .pout(p_31_24)); 

  //Stage 4 of BK Adder
  greybox gr4(.g1(g_15_8), .p1(p_15_8), .g0(g_7_0), .gout(g_15_0)); 
  blackbox bk28(.g1(g_31_24), .p1(p_31_24), .g0(g_23_16), .p0(p_23_16), .gout(g_31_16), .pout(p_31_16)); 

  //Stage 5 - The grey boxes required to generate the remaining carrys of the left out bits
  greybox gr17(.g1(g[2]), .p1(p[2]), .g0(g_1_0), .gout(g_2_0));
  greybox gr18(.g1(g[4]), .p1(p[4]), .g0(g_3_0), .gout(g_4_0)); 
  greybox gr10(.g1(g_5_4), .p1(p_5_4), .g0(g_3_0), .gout(g_5_0)); 
  greybox gr19(.g1(g[6]), .p1(p[6]), .g0(g_5_0), .gout(g_6_0)); 
  greybox gr20(.g1(g[8]), .p1(p[8]), .g0(g_7_0), .gout(g_8_0));
  greybox gr11(.g1(g_9_8), .p1(p_9_8), .g0(g_7_0), .gout(g_9_0));
  greybox gr21(.g1(g[10]), .p1(p[10]), .g0(g_9_0), .gout(g_10_0)); 
  greybox gr7(.g1(g_11_8), .p1(p_11_8), .g0(g_7_0), .gout(g_11_0));
  greybox gr22(.g1(g[12]), .p1(p[12]), .g0(g_11_0), .gout(g_12_0)); 
  greybox gr12(.g1(g_13_12), .p1(p_13_12), .g0(g_11_0), .gout(g_13_0));
  greybox gr23(.g1(g[14]), .p1(p[14]), .g0(g_13_0), .gout(g_14_0)); 
  greybox gr24(.g1(g[16]), .p1(p[16]), .g0(g_15_0), .gout(g_16_0));
  greybox gr13(.g1(g_17_16), .p1(p_17_16), .g0(g_15_0), .gout(g_17_0)); 
  greybox gr25(.g1(g[18]), .p1(p[18]), .g0(g_17_0), .gout(g_18_0)); 
  greybox gr8(.g1(g_19_16), .p1(p_19_16), .g0(g_15_0), .gout(g_19_0));
  greybox gr26(.g1(g[20]), .p1(p[20]), .g0(g_19_0), .gout(g_20_0)); 
  greybox gr14(.g1(g_21_20), .p1(p_21_20), .g0(g_19_0), .gout(g_21_0));
  greybox gr27(.g1(g[22]), .p1(p[22]), .g0(g_21_0), .gout(g_22_0)); 
  greybox gr6(.g1(g_23_16), .p1(p_23_16), .g0(g_15_0), .gout(g_23_0));
  greybox gr28(.g1(g[24]), .p1(p[24]), .g0(g_23_0), .gout(g_24_0)); 
  greybox gr15(.g1(g_25_24), .p1(p_25_24), .g0(g_23_0), .gout(g_25_0));
  greybox gr29(.g1(g[26]), .p1(p[26]), .g0(g_25_0), .gout(g_26_0));
  greybox gr9(.g1(g_27_24), .p1(p_27_24), .g0(g_23_0), .gout(g_27_0));
  greybox gr30(.g1(g[28]), .p1(p[28]), .g0(g_27_0), .gout(g_28_0)); 
  greybox gr16(.g1(g_29_28), .p1(p_29_28), .g0(g_27_0), .gout(g_29_0));
  greybox gr31(.g1(g[30]), .p1(p[30]), .g0(g_29_0), .gout(g_30_0));  
  greybox gr5(.g1(g_31_16), .p1(p_31_16), .g0(g_15_0), .gout(g_31_0)); 
   

  //Sum Generation Stage
  assign sum[0]  = p[0]  ^ cin;
  assign sum[1]  = p[1]  ^ g_0;
  assign sum[2]  = p[2]  ^ g_1_0;
  assign sum[3]  = p[3]  ^ g_2_0;
  assign sum[4]  = p[4]  ^ g_3_0;
  assign sum[5]  = p[5]  ^ g_4_0;
  assign sum[6]  = p[6]  ^ g_5_0;
  assign sum[7]  = p[7]  ^ g_6_0;
  assign sum[8]  = p[8]  ^ g_7_0;
  assign sum[9]  = p[9]  ^ g_8_0;
  assign sum[10] = p[10] ^ g_9_0;
  assign sum[11] = p[11] ^ g_10_0;
  assign sum[12] = p[12] ^ g_11_0;
  assign sum[13] = p[13] ^ g_12_0;
  assign sum[14] = p[14] ^ g_13_0;
  assign sum[15] = p[15] ^ g_14_0;
  assign sum[16] = p[16] ^ g_15_0;
  assign sum[17] = p[17] ^ g_16_0;
  assign sum[18] = p[18] ^ g_17_0;
  assign sum[19] = p[19] ^ g_18_0;
  assign sum[20] = p[20] ^ g_19_0;
  assign sum[21] = p[21] ^ g_20_0;
  assign sum[22] = p[22] ^ g_21_0;
  assign sum[23] = p[23] ^ g_22_0;
  assign sum[24] = p[24] ^ g_23_0;
  assign sum[25] = p[25] ^ g_24_0;
  assign sum[26] = p[26] ^ g_25_0;
  assign sum[27] = p[27] ^ g_26_0;
  assign sum[28] = p[28] ^ g_27_0;
  assign sum[29] = p[29] ^ g_28_0;
  assign sum[30] = p[30] ^ g_29_0;
  assign sum[31] = p[31] ^ g_30_0;

  //Final stage Cout
  assign cout = g_31_0;

endmodule


//Module for the Greybox to find the carry/Generate for next stage
module greybox(
  input g1, 
  input p1, 
  input g0, 
  output gout
); 
  assign gout = g1 | (g0 & p1);
  
endmodule

//Module for the Blackbox to find Group Propogate and Group Generate
module blackbox(
  input  g1, 
  input  p1,
  input  g0, 
  input  p0,
  output gout, 
  output pout
);
  assign gout = g1 | (g0 & p1);
  assign pout = p1 & p0;
  
endmodule
