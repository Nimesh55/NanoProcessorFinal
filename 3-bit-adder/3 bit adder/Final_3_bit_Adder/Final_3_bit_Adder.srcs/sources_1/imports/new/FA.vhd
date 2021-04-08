library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Full adder is created using 2 Half adders
-- Simply added by Lab 3

entity FA is
    Port ( A : in STD_LOGIC; --Set input and output ports
           B : in STD_LOGIC;
           C_in : in STD_LOGIC;
           S : out STD_LOGIC;
           C_out : out STD_LOGIC);
end FA;

architecture Behavioral of FA is

component HA  
        port (  
        A: in std_logic;  --define relevant ports for HA(half adder) circuit
        B: in std_logic;  
        S: out std_logic;
        C: out std_logic);  
    end component;

SIGNAL HA0_S, HA0_C, HA1_S, HA1_C : std_logic; --make four extra logic ports for sum and carry bits in both half adders

begin
    HA_0 : HA  
        port map (  
        A => A,  
        B => B,  
        S => HA0_S,  
        C => HA0_C); 

    HA_1 : HA  
        port map (  
        A => HA0_S, --give sum bit of previous adder to second adder as an input 
        B => C_in,  
        S => HA1_S,  
        C => HA1_C);
        
S <= HA1_S; --Get sum for full adder using adders outputs
C_out <= HA1_C OR HA0_C; --Get carry bit for full adder by using two carry bits in adders   

end Behavioral;
