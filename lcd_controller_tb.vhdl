library ieee;
library std;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use STD.textio.all;
use ieee.std_logic_textio.all;

entity lcd_controller_tb is
end lcd_controller_tb;

architecture log of lcd_controller_tb is
component lcd_controller is
Port ( CLK, RESET, RS, RW : in  BIT;
       DATAIN : in  BIT_VECTOR (7 downto 0);
       RSO, RWO, EN : out  BIT;
       DATAOUT : out  BIT_VECTOR (7 downto 0));
end component;

signal CLK, RS, RW :  BIT := '0';
signal RESET : BIT := '1';
signal DATAIN : BIT_VECTOR (7 downto 0);
signal RSO, RWO, EN :  BIT;
signal DATAOUT :  BIT_VECTOR (7 downto 0);

constant CLK_time : time := 5 ns;
begin
 LCD1 : lcd_controller port map(CLK, RESET, RS, RW, DATAIN, RSO, RWO, EN, DATAOUT);

process
begin
  CLK <= '0';
  wait for CLK_time/2;
  CLK <= '1';
  wait for CLK_time/2;
end process;


 process
 file F_IN : TEXT open READ_MODE is "read.txt";
 variable r_line : line;
 variable RSr, RWr, RESETr : bit;
 variable DATAINr : BIT_VECTOR(7 downto 0);

 begin

  wait for 45 ns;
  while not endfile(F_IN) loop
    readline(F_IN, r_line);
    read(r_line, RESETr);
    read(r_line, RSr);
    read(r_line, RWr);
    read(r_line, DATAINr);

    RESET <= RESETr;
    RS <= RSr;
    RW <= RWr;
    DATAIN <= DATAINr;
wait for 0 ns;

  end loop;

 end process;

end log;
