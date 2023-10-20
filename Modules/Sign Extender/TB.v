module SignExtender_tb;

  // Define testbench inputs and outputs
  reg  [1:0] ImmSrc;
  reg  [31:0] data_in;
  wire [31:0] data_out;

  // Instantiate the SignExtender module
  sign_extender uut (
    .ImmSrc(ImmSrc),
    .data_in(data_in),
    .data_out(data_out)
  );

  // Test sequence
  initial begin
    // Test with positive number (no sign bit change)
    data_in = 32'b0110_1111_1110_1001_1010_0110_0101_1110;
    ImmSrc =2'b00;
    #100;
    ImmSrc =2'b01;
    #100;
    ImmSrc =2'b10;
    #100;
    ImmSrc =2'b11;
    #100;
    // Test with negative number (sign bit extension)
    data_in = 32'b1001_0101_1100_0110_1110_0110_0101_1110;
    ImmSrc =2'b00;
    #100;
    ImmSrc =2'b01;
    #100;
    ImmSrc =2'b10;
    #100;
    ImmSrc =2'b11;
    #100;
    
    // End simulation
    $finish;
  end

  // Display input and output data
  initial begin
    $monitor("Input: %b, Extended: %b", data_in, data_out);
  end

endmodule
