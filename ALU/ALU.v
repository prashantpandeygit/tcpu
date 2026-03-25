module ALU (input [31:0] in1, in2,
            input [3:0] alu_control,
            output reg [31:0] alu_result.
            output reg zero_flag);

    always @(*)
    begin
      
