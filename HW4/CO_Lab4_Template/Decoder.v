module Decoder( instr_op_i, RegWrite_o,	ALUOp_o, ALUSrc_o, RegDst_o, Jump_o, Branch_o, BranchType_o, MemWrite_o, MemRead_o, MemtoReg_o);
     
//I/O ports
input	[6-1:0] instr_op_i;

output			RegWrite_o;
output	[3-1:0] ALUOp_o;
output			ALUSrc_o;
output	[2-1:0]	RegDst_o, MemtoReg_o;
output			Jump_o, Branch_o, BranchType_o, MemWrite_o, MemRead_o;
 
//Internal Signals
wire	[3-1:0] ALUOp_o;
wire			ALUSrc_o;
wire			RegWrite_o;
wire	[2-1:0]	RegDst_o, MemtoReg_o;
wire			Jump_o, Branch_o, BranchType_o, MemWrite_o, MemRead_o;

//Main function
/*your code here*/
parameter R = 6'b000000;
parameter addi = 6'b001000;
parameter lw   = 6'b100001;
parameter sw   = 6'b100011;
parameter beq  = 6'b111011;
parameter bne  = 6'b100101;
parameter jump = 6'b100010;

assign RegWrite_o = (instr_op_i == R || instr_op_i == addi || instr_op_i == lw) ? 1'b1 : 1'b0; 
					
assign ALUOp_o = 	(instr_op_i == R) ? 3'b010 :
					(instr_op_i == addi) ? 3'b011 : 
					(instr_op_i == lw || instr_op_i == sw) ? 3'b000 :
					(instr_op_i == beq) ? 3'b001 :
					(instr_op_i == bne) ? 3'b110 : 3'b000;
					
assign ALUSrc_o = (instr_op_i == addi || instr_op_i == lw || instr_op_i == sw) ? 1'b1 : 1'b0;
assign RegDst_o = (instr_op_i == R) ? 2'b01 : 2'b00;
assign Branch_o = (instr_op_i == bne || instr_op_i == beq) ? 1'b1 : 1'b0;
assign MemRead_o = (instr_op_i == lw) ? 1'b1 : 1'b0;
assign MemWrite_o = (instr_op_i == sw) ? 1'b1 : 1'b0;
assign MemtoReg_o = (instr_op_i == lw) ? 2'b01 : 2'b00;
assign Jump_o = (instr_op_i == jump) ? 1'b1 : 1'b0;
assign BranchType_o = (instr_op_i == bne) ? 1'b1 : 1'b0;

endmodule
   