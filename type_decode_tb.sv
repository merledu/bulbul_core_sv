`timescale 1ns/1ns
module type_decode_tb;
logic [6:0] opcode_i;
logic r_type_o;
logic i_type_o;
logic store_o;
logic branch_o;
logic load_o;
logic jalr_o;
logic jal_o;
logic lui_o;

	type_decode dut (
		.opcode_i(opcode_i),
		.r_type_o(r_type_o),
		.i_type_o(i_type_o),
		.store_o(store_o),
		.branch_o(branch_o),
		.load_o(load_o),
		.jalr_o(jalr_o),
		.jal_o(jal_o),
		.lui_o(lui_o));
	initial begin
		#5;
		opcode_i <= 0110011;

		#5;
		opcode_i <= 0000011;
		
		#5;
		opcode_i <= 0100011;

		#5;
		opcode_i <= 1100011;

		#5;
		opcode_i <= 0010011;

		#5;
		opcode_i <= 1100111;

		#5;
		opcode_i <= 1101111;

		#5;
		opcode_i <= 0110111;

	end
endmodule