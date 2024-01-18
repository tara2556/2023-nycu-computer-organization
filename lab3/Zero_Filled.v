module Zero_Filled (
           data_i,
           data_o
       );

//I/O ports
input [16-1:0] data_i;
output [32-1:0] data_o;

//Internal Signals
reg [32-1:0] data_o;

//Zero_Filled
/*your code here*/
integer i;
always @*
begin
    for(i = 0; i < 16; i = i+1)
    begin
        data_o[i+16] = 1'b0;
        data_o[i] = data_i[i];
    end
end

endmodule
