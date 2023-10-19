module Control_unit(
   
    //instruction
    input [6:0] op_code,//inst[6:0]
    input [2:0] funct3, //inst[14:12]
    input funct7,       //inst[30]
   
    //Data memory 
    output reg WE,

    //ALU 
    input zero,
    output reg [2:0] ALU_Control,

    //PC
    output reg reset,
    output reg PC_Src,

    //Register file
    output reg WE3,

    //sign extender
    output reg [1:0] ImmSrc,

    //Different MUX in the processor
    output reg ALU_Src,
    output reg Result_Src

);
/*
  ALU operations:
    ALU_op[2:1]=01 ,then add/sub operations
        where , add: op[0]=0 
                sub: op[0]=1
     ALU_op[2:1]=10 ,then and/or operations 
        where , or: op[0]=0
                and: op[0]=1
     ALU_op[2:1]=11 ,then other operations 
        where , slt: op=110             

    PC operation:
      if(reset) then PC_next =0x 0000_1000
        else
            PC_Src=0 , inc by 4        : PC_next =PC_current +4
            PC_Src=1 , Goto PC_Target  : PC_next =PC_current +Sign_extended_out  
            
    Data memory operation:
        if(WE) then Mem[A]=WD;
        else  WR=Mem[A];

    Register file operaiton:
        if(WE3) then Mem[A3]=WD3
        else no action on Mem[A3]

    sign extender operation:
        Case(ImmSrc)
            00:out={{20{inst[31]}},inst[31:20]}
            01:out={{20{inst[31]}},inst[31:25],inst[11:7]}
            10:out={{20{inst[31]}},inst[7],inst[31:25],inst[11:8],1'b0}
    Different MUXs:
        case(ALU_src)
            0: SrcB = Register_file_Data2; 
            1: SrcB = sign_extend_out;

        case(Result_src)
            0: WD3 = Data_memory_out; 
            1: WD3 = ALU_Result;       
 */
endmodule