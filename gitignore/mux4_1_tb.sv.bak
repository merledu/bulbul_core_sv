`timescale 1ns/1ns
module mux_4_1_tb;
logic sel_i;
logic [31:0] input_0;
logic [31:0] input_1;
logic [31:0] input_2;
logic [31:0] input_3;
logic [31:0] Y_o;

	mux_4_1 dut (
		.sel_i(sel_i),
		.input_0(input_0),
		.input_1(input_1),
		.input_2(input_2),
		.input_3(input_3),
		.Y_o(Y_o) );
	initial begin 
		#5;
		sel_i <= 00;
		#5;
		sel_i <= 01;
		#5;
		sel_i <= 10;
		#5;
		sel_i <= 11;
		end
endmodule
