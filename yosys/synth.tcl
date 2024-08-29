yosys -import

set  libFiles  "/home/rcg/Desktop/vlsi/OpenROAD-flow-scripts/flow/platforms/sky130hd/lib/sky130_fd_sc_hd__tt_025C_1v80.lib" 

# read design 
read_verilog counter.v

# elaborate design hierarchy
hierarchy -check -top counter

# the high-level stuff
opt; fsm; opt;

# mapping to internal cell library
techmap; opt

# cleanup
synth -top counter

dfflibmap -liberty $libFiles

abc -liberty $libFiles -constr counter.sdc

show -pause
# write synthesized design
write_verilog counter.synth.v

