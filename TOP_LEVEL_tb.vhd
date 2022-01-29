----------------------------------------------------------------------------------
--!
--! \file TOP_LEVEL_tb.vhd
--!
--! \brief Testbenchs for TOP_LEVEL.
--!
--! \version 1.0
--! \date XX/XX/XX
--!
--! \author Dangremont Jayson, dangremontjayson.pro@gmail.com
--!
----------------------------------------------------------------------------------

--! Use simulation librairies
Library IEEE;
use IEEE.std_logic_TEXTIO.all;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

--! \brief Entity of TOP_LEVEL_tb
entity TOP_LEVEL_HFECT_tb is
    --  Port ( );
end TOP_LEVEL_HFECT_tb;

architecture simulation of TOP_LEVEL_HFECT_tb is

    --! Component TOP_LEVEL declaration
    component TOP_LEVEL_HFECT
        port (
           
        );
    end component;
    
    --! Signal declarations
    
begin
    UUT: TOP_LEVEL_HFECT port map();

    reset_gen: process
        begin
        end process;

    clk_gen: process
        begin
        end process;

end simulation;