library ieee;
    use ieee.std_logic_1164.all;

entity FSM is
    Port ( 
        reset_n : in  std_logic;
        clk 	: in  std_logic
	);
end FSM;

architecture Behavioral of FSM is

	type state_t is (init, state_1, state_2, state_3);
	signal present_state, next_state : state_t;

begin

	--! FSM register
	process(reset_n,clk)
	begin
		if reset_n = '1' then
			if rising_edge(clk) then
				present_state <= next_state;
			end if;
		else
			present_state <= init;
		end if;
	end process;

	--! FSM combinational next state logic
	process(present_state) 
    begin
    	next_state <= present_state;
        
		case present_state is
			when init =>
			when state_1 =>
			when state_2 =>
			when state_3 =>
		end case;
	end process;

	--! FSM combinational output logic block
	process(present_state)
	begin
		case present_state is
            when init =>
            when state_1 =>
            when state_2 =>
            when state_3 =>
		end case;
	end process;

end Behavioral;

