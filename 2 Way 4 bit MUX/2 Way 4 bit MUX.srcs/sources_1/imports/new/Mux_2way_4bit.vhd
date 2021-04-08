LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY MUX_2_way_4_bit IS
    PORT (
        AddSubValue : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
        InsDecValue : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
        OutputValue : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
        Selector : IN STD_LOGIC);--'0' for addsub and '1' for insdec
END MUX_2_way_4_bit;

ARCHITECTURE Behavioral OF MUX_2_way_4_bit IS
    COMPONENT tri_state_buffer
        PORT (
            inputTri : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
            outputTri : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
            EN : IN STD_LOGIC);
    END COMPONENT;
    SIGNAL NOTSel : STD_LOGIC;
BEGIN
    tri_state_buffer_0 : tri_state_buffer
    PORT MAP(
        inputTri => AddSubValue,
        outputTri => OutputValue,
        EN => NOTSel);
    tri_state_buffer_1 : tri_state_buffer
    PORT MAP(
        inputTri => InsDecValue,
        outputTri => OutputValue,
        EN => Selector);

    NOTSel <= NOT Selector;

END Behavioral;