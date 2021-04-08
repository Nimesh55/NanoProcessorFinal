library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Add_Sub_unit is
    Port ( AA : in STD_LOGIC_Vector (3 downto 0); --first number
           BB : in STD_LOGIC_Vector (3 downto 0); --second number
           SS : out STD_LOGIC_Vector (3 downto 0); --get result on this
           Sel : in STD_LOGIC;  --Select add or substract using this
           Zero : out std_logic; -- Zero flag
           Overflow : out STD_LOGIC; --Overflow flag
           Carry : out STD_LOGIC; -- carry flag
           Negative: out STD_LOGIC --Negative flag
           ); 
end Add_Sub_unit;

architecture Behavioral of Add_Sub_unit is

-- Implemented using the Full Adder which created in Lab 3
component FA --defining full adder circuit with its ports
port (
    A: in std_logic;
    B: in std_logic;
    C_in: in std_logic;
    S: out std_logic;
    C_out: out std_logic);
end component;

SIGNAL FA0_C, FA1_C, FA2_C, FA3_C : std_logic;

--These are used to keep values for use in logical operations
SIGNAL BBU : STD_LOGIC_VECTOR(3 downto 0); 
SIGNAL SSU : STD_LOGIC_VECTOR(3 downto 0);
signal C : std_logic; -- used to keep final value of C_out
signal Overflow_flag : std_logic; -- used to keep overflow flag value

begin
    FA_0 : FA --full adder 01
        port map (
        A => AA(0),
        B => BBU(0),
        C_in => Sel, -- Get selector value to this
        S => SSU(0),
        C_Out => FA0_C);
        
    FA_1 : FA  -- full adder 02
        port map (
        A => AA(1),
        B => BBU(1),
        C_in => FA0_C, --input carry bit from FA_0
        S => SSU(1),
        C_Out => FA1_C);

    FA_2 : FA  --full adder 03
        port map (
        A => AA(2),
        B => BBU(2),
        C_in => FA1_C,  --input carry bit from FA_1
        S => SSU(2),
        C_Out => FA2_C);
        
    FA_3 : FA  --full adder 04
        port map (
        A => AA(3),
        B => BBU(3),
        C_in => FA2_C, --input carry bit from FA_2
        S => SSU(3),
        C_Out => C);

-- If SEL = 1, we have B XOR 1 = B and C_out = 1 == perform as a subtractor
-- If SEL = 0, we have B XOR 1 = Not(B) and C_in = 0  == perform as an adder

BBU(0) <= Sel XOR BB(0);
BBU(1) <= Sel XOR BB(1);
BBU(2) <= Sel XOR BB(2);
BBU(3) <= Sel XOR BB(3);

SS <= SSU;--outputs

--This get only overflow, not sign in minus numbers
Overflow_flag <= ((AA(3) and BBU(3) and not(SSU(3))) or (not(AA(3)) and not(BBU(3)) and SSU(3))); 
Overflow <= Overflow_flag;
Zero<= NOT(SSU(0) OR SSU(1) OR SSU(2) OR SSU(3) OR C); --This is the zero flag
Negative <= SSU(3) and not(Overflow_flag); -- This is the negative flag
Carry <= C; --This is the carry flag

end Behavioral;
