-- Module SHIFT_REG:
 
LIBRARY IEEE;
USE IEEE.std_logic_1164.all;


 
ENTITY SHIFT_REG IS
PORT(
D: IN STD_LOGIC_VECTOR (4 downto 0);
Ds, L_S, ENA, CLK: IN STD_LOGIC;
Q: OUT STD_LOGIC_VECTOR (4 downto 0)
);
END SHIFT_REG;
 
ARCHITECTURE RTL OF SHIFT_REG IS
SIGNAL rg_sh: STD_LOGIC_VECTOR (4 downto 0);
BEGIN
Q <= rg_sh;
PROCESS(CLK)
BEGIN
IF CLK'event and CLK = '1' THEN
IF ENA = '1' THEN
IF L_S = '1' THEN
rg_sh <= D;
ELSE
rg_sh <= Ds&rg_sh(4 downto 1);
END IF;
ELSE null;
END IF;
END IF;
END PROCESS;
END RTL;
