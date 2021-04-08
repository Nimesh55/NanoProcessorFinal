LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY Adder_3_bit IS
    PORT (
        AA : IN STD_LOGIC_VECTOR (2 DOWNTO 0); --first number
        SS : OUT STD_LOGIC_VECTOR (2 DOWNTO 0) --get result on this
    );
END Adder_3_bit;

ARCHITECTURE Behavioral OF Adder_3_bit IS
    COMPONENT HA --defining half adder circuit with its ports
        PORT (
            A : IN STD_LOGIC;
            B : IN STD_LOGIC;
            S : OUT STD_LOGIC;
            C : OUT STD_LOGIC);
    END COMPONENT;

    SIGNAL HA0_C, HA1_C : STD_LOGIC;

BEGIN
    HA_0 : HA --half adder 01
    PORT MAP(
        A => AA(0),
        B => '1', --add 1
        S => SS(0),
        C => HA0_C);

    HA_1 : HA --half adder 02
    PORT MAP(
        A => AA(1),
        B => HA0_C,
        S => SS(1),
        C => HA1_C);

    HA_2 : HA --half adder 03
    PORT MAP(
        A => AA(2),
        B => HA1_C,
        S => SS(2));

END Behavioral;