module Sign_Extend (
           data_i,
           data_o
       );

//I/O ports
input [16-1:0] data_i;

output [32-1:0] data_o;

//Internal Signals
reg [32-1:0] data_o;

//Sign extended
/*your code here*/
integer i;
always @*
begin
    for(i = 0; i < 16; i = i+1)
    begin
        data_o[i+16] = data_i[15];
        data_o[i] = data_i[i];
    end
end

endmodule
