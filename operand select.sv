module operandsel 
(
	input logic [1:0] operand_ASel ,
	input logic [1:0] extend_Sel ,
	input logic [31:0] pc,
	input logic operand_BSel ,
	input logic [31:0] rs1,rs2,
	input logic [31:0] stype_imm ,
	input logic [31:0] sbtype_imm , 
	input logic [31:0] ujtype_imm, 
	input logic [31:0] utype_imm ,
	input logic [31:0] itype_imm,
	output logic [31:0] operand_A ,
	output logic [31:0] operand_B 
	);
//FOR OPERAND B SELECT
always_comb begin 
operand_B = (operand_BSel == 1'b1 && extend_Sel == 2'b0 )?itype_imm:
            (operand_BSel == 1'b1 && extend_Sel == 2'b1 )?utype_imm:
            (operand_BSel == 1'b1 && extend_Sel == 2'b10 )?stype_imm:rs2;
end 
//FOR OPERAND A SELECT
always_comb begin
operand_A = (operand_ASel == 2'b10)?(pc+32'h4):rs1;
end 
endmodule 