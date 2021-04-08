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
            Enable : in std_logic;
            Zero_Flag : OUT STD_LOGIC;
            Overflow_Flag : OUT STD_LOGIC;
            Carry_Flag : OUT STD_LOGIC;
            Negative_Flag : OUT STD_LOGIC;
            jmp_flag : OUT STD_LOGIC;
            Reg0 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
            Reg1 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
            Reg2 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
            Reg3 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
            Reg4 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
            Reg5 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
            Reg6 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
            Reg7 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
            Num1 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
            Num2 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
            Instruction_next : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
            instructions : OUT STD_LOGIC_VECTOR(11 DOWNTO 0);
            SD_7_display : OUT STD_LOGIC_VECTOR(6 DOWNTO 0));

    END COMPONENT;

    SIGNAL Reset, Clk, jmp_flag, Negative_Flag, Carry_Flag, Overflow_Flag, Zero_Flag,Enable : STD_LOGIC;
    SIGNAL Num2, Num1, Reg7, Reg6, Reg5, Reg4, Reg3, Reg2, Reg1, Reg0 : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL Instruction_next : STD_LOGIC_VECTOR(2 DOWNTO 0);
    SIGNAL instructions : STD_LOGIC_VECTOR(11 DOWNTO 0);
    SIGNAL SD_7_display : STD_LOGIC_VECTOR(6 DOWNTO 0);
    CONSTANT clock_period : TIME := 1ns;
BEGIN
    uut : NanoProcessor PORT MAP(
        Reset => Reset,
        Clk => Clk,
        Enable=>Enable,
        Zero_Flag => Zero_Flag,
        Overflow_Flag => Overflow_Flag,
        Carry_Flag => Carry_Flag,
        Negative_Flag => Negative_Flag,
        jmp_flag => jmp_flag,
        Reg0 => Reg0,
        Reg1 => Reg1,
        Reg2 => Reg2,
        Reg3 => Reg3,
        Reg4 => Reg4,
        Reg5 => Reg5,
        Reg6 => Reg6,
        Reg7 => Reg7,
        Num1 => Num1,
        Num2 => Num2,
        Instruction_next => Instruction_next,
        instructions => instructions,
        SD_7_display => SD_7_display
    );
    clock_process : PROCESS
    BEGIN
        Clk <= '0';
        WAIT FOR clock_period/2;
        Clk <= '1';
        WAIT FOR clock_period/2;
    END PROCESS;

    sim:process
        begin
            Enable<='1';
            Reset<='1';
            wait for 100ns;
            Enable<='1';
            Reset<='0';
            wait;
        end process;
            
END Behavioral;