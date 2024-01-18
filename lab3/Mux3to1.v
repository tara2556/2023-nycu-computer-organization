module Mux3to1 (
           data0_i,
           data1_i,
           data2_i,
           select_i,
           data_o
       );

parameter size = 0;

//I/O ports
input [size-1:0] data0_i;
input [size-1:0] data1_i;
input [size-1:0] data2_i;
input [1:0] select_i;

output [size-1:0] data_o;

//Internal Signals
reg [size-1:0] data_o;
wire temp;
//Main function
/*your code here*/
integer select;
always@*
begin
    select = $unsigned(select_i);
    if(select==0)
    begin
        assign data_o = data0_i;
    end
    else if(select==1)
    begin
        assign data_o = data1_i;
    end
    else if(select==2)
    begin
        assign data_o = data2_i;
    end
    else
    begin
        assign data_o = 32'b0;
    end
end
endmodule
