module alu( A_i,B_i ,aluc_i ,C_o,branch_o);
input logic[31:0] A_i;
input logic[31:0] B_i;
input logic [4:0] aluc_i;
output logic[31:0] C_o;
output logic branch_o;


always @(A_i , B_i)
begin
if(aluc_i == 5'b0)              //Add ADDI
begin               

	C_o=A_i + B_i;
end
else if(aluc_i == 5'b00001)     //SLL SLLI
begin
	C_o=B_i << A_i;
end

else if(aluc_i == 5'b00010)     //SLT SLTI
begin

	if(A_i < B_i) begin
	C_o=1;
	end
	else begin
	C_o=0;
	end 
end
else if(aluc_i == 5'b00010 | aluc_i == 5'b10110 )      //SLTU,SLTUI,LTU
begin
	if(A_i > B_i) begin
	C_o=1;
	end
	else begin
	C_o=0;
	end
end
else if(aluc_i == 5'b00100)                        //XOR XORI
begin
	C_o=A_i ^ B_i;
end
else if(aluc_i == 5'b00101)	//SRL SRLI
begin
	C_o=A_i >> B_i;
end
		
else if(aluc_i == 5'b00110)	//OR ORI
begin
	
	C_o= A_i | B_i;
end

else if(aluc_i == 5'b00111)	//AND ANDI
begin
	C_o= A_i & B_i;
end
else if(aluc_i == 5'b01000)     //SUB 
begin
	C_o=B_i - A_i;
end
else if(aluc_i == 5'b01101)     //SRA SRAI
begin
	C_o=A_i >>> B_i;
end
else if(aluc_i == 5'b01110)	//BEQ
begin
	if(A_i == B_i) begin
	C_o=1;
	end
	else begin 
	C_o=0;
	end
end
else if(aluc_i == 5'b01111)	//BNE
begin
	if (A_i == B_i) begin 
	C_o=0;
	end
	else begin	
	C_o=1;
	end
end
else if(aluc_i == 5'b10100)	//BLT	
begin	
	if (A_i < B_i) begin
	C_o=1;
	end
	else begin
	C_o=0;
	end
end
else if(aluc_i == 5'b10001)	//BGE
begin	
	if ((A_i > B_i) | (A_i > B_i)) begin
	C_o=1;
	end
	else begin 
	C_o=0;
	end
end
else if(aluc_i == 5'b10011)	//BGEU
begin	
	if ((A_i > B_i) | (A_i == B_i)) begin
	C_o=1;	
	end
	else begin
	C_o=0;
	end
end
else if(aluc_i == 11111)	//JAL,JALR
begin	
	C_o = A_i;
end
else if (aluc_i == 5'b10xxx && C_o==1)
begin	
	branch_o=1; end
else 
 begin
	branch_o=0;
end
//else 
//begin
	//C_o={Width{32'bxxxxx}};
//end
end	
endmodule: alu
	
	
	


