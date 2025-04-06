/*
created by: Youssif Ekramy
date: 19/10/2023
*/
//module behaviour 
 /*
 my understanding:
    it's 32-bit word x 32 bit address memory which store program instructions 
 
 book Description:
    The instruction memory has a single read port.It takes a 32-bit 
    instruction address input, A, and reads the 32-bit data (i.e., instruction) 
    from that address onto the read data output, RD.

 */   

module instruction_memory(
    input clk,
    input  [31:0] PC_out_address,
    output [31:0] instruction
);
    reg [31:0] inst_reg;
    // Define the instruction memory as a memory array
    reg [31:0] mem [0:1023]; // 1024 words of 32 bits each

    // Initialize the memory with example instructions
    initial begin
        $readmemh("instructions.txt", mem); 
    end

    // Read operation
    always @(posedge clk) begin
        inst_reg <= mem[PC_out_address]; // Read the instruction from the specified address
    end
    assign instruction = inst_reg;

endmodule