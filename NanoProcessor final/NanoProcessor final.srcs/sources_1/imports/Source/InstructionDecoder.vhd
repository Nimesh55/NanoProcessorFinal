library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity InstructionDecoder is
  PORT( X: in std_logic_vector(11 downto 0);        --Instruction
        JUMP_CHECK: in std_logic;                   --Register check for jump
        REG_EN: out std_logic_vector(2 downto 0);   --Register enable
        REG_SEL_0: out std_logic_vector(2 downto 0);--Register select one
        REG_SEL_1: out std_logic_vector(2 downto 0);--Register select two
        IM_VALUE: out std_logic_vector(3 downto 0); --Imediate value
        SUB : out std_logic;                        --add/sub select
        LOAD_SEL : out std_logic;                   --load select
        JUMP_FLAG : out  std_logic;                 --jump flag
        JUMP_TO: out std_logic_vector(2 downto 0)); --Address to jump   
end InstructionDecoder;

architecture Behavioral of InstructionDecoder is

COMPONENT Decoder_2_to_4
    Port (  I : in STD_LOGIC_VECTOR (1 downto 0);
            EN : in STD_LOGIC;
            Y : out STD_LOGIC_VECTOR (3 downto 0));
END COMPONENT;
 
SIGNAL MOV, ADD, NEG, JZR: std_logic;
SIGNAL JUMP_FLAG_0 : std_logic;

begin
--to activate only the necessary modules at instance, 2 to 4 decoder is used 
Decoder_2_to_40 : Decoder_2_to_4
    PORT MAP(
    I(0) => X(10),
    I(1) => X(11),
    Y(0) => ADD,
    Y(1) => NEG,
    Y(2) => MOV,
    Y(3) => JZR,
    EN => '1');
   
LOAD_SEL <= MOV;
REG_EN <= X(9 downto 7);
IM_VALUE <= X(3 downto 0);
REG_SEL_0 <= X(9 downto 7);
REG_SEL_1 <= X(6 downto 4);
SUB <= NEG;
JUMP_TO <= X(2 downto 0);
JUMP_FLAG <= JZR AND (not(JUMP_CHECK));

end Behavioral;
