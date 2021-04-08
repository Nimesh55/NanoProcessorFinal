LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY NanoProcessor IS
    PORT (
        Reset : IN STD_LOGIC;
        Clk : IN STD_LOGIC;
        Zero_Flag : OUT STD_LOGIC;
        Overflow_Flag : OUT STD_LOGIC;
        Carry_Flag : OUT STD_LOGIC;
        Negative_Flag : OUT STD_LOGIC;
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
        Instruction_Current: OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
        jmp_flag : OUT STD_LOGIC;
        instructions : OUT STD_LOGIC_VECTOR(11 DOWNTO 0);
        SD_7_display : OUT STD_LOGIC_VECTOR(6 DOWNTO 0));

END NanoProcessor;

ARCHITECTURE Behavioral OF NanoProcessor IS

    COMPONENT Slow_Clock
        PORT (
            Clk_in : IN STD_LOGIC;
            Clk_out : OUT STD_LOGIC);
    END COMPONENT;

    COMPONENT Counter
        PORT (
            Next_Ins : IN STD_LOGIC_VECTOR(2 DOWNTO 0) := "000"; --Next INstruction
            Res : IN STD_LOGIC := '1'; --Reset
            Clk : IN STD_LOGIC := '1'; --Clock
            Current_Ins : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)); -- Current Instruction
    END COMPONENT;

    COMPONENT Adder_3_bit
        PORT (
            AA : IN STD_LOGIC_VECTOR (2 DOWNTO 0); --first number
            SS : OUT STD_LOGIC_VECTOR (2 DOWNTO 0) --get result on this
        );
    END COMPONENT;

    COMPONENT MUX_2_way_4_bit
        PORT (
            AddSubValue : IN STD_LOGIC_VECTOR (3 DOWNTO 0) := "0000";
            InsDecValue : IN STD_LOGIC_VECTOR (3 DOWNTO 0) := "0000";
            OutputValue : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
            Selector : IN STD_LOGIC := '0' --'0' for addsub and '1' for insdec
        );
    END COMPONENT;

    COMPONENT MUX_2_way_3_bit
        PORT (
            Adder_3 : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
            JUMP_TO : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
            Selector : IN STD_LOGIC;
            Output : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
        );
    END COMPONENT;

    COMPONENT MUX_8_way_4_bit
        PORT (
            Reg0 : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
            Reg1 : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
            Reg2 : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
            Reg3 : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
            Reg4 : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
            Reg5 : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
            Reg6 : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
            Reg7 : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
            RegValue : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
            RegSelection : IN STD_LOGIC_VECTOR (2 DOWNTO 0)
        );
    END COMPONENT;

    COMPONENT ProgramRom
        PORT (
            Memory_select : IN STD_LOGIC_VECTOR (2 DOWNTO 0); -- Memory selection 
            Instruction : OUT STD_LOGIC_VECTOR (11 DOWNTO 0) -- Instruction
        );
    END COMPONENT;

    COMPONENT Instruction_Decoder
        PORT (
            INS : IN STD_LOGIC_VECTOR (11 DOWNTO 0); --Instruction
            Jump_check : in STD_LOGIC_VECTOR(3 downto 0); --Register check for jump
            Reg_enable : OUT STD_LOGIC_VECTOR (2 DOWNTO 0); --Register enable
            Reg_select_0 : OUT STD_LOGIC_VECTOR (2 DOWNTO 0); --Register select one
            Reg_select_1 : OUT STD_LOGIC_VECTOR (2 DOWNTO 0); --Register select two
            Imediate_val : OUT STD_LOGIC_VECTOR (3 DOWNTO 0); --Imediate value
            Add_Sub_select : OUT STD_LOGIC; --add/sub select
            Load_select : OUT STD_LOGIC; --load select
            Jump_flag : OUT STD_LOGIC; --jump flag
            Jump_address : OUT STD_LOGIC_VECTOR (2 DOWNTO 0) --Address to jump 
        );
    END COMPONENT;

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
            R7 : OUT STD_LOGIC_VECTOR (3 DOWNTO 0)
        );
    END COMPONENT;

    COMPONENT Add_Sub_unit
        PORT (
            AA : IN STD_LOGIC_VECTOR (3 DOWNTO 0); --first number
            BB : IN STD_LOGIC_VECTOR (3 DOWNTO 0); --second number
            SS : OUT STD_LOGIC_VECTOR (3 DOWNTO 0); --get result on this
            Sel : IN STD_LOGIC; --Select add or substract using this
            Zero : OUT STD_LOGIC; -- Zero flag
            Overflow : OUT STD_LOGIC; --Overflow flag
            Carry : OUT STD_LOGIC; -- carry flag
            Negative : OUT STD_LOGIC --Negative flag
        );
    END COMPONENT;

    SIGNAL Number01, Number02 : STD_LOGIC_VECTOR (3 DOWNTO 0);
    Signal AddSubTotal :  STD_LOGIC_VECTOR (3 DOWNTO 0) := "0000";

    SIGNAL Adder_3_value : STD_LOGIC_vector(2 downto 0);

    SIGNAL Jump_flag_sel : STD_LOGIC;
    signal Address_to_jump : std_logic_vector(2 downto 0);

--    SIGNAL Next_ins : STD_LOGIC_VECTOR(2 DOWNTO 0);
    signal Enable,Res :std_logic;

    SIGNAL Next_instruction : STD_LOGIC_VECTOR(2 DOWNTO 0);
    SIGNAL Current_Instruction : STD_LOGIC_VECTOR(2 DOWNTO 0) := "000";

    SIGNAL Instruction_bus : STD_LOGIC_VECTOR(11 DOWNTO 0);

    SIGNAL  Load_sel, Add_Sub_sel : STD_LOGIC;
    signal Reg_sel_0,Reg_sel_1 : std_logic_vector(2 downto 0);
    
    signal Register_enable : std_logic_vector(2 downto 0);

    SIGNAL Register_receiving_value, Imediate_value : STD_LOGIC_vector(3 downto 0);

    SIGNAL R0_value,R1_value, R2_value, R3_value, R4_value, R5_value, R6_value, R7_value : STD_LOGIC_VECTOR(3 DOWNTO 0);
    
    SIGNAL Clk_out : STD_LOGIC;
BEGIN

    clock : Slow_Clock
    PORT MAP(
        Clk_in => Clk,
        Clk_out => Clk_out);

    Number_01 : MUX_8_way_4_bit
    PORT MAP(
        Reg0 => R0_value,
        Reg1 => R1_value,
        Reg2 => R2_value,
        Reg3 => R3_value,
        Reg4 => R4_value,
        Reg5 => R5_value,
        Reg6 => R6_value,
        Reg7 => R7_value,
        RegValue => Number01,
        RegSelection => Reg_sel_0
    );

    Number_02 : MUX_8_way_4_bit
    PORT MAP(
        Reg0 => R0_value,
        Reg1 => R1_value,
        Reg2 => R2_value,
        Reg3 => R3_value,
        Reg4 => R4_value,
        Reg5 => R5_value,
        Reg6 => R6_value,
        Reg7 => R7_value,
        RegValue => Number02,
        RegSelection => Reg_sel_1
    );

    add_sub : Add_Sub_unit
    PORT MAP(
        AA => Number01, --value in first MUX
        BB => Number02, --value in second MUX
        SS => AddSubTotal,
        Sel => Add_Sub_sel,
        Zero => Zero_Flag,
        Overflow => Overflow_Flag,
        Carry => Carry_Flag,
        Negative => Negative_Flag
    );

    MUX_2_way_4 : MUX_2_way_4_bit
    PORT MAP(
        AddSubValue => AddSubTotal,
        InsDecValue => Imediate_value,
        OutputValue => Register_receiving_value,
        Selector => Load_sel
    );

    register_bank : RegisterBank
    PORT MAP(
        D => Register_receiving_value,
        I => Register_enable,
        Clk => Clk_out,
        Enable => Enable,
        Res => Reset,
        R0 => R0_value,
        R1 => R1_value,
        R2 => R2_value,
        R3 => R3_value,
        R4 => R4_value,
        R5 => R5_value,
        R6 => R6_value,
        R7 => R7_value
    );

    instruction_dec : Instruction_Decoder
    PORT MAP(
        INS => Instruction_bus,
        Jump_check => Number01,
        Reg_enable => Register_enable,
        Reg_select_0 => Reg_sel_0,
        Reg_select_1 => Reg_sel_1,
        Imediate_val => Imediate_value,
        Add_Sub_select => Add_Sub_sel,
        Load_select => Load_sel,
        Jump_flag => Jump_flag_sel,
        Jump_address => Address_to_jump
    );

    adder : Adder_3_bit
    PORT MAP(
        AA => Current_Instruction,
        SS => Adder_3_value
    );

    MUX_2_way_3 : MUX_2_way_3_bit
    PORT MAP(
        Adder_3 => Adder_3_value,
        JUMP_TO => Address_to_jump,
        Selector => Jump_flag_sel,
        Output => Next_instruction
    );

    programme_counter : Counter
    PORT MAP(
        Next_Ins => Next_instruction,
        Res => Reset,
        Clk => Clk_out,
        Current_Ins => Current_Instruction
    );

    prom : ProgramRom
    PORT MAP(
        Memory_select => Current_Instruction,
        Instruction => Instruction_bus
    );

    Reg0 <= R0_value;
    Reg1 <= R1_value;
    Reg2 <= R2_value;
    Reg3 <= R3_value;
    Reg4 <= R4_value;
    Reg5 <= R5_value;
    Reg6 <= R6_value;
    Reg7 <= R7_value;
    Num1 <= Number01;
    Num2 <= Number02;
    jmp_flag <= Jump_flag_sel;
    instructions <= Instruction_bus;
    Instruction_next <= Next_instruction;
    Instruction_Current<=Current_Instruction;
END Behavioral;