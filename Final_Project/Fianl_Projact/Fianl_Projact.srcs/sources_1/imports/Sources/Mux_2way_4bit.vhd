LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY MUX_2_way_4_bit IS
    PORT (
        AddSubValue : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
        InsDecValue : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
        OutputValue : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
        --'0' to select add/sub unit value and '1' to select instruction decoder immediate value
        Selector : IN STD_LOGIC);
END MUX_2_way_4_bit;

ARCHITECTURE Behavioral OF MUX_2_way_4_bit IS

component Decoder_1_to_2 
    Port ( I : in STD_LOGIC;
           EN : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR(1 downto 0));
end component;

    COMPONENT tri_state_buffer
        PORT (
            inputTri : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
            outputTri : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
            EN : IN STD_LOGIC);
    END COMPONENT;
    
    signal RegSel : STD_LOGIC_VECTOR (1 downto 0);
BEGIN

    Decoder: Decoder_1_to_2
        port map (
            I => Selector,
            EN => '1',
            Y => RegSel);  
        

    tri_state_buffer_0 : tri_state_buffer
    PORT MAP(
        inputTri => AddSubValue,
        outputTri => OutputValue,
        EN => RegSel(0));
    tri_state_buffer_1 : tri_state_buffer
    PORT MAP(
        inputTri => InsDecValue,
        outputTri => OutputValue,
        EN => RegSel(1));

END Behavioral;