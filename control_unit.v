module control_unit(
input [31:0] Instr,
input  sign_flag,ZERO_flag,rst_n,
output reg PC_Src,Result_Src,Mem_Write,ALU_Src,Reg_Write,
output reg [2:0] ALU_CONTROL,
output reg [1:0] Imm_Src,
output load
	);
reg [1:0]ALUoP;
reg Branch;


always @(*)begin
	case(Instr[6:0])
	7'b000_0011:begin
	Reg_Write=1'b1;
	Imm_Src=2'b00;
	ALU_Src=1'b1;
	Mem_Write=1'b0;
	Result_Src=1'b1;
	ALUoP=2'b00;
	Branch=1'b0;
	end

	7'b010_0011:begin
	Reg_Write=1'b0;
	Imm_Src=2'b01;
	ALU_Src=1'b1;
	Mem_Write=1'b1;
	ALUoP=2'b00;
	Branch=1'b0;
	end

	7'b011_0011:begin
	Reg_Write=1'b1;
	ALU_Src=1'b0;
	Mem_Write=1'b0;
	Result_Src=1'b0;
	ALUoP=2'b10;
	Branch=1'b0;
	end

	7'b001_0011:begin
	Reg_Write=1'b1;
	Imm_Src=2'b00;
	ALU_Src=1'b1;
	Mem_Write=1'b0;
	Result_Src=1'b0;
	ALUoP=2'b10;
	Branch=1'b0;
	end

	7'b110_0011:begin
	Reg_Write=1'b0;
	Imm_Src=2'b10;
	ALU_Src=1'b0;
	Mem_Write=1'b0;
	ALUoP=2'b01;
	Branch=1'b1;
	end

	default:begin
	Reg_Write=1'b0;
	Imm_Src=2'b00;
	ALU_Src=1'b0;
	Mem_Write=1'b0;
	Result_Src=1'b0;
	ALUoP=2'b00;
	Branch=1'b0;
	end
	endcase
end

always @(*)begin
if(ALUoP==2'b00)begin
	ALU_CONTROL=3'b000;
end

else if(ALUoP==2'b01)begin
	ALU_CONTROL=3'b010;
end

else if(ALUoP==2'b10)begin
	if(Instr[14:12]==3'b000 && ( {Instr[5],Instr[30]}==2'b00 || {Instr[5],Instr[30]}==2'b01 || {Instr[5],Instr[30]}==2'b10 ) ) begin
	  ALU_CONTROL=3'b000;	
	end
	else if(Instr[14:12]==3'b000 && {Instr[5],Instr[30]}==2'b11)begin
	  ALU_CONTROL=3'b010;
	end
	else if(Instr[14:12]==3'b001)begin
      ALU_CONTROL=3'b001;
    end
    else if(Instr[14:12]==3'b100)begin
      ALU_CONTROL=3'b100;
    end
    else if(Instr[14:12]==3'b101)begin
      ALU_CONTROL=3'b101;
    end
    else if(Instr[14:12]==3'b110)begin
      ALU_CONTROL=3'b110;
    end 
    else if(Instr[14:12]==3'b111)begin
      ALU_CONTROL=3'b111;
    end

end

else begin
	  ALU_CONTROL=3'b000;
end
	
end

always @(*)begin
	if(Branch==1'b1)begin
		case(Instr[14:12])
		3'b000:PC_Src=ZERO_flag & Branch;
		3'b001:PC_Src=Branch & ~(ZERO_flag) ;
		3'b100:PC_Src= sign_flag & Branch;
		default:PC_Src=1'b0;
		endcase
	end
	else begin
		PC_Src=1'b0;
	end
end


assign load=1'b1;

endmodule