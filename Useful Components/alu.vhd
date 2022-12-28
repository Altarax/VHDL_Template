library ieee;
use ieee.std_logic_1164.all;
use ieee.math_real.all;

entity alu is
    generic(
          width : integer := 8;
          num_operations : integer := 16
    );
    port(
          data_a    : in std_logic_vector(width-1 downto 0);
          data_b    : in std_logic_vector(width-1 downto 0);
          opcode    : in std_logic_vector(log2(num_operations)-1 downto 0);
          result    : out std_logic_vector(width-1 downto 0);
          zero      : out std_logic;
          overflow  : out std_logic
    );
end alu;

architecture behavioral of alu is
  signal adder_output : std_logic_vector(width downto 0);
  signal shifter_output : std_logic_vector(width-1 downto 0);
begin
    adder : entity work.adder
        generic map(width => width)
        port map(
              a => data_a,
              b => data_b,
              sum => adder_output(width-1 downto 0),
              carry_out => adder_output(width));
    shifter : entity work.barrel_shifter
        generic map(width => width)
        port map(
              data => shifter_output,
              shift => data_b,
              direction => opcode(0),
              output => shifter_output);
    process(data_a, data_b, opcode)
    begin
        case opcode is
            when "0000" => result <= data_a and data_b;
            when "0001" => result <= data_a or data_b;
            when "0010" => result <= data_a xor data_b;
            when "0011" => result <= data_a + data_b;
            when "0100" => result <= data_a - data_b;
            when "0101" => result <= data_a * data_b;
            when "0110" => result <= data_a / data_b;
            when "0111" => result <= data_a mod data_b;
            when "1000" => result <= data_a and not data_b;
            when "1001" => result <= data_a or not data_b;
            when "1010" => result <= not data_a;
            when "1011" => result <= adder_output;
            when "1100" => result <= shifter_output;
            when "1101" => result <= data_a;
            when "1110" => result <= data_b;
            when "1111" => result <= (others => '0');
            when others => null;
        end case;
        zero <= result = (others => '0');
        overflow <= adder_output(width);
    end process;
end behavioral;
