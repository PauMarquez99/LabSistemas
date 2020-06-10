library ieee;
use ieee.numeric_std.all;

entity DigitalClk is
  port(clk, setM, setH: in bit; segM: out unsigned(5 downto 0);
  segH: out unsigned(3 downto 0); PM: out bit);
end DigitalClk;

architecture behavioural of DigitalClk is
  signal SsegM: unsigned (5 downto 0);
  signal SsegH: unsigned (3 downto 0);
  signal SPM: bit;

  begin
  process(clk)
  begin
    if clk'event and clk = '1' then

    end if;
  end process;

  segH <= SsegH;
  segM <= SsegM;
  PM <= SPM;
end behavioural;
