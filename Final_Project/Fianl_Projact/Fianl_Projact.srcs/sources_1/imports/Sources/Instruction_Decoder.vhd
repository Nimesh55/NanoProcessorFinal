
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Instruction_Decoder is
    Port ( INS : in STD_LOGIC_VECTOR (11 downto 0);             --Instruction
           Jump_check : in STD_LOGIC_VECTOR(3 downto 0);        --Register check for jump
           Reg_enable : out STD_LOGIC_VECTOR (2 downto 0);      --Register enable
           Reg_select_0 : out STD_LOGIC_VECTOR (2 downto 0);    --Register select one
           Reg_select_1 : out STD_LOGIC_VECTOR (2 downto 0);    --Register select two
           Imediate_val : out STD_LOGIC_VECTOR (3 downto 0);    --Imediate value
           Add_Sub_select : out STD_LOGIC;                      --add/sub select
           Load_select : out STD_LOGIC;                         --load select
           Jump_flag : out STD_LOGIC;                           --jump flag
           Jump_address : out STD_LOGIC_VECTOR (2 downto 0));   --Address to jump 
end Instruction_Decoder;

architecture Behavioral of Instruction_Decoder is

--to activate only the necessary modules at instance, 2 to 4 decoder is used 
COMPONENT Decoder_2_to_4
    Port (  I : in STD_LOGIC_VECTOR (1 downto 0);
            Enable : in STD_LOGIC;
            Y : out STD_LOGIC_VECTOR (3 downto 0));
END COMPONENT;
 
SIGNAL MOV, ADD, NEG, JZR: std_logic;
SIGNAL JUMP_FLAG_0 : std_logic;

begin

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

--if (not(JZR)) then
--outputTri<=inputTri WHEN (EN='1') else "ZZZ";
Reg_Enable <= INS(9 downto 7) WHEN (JZR='0') else "ZZZ";
--end if;
Imediate_val <= INS(3 downto 0);
Reg_Select_0 <= INS(9 downto 7);
Reg_Select_1 <= INS(6 downto 4);
Jump_flag <= JZR AND (not(JUMP_CHECK(0) or Jump_check(1) or Jump_check(2) or Jump_check(3)));
Jump_address <= INS(2 downto 0);

end Behavioral;
