module ALU_Ctrl (
           funct_i,
           ALUOp_i,
           ALU_operation_o,
           FURslt_o,
           leftRight_o,
           shifhterSource_o,
           PC_source_o
       );

//I/O ports
input [6-1:0] funct_i;
input [3-1:0] ALUOp_i;

output [4-1:0] ALU_operation_o;
output [2-1:0] FURslt_o;
output leftRight_o;
output shifhterSource_o;
output PC_source_o;
parameter ADD = 6'b100011;
parameter SUB = 6'b010011;
parameter AND = 6'b011111;
parameter OR = 6'b101111;
parameter NOR = 6'b010000;
parameter SLT = 6'b010100;
parameter SLL = 6'b010010;
parameter SRL = 6'b100010;
parameter SLLV = 6'b011000;
parameter SRLV = 6'b101000;
parameter JR =  6'b000001;

//Internal Signals
reg [4-1:0] ALU_operation_o;
reg [2-1:0] FURslt_o;
reg leftRight_o;
reg shifhterSource_o;
reg PC_source_o;
//Main function
/*your code here*/
always @*
begin
    case(ALUOp_i)
        3'b000:{ALU_operation_o, FURslt_o, leftRight_o, shifhterSource_o, PC_source_o} = {4'b0010, 2'b00, 1'bx, 1'bx, 1'b0};
        3'b001:{ALU_operation_o, FURslt_o, leftRight_o, shifhterSource_o, PC_source_o} = {4'b0110, 2'b00, 1'bx, 1'bx, 1'b0};
        3'b010:
        begin
            case(funct_i)
                ADD:{ALU_operation_o, FURslt_o, leftRight_o, shifhterSource_o, PC_source_o} = {4'b0010, 2'b00, 1'bx, 1'bx, 1'b0};
                SUB:{ALU_operation_o, FURslt_o, leftRight_o, shifhterSource_o, PC_source_o} = {4'b0110, 2'b00, 1'bx, 1'bx, 1'b0};
                AND:{ALU_operation_o, FURslt_o, leftRight_o, shifhterSource_o, PC_source_o} = {4'b0000, 2'b00, 1'bx, 1'bx, 1'b0};
                OR:{ALU_operation_o, FURslt_o, leftRight_o, shifhterSource_o, PC_source_o} = {4'b0001, 2'b00, 1'bx, 1'bx, 1'b0};
                NOR:{ALU_operation_o, FURslt_o, leftRight_o, shifhterSource_o, PC_source_o} = {4'b1100, 2'b00, 1'bx, 1'bx, 1'b0};
                SLT:{ALU_operation_o, FURslt_o, leftRight_o, shifhterSource_o, PC_source_o} = {4'b0111, 2'b00, 1'bx, 1'bx, 1'b0};
                SLL:{ALU_operation_o, FURslt_o, leftRight_o, shifhterSource_o, PC_source_o} = {4'bx, 2'b01, 1'b0, 1'b0, 1'b0};
                SRL:{ALU_operation_o, FURslt_o, leftRight_o, shifhterSource_o, PC_source_o} = {4'bx, 2'b01, 1'b1, 1'b0, 1'b0};
                SLLV:{ALU_operation_o, FURslt_o, leftRight_o, shifhterSource_o, PC_source_o} = {4'bx, 2'b01, 1'b0, 1'b1, 1'b0};
                SRLV:{ALU_operation_o, FURslt_o, leftRight_o, shifhterSource_o, PC_source_o} = {4'bx, 2'b01, 1'b1, 1'b1, 1'b0};
                JR:{ALU_operation_o, FURslt_o, leftRight_o, shifhterSource_o, PC_source_o} = {4'b0010, 2'b00, 1'bx, 1'bx, 1'b1};
                default:{ALU_operation_o, FURslt_o, leftRight_o, shifhterSource_o, PC_source_o} = {4'bx, 2'bx, 1'bx, 1'bx, 1'b0};
            endcase
        end
        3'b011:{ALU_operation_o, FURslt_o, leftRight_o, shifhterSource_o, PC_source_o} = {4'b0010, 2'b00, 1'bx, 1'bx, 1'b0};
        3'b100:{ALU_operation_o, FURslt_o, leftRight_o, shifhterSource_o, PC_source_o} = {4'b0111, 2'b00, 1'bx, 1'bx, 1'b0};
        3'b101:{ALU_operation_o, FURslt_o, leftRight_o, shifhterSource_o, PC_source_o} = {4'b0110, 2'b00, 1'bx, 1'bx, 1'b0};
        3'b110:{ALU_operation_o, FURslt_o, leftRight_o, shifhterSource_o, PC_source_o} = {4'b0111, 2'b00, 1'bx, 1'bx, 1'b0};
        default:{ALU_operation_o, FURslt_o, leftRight_o, shifhterSource_o, PC_source_o} = {4'b0, 2'b0, 1'b0, 1'b0, 1'b0};

    endcase
end

endmodule
