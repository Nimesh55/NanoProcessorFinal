library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX_2_way_3_bit is
    Port ( Adder_3 : in STD_LOGIC_VECTOR (2 downto 0);
           JUMP_TO : in STD_LOGIC_VECTOR (2 downto 0);
           Selector : in STD_LOGIC;
           Output : out std_logic_vector(2 downto 0));
end MUX_2_way_3_bit;

architecture Behavioral of MUX_2_way_3_bit is
component tri_state_buffer_3bit
    port ( inputTri : in STD_LOGIC_VECTOR (2 downto 0);
           outputTri : out STD_LOGIC_VECTOR (2 downto 0);
           EN : in STD_LOGIC);
end component; 
signal NOTSel: std_logic;   
begin
tri_state_buffer_3bit_0 :tri_state_buffer_3bit
port map(   inputTri=> Adder_3,
            outputTri => Output,
            EN=> NOTSel);
tri_state_buffer_3bit_1: tri_state_buffer_3bit
port map(   inputTri=> JUMP_TO,
            outputTri =>Output,
            EN=>Selector);

NOTSel <= NOT Selector;

end Behavioral;
