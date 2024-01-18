module ALU (
           aluSrc1,
           aluSrc2,
           ALU_operation_i,
           result,
           zero,
           overflow
       );

//I/O ports
input [32-1:0] aluSrc1;
input [32-1:0] aluSrc2;
input [4-1:0] ALU_operation_i;

output reg[32-1:0] result;
output zero;
output overflow;

//Internal Signals
wire zero;
wire overflow;

//Main function
/*your code here*/
integer i;
nor (zero, result[0], result[1], result[2], result[3], result[4], result[5], result[6], result[7], result[8], result[9], result[10], result[11], result[12], result[13], result[14], result[15], result[16], result[17], result[18], result[19], result[20], result[21], result[22], result[23], result[24], result[25], result[26], result[27], result[28], result[29], result[30], result[31]);

always @*
begin
    case(ALU_operation_i)
        4'b0000:result = aluSrc1&aluSrc2;
        4'b1100:result = ~(aluSrc1|aluSrc2);
        4'b0001:result = aluSrc1|aluSrc2;
        4'b1101:result = ~(aluSrc1&aluSrc2);
        4'b0010:result = $signed(aluSrc1) + $signed(aluSrc2);
        4'b0110:result = $signed(aluSrc1) - $signed(aluSrc2);
        4'b0111:result = {31'b0, $signed(aluSrc1) < $signed(aluSrc2)};
    endcase
end

assign overflow = (aluSrc1[31]==aluSrc2[31])&&(aluSrc1[31]!=result[31]);

endmodule
