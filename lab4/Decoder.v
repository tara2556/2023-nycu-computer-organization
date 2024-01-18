module Decoder (
           instr_op_i,
           RegWrite_o,
           ALUOp_o,
           ALUSrc_o,
           RegDst_o,
           Jump_o,
           Branch_o,
           BranchType_o,
           MemRead_o,
           MemWrite_o,
           MemtoReg_o,
           jal_o,
           rt_o,
           RestoreLink_o,
           RTsource_o
       );

//I/O ports
input [6-1:0] instr_op_i;

output RegWrite_o;
output [3-1:0] ALUOp_o;
output ALUSrc_o;
output RegDst_o;
output Jump_o;
output Branch_o;
output BranchType_o;
output MemRead_o;
output MemWrite_o;
output MemtoReg_o;
output jal_o;
output rt_o;
output RestoreLink_o;
output RTsource_o;
//Internal Signals
reg RegWrite_o;
reg [3-1:0] ALUOp_o;
reg ALUSrc_o;
reg RegDst_o;
reg Jump_o;
reg Branch_o;
reg BranchType_o;
reg MemRead_o;
reg MemWrite_o;
reg MemtoReg_o;
reg jal_o;
reg rt_o;
reg RestoreLink_o;
reg RTsource_o;

parameter RType= 6'b000000;
parameter addi = 6'b010011;
parameter lw   = 6'b011000;
parameter sw   = 6'b101000;
parameter beq  = 6'b011001;
parameter bne  = 6'b011010;
parameter jump = 6'b001100;
parameter jal  = 6'b001111;
parameter blt  = 6'b011100;
parameter bnez = 6'b011101;
parameter bgez = 6'b011110;

//Main function
/*your code here*/

always@*
begin
    case(instr_op_i)
        RType: {RegWrite_o,
                    ALUOp_o,
                    ALUSrc_o,
                    RegDst_o,
                    Jump_o,
                    Branch_o,
                    BranchType_o,
                    MemRead_o,
                    MemWrite_o,
                    MemtoReg_o,
                    jal_o,
                    rt_o,
                    RestoreLink_o,
                    RTsource_o} = {1'b1, 3'b010, 1'b0, 1'b1, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0};
        addi:{ RegWrite_o,
                    ALUOp_o,
                    ALUSrc_o,
                    RegDst_o,
                    Jump_o,
                    Branch_o,
                    BranchType_o,
                    MemRead_o,
                    MemWrite_o,
                    MemtoReg_o,
                    jal_o,
                    rt_o,
                    RestoreLink_o,
                    RTsource_o} = {1'b1, 3'b011, 1'b1, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0};
        lw:{ RegWrite_o,
                    ALUOp_o,
                    ALUSrc_o,
                    RegDst_o,
                    Jump_o,
                    Branch_o,
                    BranchType_o,
                    MemRead_o,
                    MemWrite_o,
                    MemtoReg_o,
                    jal_o,
                    rt_o,
                    RestoreLink_o,
                    RTsource_o} = {1'b1, 3'b000, 1'b1, 1'b0, 1'b0, 1'b0, 1'b0, 1'b1, 1'b0, 1'b1, 1'b0, 1'b0, 1'b0, 1'b0};
        sw:{ RegWrite_o,
                    ALUOp_o,
                    ALUSrc_o,
                    RegDst_o,
                    Jump_o,
                    Branch_o,
                    BranchType_o,
                    MemRead_o,
                    MemWrite_o,
                    MemtoReg_o,
                    jal_o,
                    rt_o,
                    RestoreLink_o,
                    RTsource_o} = {1'b0, 3'b000, 1'b1, 1'bx, 1'b0, 1'b0, 1'b0, 1'b0, 1'b1, 1'bx, 1'b0, 1'b0, 1'b0, 1'b0};
        beq:{ RegWrite_o,
                    ALUOp_o,
                    ALUSrc_o,
                    RegDst_o,
                    Jump_o,
                    Branch_o,
                    BranchType_o,
                    MemRead_o,
                    MemWrite_o,
                    MemtoReg_o,
                    jal_o,
                    rt_o,
                    RestoreLink_o,
                    RTsource_o} = {1'b0, 3'b001, 1'b0, 1'b0, 1'b0, 1'b1, 1'b0, 1'b0, 1'b0, 1'bx, 1'b0, 1'b0, 1'b0, 1'b0};
        bne:{ RegWrite_o,
                    ALUOp_o,
                    ALUSrc_o,
                    RegDst_o,
                    Jump_o,
                    Branch_o,
                    BranchType_o,
                    MemRead_o,
                    MemWrite_o,
                    MemtoReg_o,
                    jal_o,
                    rt_o,
                    RestoreLink_o,
                    RTsource_o} = {1'b0, 3'b001, 1'b0, 1'b0, 1'b0, 1'b1, 1'b1, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0};
        jump:{ RegWrite_o,
                    ALUOp_o,
                    ALUSrc_o,
                    RegDst_o,
                    Jump_o,
                    Branch_o,
                    BranchType_o,
                    MemRead_o,
                    MemWrite_o,
                    MemtoReg_o,
                    jal_o,
                    rt_o,
                    RestoreLink_o,
                    RTsource_o} = {1'b0, 3'bx, 1'bx, 1'bx, 1'b1, 1'b0, 1'bx, 1'b0, 1'b0, 1'bx, 1'b0, 1'b0, 1'b0, 1'b0};
        jal:{ RegWrite_o,
                    ALUOp_o,
                    ALUSrc_o,
                    RegDst_o,
                    Jump_o,
                    Branch_o,
                    BranchType_o,
                    MemRead_o,
                    MemWrite_o,
                    MemtoReg_o,
                    jal_o,
                    rt_o,
                    RestoreLink_o,
                    RTsource_o} = {1'b1, 3'bx, 1'bx, 1'bx, 1'b1, 1'b0, 1'bx, 1'b0, 1'b0, 1'bx, 1'b0, 1'b0, 1'b1, 1'b0};
        blt:{ RegWrite_o,
                    ALUOp_o,
                    ALUSrc_o,
                    RegDst_o,
                    Jump_o,
                    Branch_o,
                    BranchType_o,
                    MemRead_o,
                    MemWrite_o,
                    MemtoReg_o,
                    jal_o,
                    rt_o,
                    RestoreLink_o,
                    RTsource_o} = {1'b0, 3'b100, 1'b0, 1'bx, 1'b0, 1'bx, 1'bx, 1'b0, 1'b0, 1'b0, 1'b0, 1'b1, 1'b0, 1'b0};
        bnez:{ RegWrite_o,
                    ALUOp_o,
                    ALUSrc_o,
                    RegDst_o,
                    Jump_o,
                    Branch_o,
                    BranchType_o,
                    MemRead_o,
                    MemWrite_o,
                    MemtoReg_o,
                    jal_o,
                    rt_o,
                    RestoreLink_o,
                    RTsource_o} = {1'b0, 3'b101, 1'b0, 1'bx, 1'b0, 1'b1, 1'b1, 1'b0, 1'b0, 1'bx, 1'b0, 1'b0, 1'b0, 1'b1};
        bgez:{ RegWrite_o,
                    ALUOp_o,
                    ALUSrc_o,
                    RegDst_o,
                    Jump_o,
                    Branch_o,
                    BranchType_o,
                    MemRead_o,
                    MemWrite_o,
                    MemtoReg_o,
                    jal_o,
                    rt_o,
                    RestoreLink_o,
                    RTsource_o} = {1'b0, 3'b110, 1'b0, 1'bx, 1'b0, 1'b1, 1'b0, 1'b0, 1'b0, 1'bx, 1'b1, 1'b0, 1'b0, 1'b1};
    endcase
end
endmodule
