module type_decode(opcode_i,r_type_i,i_type_i,store_i,branch_i, load_i,jalr_i, jal_i, lui_i);
input logic [6:0] opcode_i;
output logic r_type_i;
output logic i_type_i;
output logic store_i;
output logic branch_i;
output logic load_i;
output logic jalr_i;
output logic jal_i;
output logic lui_i;

always @ (opcode_i)
begin 
if (opcode_i== 0110011)	begin		//R_TYPE
	r_type_o=1;
end
else if(opcode_i==0000011) begin	//LOAD	
	load_o=1;
end
else if(opcode_i==0100011) begin	//STORE
	store_o=1;
end
else if(opcode_i==1100011) begin	//BRANCH
	branch_o=1;
end
else if(opcode_i==0010011) begin	//I_TYPE
	i_type_o=1;
end
else if(opcode_i==1100111) begin	//JALR
	jalr_o=1;
end
else if(opcode_i==1101111) begin	//JAL
	jal_o=1;
end
else if(opcode_i==0110111) begin	//LUI
	lui_o=1;
end
else begin 
	r_type_o=0;
	load_o=0;
	store_o=0;
	branch_o=0;
	i_type_o=0;
	jalr_o=0;
	jal_o=0;
	lui_o=0;
end
end
endmodule: type_decode
