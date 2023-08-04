module alu(SRcA,SRcB,ALURESULT,ALU_CONTROL,sign_flag,ZERO_flag);
input [31:0]SRcA,SRcB;
input [2:0] ALU_CONTROL;
output reg[31:0]ALURESULT;
output  sign_flag;
output reg ZERO_flag;

parameter ADD=3'b000;
parameter SHL=3'b001;
parameter SUB=3'b010;
parameter XOR=3'b100;
parameter SHR=3'b101;
parameter OR=3'b110;
parameter AND=3'b111;

always @(*)begin
case(ALU_CONTROL)
 ADD:ALURESULT=SRcA+SRcB;
 SHL:ALURESULT=SRcA<<SRcB;
 SUB:ALURESULT=SRcA-SRcB;
 XOR:ALURESULT=SRcA^SRcB;
 SHL:ALURESULT=SRcA>>SRcB;
 OR:ALURESULT=SRcA|SRcB;
 AND:ALURESULT=SRcA&SRcB;
 default:ALURESULT=0;
endcase
if(ALURESULT==0) ZERO_flag=1'b1;
else             ZERO_flag=1'b0;

end

assign sign_flag=ALURESULT[31];
endmodule