module ALU_1bit_the32th (
           a,
           b,
           invertA,
           invertB,
           operation,
           carryIn,
           less,
           result,
           carryOut,
           addResult
       );

//I/O ports
input a;
input b;
input invertA;
input invertB;
input [2-1:0] operation;
input carryIn;
input less;

output reg result;
output carryOut;
output addResult;
//Internal Signals
wire carryOut;
wire temp;
wire tempa, tempb;
//Main function
/*your code here*/
assign tempb = (invertB)?~b:b;
assign tempa = (invertA)?~a:a;
Full_adder M0( .carryIn(carryIn),
               .input1(tempa),
               .input2(tempb),
               .sum(temp),
               .carryOut(carryOut));
always@*
begin
    case(operation)
        2'b00: result = tempa|tempb;
        2'b01: result = tempa&tempb;
        2'b10: result = temp;
        2'b11: result = less;
    endcase
end
assign addResult = temp;
endmodule
