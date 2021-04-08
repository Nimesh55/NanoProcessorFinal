LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY Add_Sub_unit IS
    PORT (
        AA : IN STD_LOGIC_VECTOR (3 DOWNTO 0); --first number
        BB : IN STD_LOGIC_VECTOR (3 DOWNTO 0); --second number
        SS : OUT STD_LOGIC_VECTOR (3 DOWNTO 0); --get result on this
        Sel : IN STD_LOGIC; --Select add or substract using this
        Zero : OUT STD_LOGIC; -- Zero flag
        Overflow : OUT STD_LOGIC; --Overflow flag
        Carry : OUT STD_LOGIC; -- carry flag
        Negative : OUT STD_LOGIC --Negative flag
    );
END Add_Sub_unit;

ARCHITECTURE Behavioral OF Add_Sub_unit IS

    -- Implemented using the Full Adder which created in Lab 3
    COMPONENT FA --defining full adder circuit with its ports
        PORT (
            A : IN STD_LOGIC;
            B : IN STD_LOGIC;
            C_in : IN STD_LOGIC;
            S : OUT STD_LOGIC;
            C_out : OUT STD_LOGIC);
    END COMPONENT;

    SIGNAL FA0_C, FA1_C, FA2_C, FA3_C : STD_LOGIC;

    --These are used to keep values for use in logical operations
    SIGNAL BBU : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL SSU : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL C : STD_LOGIC; -- used to keep final value of C_out
    SIGNAL Overflow_flag : STD_LOGIC; -- used to keep overflow flag value

BEGIN
    FA_0 : FA --full adder 01
    PORT MAP(
        A => AA(0),
        B => BBU(0),
        C_in => Sel, -- Get selector value to this
        S => SSU(0),
        C_Out => FA0_C);

    FA_1 : FA -- full adder 02
    PORT MAP(
        A => AA(1),
        B => BBU(1),
        C_in => FA0_C, --input carry bit from FA_0
        S => SSU(1),
        C_Out => FA1_C);

    FA_2 : FA --full adder 03
    PORT MAP(
        A => AA(2),
        B => BBU(2),
        C_in => FA1_C, --input carry bit from FA_1
        S => SSU(2),
        C_Out => FA2_C);

    FA_3 : FA --full adder 04
    PORT MAP(
        A => AA(3),
        B => BBU(3),
        C_in => FA2_C, --input carry bit from FA_2
        S => SSU(3),
        C_Out => C);

    -- If SEL = 1, we have B XOR 1 = B and C_in = 1 == perform as a subtractor
    -- If SEL = 0, we have B XOR 1 = Not(B) and C_in = 0  == perform as an adder

    BBU(0) <= Sel XOR BB(0);
    BBU(1) <= Sel XOR BB(1);
    BBU(2) <= Sel XOR BB(2);
    BBU(3) <= Sel XOR BB(3);

    SS <= SSU;--outputs

    --Get overflow flag value and give it to the overflow flag
    Overflow_flag <= ((AA(3) AND BBU(3) AND NOT(SSU(3))) OR (NOT(AA(3)) AND NOT(BBU(3)) AND SSU(3)));
    Overflow <= Overflow_flag; --This is the overflow flag
    Zero <= NOT(SSU(0) OR SSU(1) OR SSU(2) OR SSU(3) OR C); --This is the zero flag
    Negative <= SSU(3) AND NOT(Overflow_flag); -- This is the negative flag
    Carry <= C; --This is the carry flag

END Behavioral;