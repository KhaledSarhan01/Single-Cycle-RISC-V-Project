/*
Implemented by : Youssif Ekramy 
Date:19/10/2023
*/

//module behaviour
/*
book design:
When ImmSrc = 0 (for lw), the Extend unit chooses Instr31:20 as the 12-bit signed immediate; when ImmSrc = 1 (for sw), it chooses Instr31:25,11:7.
*/  

module sign_extender(
    //control Signal
    input ImmSrc,
    //data path signal
    input  [11:0] data_in,
    output [31:0] data_out
);

// Module behavior
    always @(*) begin
        if (ImmSrc == 0) begin
            // Sign-extend Instr[31:20] for lw
            data_out = {{20{data_in[11]}}, data_in};
        end else begin
            // Sign-extend Instr[31:25], Instr[11:7] for sw
            data_out = {{7{data_in[11]}}, data_in[11:0], {19{data_in[11]}}, data_in[5:0]};
        end
    end  
endmodule