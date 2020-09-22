module next_pc(b_i,j_i,jr_i,npc_o);
input logic b_i;
input logic j_i;
input logic jr_i;
output logic [1:0] npc_o;
always @(b_i,j_i,jr_i)
begin
if(b=0 && j=0 && jr=1) begin		//JALR
	npc_o=11;
end
else if(b=0 && j=1 && jr=0) begin	//JAL
	npc_o=10;
end
else if(b=1 && j=0 && jr=0) begin	//BRANCH
	npc_o=01;
end
else begin
	npc_o=00;
end
end
endmodule: next_pc
	
			