module MUX1(
output [31:0] out_o ,
input [31:0] a_i, b_i,
input [1:0] sel_i,
logic [31:0] c, d
);

assign c = a_i & (~sel_i);
assign d = b_i & sel_i;
assign out_o = c | d;
endmodule