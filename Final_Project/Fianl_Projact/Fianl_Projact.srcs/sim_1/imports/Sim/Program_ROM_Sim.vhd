LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY Program_Rom_Sim IS
END Program_Rom_Sim;

ARCHITECTURE Behavioral OF Program_Rom_Sim IS

        COMPONENT ProgramROM
                PORT (
                        Memory_select : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
                        Instruction : OUT STD_LOGIC_VECTOR (11 DOWNTO 0));
        END COMPONENT;

        SIGNAL Memory_select : STD_LOGIC_VECTOR (2 DOWNTO 0);
        SIGNAL Instruction : STD_LOGIC_VECTOR (11 DOWNTO 0);

BEGIN

        UUT : ProgramROM PORT MAP(
                Memory_select(2 DOWNTO 0) => Memory_select(2 DOWNTO 0),
                Instruction(11 DOWNTO 0) => Instruction(11 DOWNTO 0)
        );

        PROCESS
        BEGIN

                Memory_select <= "100";
                WAIT FOR 100 ns;

                Memory_select <= "000";
                WAIT FOR 100 ns;

                Memory_select <= "001";
                WAIT FOR 100 ns;

                Memory_select <= "011";
                WAIT FOR 100 ns;

                Memory_select <= "101";
                WAIT FOR 100 ns;

                Memory_select <= "110";
                WAIT FOR 100 ns;

                Memory_select <= "010";
                WAIT FOR 100 ns;

                Memory_select <= "111";
                WAIT; -- will wait forever
        END PROCESS;

END Behavioral;