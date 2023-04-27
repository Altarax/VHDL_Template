library IEEE;
use ieee.std_logic_1164.ALL;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.ALL;

entity CLK_Generator is
    Port (
        clk_in_2        : in std_logic;
        clk_in          : in std_logic;
        reset_n         : in std_logic;
        SOMETHING       : in std_logic_vector(4 downto 0);

        generated_clock : inout std_logic
    );
end CLK_Generator;

architecture Behavioral of CLK_Generator is

    signal counter              : integer := 0;
    signal max_counter          : integer := 0;

    -- Example values in NS
    constant TIMING_0_NS        : integer := 375;
    constant TIMING_1_NS        : integer := 15000;
    constant TIMING_2_NS        : integer := 60000;
    constant TIMING_3_NS        : integer := 240_000;
    constant TIMING_4_NS        : integer := 960_000;
    constant TIMING_5_NS        : integer := 3_840_000;
    constant TIMING_6_NS        : integer := 15_360_000;
    constant TIMING_7_NS        : integer := 61_440_000;
    constant TIMING_8_NS        : integer := 245_760_000;
    constant TIMING_9_NS        : integer := 983_040_000;

begin

    --! \brief Process to calculate the speed.
    calculate_sample_speed: process (reset_n, clk_in_2, SOMETHING, pulse_duration_hv_s) is
    begin
        if rising_edge(clk_in_2) then
            if reset_n = '0' then
                max_counter <= 2;
            else 
                case SOMETHING is
s
                    when SOMETHING => 

                        if VALUE <= TIMING then

                            max_counter <= COUNTER_VALUE;

                        end if;

                    when others => max_counter <= DEFAULT_VALUE;

                end case;
            end if;
        end if;

    end process;

    --! \brief Process to divide clock.
    divider_gen: process(clk_in, reset_n, max_counter, counter)
        begin
            if rising_edge(clk_in) then
                if reset_n = '0' then
                    generated_clock <= '0';
                    counter <= 0;
                else 
                    if counter < max_counter - 1 then
                        counter <= counter + 1;
                    else
                        counter <= 0;
                    end if;
                    
                    if counter = 1 then
                        generated_clock <= not(generated_clock);
                    end if;
                end if;
            end if;
    end process;

end Behavioral;
