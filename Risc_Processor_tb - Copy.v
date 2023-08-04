module Risc_processor_tb();
reg clk,rst_n;


 TOP_module my_risc_processor(clk,rst_n);

 initial begin
 	clk=0;
 	forever #1 clk=~clk;
 end

  integer i;

 initial begin
 	$readmemh("program.dat", my_risc_processor.my_intsr_mem.mem);
 	rst_n=0;
 	#20
 	rst_n=1;
 	#20;

   
 	
 	for(i=0;i<10;i=i+1)begin
 		$dsiplay("%d",my_risc_processor.my_intsr_mem.mem[i]);
 		#2;
 		end
 #50;

 	
 	for(i=0;i<10;i=i+1)begin
 		$dsiplay("%d",my_risc_processor.mydata_mem.data_mem[i]);
 		#2;
 		end
 #50;

 
 	for(i=0;i<10;i=i+1)begin
 		$dsiplay("%d",my_risc_processor.my_regitser_file.regfile[i]);
 		#2;
 		end
 
 #200
 	$stop;
 	
 end

 endmodule