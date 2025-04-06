module ProgramCounter_tb;

  // Define testbench inputs and outputs
  reg clk;
  reg rst;
  reg inc;
  reg [31:0] extAddress;
  wire [31:0] pc;

  // Instantiate the ProgramCounter module
  ProgramCounter uut (
    .clk(clk),
    .rst(rst),
    .inc(inc),
    .extAddress(extAddress),
    .pc(pc)
  );

  // Clock generation
  always begin
    #5 clk = ~clk;
  end

  // Reset generation
  initial begin
    clk = 0;
    rst = 1;
    inc = 0;
    extAddress = 32'h00000000;
    #10 rst = 0;
  end

  // Test sequence
  initial begin
    // Test initial state (reset)
    #10;
    
    // Set the external address to 0x1000
    extAddress = 32'h00001000;
    #10;
    
    // Increment the PC
    inc = 1;
    #10;
    inc = 0;
    
    // Observe the PC value
    #10;
    
    // Set the external address to 0x2000
    extAddress = 32'h00002000;
    #10;
    
    // Reset the PC
    rst = 1;
    #10;
    rst = 0;
    
    // Observe the PC value after reset
    #10;
    
    // End simulation
    $finish;
  end

  // Display PC value
  always @(posedge clk) begin
    $display("PC = %h", pc);
  end

endmodule
