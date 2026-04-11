// IFU has clock and reset pins as input and 32 bit instruction code as output
// the internal block has inst. memory, program counter and adder to increment counter by 4 on positive clock edge.

`include "INST_MEM.v"

module IFU(
    input clock,reset,
    output [31:0] Instruction_Code
);
reg [31:0] PC = 32'b0;  // 32-bit program counter set to zero

   // instruction memory block
    INST_MEM instr_mem(PC,reset,Instruction_Code);

    always @(posedge clock, posedge reset)
    begin
        if(reset == 1)  // If reset is one, clear the program counter
        PC <= 0;
        else
        PC <= PC+4;   // increment program counter
    end

endmodule
