module mux_4_1 (
input logic [1:0] sel_i,
input logic [31:0] input_0,
input logic [31:0] input_1,
input logic [31:0] input_2,
input logic [31:0] input_3,
output logic [31:0] Y_o
);
always @(sel_i)
begin
if(sel_i == 00)
Y_o = input_0 ;
else if (sel_i == 01)
Y_o = input_1;
else if (sel_i == 10)
Y_o = input_2;
else if (sel_i == 11)
Y_o = input_3;
else 
Y_o = 4'b0000;

end
endmodule
