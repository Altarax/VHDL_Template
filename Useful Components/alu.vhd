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

    constant AND_GATE       : bits4 := "0000";
    constant OR_GATE        : bits4 := "0001";
    constant XOR_GATE       : bits4 := "0010";
    constant ADDITION       : bits4 := "0011";
    constant SUBTRACTION    : bits4 := "0100";
    constant MULTIPLICATION : bits4 := "0101";
    constant DIVISION       : bits4 := "0110";
    constant MODUL0         : bits4 := "0111";
    constant AND_NOT_GATE   : bits4 := "1000";
    constant OR_NOT_GATE    : bits4 := "1001";
    constant NOT_GATE       : bits4 := "1010";
    constant ADDER_OUTPUT   : bits4 := "1011";
    constant SHIFTER_OUTPUT : bits4 := "1100";
    constant DATA_A         : bits4 := "1101";
    constant DATA_B         : bits4 := "1110";
    constant ZERO           : bits4 := "1111";

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
            when AND_GATE => result <= data_a and data_b;
            when OR_GATE => result <= data_a or data_b;
            when XOR_GATE => result <= data_a xor data_b;
            when ADDITION => result <= std_logic_vector(unsigned(data_a) + unsigned(data_b));
            when SUBTRACTION => result <= std_logic_vector(unsigned(data_a) - unsigned(data_b));
            when MULTIPLICATION => result <= std_logic_vector(unsigned(data_a) * unsigned(data_b));
            when DIVISION => result <= std_logic_vector(unsigned(data_a) / unsigned(data_b));
            when MODUL0 => result <= data_a mod data_b;
            when AND_NOT_GATE => result <= data_a and not data_b;
            when OR_NOT_GATE => result <= data_a or not data_b;
            when NOT_GATE => result <= not data_a;
            when ADDER_OUTPUT => result <= adder_output;
            when SHIFTER_OUTPUT => result <= shifter_output;
            when DATA_A => result <= data_a;
            when DATA_B => result <= data_b;
            when ZERO => result <= (others => '0');
            when others => null;
        end case;
        zero <= result = (others => '0');
        overflow <= adder_output(width);
    end process;
end behavioral;
