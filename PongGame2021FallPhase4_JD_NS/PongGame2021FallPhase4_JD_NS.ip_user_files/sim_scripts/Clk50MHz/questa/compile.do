vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xpm
vlib questa_lib/msim/xil_defaultlib

vmap xpm questa_lib/msim/xpm
vmap xil_defaultlib questa_lib/msim/xil_defaultlib

vlog -work xpm -64 -sv "+incdir+../../../ipstatic" \
"C:/Xilinx/Vivado/2019.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \

vcom -work xpm -64 -93 \
"C:/Xilinx/Vivado/2019.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib -64 "+incdir+../../../ipstatic" \
"../../../../PongGame2021FallPhase3_JD_NS.srcs/sources_1/ip/Clk50MHz/Clk50MHz_clk_wiz.v" \
"../../../../PongGame2021FallPhase3_JD_NS.srcs/sources_1/ip/Clk50MHz/Clk50MHz.v" \

vlog -work xil_defaultlib \
"glbl.v"

