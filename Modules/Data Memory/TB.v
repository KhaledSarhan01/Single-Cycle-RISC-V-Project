module DataMemory_tb;

  // Define testbench inputs and outputs
  reg [31:0] address;
  reg [31:0] writeData;
  reg writeEnable;
  wire [31:0] readData;
  reg clk;
  reg rst;

  // Instantiate the DataMemory module
  DataMemory uut (
    .address(address),
    .writeData(writeData),
    .writeEnable(writeEnable),
    .readData(readData)
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
    // Perform write operations
    writeEnable = 1;
    address = 0;  // Write data to address 0
    writeData = 32'h12345678;
    #10;
    address = 4;  // Write data to address 4
    writeData = 32'hABCDEF01;
    #10;

    // Perform read operations
    writeEnable = 0;
    address = 0;  // Read data from address 0
    #10;
    address = 4;  // Read data from address 4
    #10;

    // End simulation
    $finish;
  end

  // Display data memory operations
  always @(posedge clk) begin
    $display("Address = %d, Write Data = %h, Write Enable = %b, Read Data = %h", address, writeData, writeEnable, readData);
  end

endmodule
