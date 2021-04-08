library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Decoder_2_to_4_sim is
--  Port ( );
end Decoder_2_to_4_sim;

architecture Behavioral of Decoder_2_to_4_sim is
    component Decoder_2_to_4
        Port ( I : in STD_LOGIC_VECTOR (1 downto 0);
               Enable : in STD_LOGIC;
               Y : out STD_LOGIC_VECTOR (3 downto 0));
    end component;
    
    signal I : STD_LOGIC_VECTOR (1 downto 0);
    signal Enable : STD_LOGIC;
    signal Y : STD_LOGIC_VECTOR (3 downto 0);
        
begin
    uut:Decoder_2_to_4 port map(
            I(1 downto 0) => I(1 downto 0),
            Enable => Enable,
            Y(3 downto 0) => Y(3 downto 0));
process
    begin
        I(0)<='0';
        I(1)<='0';
        Enable<='1';
        wait for 100 ns;
        
        I(0)<='0';
        I(1)<='1';
        Enable<='1';
        wait for 100 ns;
        
        I(0)<='1';
        I(1)<='0';
        Enable<='1';
        wait for 100 ns;
        
        I(0)<='1';
        I(1)<='1';
        Enable<='1';
        wait for 100 ns;
        
        I(0)<='0';
        I(1)<='0';
        Enable<='0';
        wait for 100 ns;
        
        I(0)<='0';
        I(1)<='1';
        Enable<='0';
        wait for 100 ns;
        
        I(0)<='1';
        I(1)<='0';
        Enable<='0';
        wait for 100 ns;
        
        I(0)<='1';
        I(1)<='1';
        Enable<='0';
        wait;
    
    end process;
end Behavioral;
