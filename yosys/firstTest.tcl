read_verilog mux.v
#show -pause
hierarchy -check -top mux
opt; fsm; opt;

# mapping to internal cell library
techmap; opt

proc

### ignore if is is a clocked design
#satisfiability problem

cd mux
sat -prove y 1 -set a 1 -set b 1 -set ctrl 1 
sat -prove y 0 -set a 1 -set b 1 -set ctrl 1 
########################

synth -top mux
dfflibmap -liberty ./sky130_fd_sc_hd__tt_025C_1v80.lib

abc -liberty ./sky130_fd_sc_hd__tt_025C_1v80.lib -constr ./mux.sdc 


