
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Reg is
    Port ( D : in STD_LOGIC_VECTOR (3 downto 0);
           Res : in STD_LOGIC;
           Enable : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (3 downto 0);
           Clk : in STD_LOGIC);
end Reg;

architecture Behavioral of Reg is
 -- Add D Flip Flops to the Program counter
 component D_FFR
 port(
 D : in std_logic;
 Res:in std_logic;
 Clk:in std_logic;
 Q : out std_logic;
 En : in STD_LOGIC;
 Qbar : out std_logic  
 );
end component;

-- Add Slow Clock to the program counter
component Slow_Clock
 port(
     Clk_In : in std_logic;
     Clk_Out : out std_logic
     );
end component;

signal D0,D1,D2 : std_logic;
signal Clk_slow:std_logic;

begin

    D_FFR0: D_FFR
    port map(
        D=>D(0),
        Res=>Res,
        En=>Enable,
        Clk=>Clk_slow,
        Q=>Q(0)
        
    );
    D_FFR1: D_FFR
    port map(
        D=>D(1),
        Res=>Res,
        En=>Enable,
        Clk=>Clk_slow,
        Q=>Q(1)
        
    );
    D_FFR2: D_FFR
    port map(
        D=>D(2),
        Res=>Res,
        En=>Enable,
        Clk=>Clk_slow,
        Q=>Q(2)
        
    );
    D_FFR3: D_FFR
    port map(
        D=>D(3),
        Res=>Res,
        En=>Enable,
        Clk=>Clk_slow,
        Q=>Q(3)
        
    );

end Behavioral;
