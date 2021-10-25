set_property SRC_FILE_INFO {cfile:c:/Users/davidsjt/Documents/2021-22/Fall/ECE433/Labs/ECE433_PongVGA/PongGame2020fallpahse1_JD_NS/PongGame2020fallpahse1_JD_NS.srcs/sources_1/ip/clk_50MHz/clk_50MHz.xdc rfile:../../../PongGame2020fallpahse1_JD_NS.srcs/sources_1/ip/clk_50MHz/clk_50MHz.xdc id:1 order:EARLY scoped_inst:inst} [current_design]
current_instance inst
set_property src_info {type:SCOPED_XDC file:1 line:57 export:INPUT save:INPUT read:READ} [current_design]
set_input_jitter [get_clocks -of_objects [get_ports clk_in1]] 0.1
