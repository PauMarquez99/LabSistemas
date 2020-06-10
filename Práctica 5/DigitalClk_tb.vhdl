library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity DigitalClk_tb is
end DigitalClk_tb;

architecture behavioural of DigitalClk_tb is
  component DigitalClk
    port(clk, setM, setH: in std_logic; segM: out unsigned(5 downto 0);
    segH: out unsigned(3 downto 0));
  end component;

  signal clk: std_logic:='0';
  signal setH, setM: std_logic:= '1';
  signal segM: unsigned (5 downto 0);
  signal segH: unsigned (3 downto 0);

  begin
    uut1: DigitalClk port map(clk, setM, setH, segM, segH);

  process
  begin
    clk <= '1';
    wait for 2 ns;

    clk <= '0';
    wait for 2 ns;
  end process;

  process
  begin
    setM <= '0';
    setH <= '0';
    wait for 120 ns;

  end process;
end behavioural;
