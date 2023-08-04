module data_memory(clk,write_enable_WE,write_address_A,write_data_WD,read_data_RD);
input clk,write_enable_WE;
input[31:0]  write_address_A,write_data_WD;
output reg [31:0] read_data_RD;

reg [31:0] data_mem[0:63];

always @(posedge clk)begin
	if(write_enable_WE)begin
		data_mem[(write_address_A)/4]<=write_data_WD;
	end
end

always @(*)begin
	read_data_RD=data_mem[(write_address_A)/4];
end

endmodule