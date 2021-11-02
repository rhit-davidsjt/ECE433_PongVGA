onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib Clk50MHz_opt

do {wave.do}

view wave
view structure
view signals

do {Clk50MHz.udo}

run -all

quit -force
