LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY Counter IS
    PORT (
        Next_Ins : IN STD_LOGIC_VECTOR(2 DOWNTO 0); --Next INstruction
        Res : IN STD_LOGIC; --Reset
        Clk : IN STD_LOGIC; --Clock
        Current_Ins : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)); -- Current Instruction
END Counter;

ARCHITECTURE Behavioral OF Counter IS

    -- Add D Flip Flops to the Program counter
    -- Implemented using previous Lab
    COMPONENT D_FF
        PORT (
            D : IN STD_LOGIC;
            Res : IN STD_LOGIC;
            Clk : IN STD_LOGIC;
            Q : OUT STD_LOGIC
        );
    END COMPONENT;

BEGIN

    D_FF0 : D_FF --First D-Flip Flop
    PORT MAP(
        D => Next_Ins(0),
        Res => Res,
        Clk => Clk,
        Q => Current_Ins(0)
    );

    D_FF1 : D_FF --Second D-Flip Flop
    PORT MAP(
        D => Next_Ins(1),
        Res => Res,
        Clk => Clk,
        Q => Current_Ins(1)
    );

    D_FF2 : D_FF --Third D-Flip Flop
    PORT MAP(
        D => Next_Ins(2),
        Res => Res,
        Clk => Clk,
        Q => Current_Ins(2)
    );
END Behavioral;