`timescale 1ns/1ns
module pc(
	input logic clk_i,reset_i,
	output logic [31:0] pc_o);
always @ (posedge clk_i) begin
if (reset_i)
begin
pc_o<=pc_o;
end
else
pc_o<=pc_o+32'h4;
end
endmodule 