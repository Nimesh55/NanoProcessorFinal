library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--set needed inputs and outputs ports(buses, ports)
entity Decoder_2_to_4 is
    Port ( I : in STD_LOGIC_VECTOR (1 downto 0);
           EN : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (3 downto 0));
end Decoder_2_to_4;

architecture Behavioral of Decoder_2_to_4 is

--Given relevant boolean equations for each bus line in Y
begin
Y(3) <= EN and I(0) and I(1);
Y(2) <= EN and (not(I(0))) and I(1);
Y(1) <= EN and I(0) and (not(I(1)));
Y(0) <= EN and (not(I(0))) and (not(I(1)));

end Behavioral;
