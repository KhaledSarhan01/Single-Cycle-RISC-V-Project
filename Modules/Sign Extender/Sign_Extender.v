/*
Implemented by : Youssif Ekramy 
edited by : khaled Sarhan
Date:19/10/2023
*/

//module behaviour
/*
book design:
Case(ImmSrc)
            00:out={{20{inst[31]}},inst[31:20]}
            01:out={{20{inst[31]}},inst[31:25],inst[11:7]}
            10:out={{20{inst[31]}},inst[7],inst[31:25],inst[11:8],1'b0}
*/  

module sign_extender(
    //control Signal
    input [1:0] ImmSrc,
    //data path signal
    input  [31:0] data_in,
    output reg [31:0] data_out
);

// Module behavior
    always @(*) begin
        case (ImmSrc)
            2'b00:data_out = {{20{data_in[31]}}, data_in[31:20]};
            2'b01:data_out = {{20{data_in[31]}}, data_in[31:25],data_in[11:7]};
            2'b10:data_out = {{20{data_in[31]}}, data_in[7] ,data_in[31:20],data_in[11:8],1'b0};
            2'b11:data_out = {{12{data_in[31]}}, data_in[19:12] ,data_in[20],data_in[30:21],1'b0};
            default: data_out= 32'b0;
        endcase 
    end  
endmodule