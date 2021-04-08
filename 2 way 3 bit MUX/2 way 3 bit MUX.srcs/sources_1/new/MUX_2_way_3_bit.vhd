LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY MUX_2_way_3_bit IS
    PORT (
        Adder_3 : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
        JUMP_TO : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
        Selector : IN STD_LOGIC;
        Output : OUT STD_LOGIC_VECTOR(2 DOWNTO 0));
END MUX_2_way_3_bit;

ARCHITECTURE Behavioral OF MUX_2_way_3_bit IS
    COMPONENT tri_state_buffer_3bit
        PORT (
            inputTri : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
            outputTri : OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
            EN : IN STD_LOGIC);
    END COMPONENT;
    SIGNAL NOTSel : STD_LOGIC;
BEGIN
    tri_state_buffer_3bit_0 : tri_state_buffer_3bit
    PORT MAP(
        inputTri => Adder_3,
        outputTri => Output,
        EN => NOTSel);
    tri_state_buffer_3bit_1 : tri_state_buffer_3bit
    PORT MAP(
        inputTri => JUMP_TO,
        outputTri => Output,
        EN => Selector);

    NOTSel <= NOT Selector;

END Behavioral;