module instruction_memory(
    input  [31:0] address,
    output [31:0] instruction
);

reg [31:0] memory [0:255];

initial begin
    // simple instructions (demo only)
    memory[0] = 32'b0000000_00001_00010_000_00011_0110011;
    memory[1] = 32'b0000000_00011_00010_000_00100_0110011;
end

assign instruction = memory[address[9:2]];

endmodule
