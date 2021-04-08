library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_Add_Sub_unit is
--  Port ( );
end TB_Add_Sub_unit;

architecture Behavioral of TB_Add_Sub_unit is

COMPONENT Add_Sub_unit
    PORT( AA : IN STD_LOGIC_VECTOR(3 downto 0); --set input and output ports
          BB : IN STD_LOGIC_VECTOR(3 downto 0);
          SS : OUT STD_LOGIC_VECTOR(3 downto 0);
          Sel : in STD_LOGIC;
          Zero : out std_logic;
          Carry : out STD_LOGIC;
          Overflow : inout STD_LOGIC;
          Negative : OUT STD_LOGIC);
END COMPONENT;

signal AA : STD_LOGIC_VECTOR (3 downto 0);
signal BB : STD_LOGIC_VECTOR (3 downto 0);
signal SS : STD_LOGIC_VECTOR (3 downto 0);
signal Sel,Zero,Overflow,Negative,Carry : STD_LOGIC;

begin

UUT: Add_Sub_unit PORT MAP( --map relevant ports to the RCA circuit
    AA => AA,
    BB => BB,
    Sel => Sel,
    SS => SS,
    Zero => Zero,
    Overflow => Overflow,
    Carry => Carry,
    Negative => Negative
);
process
begin
-- SS = 0010 + 0001
    AA <="0010";
    BB <="0001";
    Sel <= '0'; --Set to add operation

WAIT FOR 100 ns;  --change inputs
-- SS = 0111 + 0001
    AA <="0111";
    BB <="0001";
    Sel <= '0'; --Set to add operation

WAIT FOR 100 ns;  --change inputs
-- SS = 0111 - 0010
    AA <="0111";
    BB <="0010";
    Sel <= '1'; --Set to substract operation

WAIT FOR 100 ns;  --change inputs
-- SS = 1111 + 1111
    AA <="1111";
    BB <="1111";
    Sel <= '0'; --Set to add operation

WAIT FOR 100 ns;  --change inputs
-- SS = 0000 + 0000
    AA <="0000";
    BB <="0000";
    Sel <= '0'; --Set to add operation

WAIT FOR 100 ns; --change inputs
-- SS = 0001 + 0101
    AA <="0001";
    BB <="0101";
    Sel <= '0'; --Set to add operation

WAIT FOR 100 ns; --change inputs
-- SS = 1001 - 0010
    AA <="1001";
    BB <="0010";
    Sel <= '1'; --Set to substract operation

WAIT FOR 100 ns; --change inputs
-- SS = 1010 - 1100
    AA <="1010";
    BB <="1100";
    Sel <= '1'; --Set to add operation

WAIT;

end process;
end Behavioral;
