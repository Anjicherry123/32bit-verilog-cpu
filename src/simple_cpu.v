module simple_cpu(
    input clk,
    input reset
);

wire [31:0] pc_current;
wire [31:0] pc_next;
wire [31:0] alu_result;
wire zero;

// PC instance
pc pc_inst (
    .clk(clk),
    .reset(reset),
    .next_pc(pc_next),
    .current_pc(pc_current)
);

// ALU used as PC + 4 adder
alu32 alu_inst (
    .a(pc_current),
    .b(32'd4),
    .alu_control(3'b000), // ADD
    .result(alu_result),
    .zero(zero)
);

assign pc_next = alu_result;

endmodule
