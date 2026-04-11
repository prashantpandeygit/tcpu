// takes 2 operands of size 32 bit each and 4 bit ALU control as input
// outputs 32 bit ALU result 
// if ALU result is zero then zero flag is set

/*
ALU Control lines | Function
-----------------------------
        0000    Bitwise AND
        0001    Bitwise OR
        0010	  Add
        0100	  Subtract
        1000	  less than
        0011    Shift left logical
        0101    Shift right logical
        0110    Multiply
        0111    Bitwise XOR
*/

module ALU (
    input [31:0] in1,in2, 
    input[3:0] alu_control,
    output reg [31:0] alu_result,
    output reg zero_flag
);
    always @(*)
    begin
        case(alu_control)

        4'b0000: alu_result = in1&in2;
        4'b0001: alu_result = in1|in2;
        4'b0010: alu_result = in1+in2;
        4'b0100: alu_result = in1-in2;
        4'b1000: begin 
            if(in1<in2)
            alu_result = 1;
            else
            alu_result = 0;
        end
        4'b0011: alu_result = in1<<in2;
        4'b0101: alu_result = in1>>in2;
        4'b0110: alu_result = in1*in2;
        4'b0111: alu_result = in1^in2;
        default: alu_result = 32'b0;
        endcase

        // zero flag if alu result is zero
        if (alu_result == 0)
            zero_flag = 1'b1;
        else
            zero_flag = 1'b0;
        
    end
endmodule