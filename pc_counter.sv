module pc_counter(input logic enbl_i,clk_i,output logic [31:0] pc_o);
always@(posedge clk_i)
begin
if(enbl_i == 0)
begin
pc_o <= pc_o + 4;
end
else begin
pc_o <= 0;
end
end
endmodule 