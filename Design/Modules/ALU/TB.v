module ALU_testbench;
    reg [31:0] SrcA, SrcB;
    reg [2:0] funct3;
    reg [1:0] ALUOp;
    wire zero;
    wire [31:0] ALU_result;

    ALU myALU(
        .SrcA(SrcA),
        .SrcB(SrcB),
        .funct3(funct3),
        .ALUOp(ALUOp),
        .zero(zero),
        .ALU_result(ALU_result)
    );

    initial begin
        $display("Test Case: ADD operation");
        SrcA = 10;
        SrcB = 20;
        funct3 = 3'b000; // ADD
        ALUOp = 2'b00;  // ADD
        #10;
        $display("ALU_result = %d, zero = %d", ALU_result, zero);

        $display("Test Case: SUB operation");
        SrcA = 30;
        SrcB = 10;
        funct3 = 3'b001; // SUB
        ALUOp = 2'b01;  // SUB
        #10;
        $display("ALU_result = %d, zero = %d", ALU_result, zero);

        $display("Test Case: SLT operation");
        SrcA = 5;
        SrcB = 10;
        funct3 = 3'b010; // SLT
        ALUOp = 2'b10;  // ALUOp default
        #10;
        $display("ALU_result = %d, zero = %d", ALU_result, zero);

        $display("Test Case: OR operation");
        SrcA = 8'hFF;
        SrcB = 8'hAA;
        funct3 = 3'b110; // OR
        ALUOp = 2'b10;  // ALUOp default
        #10;
        $display("ALU_result = %h, zero = %d", ALU_result, zero);

        $display("Test Case: AND operation");
        SrcA = 8'hF0;
        SrcB = 8'h0F;
        funct3 = 3'b111; // AND
        ALUOp = 2'b10;  // ALUOp default
        #10;
        $display("ALU_result = %h, zero = %d", ALU_result, zero);

        $finish;
    end
endmodule