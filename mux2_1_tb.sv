`timescale 1ns/1ns
module MUX1_tb;
logic [31:0] out_o ;
logic [31:0] a_i, b_i;
logic [1:0] sel_i;
logic [31:0] c, d;
	MUX1 dut(
		.out_o(out_o),
		.a_i(a_i),
		.b_i(b_i),
		.sel_i(sel_i),
		.c(c),
		.d(d));

	initial begin
		#5;
		sel_i <= 2'b00;
		a_i <= 5;
		b_i <= 3;
		#5;
		sel_i <= 2'b01;
		a_i <= 2;
		b_i <= 9;
		#5;
		sel_i <= 2'b00;
		a_i <= 7;
		b_i <= 6;
		#5;
		sel_i <= 2'b01;
		a_i <= 8;
		b_i <= 4;
end
endmodule