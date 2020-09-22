module ALU_op(r_type_i,i_type_i,store_i,branch_i, load_i,jalr_i, jal_i, lui_i,aluop_o);
input logic r_type_i;
input logic i_type_i;
input logic store_i;
input logic branch_i;
input logic load_i;
input logic jalr_i,
input logic jal_i;
input logic lui_i;
output logic [2:0] aluop_o;

always @ (r_type_i,i_type_i,store_i,branch_i, load_i,jalr_i, jal_i, lui_i)
begin
if (r_type_i==1) 
	aluop_o=000;
else if (load_i==1) 
	aluop_o=100;
else if (store_i==1) 
	aluop_o=101;
else if (branch_i==1) 
	aluop_o=010;
else if (i_type_i==1) 
	aluop_o=001;
else if (jalr_i==1) 
	aluop_o=011;
else if (jal_i==1) 
	aluop_o=011;
else if (lui_i==1) 
	aluop_o=110;
else begin 
	aluop_o=111;
end
end

endmodule: ALU_op