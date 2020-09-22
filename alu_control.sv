module alu_control(aluop_i,func3_i,func7_i, aluc_o)
input logic [2:0] aluop_i;
input logic [2:0] func3_i;
input logic func7_i;
output logic [4:0] aluc_o;

always_comb
begin 
case(aluop_i,func3_i,func7_i)
begin
if(aluop_i == 000 | aluop_i == 001 ) 
	begin 
	if(func3_i == 000 && func7_i==0)
	aluc_o = 5b'00000;
	elseif(func3_i == 000 && func7_i==1)
	aluc_o = 5b'01000;
	elseif(func3_i == 001 && func7_i==0)
	aluc_o = 5b'00001;
	elseif(func3_i == 010 && func7_i==0)
	aluc_o = 5b'00010;
	elseif(func3_i == 011 && func7_i==0)
	aluc_o = 5b'00011;
	elseif(func3_i == 100 && func7_i==0)
	aluc_o = 5b'00100;
	elseif(func3_i == 110 && func7_i==0)
	aluc_o = 5b'00110;	
	elseif(func3_i == 111 && func7_i==0)
	aluc_o = 5b'00111;
	elseif(func3_i == 101 && func7_i==0)
	aluc_o = 5b'00101;
	elseif(func3_i == 101 && func7_i==1)
	aluc_o = 5b'01101;
	else
	aluo_c = 5b'xxxxx;
	end
else if(aluop_i == 011)
	begin	
	if(func3_i = xxx && func7_i= x)
	aluc_o = 5b'11111;
	end
else if(aluop_i == 100 | aluop_i == 101 | aluop_i == 110)
	begin
	if(func3_i = xxx && func7_i= x)
	aluc_o=5b'00000'
	end
else if(aluop_i == 010)
	begin
	if(fucn3_i == 000 && func7_i=x)
	aluc_o=5b'10000;
	else if(fucn3_i == 001 && func7_i=x)
	aluc_o=5b'10001;
	else if(fucn3_i == 100 && func7_i=x)
	aluc_o=5b'10100;
	else if(fucn3_i == 101 && func7_i=x)
	aluc_o=5b'10101;
	else if(fucn3_i == 110 && func7_i=x)
	aluc_o=5b'10110;
	else if(fucn3_i == 111 && func7_i=x)
	aluc_o=5b'10111;
	else
	aluc_o=5b'xxxxx;
	end
else 
	aluc_o=5b'xxxxx;
end
endcase
end
endmodule: alu_control
		
	