module operand_A(lui_i,jalr_i,jal_i,opasel_o);
input logic lui_i;
input logic jalr_i;
input logic jal_i;
output logic [1:0] opasel_o;

always @(lui_i,jalr_i,jal_i)
begin
if(lui_i=1 && jalr=0 && jal=0) 	begin	//LUI
	opasel_o=11;
end
else if(lui_i=0 && jalr=0 && jal=1) begin	//JAL
	opasel_o=10;
end
else if(lui_i=0 && jalr=1 && jal=0) begin	//JALR
	opasel_o=10;
end
else begin
	opasel_o=00;
end
end 
endmodule: operand_A