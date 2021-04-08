library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX_8_way_4_bit_sim is
--  Port ( );
end MUX_8_way_4_bit_sim;

architecture Behavioral of MUX_8_way_4_bit_sim is
component MUX_8_way_4_bit
    Port ( Reg0 : in STD_LOGIC_VECTOR (3 downto 0);
           Reg1 : in STD_LOGIC_VECTOR (3 downto 0);
           Reg2 : in STD_LOGIC_VECTOR (3 downto 0);
           Reg3 : in STD_LOGIC_VECTOR (3 downto 0);
           Reg4 : in STD_LOGIC_VECTOR (3 downto 0);
           Reg5 : in STD_LOGIC_VECTOR (3 downto 0);
           Reg6 : in STD_LOGIC_VECTOR (3 downto 0);
           Reg7 : in STD_LOGIC_VECTOR (3 downto 0);
           RegValue : out STD_LOGIC_VECTOR (3 downto 0);
           RegSelection : in STD_LOGIC_VECTOR (2 downto 0));
end component;
signal Reg0,Reg1,Reg2,Reg3,Reg4,Reg5,Reg6,Reg7 : std_logic_vector(3 downto 0);
signal RegSelection : std_logic_vector(2 downto 0);
signal RegValue: std_logic_vector(3 downto 0);

begin
UUT : MUX_8_way_4_bit
port map(   Reg0(3 downto 0)=> Reg0(3 downto 0),
            Reg1(3 downto 0)=> Reg1(3 downto 0),
            Reg2(3 downto 0)=> Reg2(3 downto 0),
            Reg3(3 downto 0)=> Reg3(3 downto 0),
            Reg4(3 downto 0)=> Reg4(3 downto 0),
            Reg5(3 downto 0)=> Reg5(3 downto 0),
            Reg6(3 downto 0)=> Reg6(3 downto 0),
            Reg7(3 downto 0)=> Reg7(3 downto 0),
            RegValue(3 downto 0)=> RegValue(3 downto 0),
            RegSelection(2 downto 0)=> RegSelection(2 downto 0));

process 
begin

Reg0<="0000";
Reg1<="0001";
Reg2<="0010";
Reg3<="0011";
Reg4<="0100";
Reg5<="0101";
Reg6<="0110";
Reg7<="0111";


--Start changing selected register
RegSelection<="000";
WAIT FOR 100ns;
RegSelection<="001";
WAIT FOR 100ns;
RegSelection<="010";
WAIT FOR 100ns;
RegSelection<="011";
WAIT FOR 100ns;
RegSelection<="100";
WAIT FOR 100ns;
RegSelection<="101";
WAIT FOR 100ns;
RegSelection<="110";
WAIT FOR 100ns;
RegSelection<="111";
WAIT;

end process;
end Behavioral;
