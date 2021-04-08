LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY RegisterBank IS
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
        R7 : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
        R8 : OUT STD_LOGIC_VECTOR (3 DOWNTO 0));
END RegisterBank;

ARCHITECTURE Behavioral OF RegisterBank IS

    -- Add Registers to the Program counter
    COMPONENT Reg
        PORT (
            D : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
            Enable : IN STD_LOGIC;
            Clk : IN STD_LOGIC;
            Res : IN STD_LOGIC;
            Q : OUT STD_LOGIC_VECTOR (3 DOWNTO 0));
    END COMPONENT;

    -- Add Slow Clock to the program counter
    COMPONENT Slow_Clock
        PORT (
            Clk_In : IN STD_LOGIC;
            Clk_Out : OUT STD_LOGIC
        );
    END COMPONENT;

    COMPONENT Decoder_3_to_8
        PORT (
            I : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
            Y : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
            Enable : IN STD_LOGIC);
    END COMPONENT;

    SIGNAL Clk_slow : STD_LOGIC;
    SIGNAL Y : STD_LOGIC_VECTOR(7 DOWNTO 0);

BEGIN
    Decoder_3_to_8_0 : Decoder_3_to_8
    PORT MAP(
        I => I,
        Enable => Enable,
        Y => Y
    );
    Slow_clock0 : Slow_Clock
    PORT MAP(
        Clk_In => Clk,
        Clk_Out => Clk_slow
    );
    Reg0 : Reg
    PORT MAP(
        D => "0000",
        Enable => Y(0),
        Clk => Clk_slow,
        Res => Res,
        Q => R0
    );
    Reg1 : Reg
    PORT MAP(
        D => D,
        Enable => Y(1),
        Clk => Clk_slow,
        Res => Res,
        Q => R1
    );
    Reg2 : Reg
    PORT MAP(
        D => D,
        Enable => Y(2),
        Clk => Clk_slow,
        Res => Res,
        Q => R2
    );
    Reg3 : Reg
    PORT MAP(
        D => D,
        Enable => Y(3),
        Clk => Clk_slow,
        Res => Res,
        Q => R3
    );
    Reg4 : Reg
    PORT MAP(
        D => D,
        Enable => Y(4),
        Clk => Clk_slow,
        Res => Res,
        Q => R4
    );
    Reg5 : Reg
    PORT MAP(
        D => D,
        Enable => Y(5),
        Clk => Clk_slow,
        Res => Res,
        Q => R5
    );
    Reg6 : Reg
    PORT MAP(
        D => D,
        Enable => Y(6),
        Clk => Clk_slow,
        Res => Res,
        Q => R6
    );
    Reg7 : Reg
    PORT MAP(
        D => D,
        Enable => Y(7),
        Clk => Clk_slow,
        Res => Res,
        Q => R7
    );

END Behavioral;