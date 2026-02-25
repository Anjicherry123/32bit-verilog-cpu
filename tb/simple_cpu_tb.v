`timescale 1ns/1ps

module simple_cpu_tb;

reg clk;
reg reset;

simple_cpu uut (
    .clk(clk),
    .reset(reset)
);

// clock generation
always #5 clk = ~clk;

initial begin
    $dumpfile("cpu_wave.vcd");
    $dumpvars(0, simple_cpu_tb);

    clk = 0;
    reset = 1;

    #10;
    reset = 0;

    #200;

    $finish;
end

endmodule
