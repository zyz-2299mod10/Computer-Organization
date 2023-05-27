`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/04/12 01:17:27
// Design Name: 
// Module Name: ALU_bottom
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


module ALU_bottom(result, carryOut, a, b, invertA, invertB, operation, carryIn, less, set); 
  
  output wire result;
  output wire carryOut;
  output wire set;
  
  input wire a;
  input wire b;
  input wire invertA;
  input wire invertB;
  input wire[1:0] operation;
  input wire carryIn;
  input wire less;

  wire a_temp;
  wire b_temp;
  
  //Full_adder FA(
  //  .sum(result),
  //  .carryOut(carryOut),
  //  .carryIn(carryIn),
  //  .input1(a_temp),
  //  .input2(b_temp)
  //  );
    
	assign a_temp = invertA ? ~a : a;
	assign b_temp = invertB ? ~b : b;
	
	assign result = (operation == 2'b00) ? a_temp | b_temp :
	               (operation == 2'b01) ? a_temp & b_temp :
	               (operation == 2'b10) ? a_temp ^ b_temp ^ carryIn:
	                                      less;
	
	assign carryOut = (operation == 2'b00) ? 1'b0 :
	                 (operation == 2'b01) ? 1'b0 :
	                 (operation == 2'b10) ? (a_temp & b_temp) | (carryIn & a_temp) | (carryIn & b_temp):
	                                        1'b0;
	
	assign set = (operation == 2'b11) ? a_temp ^ b_temp ^ carryIn : 1'b0;
    
endmodule
