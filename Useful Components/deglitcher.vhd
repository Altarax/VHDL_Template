library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

entity deglitcher is
    generic (
        clock_ticks : positive := 10;
        data_width : positive := 8
    );
    port (
        clk_in : in std_logic;
        reset : in std_logic;
        data_to_deglitch : in std_logic;
        data_deglitched : out std_logic
    );
end entity deglitcher;

architecture rtl of deglitcher is
    signal reg_data : std_logic;
begin
    deglitching: process(clk_in, reset) is
    begin
        if reset='1'then
            data_deglitched <= (others => '0');
        elsif rising_edge(clk_in) then
            reg_data(0) <= data_to_deglitch;
            for i in 0 to clock_ticks-1 loop
                reg_data(i+1) <= reg_data(i);
            end loop;
            if reg_data = (others => '1') then
                data_deglitched <= '1';
            else
                data_deglitched <= '0';
            end if;
        end if;
    end process;
end architecture rtl;
