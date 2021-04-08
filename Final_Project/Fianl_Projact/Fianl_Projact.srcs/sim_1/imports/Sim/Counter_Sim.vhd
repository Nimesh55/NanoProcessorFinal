library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Counter_Sim is
end Counter_Sim;

architecture Behavioral of Counter_Sim is

    Component Counter
    Port ( 
        Next_Ins : in std_logic_vector(2 downto 0);
        Res : in STD_LOGIC;
        Clk : in STD_LOGIC;
        Current_Ins : out std_logic_vector(2 downto 0));
    end component;

    signal Res, Clk : std_logic;
    signal Next_Ins : std_logic_vector(2 downto 0);
    signal Current_Ins : std_logic_vector(2 downto 0);
    constant clock_period : time := 100ns; --setting a clock period

begin
    UUT:Counter port map(
        Next_Ins=>Next_Ins,
        Res=>Res,
        Clk=>Clk,
        Current_Ins=>Current_Ins
    );

    clock_process:process 
        begin
            Clk<='0';
            wait for clock_period/2;
            Clk<='1';
            wait for clock_period/2;
    end process;

    sim:process
        begin
            Res<='1';
            wait for 100ns;

            Res<='0';
            Next_Ins<="001";
            wait for 100ns;
            
            Next_Ins<="010";
            wait for 100ns;

            Next_Ins<="011";
            wait for 100ns;

            Next_Ins<="100";
            wait for 100ns;

            Next_Ins<="101";
            wait for 100ns;

            Next_Ins<="110";
            wait for 100ns;

            Next_Ins<="111";
            wait for 100ns;

            Res<='1';
            wait for 200ns;

            wait;
        end process;
end Behavioral;