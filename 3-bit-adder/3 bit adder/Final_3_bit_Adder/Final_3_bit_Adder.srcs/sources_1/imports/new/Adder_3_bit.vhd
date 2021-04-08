library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Adder_3_bit is
    Port ( AA : in STD_LOGIC_Vector (2 downto 0); --first number
           SS : out STD_LOGIC_Vector (2 downto 0) --get result on this
           ); 
end Adder_3_bit;

architecture Behavioral of Adder_3_bit is
component FA --defining full adder circuit with its ports
port (
    A: in std_logic;
    B: in std_logic;
    C_in: in std_logic;
    S: out std_logic;
    C_out: out std_logic);
end component;

SIGNAL FA0_C, FA1_C, FA2_C : std_logic;

begin
    FA_0 : FA --full adder 01
        port map (
        A => AA(0),
        B => '1', --add 1
        C_in => '0', -- Get selector value to this
        S => SS(0),
        C_Out => FA0_C);
        
    FA_1 : FA  -- full adder 02
        port map (
        A => AA(1),
        B => '0',
        C_in => FA0_C, --input carry bit from FA_0
        S => SS(1),
        C_Out => FA1_C);
        
    FA_2 : FA  --full adder 04
        port map (
        A => AA(2),
        B => '0',
        C_in => FA1_C, --input carry bit from FA_2
        S => SS(2),
        C_Out => FA2_C); 

end Behavioral;
