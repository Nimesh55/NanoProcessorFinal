library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX_8_way_4_bit is
    Port ( Reg0 : in STD_LOGIC_VECTOR (3 downto 0);
           Reg1 : in STD_LOGIC_VECTOR (3 downto 0);
           Reg2 : in STD_LOGIC_VECTOR (3 downto 0);
           Reg3 : in STD_LOGIC_VECTOR (3 downto 0);
           Reg4 : in STD_LOGIC_VECTOR (3 downto 0);
           Reg5 : in STD_LOGIC_VECTOR (3 downto 0);
           Reg6 : in STD_LOGIC_VECTOR (3 downto 0);
           Reg7 : in STD_LOGIC_VECTOR (3 downto 0);
           RegValue : out STD_LOGIC_VECTOR (3 downto 0);
           RegSelection : in STD_LOGIC_VECTOR (2 downto 0));
end MUX_8_way_4_bit;

architecture Behavioral of MUX_8_way_4_bit is
Component Decoder_3_to_8_MUX
    port(   I : in STD_LOGIC_VECTOR (2 downto 0);
            Enable : in STD_LOGIC;
            Y : out STD_LOGIC_VECTOR (7 downto 0));
 end component;

Signal YY : std_logic_vector(7 downto 0);

component tri_state_buffer
    port(  inputTri : in STD_LOGIC_VECTOR (3 downto 0);
           outputTri : out STD_LOGIC_VECTOR (3 downto 0);
           EN : in STD_LOGIC);
end component;
begin

Decoder_3_to_8_0 : Decoder_3_to_8_MUX
    port map (  I => RegSelection,
            Enable => '1',
            Y => YY);
tri_state_buffer_0 : tri_state_buffer
    port map(   inputTri => Reg0,
                EN=> YY(0),
                outputTri => RegValue);
tri_state_buffer_1 : tri_state_buffer
    port map(   inputTri => Reg1,
                EN=> YY(1),
                outputTri => RegValue);
tri_state_buffer_2 : tri_state_buffer
    port map(   inputTri => Reg2,
                EN=> YY(2),
                outputTri => RegValue);
tri_state_buffer_3 : tri_state_buffer
    port map(   inputTri => Reg3,
                EN=> YY(3),
                outputTri => RegValue);
tri_state_buffer_4 : tri_state_buffer
    port map(   inputTri => Reg4,
                EN=> YY(4),
                outputTri => RegValue);
tri_state_buffer_5 : tri_state_buffer
    port map(   inputTri => Reg5,
                EN=> YY(5),
                outputTri => RegValue);
tri_state_buffer_6 : tri_state_buffer
    port map(   inputTri => Reg6,
                EN=> YY(6),
                outputTri => RegValue);
tri_state_buffer_7 : tri_state_buffer
    port map(   inputTri => Reg7,
                EN=> YY(7),
                outputTri => RegValue);                


end Behavioral;
