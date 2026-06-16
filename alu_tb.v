`timescale 1ns/1ps

module alu_tb;

reg [7:0] A;
reg [7:0] B;
reg [2:0] SEL;

wire [7:0] RESULT;
wire ZERO;
wire CARRY;

alu uut (
    .A(A),
    .B(B),
    .SEL(SEL),
    .RESULT(RESULT),
    .ZERO(ZERO),
    .CARRY(CARRY)
);

initial begin

    $dumpfile("wave.vcd");
    $dumpvars(0, alu_tb);

    // Normal ADD
    A = 8'd10;
    B = 8'd5;
    SEL = 3'b000;
    #10;

    // SUB producing ZERO
    A = 8'd5;
    B = 8'd5;
    SEL = 3'b001;
    #10;

    // ADD producing CARRY
    A = 8'd255;
    B = 8'd1;
    SEL = 3'b000;
    #10;

    // AND
    A = 8'd10;
    B = 8'd5;
    SEL = 3'b010;
    #10;

    $finish;

end

endmodule
