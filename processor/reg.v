// reg files reads two registers and write into one register, we have 32 bit ref each 32 bit
// 5 bits to assign register numbers
// read: outputs content of the register corresponding to the read register
// write: controlled by signal(RegWrite) and clock signal, done when signal is 1 or positive edge on the clock.

module REG_FILE(
    input [4:0] read_reg_num1,
    input [4:0] read_reg_num2,
    input [4:0] write_reg,
    input [31:0] write_data,
    output [31:0] read_data1,
    output [31:0] read_data2,
    input regwrite,
    input clock,
    input reset
);

    reg [31:0] reg_memory [31:0]; // 32 mem locations, 32 bit wide
    integer i=0;

    //  when reset, registers get some value
    always @(posedge reset)
    begin
        for (i = 0; i < 32; i = i + 1) begin
            reg_memory[i] = i; 
        end
    end

    // The register file will always output the values corresponding to read register numbers 
    // It is independent of any other signal
    assign read_data1 = reg_memory[read_reg_num1];
    assign read_data2 = reg_memory[read_reg_num2];
    
    // if clock edge is positive and regwrite is 1, data is written to the register
    always @(posedge clock)
    begin
        if (regwrite && write_reg != 5'b0) begin // x0 is hardwired to 0
            reg_memory[write_reg] <= write_data;
        end     
    end

endmodule
