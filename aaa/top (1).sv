timeunit 1ns;
timeprecision 1ns;
module top(); 
	logic clk_o;
	logic [6:0] opcode_tb;
	logic [31:0]instruction_tb;
	logic [4:0] rs1_tb;
	logic [4:0] rs2_tb;
	// logic [5:0] rd_tb;
	logic rgw_tb;
	logic sel_tb;
	logic [31:0] opA_tb;
	logic [31:0] opB_tb;
	logic [2:0] func3i_tb;
	logic func7i_tb;
	logic [2:0] aluop_tb;
	logic [31:0] itype_tb;
	logic [31:0] stype_tb;
	logic [31:0] sbtype_tb;
	logic [31:0] utype_tb;
	logic [31:0] ujtype_tb;
	logic [31:0] mux211_tb;
	logic [1:0] extendselo_tb;
	logic memread_tb;
	logic memwrite_tb;
	// logic memtorego_tb;
	logic [31:0] datao_tb;
	logic [4:0] rd_tb;
	logic [31:0] wdi_tb;
	logic [31:0] mux212o_tb;
	logic [31:0] pco_tb;
	logic [7:0] aluo_tb;
	logic alubranch_tb;
	logic brancho_tb;
	logic branch_tb;
	logic [19:0] instr_tb;
	logic [1:0] sel2_tb;
    logic [1:0] nextpcselo_tb;
	// logic [7:0] aldatao_tb;
	logic [31:0] bi_tb;
	logic [31:0] mux412o_tb;
	logic [4:0] aluco_tb;
	logic [31:0] aldatao_tb;
	logic[31:0] ai_tb;
	logic memtorego_tb;
	






	control_unit ctrl(.opcodes(opcode_tb),.regwrite_o(rgw_tb),.opBsel_o(sel_tb),.opAsel_o(sel2_tb),.aluop_o(aluop_tb),.extendsel_o(extendselo_tb),.nextPCsel_o(nextpcselo_tb),.memrd_o(memread_tb),.memw_o(memwrite_tb),.memtoreg_o(memtorego_tb),.branch_o(brancho_tb));
	
	decoder dec(.addr(aldatao_tb),.alu_o(aluo_tb),.instruction(instruction_tb),.opcode(opcode_tb),.rs1(rs1_tb),.rs2(rs2_tb),.rd(rd_tb),.f3(func3i_tb),.f7(func7i_tb),.pc(mux412o_tb),.address(instr_tb));
	
	intr_mem intr(.data_o(instruction_tb),.addr(instr_tb));
	
	RF rftb(.clk_i(clk_o),.rs1_i(rs1_tb),.rs2_i(rs2_tb),.rd_i(rd_tb),.regwrite_i(rgw_tb),.operandB_o(opB_tb),.operandA_o(opA_tb),.wd_i(wdi_tb));
	
	MUX1 mux21(.sel_i(sel_tb),.in1_i(opB_tb),.in2_i(mux211_tb),.out_o(bi_tb));

	MUX1 mux21_1(.in2_i(sbtype_tb),.in1_i(pco_tb),.out_o(mux212o_tb),.sel_i(branch_tb));

	MUX1 mux21_2(.sel_i(memtorego_tb),.in2_i(datao_tb),.in1_i(aldatao_tb),.out_o(wdi_tb));

	mux_4_1 mux41(.sel_i(sel2_tb),.in1_i(opA_tb),.in2_i(pco_tb),.in3_i(pco_tb),.in4_i(opA_tb),.out_o(ai_tb));

	mux_4_1 mux41_1(.in1_i(itype_tb),.in2_i(utype_tb),.in3_i(stype_tb),.out_o(mux211_tb),.sel_i(extendselo_tb));

	mux_4_1 mux41_2(.in3_i(ujtype_tb),.in2_i(mux212o_tb),.in1_i(pco_tb),.in4_i(jalrto_tb),.sel_i(nextpcselo_tb),.out_o(mux412o_tb));

	alu alus(.A_i(ai_tb),.B_i(bi_tb),.aluc_i(aluco_tb),.C_o(aldatao_tb),.branch_o(alubranch_tb));

	alu_control aluc(.aluc_o(aluco_tb),.func3_i(func3i_tb),.func7_i(func7i_tb),.aluop_i(aluop_tb));

	imm_gen immgen(.instruction(instruction_tb),.i_imm(itype_tb),.s_imm(stype_tb),.u_imm(utype_tb),.uj_imm(ujtype_tb),.sb_imm(sbtype_tb),.pc(mux412o_tb));

	data_mem datamem(.clk(clk_o),.addr(aluo_tb),.data_i(bi_tb),.data_o(datao_tb),.ren(memread_tb),.wen(memwrite_tb));

	jalr jalrtarget(.a_i(opA_tb),.b_i(mux211_tb),.jalrt_o(jalrto_tb));

	andgate andgatetb(.alubranch(alubranch_tb),.cubranch(brancho_tb),.outbranch(branch_tb));

	pc pctb(.clk_i(clk_o),.pc_o(pco_tb));

	initial begin

     clk_o <= 0;
     forever #10 clk_o = ~clk_o;

    end
endmodule