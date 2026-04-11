`include "reg.v"
`include "ALU.v"

module DATAPATH(
    input [4:0]read_reg_num1,
    input [4:0]read_reg_num2,
    input [4:0]write_reg,
    input [3:0]alu_control,
    input regwrite,
    input clock,
    input reset,
    output zero_flag
);

    // internal wires for data carry
    wire [31:0]read_data1;
    wire [31:0]read_data2;
    wire [31:0]write_data;

    // start the register file
    REG_FILE reg_file_module(
        .read_reg_num1(read_reg_num1),
        .read_reg_num2(read_reg_num2),
        .write_reg(write_reg),
        .write_data(write_data),
        .read_data1(read_data1),
        .read_data2(read_data2),
        .regwrite(regwrite),
        .clock(clock),
        .reset(reset)
    );

    // start the ALU
    ALU alu_module(
        .in1(read_data1),
        .in2(read_data2),
        .alu_control(alu_control),
        .alu_result(write_data),
        .zero_flag(zero_flag)
    );
	 
endmodule