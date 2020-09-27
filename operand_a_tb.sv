`timescale 1ns/1ns
module operand_a_tb;
 logic lui_i;
 logic jalr_i;
 logic jal_i;
 logic [1:0] opasel_o;
	
	operand_A dut (
		.lui_i(lui_i),
		.jalr_i(jalr_i),
		.jal_i(jal_i),
		.opasel_o(opasel_o));
	initial begin
		#5;
		lui_i <= 1;
		jalr_i <= 0;
		jal_i <= 0;

		#5;
		lui_i <= 0;
		jalr_i <= 0;
		jal_i <= 1;

		#5;
		lui_i <= 0;
		jalr_i <= 1;
		jal_i <= 0;
	end

endmodule 