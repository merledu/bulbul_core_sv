module jalr(a_i,b_i,jalr_o);
input logic [31:0] a_i,
input logic [31:0] b_i,
output logic [31:0] jalr_o
always @(a_i,b_i)
begin 
jal_o=(a_i+b_i) & 32'hfffffffe
end 
endmodule: jalr