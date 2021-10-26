vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xil_defaultlib

vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib

vlog -work xil_defaultlib -64 -incr "+incdir+../../../ipstatic" \
"../../../../PongGame2020fallpahse1_JD_NS.srcs/sources_1/ip/clk_50MHz/clk_50MHz_clk_wiz.v" \
"../../../../PongGame2020fallpahse1_JD_NS.srcs/sources_1/ip/clk_50MHz/clk_50MHz.v" \


vlog -work xil_defaultlib \
"glbl.v"

