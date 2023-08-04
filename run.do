vlib work

vlog Risc_processor_tb.v  TOP_module.v alu.v register_file.v Program_counter.v instruction_memory.v  sign_extend.v control_unit.v data_memory.v   +cover -covercells

vsim -voptargs=+acc work.Risc_processor_tb    -cover

add wave -position insertpoint  \
sim:/Risc_processor_tb/clk \
sim:/Risc_processor_tb/rst_n \
sim:/Risc_processor_tb/my_risc_processor/my_PC/PC\
sim:/Risc_processor_tb/my_risc_processor/my_PC/PC_next\
sim:/Risc_processor_tb/my_risc_processor/Instr\
sim:/Risc_processor_tb/my_risc_processor/mu_alu/ALURESULT\
sim:/Risc_processor_tb/my_risc_processor/mu_alu/ALURESULT\
sim:/Risc_processor_tb/my_risc_processor/Result\
sim:/Risc_processor_tb/my_risc_processor/WriteData\
sim:/Risc_processor_tb/my_risc_processor/Read_Data\
sim:/Risc_processor_tb/my_risc_processor/ImmExt\
sim:/Risc_processor_tb/my_risc_processor/RegWrite\
sim:/Risc_processor_tb/my_risc_processor/ALU_Control\
vsim:/Risc_processor_tb/my_risc_processor/MemWrite\
sim:/Risc_processor_tb/my_risc_processor/PcSrc\
sim:/Risc_processor_tb/my_risc_processor/ImmSrc\
sim:/Risc_processor_tb/my_risc_processor/ALUSrc\
sim:/Risc_processor_tb/my_risc_processor/load\
sim:/Risc_processor_tb/my_risc_processor/my_cntrl_unit/Branch\
sim:/Risc_processor_tb/my_risc_processor/my_cntrl_unit/ZERO_flag\
sim:/Risc_processor_tb/my_risc_processor/my_cntrl_unit/sign_flag\
sim:/Risc_processor_tb/my_risc_processor/mydata_mem/data_mem[0]\
sim:/Risc_processor_tb/my_risc_processor/mydata_mem/data_mem[1]\
sim:/Risc_processor_tb/my_risc_processor/mydata_mem/data_mem[2]\
sim:/Risc_processor_tb/my_risc_processor/mydata_mem/data_mem[3]\
sim:/Risc_processor_tb/my_risc_processor/mydata_mem/data_mem[4]\
sim:/Risc_processor_tb/my_risc_processor/mydata_mem/data_mem[5]\
sim:/Risc_processor_tb/my_risc_processor/mydata_mem/data_mem[6]\
sim:/Risc_processor_tb/my_risc_processor/mydata_mem/data_mem[7]\
sim:/Risc_processor_tb/my_risc_processor/mydata_mem/data_mem[8]\
sim:/Risc_processor_tb/my_risc_processor/mydata_mem/data_mem[9]\
sim:/Risc_processor_tb/my_risc_processor/my_regitser_file/regfile[0]\
sim:/Risc_processor_tb/my_risc_processor/my_regitser_file/regfile[1]\
sim:/Risc_processor_tb/my_risc_processor/my_regitser_file/regfile[2]\
sim:/Risc_processor_tb/my_risc_processor/my_regitser_file/regfile[3]\
sim:/Risc_processor_tb/my_risc_processor/my_regitser_file/regfile[4]\
sim:/Risc_processor_tb/my_risc_processor/my_regitser_file/regfile[5]\
sim:/Risc_processor_tb/my_risc_processor/my_regitser_file/regfile[6]\
sim:/Risc_processor_tb/my_risc_processor/my_regitser_file/regfile[7]\
sim:/Risc_processor_tb/my_risc_processor/my_regitser_file/regfile[8]\
sim:/Risc_processor_tb/my_risc_processor/my_regitser_file/regfile[9]\
sim:/Risc_processor_tb/my_risc_processor/my_regitser_file/regfile[10]\
sim:/Risc_processor_tb/my_risc_processor/my_regitser_file/regfile[11]\
sim:/Risc_processor_tb/my_risc_processor/my_regitser_file/regfile[12]\
run -all 