module sign_extender(
    input ImmSrc,
    input  [11:0] data_in,
    output [31:0] data_out
);
//module behaviour
/*
book design:
When ImmSrc = 
0 (for lw), the Extend unit chooses Instr31:20 as the 12-bit signed immediate; when ImmSrc = 1 (for sw), it chooses Instr31:25,11:7.
*/    
endmodule