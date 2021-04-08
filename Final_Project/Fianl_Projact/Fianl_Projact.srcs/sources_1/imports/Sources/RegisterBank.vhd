
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY RegisterBank IS
    PORT (
        Clk : IN STD_LOGIC; --Cloak
        Res : IN STD_LOGIC; --Reset
        R0 : OUT STD_LOGIC_VECTOR (3 DOWNTO 0); --Register 1
        R1 : OUT STD_LOGIC_VECTOR (3 DOWNTO 0); --Register 2
        R2 : OUT STD_LOGIC_VECTOR (3 DOWNTO 0); --Register 3
        R3 : OUT STD_LOGIC_VECTOR (3 DOWNTO 0); --Register 4
        R4 : OUT STD_LOGIC_VECTOR (3 DOWNTO 0); --Register 5
        R5 : OUT STD_LOGIC_VECTOR (3 DOWNTO 0); --Register 6
        R6 : OUT STD_LOGIC_VECTOR (3 DOWNTO 0); --Register 7
        R7 : OUT STD_LOGIC_VECTOR (3 DOWNTO 0); --Register 8
        D : IN STD_LOGIC_VECTOR (3 DOWNTO 0); --Data bus
        X : IN STD_LOGIC_VECTOR (2 DOWNTO 0)); --Instruction

END RegisterBank;

ARCHITECTURE Behavioral OF RegisterBank IS

    COMPONENT Reg --Register component
        PORT (
            D : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
            En : IN STD_LOGIC;
            Clk : IN STD_LOGIC;
            Q : OUT STD_LOGIC_VECTOR (3 DOWNTO 0));
    END COMPONENT;
    COMPONENT Decoder_3_to_8 -- Three to Eight decoder component
        PORT (
            I : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
            EN : IN STD_LOGIC;
            Y : OUT STD_LOGIC_VECTOR (7 DOWNTO 0));
    END COMPONENT;

    SIGNAL Y0, Y1 : STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL D_sig : STD_LOGIC_VECTOR(3 DOWNTO 0);

BEGIN
    Decoder_3_to_8_0 : Decoder_3_to_8 --3 to 8 decoder
    PORT MAP(
        I => X (2 DOWNTO 0),
        EN => '1',
        Y => Y1
    );

    Reg0 : Reg --Register 01 
    PORT MAP(
        D => "0000",
        En => '1',
        Clk => Clk,
        Q => R0
    );

    Reg1 : Reg --Register 02 
    PORT MAP(
        D => D_sig,
        En => Y0(1),
        Clk => Clk,
        Q => R1
    );
    Reg2 : Reg --Register 03 
    PORT MAP(
        D => D_sig,
        En => Y0(2),
        Clk => Clk,
        Q => R2);
    Reg3 : Reg --Register 04
    PORT MAP(
        D => D_sig,
        En => Y0(3),
        Clk => Clk,
        Q => R3
    );

    Reg4 : Reg --Register 05
    PORT MAP(
        D => D_sig,
        En => Y0(4),
        Clk => Clk,
        Q => R4
    );

    Reg5 : Reg --Register 06
    PORT MAP(
        D => D_sig,
        En => Y0(5),
        Clk => Clk,
        Q => R5
    );

    Reg6 : Reg --Register 07
    PORT MAP(
        D => D_sig,
        En => Y0(6),
        Clk => Clk,
        Q => R6
    );

    Reg7 : Reg --Register 08
    PORT MAP(
        D => D_sig,
        En => Y0(7),
        Clk => Clk,
        Q => R7
    );
    D_sig <= "0000" WHEN(Res = '1') ELSE
        D;
    Y0 <= "11111111" WHEN (Res = '1') ELSE
        Y1;
END Behavioral;