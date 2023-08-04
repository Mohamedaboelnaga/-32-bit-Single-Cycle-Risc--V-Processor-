module Program_counter(PC_Src,load,clk,rst_n,PC,ImmExt);
input clk,rst_n,load,PC_Src;
input[31:0] ImmExt;
output reg[31:0] PC;
//reg [31:0]ImmExt;
reg [31:0]PC_next;

always @(posedge clk or negedge rst_n)begin
	if(~rst_n) PC<='b0;
	else if(load) PC<=PC_next;
end

always @(*) begin
if(PC_Src==1) PC_next=PC+ImmExt;
else       PC_next=PC+4;

end
endmodule