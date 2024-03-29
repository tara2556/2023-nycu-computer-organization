`include "Program_Counter.v"
`include "Adder.v"
`include "Instr_Memory.v"
`include "Mux2to1.v"
`include "Mux3to1.v"
`include "Reg_File.v"
`include "Decoder.v"
`include "ALU_Ctrl.v"
`include "Sign_Extend.v"
`include "Zero_Filled.v"
`include "ALU.v"
`include "Shifter.v"
`include "Data_Memory.v"

module Simple_Single_CPU (
           clk_i,
           rst_n
       );

//I/O port
input clk_i;
input rst_n;
//Internal Signles
wire [31:0]pc_counter_i;
wire [31:0]pc_counter_o;
wire [31:0]instruction;
wire RegWrite;
wire [2:0] ALUOp;
wire ALUSrc;
wire RegDst;
wire Jump;
wire Branch;
wire BranchType;
wire MemRead;
wire MemWrite;
wire MemtoReg;
wire [31:0] RSdata;
wire [4:0] RTaddress;
wire [31:0] RTdata;
wire [4:0] WriteRegister;
wire [31:0] signAlreadyExtend;
wire [31:0] readData2;
wire [3:0] ALU_Operation;
wire leftRight;
wire [1:0] FURslt;
wire [31:0] ALU_Result;
wire [31:0] PC_address;
wire zero;
wire overflow;
wire [31:0] zeroFilled;
wire [31:0] alreadyShift;
wire [31:0] alreadyShift2;
wire [31:0] finalShift;
wire [31:0] Address;
wire [31:0] outputData;
wire [31:0] writeData;
wire [31:0] addressShift;
wire [31:0] branchTarget;
wire [31:0] branchAddress;
wire [31:0] jumpShift;
wire equalOrNotEqual;
wire jal;
wire rt;
wire PC_source;
wire [31:0] temperAddress;
wire [4:0] WriteRegister2;
wire [4:0] WriteRegister3;
wire RestoreLink;
wire [31:0] WriteData2;
wire RTsource;
//modules
Program_Counter PC (
                    .clk_i(clk_i),
                    .rst_n(rst_n),
                    .pc_in_i(pc_counter_i),
                    .pc_out_o(PC_address)
                );

Adder Adder1 (
          .src1_i(PC_address),
          .src2_i(32'd4),
          .sum_o (pc_counter_o)
      );

Shifter branchShifter (
            .result(addressShift),
            .leftRight(1'b0),
            .shamt(5'd2),
            .sftSrc(signAlreadyExtend)
        );

Adder Adder2 (
          .src1_i(pc_counter_o),
          .src2_i(addressShift),
          .sum_o (branchTarget)
      );

Mux2to1 #(
            .size(32)
        ) Mux_branch (
            .data0_i (pc_counter_o),
            .data1_i (branchTarget),
            .select_i((Branch&equalOrNotEqual)||(rt&ALU_Result[31])||(jal&(~ALU_Result[0]))),
            .data_o  (branchAddress)
        );

Mux2to1 #(
            .size(32)
        ) Mux_address (
            .data0_i (branchAddress),
            .data1_i ({pc_counter_o[31:28], jumpShift[27:0]}),
            .select_i(Jump),
            .data_o  (temperAddress)
        );

Mux2to1 #(
            .size(32)
        ) Mux_JRaddress (
            .data0_i (temperAddress),
            .data1_i (Address),
            .select_i(PC_source),
            .data_o  (pc_counter_i)
        );

Shifter jumpShifter (
            .result(jumpShift),
            .leftRight(1'b0),
            .shamt(5'd2),
            .sftSrc({6'b0, instruction[25:0]})
        );

Mux2to1 #(
            .size(32)
        ) ALU_Src (
            .data0_i (RTdata),
            .data1_i (signAlreadyExtend),
            .select_i(ALUSrc),
            .data_o  (readData2)
        );

Instr_Memory IM (
                 .pc_addr_i(PC_address),
                 .instr_o  (instruction)
             );

Mux2to1 #(
            .size(5)
        ) Mux_Write_Reg (
            .data0_i (instruction[20:16]),
            .data1_i (instruction[15:11]),
            .select_i(RegDst),
            .data_o  (WriteRegister)
        );

Mux2to1 #(
            .size(5)
        ) Mux_Write_RegJAL (
            .data0_i (WriteRegister),
            .data1_i (5'b11111),
            .select_i(RestoreLink),
            .data_o  (WriteRegister2)
        );

Mux2to1 #(
            .size(5)
        ) Mux_Write_RegJR (
            .data0_i (WriteRegister2),
            .data1_i (instruction[25:21]),
            .select_i(PC_source),
            .data_o  (WriteRegister3)
        );

Mux2to1 #(
            .size(5)
        ) Mux_read_RT (
            .data0_i (instruction[20:16]),
            .data1_i (5'b0),
            .select_i(RTsource),
            .data_o  (RTaddress)
        );

Reg_File RF (
             .clk_i(clk_i),
             .rst_n(rst_n),
             .RSaddr_i(instruction[25:21]),
             .RTaddr_i(RTaddress),
             .RDaddr_i(WriteRegister3),
             .RDdata_i(WriteData2),
             .RegWrite_i(RegWrite),
             .RSdata_o(RSdata),
             .RTdata_o(RTdata)
         );

Mux2to1 #(
            .size(32)
        ) Mux_JALWriteData (
            .data0_i (writeData),
            .data1_i (pc_counter_o),
            .select_i(RestoreLink),
            .data_o  (WriteData2)
        );

Decoder Decoder (
            .instr_op_i(instruction[31:26]),
            .RegWrite_o(RegWrite),
            .ALUOp_o(ALUOp),
            .ALUSrc_o(ALUSrc),
            .RegDst_o(RegDst),
            .Jump_o(Jump),
            .Branch_o(Branch),
            .BranchType_o(BranchType),
            .MemRead_o(MemRead),
            .MemWrite_o(MemWrite),
            .MemtoReg_o(MemtoReg),
            .jal_o(jal),
            .rt_o(rt),
            .RestoreLink_o(RestoreLink),
            .RTsource_o(RTsource)
        );

ALU_Ctrl AC (
             .funct_i(instruction[5:0]),
             .ALUOp_i(ALUOp),
             .ALU_operation_o(ALU_Operation),
             .FURslt_o(FURslt),
             .leftRight_o(leftRight),
             .shifhterSource_o(shifhterSource),
             .PC_source_o(PC_source)
         );

Sign_Extend SE (
                .data_i(instruction[15:0]),
                .data_o(signAlreadyExtend)
            );

Zero_Filled ZF (
                .data_i(instruction[15:0]),
                .data_o(zeroFilled)
            );

ALU ALU (
        .aluSrc1(RSdata),
        .aluSrc2(readData2),
        .ALU_operation_i(ALU_Operation),
        .result(ALU_Result),
        .zero(zero),
        .overflow(overflow)
    );

Mux2to1 #(
            .size(1)
        ) branch (
            .data0_i(zero),
            .data1_i(~zero),
            .select_i(BranchType),
            .data_o(equalOrNotEqual)
        );

Mux2to1 #(
            .size(32)
        ) shifhterSource (
            .data0_i(alreadyShift),
            .data1_i(alreadyShift2),
            .select_i(shifhterSource),
            .data_o(finalShift)
        );
Shifter shifter (
            .result(alreadyShift),
            .leftRight(leftRight),
            .shamt(instruction[10:6]),
            .sftSrc(readData2)
        );

Shifter rdShift (
            .result(alreadyShift2),
            .leftRight(leftRight),
            .shamt(RSdata[4:0]),
            .sftSrc(readData2)
        );

Mux3to1 #(
            .size(32)
        ) RDdata_Source (
            .data0_i (ALU_Result),
            .data1_i (finalShift),
            .data2_i (signAlreadyExtend),
            .select_i(FURslt),
            .data_o  (Address)
        );
wire mem;
wire [31:0] mem2;
Data_Memory DM (
                .clk_i(clk_i),
                .addr_i(Address),
                .data_i(RTdata),
                .MemRead_i(MemRead),
                .MemWrite_i(MemWrite),
                .data_o(outputData)
            );

Mux2to1 #(
            .size(32)
        ) Mux_Write (
            .data0_i(Address),
            .data1_i(outputData),
            .select_i(MemtoReg),
            .data_o(writeData)
        );

endmodule



