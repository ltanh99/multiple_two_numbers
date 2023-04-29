-- Module CONTROL:
 
LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
 
ENTITY CONTROL IS
PORT(
RESET, CLK: IN STD_LOGIC;
READY, L_S, ENA1, ENA2, CLR: OUT STD_LOGIC
);
END CONTROL;
 
ARCHITECTURE RTL OF CONTROL IS
SIGNAL timer: INTEGER RANGE 0 to 6;
SIGNAL time_ready:INTEGER RANGE 0 to 1;
SIGNAL time_ena2:INTEGER RANGE 0 to 1:=0;
BEGIN
PROCESS(CLK, RESET)
BEGIN
 
IF CLK'event and CLK = '1' THEN
IF RESET = '1' THEN
L_S <= '1';
CLR <= '1';
ENA1 <= '0';
timer <= 0;
time_ready <= 0;
READY <= '0';
time_ena2 <= time_ena2+1;
IF time_ena2 < 1 THEN
ENA2 <= '1';
ELSE
ENA2 <= '0';
time_ena2 <= 1;
END IF;
ELSE
timer <= timer+1;
IF timer < 5 THEN
ENA1 <= '1';
ENA2 <= '1';
CLR <= '0';
L_S <= '0';
READY <= '0';
time_ready <= 0;
ELSE
time_ready <= time_ready+1;
timer <= 6;
ENA1 <= '0';
ENA2 <= '0';
L_S <= '0';
CLR <= '0';
IF time_ready < 1 THEN
READY <= '1';
time_ena2 <= 0;
ELSE
READY <= '0';
time_ready <=1;
END IF;
END IF;
END IF;
END IF;
END PROCESS;
END RTL;
