module register_file( 
input wire [31:0] write_data_WD3,
input wire [4:0]  write_addr_A3,
input  wire [4:0] read_addr_A1,
input  wire [4:0] read_addr_A2,
input wire clk,
input wire rst_n,
input write_enable_WE3,
output reg [31:0] read_data_RD1,
output reg [31:0] read_data_RD2
);

reg [31:0] regfile [0:31];
integer i;

always@(posedge clk or negedge rst_n  )
 begin
if (~rst_n )
begin
  for(i=0 ; i<32 ; i=i+1)
    begin
      regfile[i]<=0;
     end 
end

 else if(write_enable_WE3)

 regfile[write_addr_A3]<=write_data_WD3;
    
 end

 always @(*)begin
 read_data_RD1 <= regfile[read_addr_A1];
 read_data_RD2<= regfile[read_addr_A2];
 end

endmodule