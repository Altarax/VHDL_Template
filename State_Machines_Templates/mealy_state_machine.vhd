----------------------------------------------------------------------------------
--!
--! \file mealy_state_machine.vhd
--!
--! \brief Mealy State Machine.
--!
--! \version 1.0
--! \date XX/XX/XX
--!
--! \author Dangremont Jayson, dangremontjayson.pro@gmail.com
--!
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all; 

entity Mealy_State_Machine is
    port(
        clk, reset : in std_logic;
        level : in std_logic;
        Mealy_tick: out std_logic 
    );
end Mealy_State_Machine;

architecture arch of Mealy_State_Machine is 

    type stateMealy_type is (zero, one);
    signal stateMealy_reg, stateMealy_next : stateMealy_type;
    
begin   
    process(clk, reset)
    begin
        if (reset = '1') then
            stateMealy_reg <= zero;
        elsif (clk'event and clk = '1') then
            stateMealy_reg <= stateMealy_next;
        else
            null;
        end if; 
    end process;

    Mealy_design: process(stateMealy_reg, level)
    begin 

        stateMealy_next <= stateMealy_reg;
        Mealy_tick <= '0';

        case stateMealy_reg is 
            when zero => 
                if level = '1' then 
                    stateMealy_next <= one; 
                    Mealy_tick <= '1';
                end if; 
            when one =>  
                if level = '0' then 
                    stateMealy_next <= zero; 
                end if;
        end case;
         
    end process;  

end arch; 
    