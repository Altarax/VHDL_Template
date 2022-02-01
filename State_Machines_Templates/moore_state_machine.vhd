----------------------------------------------------------------------------------
--!
--! \file moore_state_machine.vhd
--!
--! \brief Moore State Machine.
--!
--! \version 1.0
--! \date XX/XX/XX
--!
--! \author Dangremont Jayson, dangremontjayson.pro@gmail.com
--!
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all; 

entity Moore_State_Machine is
    port(
        clk, reset : in std_logic;
        level : in std_logic;
        Moore_tick: out std_logic 
    );
end Moore_State_Machine;

architecture arch of Moore_State_Machine is 
    
    type stateMoore_type is (zero, edge, one);
    signal stateMoore_reg, stateMoore_next : stateMoore_type;
    
begin   
    process(clk, reset)
    begin
        if (reset = '1') then
            stateMoore_reg <= zero;
        elsif (clk'event and clk = '1') then
            stateMoore_reg <= stateMoore_next;
        else
            null;
        end if; 
    end process;
    
    Moore_design: process(stateMoore_reg, level)
    begin 
        stateMoore_next <= stateMoore_reg; 
        Moore_tick <= '0';

        case stateMoore_reg is 
            when zero =>
                if level = '1' then
                    stateMoore_next <= edge;
                end if; 
            when edge => 
                Moore_tick <= '1';
                if level = '1' then
                    stateMoore_next <= one;
                else 
                    stateMoore_next <= zero
                end if;
            when one =>
                if level = '0' then
                    stateMoore_next <= zero;
                end if;
        end case; 
        
    end process;  

end arch; 
    