module instruction_memory(PC,INSTRUCTION);
input [31:0] PC;
output reg [31:0] INSTRUCTION;

reg [31:0] mem[0:63]; //depth is 64 entry each entry is 32 bit

always @ (*)begin
INSTRUCTION=mem[PC/4];
end

endmodule
