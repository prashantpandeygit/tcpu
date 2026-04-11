// testbench created using opus 4.6


`timescale 1ns / 1ps
`include "processor.v"

module tb_processor();
    reg clock;
    reg reset;
    wire zero;

    // Instantiate the processor
    PROCESSOR dut (
        .clock(clock),
        .reset(reset),
        .zero(zero)
    );

    // Clock generation
    initial begin
        clock = 0;
        forever #5 clock = ~clock;
    end

    // Test sequence
    initial begin
        $dumpfile("processor.vcd");
        $dumpvars(0, tb_processor);

        // Reset the system
        reset = 1;
        #10;
        reset = 0;

        // Run for a few cycles to see instructions execute
        #100;

        $finish;
    end

    // Monitor changes
    initial begin
        $monitor("Time=%0t | PC=%0d | Instr=%h | ALU_Out=%h | Zero=%b", 
                 $time, dut.IFU_module.PC, dut.instruction_code, dut.datapath_module.write_data, zero);
    end

endmodule
