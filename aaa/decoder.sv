`timescale 1ns/1ps
module decoder(
	input logic [31:0] instruction, output logic [6:0] opcode,
	output logic [5:0] rd, output logic [2:0] f3, 
	output logic [4:0] rs1,output logic [4:0] rs2, output logic f7,
	input logic [31:0] pc,
	output logic [19:0] address,
	input logic [31:0] alu_o, 
	output logic [7:0] addr );
always_comb
begin
	opcode = {instruction [6:0]};
	rd = instruction[11:7];
	f3 = instruction[14:12];
	rs1 = instruction[19:15];
	rs2 = instruction[24:20];
	f7 = instruction [30];
	address = pc[21:2];
	addr = alu_o[9:2];
end
endmodule : decoder