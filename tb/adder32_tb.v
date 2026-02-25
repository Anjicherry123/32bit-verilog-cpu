`timescale 1ns/1ps

module adder32_tb;

reg  [31:0] a;
reg  [31:0] b;
wire [31:0] sum;
wire        carry;

adder32 uut (
    .a(a),
    .b(b),
    .sum(sum),
    .carry(carry)
);

initial begin
    a = 32'd10; b = 32'd20;
    #10;

    a = 32'd100; b = 32'd50;
    #10;

    a = 32'hFFFFFFFF; b = 1;
    #10;

    $finish;
end

endmodule
