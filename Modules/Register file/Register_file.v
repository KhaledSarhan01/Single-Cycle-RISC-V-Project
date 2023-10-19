/*
created by: Youssif Ekramy
date: 19/10/2023
*/
//Module Behaviour
 /*
 Book Design: "and I will follow"
    The 32-element × 32-bit register file holds registers x0–x31. Recall 
    that x0 is hardwired to 0. The register file has two read ports and one 
    write port. The read ports take 5-bit address inputs, A1 and A2, each 
    specifying one of the 25
    = 32 registers as source operands. The register 
    file places the 32-bit register values onto read data outputs RD1 and 
    RD2. The write port, port 3, takes a 5-bit address input, A3; a 32-bit 
    write data input, WD3; a write enable input, WE3; and a clock. If its 
    write enable (WE3) is asserted, then the register file writes the data 
    (WD3) into the specified register (A3) on the rising edge of the clock.
 */   


module Register_file(
    input clk,input RegWrite,
    
    input [4:0] A1, output [31:0] RD1,
    input [4:0] A2, output [31:0] RD2,

    input [4:0] A3, input  [31:0] WD1,
    
);

/*Create 32 register, each one is 32-bit wide*/
    reg [31:0]RegFile[0:31];

    /*Counter used in for loop to reset all registers to zero*/
    integer i;

    /*Reset all registers to zero*/
	initial
	begin
	for(i=0;i<32;i=i+1)
		RegFile[i]=0;	
	end 	

    /*Read asynchronously and write synchronously*/
    always @(posedge clk or A1 or A2) begin

        /*Only write when RegWrite is high; it's controlled by the control unit*/
        if(RegWrite)
        RegFile[A3]<=WD3;
	
    /*Read data at addresses A1 and A2 to RD1 and RD2 ports respectively*/
	RD1<=RegFile[A1];
    RD2<=RegFile[A2];
    end


endmodule