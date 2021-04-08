library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity HA is
    Port ( A : in STD_LOGIC; --set input and output ports
           B : in STD_LOGIC;
           S : out STD_LOGIC;
           C : out STD_LOGIC);
end HA;

architecture Behavioral of HA is

begin

S <= A xor B;  --Get value for sum
C <= A and B;  --Get value for carry

end Behavioral;
