LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY RegisterBank_sim IS
    --  Port ( );
END RegisterBank_sim;

ARCHITECTURE Behavioral OF RegisterBank_sim IS

    COMPONENT RegisterBank
        PORT (
            D : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
            I : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
            Clk : IN STD_LOGIC;
            Enable : IN STD_LOGIC;
            Res : IN STD_LOGIC;
            R0 : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
            R1 : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
            R2 : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
            R3 : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
            R4 : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
            R5 : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
            R6 : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
            R7 : OUT STD_LOGIC_VECTOR (3 DOWNTO 0));

    END COMPONENT;
    COMPONENT Decoder_3_to_8
        PORT (
            I : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
            Y : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
            Enable : IN STD_LOGIC
        );
    END COMPONENT;

    SIGNAL I : STD_LOGIC_VECTOR (2 DOWNTO 0);
    SIGNAL Y : STD_LOGIC_VECTOR (7 DOWNTO 0);
    SIGNAL D : STD_LOGIC_VECTOR (3 DOWNTO 0);
    SIGNAL Clk : STD_LOGIC;
    SIGNAL Enable : STD_LOGIC;
    SIGNAL Res : STD_LOGIC;
    SIGNAL R0 : STD_LOGIC_VECTOR (3 DOWNTO 0);
    SIGNAL R1 : STD_LOGIC_VECTOR (3 DOWNTO 0);
    SIGNAL R2 : STD_LOGIC_VECTOR (3 DOWNTO 0);
    SIGNAL R3 : STD_LOGIC_VECTOR (3 DOWNTO 0);
    SIGNAL R4 : STD_LOGIC_VECTOR (3 DOWNTO 0);
    SIGNAL R5 : STD_LOGIC_VECTOR (3 DOWNTO 0);
    SIGNAL R6 : STD_LOGIC_VECTOR (3 DOWNTO 0);
    SIGNAL R7 : STD_LOGIC_VECTOR (3 DOWNTO 0);
    CONSTANT clock_period : TIME := 1ns;

BEGIN
    uut : RegisterBank PORT MAP(
        D => D,
        I => I,
        Clk => Clk,
        Enable => Enable,
        Res => Res,
        R0 => R0,
        R1 => R1,
        R2 => R2,
        R3 => R3,
        R4 => R4,
        R5 => R5,
        R6 => R6,
        R7 => R7
    );
    uut1 : Decoder_3_to_8 PORT MAP(
        I=>I,
        Y =>Y,
        Enable=>Enable
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
        -- D : in STD_LOGIC_VECTOR (3 downto 0);
        -- I : in STD_LOGIC_VECTOR (2 downto 0);
        -- Clk : in STD_LOGIC;
        -- Enable : in STD_LOGIC;
        -- Res : in STD_LOGIC;

        Enable <= '1';
        Res <= '1';
        WAIT FOR 100ns;

        Res <= '0';
        D <= "0010";
        I <= "000";
        WAIT FOR 100ns;
        
        Res <= '1';
        D <= "0010";
        I <= "010";
        WAIT FOR 100ns;
        
        Res <= '0';
        D <= "1010";
        I <= "110";
        WAIT FOR 100ns;
        
        Res <= '0';
        D <= "1011";
        I <= "101";
        WAIT FOR 100ns;
        
        Res <= '0';
        D <= "1011";
        I <= "011";
        WAIT FOR 100ns;

        WAIT;
    END PROCESS;
END Behavioral;