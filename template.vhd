----------------------------------------------------------------------------------
--!
--! \file main.vhd
--!
--! \brief Main file.
--!
--! \version 1.0
--! \date XX/XX/XXXX
--!
--! \author Dangremont Jayson, dangremontjayson.pro@gmail.com
--!
----------------------------------------------------------------------------------

--! Use standard librairies
library library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

--! \brief Entity of the main file
--! \details Description

entity template is
    port (

        clk         : in std_logic;
        reset       : in std_logic;

        data_out    : out std_logic
        
    );
end entity template;

architecture template_arch of template is

    --! Signal declarations
    
begin
    
    --! Synchronous reset process
   proc_name: process(clk)
   begin
       if rising_edge(clk) then
           if rst = rst_val then
               
           else
               
           end if;
       end if;
   end process proc_name;

   --! Asynchronous reset process
  proc_name: process(clk, rst)
  begin
      if rst = rst_val then
          
      elsif rising_edge(clk) then
          
      end if;
  end process proc_name;
    
end architecture template_arch;