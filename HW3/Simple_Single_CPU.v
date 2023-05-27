module Simple_Single_CPU( clk_i, rst_n );

//I/O port
input         clk_i;
input         rst_n;

//Internal Signles
wire [32-1:0] pc_plus4;
wire [32-1:0] pc_inst;
wire [32-1:0] instr_o;
wire [5-1:0] WriteReg;
wire RegDst;
wire RegWrite;
wire [3-1:0] ALUOp;
wire ALUSrc;
wire [32-1:0] Write_Data;
wire [32-1:0] rs_data;
wire [32-1:0] rt_data;
wire [4-1:0] ALUCtrl;
wire [2-1:0] FURslt;
wire [32-1:0] sign_instr;
wire [32-1:0] zero_instr;
wire [32-1:0] ALU_or_Shifter;
wire zero;
wire [32-1:0] result_ALU;
wire [32-1:0] result_Shifter;
wire overflow;

//modules
Program_Counter PC(
        .clk_i(clk_i),      
	    .rst_n(rst_n),     
	    .pc_in_i(pc_plus4) ,   
	    .pc_out_o(pc_inst) 
	    );
	
Adder Adder1(
        .src1_i(pc_inst),     
	    .src2_i(32'd4),
	    .sum_o(pc_plus4)    
	    );
	
Instr_Memory IM(
        .pc_addr_i(pc_inst),  
	    .instr_o(instr_o)    
	    );

Mux2to1 #(.size(5)) Mux_Write_Reg(
        .data0_i(instr_o[20:16]),
        .data1_i(instr_o[15:11]),
        .select_i(RegDst),
        .data_o(WriteReg)
        );	
		
Reg_File RF(
        .clk_i(clk_i),      
	    .rst_n(rst_n) ,     
        .RSaddr_i(instr_o[25:21]) ,  
        .RTaddr_i(instr_o[20:16]) ,  
        .RDaddr_i(WriteReg) ,  
        .RDdata_i(Write_Data)  , 
        .RegWrite_i(RegWrite),
        .RSdata_o(rs_data) ,  
        .RTdata_o(rt_data)   
        );
	
Decoder Decoder(
        .instr_op_i(instr_o[32-1:26]), 
	    .RegWrite_o(RegWrite), 
	    .ALUOp_o(ALUOp),   
	    .ALUSrc_o(ALUSrc),   
	    .RegDst_o(RegDst)   
		);

ALU_Ctrl AC(
        .funct_i(instr_o[6-1:0]), 
        .ALUOp_i(ALUOp),   
        .ALU_operation_o(ALUCtrl),
		.FURslt_o(FURslt)
        );
	
Sign_Extend SE(
        .data_i(instr_o[15:0]),
        .data_o(sign_instr)
        );

Zero_Filled ZF(
        .data_i(instr_o[15:0]),
        .data_o(zero_instr)
        );
		
Mux2to1 #(.size(32)) ALU_src2Src(
        .data0_i(rt_data),
        .data1_i(sign_instr),
        .select_i(ALUSrc),
        .data_o(ALU_or_Shifter)
        );	
		
ALU ALU(
		.aluSrc1(rs_data),
	    .aluSrc2(ALU_or_Shifter),
	    .ALU_operation_i(ALUCtrl),
		.result(result_ALU),
		.zero(zero),
		.overflow(overflow)
	    );
		
Shifter shifter( 
		.result(result_Shifter),
		.leftRight(ALUCtrl[0]),
		.shamt(instr_o[10:6]),
		.sftSrc(ALU_or_Shifter) 
		);
		
Mux3to1 #(.size(32)) RDdata_Source(
        .data0_i(result_ALU),
        .data1_i(result_Shifter),
		.data2_i(zero_instr),
        .select_i(FURslt),
        .data_o(Write_Data)
        );			

endmodule



