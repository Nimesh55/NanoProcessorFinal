library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Decoder_3_to_8_sim is
--  Port ( );
end Decoder_3_to_8_sim;

architecture Behavioral of Decoder_3_to_8_sim is

component Decoder_3_to_8
        PORT( I : in std_logic_vector(2 downto 0);
              Y : out std_logic_vector(7 downto 0);
              Enable: in std_logic);
    end component;

signal I : std_logic_vector(2 downto 0);
signal Y : std_logic_vector(7 downto 0);
signal Enable: std_logic;

begin
uut: Decoder_3_to_8 port map(
 I(2 downto 0) => I(2 downto 0),
 Enable => Enable,
 Y(7 downto 0) => Y(7 downto 0)
 
);
--190222P - 101 110 011 100 001 110
process
    begin
        
        Enable <= '1';
        I <= "001";            
        WAIT FOR 50 ns;
        
        Enable <= '1';
        I <= "100";            
        WAIT FOR 50 ns;
        
        Enable <= '1';
        I <= "011";            
        WAIT FOR 50 ns;
        
        Enable <= '1';
        I <= "110";            
        WAIT FOR 50 ns;
        
        Enable <= '1';
        I <= "101";            
        WAIT FOR 50 ns;
        
        Enable <= '1';
        I <= "000";            
        WAIT FOR 50 ns;        
                
        Enable <= '1';
        I <= "111";            
        WAIT FOR 50 ns;

        Enable <= '0';
        I <= "001";            
        WAIT FOR 50 ns;
        
        Enable <= '0';
        I <= "100";            
        WAIT FOR 50 ns;
        
        Enable <= '0';
        I <= "011";            
        WAIT FOR 50 ns;
        
        Enable <= '0';
        I <= "110";            
        WAIT FOR 50 ns;
        
        Enable <= '0';
        I <= "101";            
        WAIT FOR 50 ns;
        
        Enable <= '0';
        I <= "000";            
        WAIT FOR 50 ns;        
                
        Enable <= '0';
        I <= "111";            
        WAIT;
    end process;
end Behavioral;
