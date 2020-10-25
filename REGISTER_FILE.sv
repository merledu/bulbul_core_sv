module RF(input logic regwrite_i,clk_i,
input logic [4:0]rs1,rs2,rd_i,
input logic[31:0]wd_i,
output logic[31:0]operandA_o,operandB_o,
reg [31:0] registers [0:31] );	
logic reset_i;
assign operandA_o = (rs1 != 5'd0 ) ? registers[rs1] : 32'd0;
assign operandB_o =(rs2 != 5'd0 ) ? registers[rs2] : 32'd0;
assign reset_i=1'b0;
always @(posedge clk_i)
if (reset_i == 1'b0)
	begin
	if( rd_i !== 1'b0)
	begin
		if (regwrite_i == 1'b1) 
		registers[rd_i] <= wd_i;
	end
	else
	registers[rd_i] <= 32'd0;
	end
else begin
for(int i=1; i<31 ; i++)
registers[i] <= 32'd0;
end
endmodule 