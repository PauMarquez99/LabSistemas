library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--setM Minutes
--setH Hours
entity DigitalClk is
  port(clk, setM, setH: in std_logic; segM: out unsigned(5 downto 0);
  segH: out unsigned(3 downto 0));
end DigitalClk;

architecture behavioural of DigitalClk is
  signal SsegM: unsigned (5 downto 0);
  signal SsegH: unsigned (3 downto 0);


  begin

  process(clk)
  begin
    if clk'event and clk = '1' then
      elsif setH = '0' and setM = '1' and SsegH < "1100" then
        SsegH <= SsegH +1;
        SsegM <= "000000";

      elsif setH = '0' and setM = '1' and SsegH = "1100" then
        SsegH <= SsegH;
        SsegM <= "000000";

      elsif setH = '1' and setM = '0' and SsegM < "111011" then
        SsegH <= "0000";
        SsegM <= SsegM+1;

      elsif setH = '1' and setM = '0' and SsegM = "111011" then
        SsegH <= "0000";
        SsegM <= SsegM;

      elsif setH = '1' and setM = '1' then
        SsegH <= "0000";
        SsegM <= "000000";

      elsif SsegH < "1100" and SsegM = "111011" then
        SsegH <= SsegH +1;
        SsegM <= "000000";

      elsif SsegH < "1100" and SsegM < "111011" then
        SsegH <= SsegH;
        SsegM <= SsegM+1;

      elsif SsegH = "1100" and SsegM < "111011" then
        SsegH <= SsegH;
        SsegM <= SsegM+1;

      elsif SsegH = "1100" and SsegM = "111011" then
        SsegH <= "0000";
        SsegM <= "000000";


    end if;
  end process;
  segH <= SsegH;
  segM <= SsegM;

end behavioural;
