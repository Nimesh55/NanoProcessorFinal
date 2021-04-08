LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY Adder_3_bit IS
    PORT (
        AA : IN STD_LOGIC_VECTOR (2 DOWNTO 0); --first number
        SS : OUT STD_LOGIC_VECTOR (2 DOWNTO 0) --get result on this
    );
END Adder_3_bit;

ARCHITECTURE Behavioral OF Adder_3_bit IS
    COMPONENT FA --defining full adder circuit with its ports
        PORT (
            A : IN STD_LOGIC;
            B : IN STD_LOGIC;
            C_in : IN STD_LOGIC;
            S : OUT STD_LOGIC;
            C_out : OUT STD_LOGIC);
    END COMPONENT;

    SIGNAL FA0_C, FA1_C, FA2_C : STD_LOGIC;

BEGIN
    FA_0 : FA --full adder 01
    PORT MAP(
        A => AA(0),
        B => '1', --add 1
        C_in => '0', -- Get selector value to this
        S => SS(0),
        C_Out => FA0_C);

    FA_1 : FA -- full adder 02
    PORT MAP(
        A => AA(1),
        B => '0',
        C_in => FA0_C, --input carry bit from FA_0
        S => SS(1),
        C_Out => FA1_C);

    FA_2 : FA --full adder 04
    PORT MAP(
        A => AA(2),
        B => '0',
        C_in => FA1_C, --input carry bit from FA_2
        S => SS(2),
        C_Out => FA2_C);

END Behavioral;