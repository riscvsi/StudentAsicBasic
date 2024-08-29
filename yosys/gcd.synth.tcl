yosys -import

set  libFiles  "./sky130_fd_sc_hd__tt_025C_1v80.lib" 

# read design 
read_verilog gcd.v

# elaborate design hierarchy
hierarchy -check -top gcd

# the high-level stuff
opt; fsm; opt;

# mapping to internal cell library
techmap; opt

# cleanup
synth -top gcd

dfflibmap -liberty $libFiles

abc -liberty $libFiles -constr gcd.sdc

#show -pause
# write synthesized design
write_verilog gcd.synth.v

