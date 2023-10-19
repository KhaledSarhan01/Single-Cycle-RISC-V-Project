module instruction_memory(
    input clk,
    input  [31:0] PC_out_address,
    output [31:0] instruction
);
 //module behaviour 
 /*
 my understanding:
    it's 32-bit word x 32 bit address memory which store program instructions 
 
 book Description:
    The instruction memory has a single read port.It takes a 32-bit 
    instruction address input, A, and reads the 32-bit data (i.e., instruction) 
    from that address onto the read data output, RD.

 */   

// Define the instruction memory as a memory array
reg [31:0] mem [0:1023]; // 1024 words of 32 bits each
 // Initialize the memory with example instructions
    initial begin
        // PUT YOUR INSTRUCTIONS HERE
        mem[0] <= 32'h01234567; // Example instruction 1
        mem[1] <= 32'h89ABCDEF; // Example instruction 2
        
    end

    // Read operation
    always @(posedge clk) begin
        instruction <= mem[PC_out_address]; // Read the instruction from the specified address
    end

endmodule
 /*Chat GPT
 module DataMemory (
  input wire [31:0] address,
  input wire [31:0] writeData,
  input wire writeEnable,
  output wire [31:0] readData
);

  reg [31:0] memory [0:1023]; // Assuming 1K words of data memory

  // Read operation
  assign readData = memory[address];

  // Write operation
  always @(posedge clk) begin
    if (writeEnable) begin
      memory[address] <= writeData;
    end
  end

endmodule

 */
