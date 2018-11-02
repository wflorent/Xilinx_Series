-- Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
-- 
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
-- 
----------------------------------------------------------------------------------
--
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
--
--Tool Version: Vivado v.2018.1
--Command     : generate_target VGA_source_bd_wrapper.bd
--Design      : VGA_source_bd_wrapper
--Purpose     : IP block netlist
--Updates:
--  		  - 2018/10/19 - Corrected output signals
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity VGA_source_bd_wrapper is
  port (
    blue_data_out : out STD_LOGIC_VECTOR ( 3 downto 0 );
    clk_in : in STD_LOGIC;
    green_data_out : out STD_LOGIC_VECTOR ( 3 downto 0 );
    hsync_out : out STD_LOGIC;
    red_data_out : out STD_LOGIC_VECTOR ( 3 downto 0 );
    vsync_out : out STD_LOGIC
  );
end VGA_source_bd_wrapper;

architecture STRUCTURE of VGA_source_bd_wrapper is

signal blue_data, red_data, green_data : std_logic_vector(7 downto 0);

  component VGA_source_bd is
  port (
    blue_data_out : out STD_LOGIC_VECTOR ( 7 downto 0 );
    clk_in : in STD_LOGIC;
    green_data_out : out STD_LOGIC_VECTOR ( 7 downto 0 );
    hsync_out : out STD_LOGIC;
    red_data_out : out STD_LOGIC_VECTOR ( 7 downto 0 );
    vsync_out : out STD_LOGIC
  );
  end component VGA_source_bd;
begin
VGA_source_bd_i: component VGA_source_bd
     port map (
      blue_data_out(7 downto 0) => blue_data(7 downto 0),
      clk_in => clk_in,
      green_data_out(7 downto 0) => green_data(7 downto 0),
      hsync_out => hsync_out,
      red_data_out(7 downto 0) => red_data(7 downto 0),
      vsync_out => vsync_out
    );
	
	
	blue_data_out 	<= blue_data(7 downto 4);
	red_data_out 	<= red_data(7 downto 4);
	green_data_out 	<= green_data(7 downto 4);
    
    
end STRUCTURE;
