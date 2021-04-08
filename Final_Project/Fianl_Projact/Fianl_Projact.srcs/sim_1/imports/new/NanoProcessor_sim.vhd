LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY NanoProcessor_sim IS
    --  Port ( );
END NanoProcessor_sim;

ARCHITECTURE Behavioral OF NanoProcessor_sim IS
    COMPONENT NanoProcessor
        PORT (
            Reset : IN STD_LOGIC;
            Clk : IN STD_LOGIC;
            Zero_Flag : OUT STD_LOGIC;
            Overflow_Flag : OUT STD_LOGIC;
            Carry_Flag : OUT STD_LOGIC;
            Negative_Flag : OUT STD_LOGIC;
            Reg7 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
            SD_7_display : OUT STD_LOGIC_VECTOR(6 DOWNTO 0));

    END COMPONENT;

    SIGNAL Reset, Clk, Negative_Flag, Carry_Flag, Overflow_Flag, Zero_Flag : STD_LOGIC;
    SIGNAL Reg7 : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL SD_7_display : STD_LOGIC_VECTOR(6 DOWNTO 0);
    CONSTANT clock_period : TIME := 10ns;
BEGIN
    uut : NanoProcessor PORT MAP(
        Reset => Reset,
        Clk => Clk,
        Zero_Flag => Zero_Flag,
        Overflow_Flag => Overflow_Flag,
        Carry_Flag => Carry_Flag,
        Negative_Flag => Negative_Flag,
        Reg7 => Reg7,
        SD_7_display => SD_7_display
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

        Reset <= '1';
        WAIT FOR 100ns;

        Reset <= '0';
        WAIT;
    END PROCESS;

END Behavioral;