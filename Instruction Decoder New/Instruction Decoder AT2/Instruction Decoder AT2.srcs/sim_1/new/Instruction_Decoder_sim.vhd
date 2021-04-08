
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Instruction_Decoder_sim is
end Instruction_Decoder_sim;

architecture Behavioral of Instruction_Decoder_sim is

component Instruction_Decoder
    port(  INS : in STD_LOGIC_VECTOR (11 downto 0);             --Instruction
           Jump_check : in STD_LOGIC;                           --Register check for jump
           Reg_enable : out STD_LOGIC_VECTOR (2 downto 0);      --Register enable
           Reg_select_0 : out STD_LOGIC_VECTOR (2 downto 0);    --Register select one
           Reg_select_1 : out STD_LOGIC_VECTOR (2 downto 0);    --Register select two
           Imediate_val : out STD_LOGIC_VECTOR (3 downto 0);    --Imediate value
           Add_Sub_select : out STD_LOGIC;                      --add/sub select
           Load_select : out STD_LOGIC;                         --load select
           Jump_flag : out STD_LOGIC;                           --jump flag
           Jump_address : out STD_LOGIC_VECTOR (2 downto 0));   --Address to jump
end component;

SIGNAL INS : STD_LOGIC_VECTOR (11 DOWNTO 0);
SIGNAL Jump_check : STD_LOGIC;
SIGNAL Add_Sub_select : STD_LOGIC;
SIGNAL Imediate_val : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL JUMP_FLAG : STD_LOGIC;
SIGNAL Jump_address : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL Reg_enable : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL Load_select : STD_LOGIC;
SIGNAL Reg_select_0 : STD_LOGIC_VECTOR (2 DOWNTO 0);
SIGNAL Reg_select_1 : STD_LOGIC_VECTOR (2 DOWNTO 0);

begin

   UUT : Instruction_Decoder PORT MAP(

      Imediate_val => Imediate_val,
      Add_Sub_select => Add_Sub_select,
      Load_select => Load_select,
      JUMP_FLAG => JUMP_FLAG,
      Jump_address => Jump_address,
      INS => INS,
      JUMP_CHECK => JUMP_CHECK,
      Reg_enable => Reg_enable,
      Reg_select_0 => Reg_select_0,
      Reg_select_1 => Reg_select_1);

   PROCESS

   BEGIN

      JUMP_CHECK <= '0';

      INS <= "110010000100"; --jump flag == 1
      WAIT FOR 200 ns;

      INS <= "100000000000";
      WAIT FOR 200 ns;

      INS <= "101010000001";
      WAIT FOR 200 ns;

      JUMP_CHECK <= '1';
      INS <= "011010000000";
      WAIT FOR 100 ns;

      INS <= "001111100000";
      WAIT FOR 100 ns;

      INS <= "001101010000";
      WAIT;

   END PROCESS;

end Behavioral;
