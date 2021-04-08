LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY MUX_8_way_4_bit IS
    PORT (
        Reg0 : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
        Reg1 : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
        Reg2 : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
        Reg3 : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
        Reg4 : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
        Reg5 : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
        Reg6 : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
        Reg7 : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
        RegValue : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
        RegSelection : IN STD_LOGIC_VECTOR (2 DOWNTO 0));
END MUX_8_way_4_bit;

ARCHITECTURE Behavioral OF MUX_8_way_4_bit IS
    COMPONENT Decoder_3_to_8
        PORT (
            I : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
            EN : IN STD_LOGIC;
            Y : OUT STD_LOGIC_VECTOR (7 DOWNTO 0));
    END COMPONENT;

    SIGNAL YY : STD_LOGIC_VECTOR(7 DOWNTO 0);

    COMPONENT tri_state_buffer
        PORT (
            inputTri : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
            outputTri : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
            EN : IN STD_LOGIC);
    END COMPONENT;
BEGIN

    Decoder_3_to_8_0 : Decoder_3_to_8
    PORT MAP(
        I => RegSelection,
        EN => '1',
        Y => YY);
    tri_state_buffer_0 : tri_state_buffer
    PORT MAP(
        inputTri => Reg0,
        EN => YY(0),
        outputTri => RegValue);
    tri_state_buffer_1 : tri_state_buffer
    PORT MAP(
        inputTri => Reg1,
        EN => YY(1),
        outputTri => RegValue);
    tri_state_buffer_2 : tri_state_buffer
    PORT MAP(
        inputTri => Reg2,
        EN => YY(2),
        outputTri => RegValue);
    tri_state_buffer_3 : tri_state_buffer
    PORT MAP(
        inputTri => Reg3,
        EN => YY(3),
        outputTri => RegValue);
    tri_state_buffer_4 : tri_state_buffer
    PORT MAP(
        inputTri => Reg4,
        EN => YY(4),
        outputTri => RegValue);
    tri_state_buffer_5 : tri_state_buffer
    PORT MAP(
        inputTri => Reg5,
        EN => YY(5),
        outputTri => RegValue);
    tri_state_buffer_6 : tri_state_buffer
    PORT MAP(
        inputTri => Reg6,
        EN => YY(6),
        outputTri => RegValue);
    tri_state_buffer_7 : tri_state_buffer
    PORT MAP(
        inputTri => Reg7,
        EN => YY(7),
        outputTri => RegValue);
END Behavioral;