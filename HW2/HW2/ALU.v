module ALU( result, zero, overflow, aluSrc1, aluSrc2, invertA, invertB, operation );
   
  output wire[31:0] result;
  output wire zero;
  output wire overflow;

  input wire[31:0] aluSrc1;
  input wire[31:0] aluSrc2;
  input wire invertA;
  input wire invertB;
  input wire[1:0] operation;
  
  /*your code here*/
  wire set;
  wire const_zero = 1'b0;
  wire cout;
  
  assign zero = (result == 32'b0) ? 1 : 0;

  assign overflow = (operation == 2'b10) ? a31.carryOut ^ a31.carryIn: 1'b0;
                    
 ALU_1bit a0(
	  .result(result[0]),
	  .carryOut(a1.carryIn),
	  .a(aluSrc1[0]),
	  .b(aluSrc2[0]),
	  .invertA(invertA),
	  .invertB(invertB),
	  .operation(operation),
	  .carryIn(invertB),
	  .less(a31.set)
	  );

 ALU_1bit a1(
        .result(result[1]),
        .carryOut(a2.carryIn),
        .a(aluSrc1[1]),
        .b(aluSrc2[1]),
        .invertA(invertA),
        .invertB(invertB),
        .operation(operation),
        .carryIn(a0.carryOut),
        .less(const_zero)
        );
 ALU_1bit a2(
        .result(result[2]),
        .carryOut(a3.carryIn),
        .a(aluSrc1[2]),
        .b(aluSrc2[2]),
        .invertA(invertA),
        .invertB(invertB),
        .operation(operation),
        .carryIn(a1.carryOut),
        .less(const_zero)
        );
 ALU_1bit a3(
        .result(result[3]),
        .carryOut(a4.carryIn),
        .a(aluSrc1[3]),
        .b(aluSrc2[3]),
        .invertA(invertA),
        .invertB(invertB),
        .operation(operation),
        .carryIn(a2.carryOut),
        .less(const_zero)
        );
 ALU_1bit a4(
        .result(result[4]),
        .carryOut(a5.carryIn),
        .a(aluSrc1[4]),
        .b(aluSrc2[4]),
        .invertA(invertA),
        .invertB(invertB),
        .operation(operation),
        .carryIn(a3.carryOut),
        .less(const_zero)
        );
 ALU_1bit a5(
        .result(result[5]),
        .carryOut(a6.carryIn),
        .a(aluSrc1[5]),
        .b(aluSrc2[5]),
        .invertA(invertA),
        .invertB(invertB),
        .operation(operation),
        .carryIn(a4.carryOut),
        .less(const_zero)
        );
 ALU_1bit a6(
        .result(result[6]),
        .carryOut(a7.carryIn),
        .a(aluSrc1[6]),
        .b(aluSrc2[6]),
        .invertA(invertA),
        .invertB(invertB),
        .operation(operation),
        .carryIn(a5.carryOut),
        .less(const_zero)
        );
 ALU_1bit a7(
        .result(result[7]),
        .carryOut(a8.carryIn),
        .a(aluSrc1[7]),
        .b(aluSrc2[7]),
        .invertA(invertA),
        .invertB(invertB),
        .operation(operation),
        .carryIn(a6.carryOut),
        .less(const_zero)
        );
 ALU_1bit a8(
        .result(result[8]),
        .carryOut(a9.carryIn),
        .a(aluSrc1[8]),
        .b(aluSrc2[8]),
        .invertA(invertA),
        .invertB(invertB),
        .operation(operation),
        .carryIn(a7.carryOut),
        .less(const_zero)
        );
 ALU_1bit a9(
        .result(result[9]),
        .carryOut(a10.carryIn),
        .a(aluSrc1[9]),
        .b(aluSrc2[9]),
        .invertA(invertA),
        .invertB(invertB),
        .operation(operation),
        .carryIn(a8.carryOut),
        .less(const_zero)
        );
 ALU_1bit a10(
        .result(result[10]),
        .carryOut(a11.carryIn),
        .a(aluSrc1[10]),
        .b(aluSrc2[10]),
        .invertA(invertA),
        .invertB(invertB),
        .operation(operation),
        .carryIn(a9.carryOut),
        .less(const_zero)
        );
 ALU_1bit a11(
        .result(result[11]),
        .carryOut(a12.carryIn),
        .a(aluSrc1[11]),
        .b(aluSrc2[11]),
        .invertA(invertA),
        .invertB(invertB),
        .operation(operation),
        .carryIn(a10.carryOut),
        .less(const_zero)
        );
 ALU_1bit a12(
        .result(result[12]),
        .carryOut(a13.carryIn),
        .a(aluSrc1[12]),
        .b(aluSrc2[12]),
        .invertA(invertA),
        .invertB(invertB),
        .operation(operation),
        .carryIn(a11.carryOut),
        .less(const_zero)
        );
 ALU_1bit a13(
        .result(result[13]),
        .carryOut(a14.carryIn),
        .a(aluSrc1[13]),
        .b(aluSrc2[13]),
        .invertA(invertA),
        .invertB(invertB),
        .operation(operation),
        .carryIn(a12.carryOut),
        .less(const_zero)
        );
 ALU_1bit a14(
        .result(result[14]),
        .carryOut(a15.carryIn),
        .a(aluSrc1[14]),
        .b(aluSrc2[14]),
        .invertA(invertA),
        .invertB(invertB),
        .operation(operation),
        .carryIn(a13.carryOut),
        .less(const_zero)
        );
 ALU_1bit a15(
        .result(result[15]),
        .carryOut(a16.carryIn),
        .a(aluSrc1[15]),
        .b(aluSrc2[15]),
        .invertA(invertA),
        .invertB(invertB),
        .operation(operation),
        .carryIn(a14.carryOut),
        .less(const_zero)
        );
 ALU_1bit a16(
        .result(result[16]),
        .carryOut(a17.carryIn),
        .a(aluSrc1[16]),
        .b(aluSrc2[16]),
        .invertA(invertA),
        .invertB(invertB),
        .operation(operation),
        .carryIn(a15.carryOut),
        .less(const_zero)
        );
 ALU_1bit a17(
        .result(result[17]),
        .carryOut(a18.carryIn),
        .a(aluSrc1[17]),
        .b(aluSrc2[17]),
        .invertA(invertA),
        .invertB(invertB),
        .operation(operation),
        .carryIn(a16.carryOut),
        .less(const_zero)
        );
 ALU_1bit a18(
        .result(result[18]),
        .carryOut(a19.carryIn),
        .a(aluSrc1[18]),
        .b(aluSrc2[18]),
        .invertA(invertA),
        .invertB(invertB),
        .operation(operation),
        .carryIn(a17.carryOut),
        .less(const_zero)
        );
 ALU_1bit a19(
        .result(result[19]),
        .carryOut(a20.carryIn),
        .a(aluSrc1[19]),
        .b(aluSrc2[19]),
        .invertA(invertA),
        .invertB(invertB),
        .operation(operation),
        .carryIn(a18.carryOut),
        .less(const_zero)
        );
 ALU_1bit a20(
        .result(result[20]),
        .carryOut(a21.carryIn),
        .a(aluSrc1[20]),
        .b(aluSrc2[20]),
        .invertA(invertA),
        .invertB(invertB),
        .operation(operation),
        .carryIn(a19.carryOut),
        .less(const_zero)
        );
 ALU_1bit a21(
        .result(result[21]),
        .carryOut(a22.carryIn),
        .a(aluSrc1[21]),
        .b(aluSrc2[21]),
        .invertA(invertA),
        .invertB(invertB),
        .operation(operation),
        .carryIn(a20.carryOut),
        .less(const_zero)
        );
 ALU_1bit a22(
        .result(result[22]),
        .carryOut(a23.carryIn),
        .a(aluSrc1[22]),
        .b(aluSrc2[22]),
        .invertA(invertA),
        .invertB(invertB),
        .operation(operation),
        .carryIn(a21.carryOut),
        .less(const_zero)
        );
 ALU_1bit a23(
        .result(result[23]),
        .carryOut(a24.carryIn),
        .a(aluSrc1[23]),
        .b(aluSrc2[23]),
        .invertA(invertA),
        .invertB(invertB),
        .operation(operation),
        .carryIn(a22.carryOut),
        .less(const_zero)
        );
 ALU_1bit a24(
        .result(result[24]),
        .carryOut(a25.carryIn),
        .a(aluSrc1[24]),
        .b(aluSrc2[24]),
        .invertA(invertA),
        .invertB(invertB),
        .operation(operation),
        .carryIn(a23.carryOut),
        .less(const_zero)
        );
 ALU_1bit a25(
        .result(result[25]),
        .carryOut(a26.carryIn),
        .a(aluSrc1[25]),
        .b(aluSrc2[25]),
        .invertA(invertA),
        .invertB(invertB),
        .operation(operation),
        .carryIn(a24.carryOut),
        .less(const_zero)
        );
 ALU_1bit a26(
        .result(result[26]),
        .carryOut(a27.carryIn),
        .a(aluSrc1[26]),
        .b(aluSrc2[26]),
        .invertA(invertA),
        .invertB(invertB),
        .operation(operation),
        .carryIn(a25.carryOut),
        .less(const_zero)
        );
 ALU_1bit a27(
        .result(result[27]),
        .carryOut(a28.carryIn),
        .a(aluSrc1[27]),
        .b(aluSrc2[27]),
        .invertA(invertA),
        .invertB(invertB),
        .operation(operation),
        .carryIn(a26.carryOut),
        .less(const_zero)
        );
 ALU_1bit a28(
        .result(result[28]),
        .carryOut(a29.carryIn),
        .a(aluSrc1[28]),
        .b(aluSrc2[28]),
        .invertA(invertA),
        .invertB(invertB),
        .operation(operation),
        .carryIn(a27.carryOut),
        .less(const_zero)
        );
 ALU_1bit a29(
        .result(result[29]),
        .carryOut(a30.carryIn),
        .a(aluSrc1[29]),
        .b(aluSrc2[29]),
        .invertA(invertA),
        .invertB(invertB),
        .operation(operation),
        .carryIn(a28.carryOut),
        .less(const_zero)
        );
 ALU_1bit a30(
        .result(result[30]),
        .carryOut(a31.carryIn),
        .a(aluSrc1[30]),
        .b(aluSrc2[30]),
        .invertA(invertA),
        .invertB(invertB),
        .operation(operation),
        .carryIn(a29.carryOut),
        .less(const_zero)
        );
 ALU_bottom a31(
        .result(result[31]),
        .carryOut(cout),
        .a(aluSrc1[31]),
        .b(aluSrc2[31]),
        .invertA(invertA),
        .invertB(invertB),
        .operation(operation),
        .carryIn(a30.carryOut),
        .less(const_zero),
	    .set(set)
	    );

endmodule