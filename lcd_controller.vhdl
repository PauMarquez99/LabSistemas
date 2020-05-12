library ieee;
library std;
use ieee.std_logic_1164.all;
library std;
use std.textio.all;
use ieee.numeric_bit.all;

entity lcd_controller is
    Port ( CLK, RESET, RS, RW : in  BIT;
           DATAIN : in  BIT_VECTOR (7 downto 0);
           RSO, RWO, EN : out  BIT;
           DATAOUT : out  BIT_VECTOR (7 downto 0));
end lcd_controller;

architecture logic of lcd_controller is
signal STATE : integer range 0 to 4 := 0;
begin
EN <= CLK;
process (CLK)
	begin
		if CLK'event and CLK ='0' then
			case STATE is
				when 0 =>
					STATE <= 1;
				when 1 =>
					STATE <= 2;
				when 2 =>
					STATE <= 3;
				when 3 =>
					STATE <= 4;
				when 4 =>
				if RESET = '0' then
					STATE <= 0;
				end if;
			end case;
			end if;
    end process;

process(STATE, RS, RW, DATAIN)
file F_OUT: TEXT open WRITE_MODE is "fout.txt";
variable w_line : line;
	begin
	case STATE is
		when 0=>
			RWO <= '0';
			RSO <= '0';
			DATAOUT <= x"38";
			write(w_line, string'("instr(0x38)"));
      writeline(F_OUT, w_line);
		when 1=>
			RWO <= '0';
			RSO <= '0';
			DATAOUT <= x"0F";
			write(w_line, string'("instr(0x0F)"));
      writeline(F_OUT, w_line);
		when 2=>
			RWO <= '0';
			RSO <= '0';
			DATAOUT <= x"01";
			write(w_line, string'("instr(0x01)"));
      writeline(F_OUT, w_line);
		when 3=>
			RWO <= '0';
			RSO <= '0';
			DATAOUT <= x"06";
			write(w_line, string'("instr(0x06)"));
      writeline(F_OUT, w_line);
		when 4=>
			RWO <= RW;
			RSO <= RS;
			DATAOUT <= DATAIN;
			if RS = '0' then
				write(w_line, string'("instr("));

			else
				write(w_line, string'("data("));
			end if;

			write(w_line, to_integer(unsigned(DATAIN)));
			write(w_line, string'(");"));
      writeline(F_OUT, w_line);
		end Case;

	end process;
end logic;
