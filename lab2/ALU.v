`include "ALU_1bit.v"
`include "ALU_1bit_the32th.v"
`include "Full_adder.v"
module ALU (
           aluSrc1,
           aluSrc2,
           invertA,
           invertB,
           operation,
           result,
           zero,
           overflow
       );

//I/O ports
input [32-1:0] aluSrc1;
input [32-1:0] aluSrc2;
input invertA;
input invertB;
input [2-1:0] operation;

output [32-1:0] result;
output zero;
output overflow;

//Internal Signals
wire [32-1:0] result;
wire zero;
wire overflow;
wire [32:0]temp;
wire addResult;
//Main function
/*your code here*/
ALU_1bit M0(.a(aluSrc1[0]), .b(aluSrc2[0]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(invertB), .less(addResult), .result(result[0]), .carryOut(temp[0]));
ALU_1bit M1(.a(aluSrc1[1]), .b(aluSrc2[1]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(temp[0]), .less(1'b0), .result(result[1]), .carryOut(temp[1]));
ALU_1bit M2(.a(aluSrc1[2]), .b(aluSrc2[2]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(temp[1]), .less(1'b0), .result(result[2]), .carryOut(temp[2]));
ALU_1bit M3(.a(aluSrc1[3]), .b(aluSrc2[3]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(temp[2]), .less(1'b0), .result(result[3]), .carryOut(temp[3]));
ALU_1bit M4(.a(aluSrc1[4]), .b(aluSrc2[4]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(temp[3]), .less(1'b0), .result(result[4]), .carryOut(temp[4]));
ALU_1bit M5(.a(aluSrc1[5]), .b(aluSrc2[5]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(temp[4]), .less(1'b0), .result(result[5]), .carryOut(temp[5]));
ALU_1bit M6(.a(aluSrc1[6]), .b(aluSrc2[6]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(temp[5]), .less(1'b0), .result(result[6]), .carryOut(temp[6]));
ALU_1bit M7(.a(aluSrc1[7]), .b(aluSrc2[7]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(temp[6]), .less(1'b0), .result(result[7]), .carryOut(temp[7]));
ALU_1bit M8(.a(aluSrc1[8]), .b(aluSrc2[8]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(temp[7]), .less(1'b0), .result(result[8]), .carryOut(temp[8]));
ALU_1bit M9(.a(aluSrc1[9]), .b(aluSrc2[9]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(temp[8]), .less(1'b0), .result(result[9]), .carryOut(temp[9]));
ALU_1bit M10(.a(aluSrc1[10]), .b(aluSrc2[10]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(temp[9]), .less(1'b0), .result(result[10]), .carryOut(temp[10]));
ALU_1bit M11(.a(aluSrc1[11]), .b(aluSrc2[11]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(temp[10]), .less(1'b0), .result(result[11]), .carryOut(temp[11]));
ALU_1bit M12(.a(aluSrc1[12]), .b(aluSrc2[12]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(temp[11]), .less(1'b0), .result(result[12]), .carryOut(temp[12]));
ALU_1bit M13(.a(aluSrc1[13]), .b(aluSrc2[13]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(temp[12]), .less(1'b0), .result(result[13]), .carryOut(temp[13]));
ALU_1bit M14(.a(aluSrc1[14]), .b(aluSrc2[14]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(temp[13]), .less(1'b0), .result(result[14]), .carryOut(temp[14]));
ALU_1bit M15(.a(aluSrc1[15]), .b(aluSrc2[15]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(temp[14]), .less(1'b0), .result(result[15]), .carryOut(temp[15]));
ALU_1bit M16(.a(aluSrc1[16]), .b(aluSrc2[16]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(temp[15]), .less(1'b0), .result(result[16]), .carryOut(temp[16]));
ALU_1bit M17(.a(aluSrc1[17]), .b(aluSrc2[17]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(temp[16]), .less(1'b0), .result(result[17]), .carryOut(temp[17]));
ALU_1bit M18(.a(aluSrc1[18]), .b(aluSrc2[18]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(temp[17]), .less(1'b0), .result(result[18]), .carryOut(temp[18]));
ALU_1bit M19(.a(aluSrc1[19]), .b(aluSrc2[19]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(temp[18]), .less(1'b0), .result(result[19]), .carryOut(temp[19]));
ALU_1bit M20(.a(aluSrc1[20]), .b(aluSrc2[20]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(temp[19]), .less(1'b0), .result(result[20]), .carryOut(temp[20]));
ALU_1bit M21(.a(aluSrc1[21]), .b(aluSrc2[21]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(temp[20]), .less(1'b0), .result(result[21]), .carryOut(temp[21]));
ALU_1bit M22(.a(aluSrc1[22]), .b(aluSrc2[22]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(temp[21]), .less(1'b0), .result(result[22]), .carryOut(temp[22]));
ALU_1bit M23(.a(aluSrc1[23]), .b(aluSrc2[23]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(temp[22]), .less(1'b0), .result(result[23]), .carryOut(temp[23]));
ALU_1bit M24(.a(aluSrc1[24]), .b(aluSrc2[24]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(temp[23]), .less(1'b0), .result(result[24]), .carryOut(temp[24]));
ALU_1bit M25(.a(aluSrc1[25]), .b(aluSrc2[25]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(temp[24]), .less(1'b0), .result(result[25]), .carryOut(temp[25]));
ALU_1bit M26(.a(aluSrc1[26]), .b(aluSrc2[26]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(temp[25]), .less(1'b0), .result(result[26]), .carryOut(temp[26]));
ALU_1bit M27(.a(aluSrc1[27]), .b(aluSrc2[27]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(temp[26]), .less(1'b0), .result(result[27]), .carryOut(temp[27]));
ALU_1bit M28(.a(aluSrc1[28]), .b(aluSrc2[28]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(temp[27]), .less(1'b0), .result(result[28]), .carryOut(temp[28]));
ALU_1bit M29(.a(aluSrc1[29]), .b(aluSrc2[29]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(temp[28]), .less(1'b0), .result(result[29]), .carryOut(temp[29]));
ALU_1bit M30(.a(aluSrc1[30]), .b(aluSrc2[30]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(temp[29]), .less(1'b0), .result(result[30]), .carryOut(temp[30]));
ALU_1bit_the32th M31(.a(aluSrc1[31]), .b(aluSrc2[31]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(temp[30]), .less(1'b0), .result(result[31]), .carryOut(temp[31]), .addResult(addResult));
assign overflow = temp[31]^temp[30];
nor (zero, result[0], result[1], result[2], result[3], result[4], result[5], result[6], result[7], result[8], result[9], result[10], result[11], result[12], result[13], result[14], result[15], result[16], result[17], result[18], result[19], result[20], result[21], result[22], result[23], result[24], result[25], result[26], result[27], result[28], result[29], result[30], result[31]);
endmodule
