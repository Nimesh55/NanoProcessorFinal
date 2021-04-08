library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX_2_way_4_bit is
    Port ( AddSubValue : in STD_LOGIC_VECTOR (3 downto 0);
           InsDecValue : in STD_LOGIC_VECTOR (3 downto 0);
           OutputValue : out STD_LOGIC_VECTOR (3 downto 0);
           Selector : in STD_LOGIC);--'0' for addsub and '1' for insdec
end MUX_2_way_4_bit;

architecture Behavioral of MUX_2_way_4_bit is
component tri_state_buffer
    port (  inputTri : in STD_LOGIC_VECTOR (3 downto 0);
           outputTri : out STD_LOGIC_VECTOR (3 downto 0);
           EN : in STD_LOGIC);
end component; 
signal NOTSel: std_logic;   
begin
tri_state_buffer_0:tri_state_buffer
port map(   inputTri=> AddSubValue,
            outputTri => OutputValue,
            EN=> NOTSel);
tri_state_buffer_1: tri_state_buffer
port map(   inputTri=> InsDecValue,
            outputTri =>OutputValue,
            EN=>Selector);

NOTSel <= NOT Selector;

end Behavioral;
