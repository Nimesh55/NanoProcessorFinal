
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
ENTITY Reg_sim IS
    --  Port ( );
END Reg_sim;

ARCHITECTURE Behavioral OF Reg_sim IS
    COMPONENT Reg
        PORT (
            D : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
            Enable : IN STD_LOGIC;
            Clk : IN STD_LOGIC;
            Res : IN STD_LOGIC;
            Q : OUT STD_LOGIC_VECTOR (3 DOWNTO 0));
    END COMPONENT;

    SIGNAL Enable, Clk, Res : STD_LOGIC;
    SIGNAL D : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL Q : STD_LOGIC_VECTOR(3 DOWNTO 0);
    CONSTANT clock_period : TIME := 10ns;

BEGIN
    uut : Reg PORT MAP(
        D => D,
        Enable => Enable,
        Clk => Clk,
        Res => Res,
        Q => Q
    );
    clock_process : PROCESS
    BEGIN
        Clk <= '0';
        WAIT FOR clock_period/2;
        Clk <= '1';
        WAIT FOR clock_period/2;
    END PROCESS;

    sim : PROCESS
    BEGIN
        Res <= '1';
        WAIT FOR 100ns;

        Res <= '0';
        D <= "1010";
        Enable <= '1';
        WAIT FOR 100ns;

        Res <= '0';
        D <= "0101";
        Enable <= '0';
        WAIT FOR 100ns;

        Res <= '1';
        WAIT FOR 100ns;

        WAIT;

    END PROCESS;
END Behavioral;