module RegisterFile_tb;

  // Define testbench inputs and outputs
  reg [4:0] readReg1, readReg2, writeReg;
  reg writeEnable;
  reg [31:0] writeData;
  wire [31:0] readData1, readData2;
  reg clk;
  reg rst;

  // Instantiate the RegisterFile module
  RegisterFile uut (
    .readReg1(readReg1),
    .readReg2(readReg2),
    .writeReg(writeReg),
    .writeEnable(writeEnable),
    .writeData(writeData),
    .readData1(readData1),
    .readData2(readData2)
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
    writeReg = 1; // Write to register 1
    writeData = 32'h12345678;
    #10;
    writeReg = 2; // Write to register 2
    writeData = 32'hABCDEF01;
    #10;

    // Perform read operations
    writeEnable = 0;
    readReg1 = 1; // Read from register 1
    readReg2 = 2; // Read from register 2
    #10;

    // End simulation
    $finish;
  end

  // Display register file operations
  always @(posedge clk) begin
    $display("Write Reg = %d, Write Data = %h, Write Enable = %b", writeReg, writeData, writeEnable);
    $display("Read Reg1 = %d, Read Data1 = %h", readReg1, readData1);
    $display("Read Reg2 = %d, Read Data2 = %h", readReg2, readData2);
  end

endmodule
