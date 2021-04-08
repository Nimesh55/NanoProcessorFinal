library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity Reg is
    Port ( D : in STD_LOGIC_VECTOR (3 downto 0);
           Enable : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Res : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (3 downto 0));
end Reg;

architecture Behavioral of Reg is

    -- Add D Flip Flops to the Program counter
    component D_FF
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

    signal D0,D1,D2,D3 : std_logic;
    signal Clk_slow:std_logic;
    
begin
    
    Slow_clock0:Slow_Clock
    port map(
        Clk_In=>Clk,
        Clk_Out=>Clk_slow
    );
    D_FF0: D_FF
    port map(
        D=>D(0),
        Res=>Res,
        Clk=>Clk_slow,
        En => Enable,
        Q=>Q(0)
        
    );
    
    D_FF1: D_FF
    port map(
        D=>D(1),
        Res=>Res,
        Clk=>Clk_slow,
        En => Enable,
        Q=>Q(1)
    );
    
    D_FF2: D_FF
    port map(
        D=>D(2),
        Res=>Res,
        Clk=>Clk_slow,
        En => Enable,
        Q=>Q(2)
    );
    
    D_FF3: D_FF
    port map(
        D=>D(3),
        Res=>Res,
        Clk=>Clk_slow,
        En => Enable,
        Q=>Q(3)
        
    );

end Behavioral;
