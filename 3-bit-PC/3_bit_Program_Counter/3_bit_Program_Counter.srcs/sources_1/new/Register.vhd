
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
ENTITY REGISTER IS
    PORT (
        D : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
        Res : IN STD_LOGIC;
        Enable : IN STD_LOGIC;
        Q : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
        Clk : IN STD_LOGIC);
END REGISTER;

ARCHITECTURE Behavioral OF REGISTER IS
    -- Add D Flip Flops to the Program counter
    COMPONENT D_FF
        PORT (
            D : IN STD_LOGIC;
            Res : IN STD_LOGIC;
            Clk : IN STD_LOGIC;
            Q : OUT STD_LOGIC;
            Qbar : OUT STD_LOGIC
        );
    END COMPONENT;

    -- Add Slow Clock to the program counter
    COMPONENT Slow_Clock
        PORT (
            Clk_In : IN STD_LOGIC;
            Clk_Out : OUT STD_LOGIC
        );
    END COMPONENT;

    SIGNAL D0, D1, D2 : STD_LOGIC;
    SIGNAL Clk_slow : STD_LOGIC;

BEGIN

    D_FF0 : D_FF
    PORT MAP(
        D => D(0),
        Res => Res,
        Clk => Clk_slow,
        Q => Q(0)

    );
    D_FF1 : D_FF
    PORT MAP(
        D => D(1),
        Res => Res,
        Clk => Clk_slow,
        Q => Q(1)

    );
    D_FF2 : D_FF
    PORT MAP(
        D => D(2),
        Res => Res,
        Clk => Clk_slow,
        Q => Q(2)

    );
    D_FF2 : D_FF
    PORT MAP(
        D => D(3),
        Res => Res,
        Clk => Clk_slow,
        Q => Q(3)

    );

END Behavioral;