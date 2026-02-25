`timescale 1ns/1ps

module register32_tb;

reg clk;
reg reset;
reg [31:0] d;
wire [31:0] q;

register32 uut (
    .clk(clk),
    .reset(reset),
    .d(d),
    .q(q)
);

// Clock generation
always #5 clk = ~clk;

initial begin
    $dumpfile("wave.vcd");
$dumpvars(0);
    clk = 0;
    reset = 1;
    d = 32'd0;

    #10;
    reset = 0;

    d = 32'd10;
    #10;

    d = 32'd25;
    #10;

    d = 32'd100;
    #10;

    $finish;
end

endmodule
