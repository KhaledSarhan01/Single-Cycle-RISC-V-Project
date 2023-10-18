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
/*Chat GPT:
module ProgramCounter (
  input wire clk,          // Clock signal
  input wire rst,          // Reset signal
  input wire inc,          // Increment signal
  input wire [31:0] extAddress,  // External address input
  output wire [31:0] pc    // Program counter output
);

  reg [31:0] counter;       // Program counter register

  always @(posedge clk or posedge rst) begin
    if (rst) begin
      counter <= 32'h00000000;  // Reset the counter to 0
    end else if (inc) begin
      counter <= counter + 1;  // Increment the counter by 1
    end else begin
      counter <= extAddress;   // Set the counter to the external address
    end
  end

  assign pc = counter;  // Output the program counter value

endmodule

*/
endmodule