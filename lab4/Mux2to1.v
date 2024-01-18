module Mux2to1 (
           data0_i,
           data1_i,
           select_i,
           data_o
       );

parameter size = 0;

//I/O ports
input [size-1:0] data0_i;
input [size-1:0] data1_i;
input select_i;

output [size-1:0] data_o;

//Internal Signals
reg [size-1:0] data_o;
wire temp;
//Main function
/*your code here*/
assign temp = select_i;
always@*
begin
    if(temp==0)
    begin
        assign data_o = data0_i;
    end
    else
    begin
        assign data_o = data1_i;
    end
end
endmodule
