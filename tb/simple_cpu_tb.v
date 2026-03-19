`timescale 1ns/1ps

module simple_cpu_tb;

reg clk;
reg reset;

simple_cpu uut (
    .clk(clk),
    .reset(reset)
);

// clock
always #5 clk = ~clk;

initial begin
    clk = 0;
    reset = 1;

    #10;
    reset = 0;

    #200;

    $finish;
end

// debug output
initial begin
    $monitor("time=%0t pc=%d", $time, uut.pc_current);
end

endmodule
