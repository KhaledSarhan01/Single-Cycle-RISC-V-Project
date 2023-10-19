/*
created by : Khaled Sarhan 
Date : 19/10/2023
*/
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
/*
Instructions impelemented:
    lw instruction
    sw instruction
    R-Type ALU instructions "add ,sub,slt,or,and"
    I-type ALU instructions "add ,sub,slt,or,and"
    beq instruction

*/
module Control_unit(
    //reset the processor
    input rst,
    //instruction
    input [6:0] op_code,//inst[6:0]
    input [1:0] funct3, //inst[14:12]
    input funct7,       //inst[30]
   
    //Data memory 
    output reg Mem_wirte,//connected to WE

    //ALU 
    input zero,
    output reg [2:0] ALU_Control,

    //PC
    output reg reset,
    output PC_Src,

    //Register file
    output reg Reg_write,//connected to WE3 

    //sign extender
    output reg [1:0] ImmSrc,

    //Different MUX in the processor
    output reg ALU_Src,
    output reg Result_Src

);

    reg Branch;
    reg ALU_op;

 always @(*) begin
    if(rst) reset=1'b1;
    else begin
        //main Decoder 
            case (op_code)

                7'b0000011://lw instruction
                    begin
                        Reg_write <=1'b1  ;
                        ImmSrc    <=2'b00 ;
                        ALU_Src   <=1'b1  ;
                        Mem_wirte <=1'b0  ;
                        Result_Src<=1'b0  ;
                        Branch    <=1'b0  ;
                        ALU_op    <=2'b00 ;
                    end

                7'b0100011://sw instruction
                    begin
                        Reg_write <=1'b0  ;
                        ImmSrc    <=2'b01 ;
                        ALU_Src   <=1'b1  ;
                        Mem_wirte <=1'b1  ;
                        Result_Src<=1'b0  ;//don't care
                        Branch    <=1'b0  ;
                        ALU_op    <=2'b00 ;
                    end

                7'b0110011://R-Type instruction
                    begin
                        Reg_write <=1'b1  ;
                        ImmSrc    <=2'b00 ;//don't care
                        ALU_Src   <=1'b0  ;
                        Mem_wirte <=1'b0  ;
                        Result_Src<=1'b0  ;
                        Branch    <=1'b0  ;
                        ALU_op    <=2'b10 ;
                    end

                7'b1100011://beq instruction
                    begin
                        Reg_write <=1'b0  ;
                        ImmSrc    <=2'b10 ;
                        ALU_Src   <=1'b0  ;
                        Mem_wirte <=1'b0  ;
                        Result_Src<=1'b0  ;//don't care
                        Branch    <=1'b1  ;
                        ALU_op    <=2'b01 ;
                    end 

                7'b0010011://I-type ALU instruction
                    begin
                        Reg_write <=1'b1  ;
                        ImmSrc    <=2'b00 ;
                        ALU_Src   <=1'b1  ;
                        Mem_wirte <=1'b0  ;
                        Result_Src<=1'b0  ;
                        Branch    <=1'b0  ;
                        ALU_op    <=2'b10 ;
                    end 

                default://not the ideal way to design the default 
                reset = 1'b1;

            endcase  

        //ALU Decoder
            case (ALU_op)
                2'b00: //lw,sw -> add
                    ALU_Control=3'b010;
                2'b01: //beq -> sub
                    ALU_Control=3'b011;
                2'b10://depends on the funct3
                    begin
                        case (funct3)
                            2'b00://dependes on{op[5],funct7}
                                ALU_Control= /*if code==11*/( op_code[5] && funct7 )? /*add*/ 3'b010 :/*sub*/ 3'b011;
                            2'b010://slt
                                ALU_Control=3'b110;
                            2'b110://or
                                ALU_Control=3'b100;
                            2'b111://and
                                ALU_Control=3'b101;
                            default: ALU_Control=3'b000;    
                        endcase
                    end        
                default: ALU_Control=3'b000;
            endcase 
    end     
 end

//for PC source control
assign PC_Src= Branch & zero;

endmodule