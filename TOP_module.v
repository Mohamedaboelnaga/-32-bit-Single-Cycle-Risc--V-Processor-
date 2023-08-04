module TOP_module(
input clk,rst_n
	);

// Register file and its in/out signals and instance
wire [31:0]Instr;
reg [31:0] Result; // will be used in always block to make a mux
wire [31:0] WriteData;
wire[31:0] ScrcA;
wire RegWrite; // from control unit
register_file my_regitser_file(.clk(clk),.rst_n(rst_n),
	.write_data_WD3(Result),.write_addr_A3(Instr[11:7]),
	.read_addr_A2(Instr[24:20]),.read_addr_A1(Instr[19:15]),
	.read_data_RD1(ScrcA),.read_data_RD2(WriteData),.write_enable_WE3(RegWrite));


// ALU and its in/out signals and instance
reg [31:0] ScrcB;
wire[31:0] ALU_Result;
wire [2:0] ALU_Control; // from control unit
wire zero_flag;
wire sign_flag;
alu mu_alu(.SRcA(ScrcA),.SRcB(ScrcB),.ALU_CONTROL(ALU_Control),
	.ALURESULT(ALU_Result),.sign_flag(sign_flag),.ZERO_flag(zero_flag));


// Data Memory and its in/out signals and instance
wire [31:0] Read_Data;
wire MemWrite;// from control unit
data_memory mydata_mem(.clk(clk),.write_enable_WE(MemWrite),.write_address_A(ALU_Result),
	.write_data_WD(WriteData),.read_data_RD(Read_Data));


// PC and its in/out signals and instance
wire PcSrc;
wire [31:0] PC;
wire load;
wire [31:0] ImmExt;
Program_counter my_PC(.clk(clk),.PC_Src(PcSrc),.load(load),.rst_n(rst_n),.PC(PC),.ImmExt(ImmExt));


//// Intsr. Memory and its in/out signals and instance
instruction_memory my_intsr_mem(.PC(PC),.INSTRUCTION(Instr));


// Sign Extend and its in/out signals and instance
wire [1:0] ImmSrc;// from control unit

sign_extend my_sign_extend(.Instr(Instr[31:7]),.Imm_Src(ImmSrc),.ImmExt(ImmExt));


// Control Unit and its in/out signals and instance
wire ResultSrc,ALUSrc;// rest of  control unit signals
control_unit my_cntrl_unit(.rst_n(rst_n),.Instr(Instr),.sign_flag(sign_flag),.ZERO_flag(zero_flag),
	.PC_Src(PcSrc),.Result_Src(ResultSrc),.Mem_Write(MemWrite),
	.ALU_Src(ALUSrc),.Reg_Write(RegWrite),.ALU_CONTROL(ALU_Control),.Imm_Src(ImmSrc),.load(load));

// for the 2 muxs of alu and data memory
always @(*)begin
	if(ResultSrc==1) Result=Read_Data;
	else             Result=ALU_Result;
	if(ALUSrc==1)    ScrcB=ImmExt;
	else             ScrcB=WriteData;
end

endmodule