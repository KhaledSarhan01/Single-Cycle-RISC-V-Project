module instruction_memory(
    input clk,
    input  [31:0] PC_out_address,
    output [31:0] instruction,
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

endmodule