LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY MUX_2_way_3_bit IS
    PORT (
        Adder_3 : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
        JUMP_TO : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
        Selector : IN STD_LOGIC;
        Out_put : OUT STD_LOGIC_VECTOR(2 DOWNTO 0));
END MUX_2_way_3_bit;

ARCHITECTURE Behavioral OF MUX_2_way_3_bit IS

    COMPONENT Decoder_1_to_2
        PORT (
            I : IN STD_LOGIC;
            EN : IN STD_LOGIC;
            Y : OUT STD_LOGIC_VECTOR(1 DOWNTO 0));
    END COMPONENT;

    COMPONENT tri_state_buffer_3bit
        PORT (
            inputTri : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
            outputTri : OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
            EN : IN STD_LOGIC);
    END COMPONENT;

    SIGNAL RegSel : STD_LOGIC_VECTOR (1 DOWNTO 0);

BEGIN
    Decoder : Decoder_1_to_2
    PORT MAP(
        I => Selector,
        EN => '1',
        Y => RegSel);

    tri_state_buffer_3bit_0 : tri_state_buffer_3bit
    PORT MAP(
        inputTri => Adder_3,
        outputTri => Out_put,
        EN => RegSel(0));
    tri_state_buffer_3bit_1 : tri_state_buffer_3bit
    PORT MAP(
        inputTri => JUMP_TO,
        outputTri => Out_put,
        EN => RegSel(1));

END Behavioral;