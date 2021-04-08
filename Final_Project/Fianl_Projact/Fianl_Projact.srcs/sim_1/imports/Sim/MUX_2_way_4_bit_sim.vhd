library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX_2_way_4_bit_sim is
--  Port ( );
end MUX_2_way_4_bit_sim;

architecture Behavioral of MUX_2_way_4_bit_sim is
component MUX_2_way_4_bit
    port(   AddSubValue : in STD_LOGIC_VECTOR (3 downto 0);
            InsDecValue : in STD_LOGIC_VECTOR (3 downto 0);
            OutputValue : out STD_LOGIC_VECTOR (3 downto 0);
            Selector : in STD_LOGIC);
end component;
signal AddSubValue,InsDecValue : std_logic_vector(3 downto 0);
signal Selector : std_logic;
signal OutputValue : std_logic_vector(3 downto 0);
begin
UUT: MUX_2_way_4_bit
port map(
            AddSubValue=>AddSubValue,
            InsDecValue=>InsDecValue,
            OutputValue=> OutputValue,
            Selector=> Selector);
process
begin

AddSubValue<="0010";
InsDecValue<="1000";
Selector<='0';
WAIT FOR 100ns;


Selector<='1';
WAIT FOR 100ns;

AddSubValue<="0011";
InsDecValue<="1001";
Selector<='0';
WAIT FOR 100ns;

Selector<='1';
WAIT FOR 100ns;

AddSubValue<="0111";
InsDecValue<="1101";
Selector<='0';
WAIT FOR 100ns;

Selector<='1';
WAIT FOR 100ns;

WAIT;

end process;
end Behavioral;
