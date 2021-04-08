library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity D_FFR is
    Port ( D : in STD_LOGIC;
           Res : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Q : out STD_LOGIC;
           En : in STD_LOGIC;
           Qbar : out STD_LOGIC);
end D_FFR;

architecture Behavioral of D_FFR is
    signal D_sig : std_logic;
    signal Q_sig : std_logic;
begin
    process(Clk) begin        
        if(rising_edge(Clk)) then
            if EN = '0' then
                D_sig<=Q_sig;
            else
                D_sig<=D;
            end if;
            if Res='1' then
                D_sig<='0';
                Q<='0';
                Qbar<='1';
                Q_sig<='0';
            else
                Q<=D_sig;
                Q_sig<=D_sig;
                Qbar<=not D_sig;
            end if;
        end if;
    end process;
        
end Behavioral;
