module Shifter (
           leftRight,
           shamt,
           sftSrc,
           result
       );

//I/O ports
input leftRight;
input [5-1:0] shamt;
input [32-1:0] sftSrc;

output reg [32-1:0] result;

//Internal Signals
integer decimalShamt;
integer i;

always@*
begin
    decimalShamt = $unsigned(shamt);
    if(leftRight == 0)
    begin
        for(i = 0; i < 32 - decimalShamt; i = i+1)
        begin
            result[i+decimalShamt] = sftSrc[i];
        end

        for(i = 0; i < decimalShamt; i = i+1)
        begin
            result[i] = 1'b0;
        end
    end
    else
    begin
        for(i =  32 - decimalShamt; i < 32; i = i+1)
        begin
            result[i] = 1'b0;
        end
        for(i = decimalShamt; i < 32; i = i+1)
        begin
            result[i-decimalShamt] = sftSrc[i];
        end
    end
end
//Main function
/*your code here*/

endmodule
