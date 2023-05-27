module ALU_1bit( result, carryOut, a, b, invertA, invertB, operation, carryIn, less ); 
  
  output wire result;
  output wire carryOut;
  
  input wire a;
  input wire b;
  input wire invertA;
  input wire invertB;
  input wire[1:0] operation;
  input wire carryIn;
  input wire less;
  
  /*your code here*/ 
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
	                 (operation == 2'b11) ? (a_temp & b_temp) | (carryIn & a_temp) | (carryIn & b_temp): 1'b0;
endmodule