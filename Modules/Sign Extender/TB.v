module SignExtender_tb;

  // Define testbench inputs and outputs
  reg [15:0] inputData;
  wire [31:0] extendedData;

  // Instantiate the SignExtender module
  SignExtender uut (
    .inputData(inputData),
    .extendedData(extendedData)
  );

  // Test sequence
  initial begin
    // Test with positive number (no sign bit change)
    inputData = 16'h1234;
    #10;
    
    // Test with negative number (sign bit extension)
    inputData = 16'hFEDC;
    #10;
    
    // End simulation
    $finish;
  end

  // Display input and output data
  always begin
    $display("Input: %h, Extended: %h", inputData, extendedData);
  end

endmodule
