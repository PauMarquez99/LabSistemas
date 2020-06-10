library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity DigitalClk_tb is
end DigitalClk_tb;

architecture behavioural of DigitalClk_tb is
  component DigitalClk
    port(clk, setM, setH: in bit; segM: out unsigned(5 downto 0);
    segH: out unsigned(3 downto 0); PM: out bit);
  end component;

  signal clk, setH, setM, PM: bit;
  signal segM: unsigned (5 downto 0);
  signal segH: unsigned (3 downto 0);

  begin
    uut1: DigitalClk port map(clk, setM, setH, segM, segH, PM);

  process
  begin
    clk <= '1';
    wait for 1 ns;

    clk <= '0';
    wait for 1 ns;
  end process;

  ´process(clk)
  begin
  PM <= '0';
  wait for 10 ns;

  setH <= '0';
  setM <= '0';
  wait for 150 ns;

  end process;
end behavioural; 
