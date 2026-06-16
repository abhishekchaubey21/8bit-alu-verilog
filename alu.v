module alu (
    input [7:0] A,
    input [7:0] B,
    input [2:0] SEL,

    output reg [7:0] RESULT,
    output reg ZERO,
    output reg CARRY
);

always @(*) begin

    CARRY = 0;

    case (SEL)

        // ADD
        3'b000: begin
            {CARRY, RESULT} = A + B;
        end

        // SUB
        3'b001: begin
            RESULT = A - B;
        end

        // AND
        3'b010: begin
            RESULT = A & B;
        end

        // OR
        3'b011: begin
            RESULT = A | B;
        end

        // XOR
        3'b100: begin
            RESULT = A ^ B;
        end

        // NOT
        3'b101: begin
            RESULT = ~A;
        end

        // SHIFT LEFT
        3'b110: begin
            RESULT = A << 1;
        end

        // SHIFT RIGHT
        3'b111: begin
            RESULT = A >> 1;
        end

        default: begin
            RESULT = 8'b00000000;
        end

    endcase

    // ZERO FLAG
    if (RESULT == 8'b00000000)
        ZERO = 1'b1;
    else
        ZERO = 1'b0;

end

endmodule
