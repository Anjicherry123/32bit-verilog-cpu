`timescale 1ns/1ps

module alu32_tb;

reg  [31:0] a;
reg  [31:0] b;
reg  [2:0]  alu_control;
wire [31:0] result;
wire zero;

alu32 uut (
    .a(a),
    .b(b),
    .alu_control(alu_control),
    .result(result),
    .zero(zero)
);

initial begin
    $dumpfile("wave.vcd");
$dumpvars(0);
    a = 32'd15; b = 32'd5;

    alu_control = 3'b000; #10; // ADD
    alu_control = 3'b001; #10; // SUB
    alu_control = 3'b010; #10; // AND
    alu_control = 3'b011; #10; // OR
    alu_control = 3'b100; #10; // SLT

    $finish;
end

endmodule
