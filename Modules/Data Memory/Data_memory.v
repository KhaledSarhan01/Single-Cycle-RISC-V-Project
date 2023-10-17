module Data_memory(
    input clk,
    input [31:0] A,
    input [31:0] WD,
    output [31:0] RD
);
//module behaviour
/*
Book Description:
    The data memory has a single read/write port. If its write enable, 
    WE, is asserted, then it writes data WD into address A on the rising 
    edge of the clock. If its write enable is 0, then it reads from address A
    onto the read data bus, RD.
*/
    
endmodule