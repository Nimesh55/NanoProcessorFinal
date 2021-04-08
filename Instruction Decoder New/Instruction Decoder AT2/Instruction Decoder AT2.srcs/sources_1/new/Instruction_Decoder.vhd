
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY Instruction_Decoder IS
    PORT (
        INS : IN STD_LOGIC_VECTOR (11 DOWNTO 0); --Instruction
        Jump_check : IN STD_LOGIC; --Register check for jump
        Reg_enable : OUT STD_LOGIC_VECTOR (2 DOWNTO 0); --Register enable
        Reg_select_0 : OUT STD_LOGIC_VECTOR (2 DOWNTO 0); --Register select one
        Reg_select_1 : OUT STD_LOGIC_VECTOR (2 DOWNTO 0); --Register select two
        Imediate_val : OUT STD_LOGIC_VECTOR (3 DOWNTO 0); --Imediate value
        Add_Sub_select : OUT STD_LOGIC; --add/sub select
        Load_select : OUT STD_LOGIC; --load select
        Jump_flag : OUT STD_LOGIC; --jump flag
        Jump_address : OUT STD_LOGIC_VECTOR (2 DOWNTO 0)); --Address to jump 
END Instruction_Decoder;

ARCHITECTURE Behavioral OF Instruction_Decoder IS

    --to activate only the necessary modules at instance, 2 to 4 decoder is used 
    COMPONENT Decoder_2_to_4
        PORT (
            I : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
            Enable : IN STD_LOGIC;
            Y : OUT STD_LOGIC_VECTOR (3 DOWNTO 0));
    END COMPONENT;

    SIGNAL MOV, ADD, NEG, JZR : STD_LOGIC;
    SIGNAL JUMP_FLAG_0 : STD_LOGIC;

BEGIN

    Decoder_2_to_40 : Decoder_2_to_4
    PORT MAP(
        I(0) => INS(10),
        I(1) => INS(11),
        Y(0) => ADD,
        Y(1) => NEG,
        Y(2) => MOV,
        Y(3) => JZR,
        Enable => '1');

    Add_Sub_select <= NEG;
    Load_select <= MOV;
    Reg_Enable <= INS(9 DOWNTO 7);
    Imediate_val <= INS(3 DOWNTO 0);
    Reg_Select_0 <= INS(9 DOWNTO 7);
    Reg_Select_1 <= INS(6 DOWNTO 4);
    Jump_flag <= JZR AND (NOT(JUMP_CHECK));
    Jump_address <= INS(2 DOWNTO 0);

END Behavioral;