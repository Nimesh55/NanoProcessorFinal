LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY ProgramRom IS
    PORT (
        Memory_select : IN STD_LOGIC_VECTOR (2 DOWNTO 0); -- Memory selection 
        Instruction : OUT STD_LOGIC_VECTOR (11 DOWNTO 0)); -- Instruction
END ProgramRom;

ARCHITECTURE Behavioral OF ProgramRom IS

    TYPE rom_type IS ARRAY (0 TO 7) OF STD_LOGIC_VECTOR(11 DOWNTO 0);

    SIGNAL programRom : rom_type := (
        "101110000000",
        "101100000011",
        "101010001111",
        "001111100000",
        "001101010000",
        "111100000111",
        "110000000011",
        "000000000000");

BEGIN

    Instruction <= programRom(to_integer(unsigned(Memory_select)));

END Behavioral;