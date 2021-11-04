onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+Clk50MHz -L xpm -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.Clk50MHz xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {Clk50MHz.udo}

run -all

endsim

quit -force
