library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tri_state_buffer is
    Port ( inputTri : in STD_LOGIC_VECTOR (3 downto 0);
           OutputTri : out STD_LOGIC_VECTOR (3 downto 0);
           EN : in STD_LOGIC);
end tri_state_buffer;

architecture Behavioral of tri_state_buffer is

begin
outputTri<=inputTri WHEN (EN='1') else "ZZZZ";

end Behavioral;
