-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
-- Date        : Mon Nov  1 21:27:34 2021
-- Host        : snownp-stg4 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub {c:/Users/snownp/ECE433/Final
--               Project/ECE433_PongVGA/PongGame2021FallPhase3_JD_NS/PongGame2021FallPhase3_JD_NS.srcs/sources_1/ip/Clk50MHz/Clk50MHz_stub.vhdl}
-- Design      : Clk50MHz
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a100tcsg324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Clk50MHz is
  Port ( 
    Clock50MHz : out STD_LOGIC;
    reset : in STD_LOGIC;
    locked : out STD_LOGIC;
    Clock100MHz : in STD_LOGIC
  );

end Clk50MHz;

architecture stub of Clk50MHz is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "Clock50MHz,reset,locked,Clock100MHz";
begin
end;
