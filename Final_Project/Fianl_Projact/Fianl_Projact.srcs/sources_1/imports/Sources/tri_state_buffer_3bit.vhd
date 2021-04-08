library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tri_state_buffer_3bit is

Port (      inputTri : in STD_LOGIC_VECTOR (2 downto 0);
            outputTri : out STD_LOGIC_VECTOR (2 downto 0);
            EN : in STD_LOGIC);
end tri_state_buffer_3bit;

architecture Behavioral of tri_state_buffer_3bit is

begin
outputTri<=inputTri WHEN (EN='1') else "ZZZ";

end Behavioral;
