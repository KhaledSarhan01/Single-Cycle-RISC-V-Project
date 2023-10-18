module ALU(
    input [31:0] SrcA,
    input [31:0] SrcB,
    input [2:0] funct3, // 3-bit ALU operation code
    input [1:0] ALUOp,
    output zero,
    output reg [31:0] ALU_result
);

// Declare internal wires for ALU operations
wire [31:0] add_result;
wire [31:0] sub_result;
wire [31:0] slt_result;
wire [31:0] or_result;
wire [31:0] and_result;

// ALU operation decoding logic
always @(*)
begin
    case (ALUOp)
        2'b00: ALU_result = add_result;
        2'b01: ALU_result = sub_result;
        2'b10:
        begin
            case (funct3)
                3'b000: ALU_result = add_result;
                3'b001: ALU_result = sub_result;
                3'b010: ALU_result = slt_result;
                3'b110: ALU_result = or_result;
                3'b111: ALU_result = and_result;
                default: ALU_result = 32'b0; // Default to zero
            endcase
        end
        default:ALU_result = 32'b0;
    endcase
end

// Zero detection
assign zero = (ALU_result == 32'b0);

// Adder and Subtractor
assign add_result = SrcA + SrcB;
assign sub_result = SrcA - SrcB;

// Set Less Than (SLT) operation
assign slt_result = (SrcA < SrcB) ? 32'b1 : 32'b0;

// Bitwise OR and AND operations
assign or_result = SrcA | SrcB;
assign and_result = SrcA & SrcB;

endmodule