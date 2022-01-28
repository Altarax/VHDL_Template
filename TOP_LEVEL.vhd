----------------------------------------------------------------------------------
--!
--! \file TOP_LEVEL.vhd
--!
--! \brief Main file to connect each components between them.
--!
--! \version 1.0
--! \date XX/XX/XX
--!
--! \author Dangremont Jayson, dangremontjayson.pro@gmail.com
--!
----------------------------------------------------------------------------------

--! Use standard librairies
library library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

--! \brief Entity of TOP_LEVEL
--! \details This entity is used to create
--! hierarchy between the files. The TOP LEVEL connects
--! each component (entities in the other files)
--! between them.
--!
--! \dot
--! digraph main {
--! size = "5,5";
--! TOP_LEVEL [shape=box, label="TOP LEVEL"];
--! TOP_LEVEL -> COMPONENT_X;
--! TOP_LEVEL -> COMPONENT_Y;
--! }
--! \enddot
entity TOP_LEVEL is
    port (

        clk         : in std_logic;
        reset       : in std_logic;

        data_out    : in std_logic
        
    );
end entity TOP_LEVEL;

architecture rtl of TOP_LEVEL is

    --! Component declarations

    --! Signal declarations
    
begin
    
    --! Port map
    
end architecture rtl;