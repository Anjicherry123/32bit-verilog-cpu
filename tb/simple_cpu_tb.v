module simple_cpu(
    input clk,
    input reset
);

// ===== wires =====
wire [31:0] pc_current;
wire [31:0] pc_next;
wire [31:0] instruction;
wire [31:0] rd1, rd2;
wire [31:0] alu_result;

// ===== PC =====
pc pc_inst (
    .clk(clk),
    .reset(reset),
    .next_pc(pc_next),
    .current_pc(pc_current)
);

// ===== Instruction Memory =====
instruction_memory imem (
    .address(pc_current),
    .instruction(instruction)
);

// ===== Register File =====
register_file rf (
    .clk(clk),
    .we(1'b1), // always write (simple design)
    .rs1(instruction[19:15]),
    .rs2(instruction[24:20]),
    .rd(instruction[11:7]),
    .wd(alu_result),
    .rd1(rd1),
    .rd2(rd2)
);

// ===== ALU =====
alu32 alu_inst (
    .a(rd1),
    .b(rd2),
    .alu_control(3'b000), // only ADD
    .result(alu_result),
    .zero()
);

// ===== PC increment =====
assign pc_next = pc_current + 4;

endmodule
