library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Adder_3_bit_sim is
--  Port ( );
end Adder_3_bit_sim;

architecture Behavioral of Adder_3_bit_sim is

COMPONENT Adder_3_bit
    PORT( AA : in STD_LOGIC_Vector (2 downto 0); --set input and output ports
          SS : out STD_LOGIC_Vector (2 downto 0)
          );
END COMPONENT;

signal AA : STD_LOGIC_VECTOR (2 downto 0);
signal SS : STD_LOGIC_VECTOR (2 downto 0);

begin

UUT: Adder_3_bit PORT MAP( --map relevant ports to the RCA circuit
    AA => AA,
    SS => SS
);
process
    begin
    -- A = 000
    AA <="000";    
    
    WAIT FOR 100 ns;  --change inputs
    -- A = 001
    AA <="001";
    
    WAIT FOR 100 ns;  --change inputs
    -- A = 010
    AA <="010";
    
    WAIT FOR 100 ns;  --change inputs
    -- A = 011
    AA <="011";
    
    WAIT FOR 100 ns;  --change inputs
    -- A = 100
    AA <="100";
    
    WAIT FOR 100 ns; --change inputs
    -- A = 101
    AA <="101";
    
    WAIT FOR 100 ns; --change inputs
    -- A = 110
    AA <="110";
    
    WAIT FOR 100 ns; --change inputs
    -- A = 111
    AA <="111";
    
    WAIT;
    
    end process;
end Behavioral;
