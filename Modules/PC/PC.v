module Program_Counter(
    input clk,
    input reset,
    input inc,
    
    input [31:0] PC_in,
    input in_enable,
    
    output [31:0] PC_out 
);
//module behaviour
/*
book description:
    The program counter (PC) points to the current instruction. Its 
    input, PCNext, indicates the address of the next instruction.

my design:
"NOTE: I redesign it to include some elements outside the book idea"
    if(reset) output address= x0100;
    else {
        if(in_enble) pc=pc_in;
        else{
            if(inc) pc_out=pc_out+4;
            else pc_out=pc_out;
            }
        }
*/

endmodule