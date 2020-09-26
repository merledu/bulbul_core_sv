`timescale 1ns/1ns
module pc_counter_tb;
	logic enbl_i;
	logic clk_i;
	logic out;
	
	pc_counter dut(
	.enbl_i(enbl_i),
	.clk_i(clk_i),
	.pc_o(out)
	);

	initial begin
	enbl_i <= 0; #10;

	enbl_i <= 0; #10;

	enbl_i <= 1; #10;

	enbl_i <= 0; #10;
	end

	always begin
	clk_i <= 1;	#5;
	clk_i <= 0;	#5;
	end 
endmodule 
