module testbench();
 //signals
    reg clk;
    reg reset;
    wire [31:0] WriteData, DataAdr;
    wire MemWrite;
 // instantiate device to be tested
 RISC_V_Processor dut(clk, reset, WriteData, DataAdr, MemWrite);
 // initialize test
 initial
 begin
 reset <= 1; # 22; reset <= 0;
 end
 // generate clock to sequence tests
 always
 begin
 clk <= 1; # 5; clk <= 0; # 5;
 end

 // check results
 initial begin
    $monitor("time=%0t reset=%b, WriteData=%h, DataAdr=%h, MemWrite=%h",
        $time,reset, WriteData, DataAdr, MemWrite);
end

endmodule