library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX_2_way_3_bit_sim is
--  Port ( );
end MUX_2_way_3_bit_sim;
architecture Behavioral of MUX_2_way_3_bit_sim is
component MUX_2_way_3_bit
    port(   Adder_3 : in STD_LOGIC_VECTOR (2 downto 0);
            JUMP_TO : in STD_LOGIC_VECTOR (2 downto 0);
            Output : out STD_LOGIC_VECTOR (2 downto 0);
            Selector : in STD_LOGIC);
end component;
signal Adder_3,JUMP_TO : std_logic_vector(2 downto 0);
signal Selector : std_logic;
signal Output : std_logic_vector(2 downto 0);
begin
UUT: MUX_2_way_3_bit
port map(
            Adder_3(2 downto 0)=>Adder_3(2 downto 0),
            JUMP_TO(2 downto 0)=>JUMP_TO(2 downto 0),
            Output=> Output,
            Selector=> Selector);
process
begin

Adder_3<="001";
JUMP_TO<="100";
Selector<='0';
WAIT FOR 100ns;

Selector<='1';
WAIT FOR 100ns;

Adder_3<="011";
JUMP_TO<="101";
Selector<='0';
WAIT FOR 100ns;

Selector<='1';
WAIT FOR 100ns;

Adder_3<="111";
JUMP_TO<="011";
Selector<='0';
WAIT FOR 100ns;

Selector<='1';
WAIT FOR 100ns;

WAIT;

end process;
end Behavioral;