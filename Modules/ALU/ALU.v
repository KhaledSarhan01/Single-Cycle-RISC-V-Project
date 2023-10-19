/*
implemented by: Youssif Ekramy
edited by :Khaled Sarhan
Date: 18/10/2023
*/
//module Behaviour 
/*
    op[2:1]=01 ,then add/sub operations
        where , add: op[0]=0 
                sub: op[0]=1
     op[2:1]=10 ,then and/or operations 
        where , or: op[0]=0
                and: op[0]=1
     op[2:1]=11 ,then other operations 
        where , slt: op=110             
*/

module ALU(
    //data path signals
    input [31:0] SrcA,
    input [31:0] SrcB,
    output reg [31:0] ALU_result,

    //control signals
    output zero,
    input [2:0] ALU_Control
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
    case (ALU_Control)
        3'b010: ALU_result = add_result;
        3'b011: ALU_result = sub_result;
        3'b110: ALU_result = slt_result;
        3'b100: ALU_result = or_result;
        3'b101: ALU_result = and_result;
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