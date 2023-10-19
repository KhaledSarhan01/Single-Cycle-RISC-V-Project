//module behaviour
/*
created by : Khaled Sarhan 
date:19/10/2023

book description:
    The program counter (PC) points to the current instruction. Its 
    input, PCNext, indicates the address of the next instruction.

my design:
"NOTE: I redesign it to include some elements outside the book idea"
    PC operation
      if(reset) then PC_next =0x 0000_1000
      else
      PC_Control=0 , inc by 4        : PC_next =PC_current +4
      PC_Control=1 , Goto PC_Target  : PC_next =PC_current +Sign_extended_out 
*/

module Program_Counter(
    input clk,
    //control signal
    input reset,
    input PC_Src,
    //Data Path signal
    input [31:0] PC_in,//it's the sign extended address to be added
    output [31:0] PC_out 
);

 reg [31:0] PC_reg;       // Program counter register

always @(posedge clk or posedge reset) begin
  if(reset) 
    PC_reg <= 32'h0000_1000;
  else begin
    if(PC_Src) 
      PC_reg <= PC_reg +PC_in; 
    else 
      PC_reg <= PC_reg + 4;
    end 
end

assign PC_out = PC_reg;

endmodule