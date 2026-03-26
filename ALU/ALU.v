module ALU (input [31:0] in1, in2,
            input [3:0] alu_control,
            output reg [31:0] alu_result.
            output reg zero_flag);

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
