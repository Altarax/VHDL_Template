library IEEE;
use IEEE.std_logic_1164.all;

entity delay_register is
    Generic (
        data_length : natural := 32
    );
    Port (
        reset_n, clk    : in  std_logic;
        en              : in std_logic;
        d_in            : in std_logic_vector(data_length-1 downto 0);
        d_out           : out std_logic_vector(data_length-1 downto 0)
    );
end delay_register;

architecture Behavioral of delay_register is

    signal data : std_logic_vector(data_length-1 downto 0);

begin
    
    process(reset_n, clk)
    begin
        if reset_n = '0' then
            data <= (others => '0');
        else
            if rising_edge(clk) then
                if en = '1' then
                    data <= d_in;
                else
                    data <= data;
                end if;
            end if;
        end if;
    end process;

    d_out <= data;

end Behavioral;
