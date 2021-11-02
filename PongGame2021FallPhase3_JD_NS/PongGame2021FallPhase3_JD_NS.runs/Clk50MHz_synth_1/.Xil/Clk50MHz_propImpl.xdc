set_property SRC_FILE_INFO {cfile:{c:/Users/snownp/ECE433/Final Project/ECE433_PongVGA/PongGame2021FallPhase3_JD_NS/PongGame2021FallPhase3_JD_NS.srcs/sources_1/ip/Clk50MHz/Clk50MHz.xdc} rfile:../../../PongGame2021FallPhase3_JD_NS.srcs/sources_1/ip/Clk50MHz/Clk50MHz.xdc id:1 order:EARLY scoped_inst:inst} [current_design]
current_instance inst
set_property src_info {type:SCOPED_XDC file:1 line:57 export:INPUT save:INPUT read:READ} [current_design]
set_input_jitter [get_clocks -of_objects [get_ports Clock100MHz]] 0.1
