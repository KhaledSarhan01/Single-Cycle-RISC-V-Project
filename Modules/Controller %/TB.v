`include "Control_unit.v"
`default_nettype none

module tb_Control_unit;

//signals
    //inputs
    reg [6:0] op_code;//inst[6:0]
    reg [1:0] funct3; //inst[14:12]
    reg funct7;       //inst[30]
    reg zero;
    reg rst;
    //Data memory 
    wire Mem_wirte;//connected to WE

    //ALU 
    wire [2:0] ALU_Control;

    //PC
    wire reset;
    wire PC_Src;

    //Register file
    wire Reg_write;//connected to WE3 

    //sign extender
    wire [1:0] ImmSrc;

    //Different MUX in the processor
    wire ALU_Src;
    wire Result_Src;

//Instantiation
Control_unit UUT 
(   rst,
    //instruction
    op_code,
    funct3, 
    funct7, 
    //Data memory 
    Mem_wirte,
    //ALU 
    zero,
    ALU_Control,
    //PC
    reset,
    PC_Src,
    //Register file
    Reg_write, 
    //sign extender
    ImmSrc,
    //Different MUX in the processor
    ALU_Src,
    Result_Src
);

initial begin
    #1 //initial
    op_code =7'bx;
    funct3  =2'bx; 
    funct7  =1'bx; 
    zero =1'b0;

    #10 //testing the lw
    op_code =7'bx;
    funct3  =2'bx; 
    funct7  =1'bx; 
    zero =1'b0;
    $display("OPCode= %d, Write Data = %h, Write Enable = %b, Read Data = %h", , writeData, writeEnable, readData);



end

endmodule
`default_nettype wire