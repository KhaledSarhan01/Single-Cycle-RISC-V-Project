module InstructionMemory_tb;

  // Define testbench inputs and outputs
  reg [31:0] pc;
  wire [31:0] instruction;
  reg clk;
  reg rst;

  // Instantiate the InstructionMemory module
  InstructionMemory uut (
    .pc(pc),
    .instruction(instruction)
  );

  // Clock generation
  always begin
    #5 clk = ~clk;
  end

  // Reset generation
  initial begin
    clk = 0;
    rst = 1;
    #10 rst = 0;
  end

  // Test sequence
  initial begin
    // Initialize PC to read instructions from specific addresses
    pc = 0; // Start at address 0
    #10;
    pc = 4; // Move to the next instruction address
    #10;
    pc = 8; // Move to the next instruction address
    #10;
    // Add more test cases as needed

    // End simulation
    $finish;
  end

  // Display instruction outputs
  always @(posedge clk) begin
    $display("PC = %d, Instruction = %h", pc, instruction);
  end

endmodule
