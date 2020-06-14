library ieee;
use ieee.numeric_bit.all;

entity shift8_tb is
end entity;

architecture log of shift8_tb is
  component shift8
    port(clk, clr, sdr, sdl: in bit;
        mode: in bit_vector(1 downto 0);
        parallel: in bit_vector (7 downto 0);
        q: out bit_vector (7 downto 0));
  end component;

  signal clk, clr, sdr, sdl: bit;
  signal mode: bit_vector(1 downto 0);
  signal parallel: bit_vector (7 downto 0);
  signal q : bit_vector (7 downto 0);

  begin

    uut1: shift8 port map (clk, clr, sdr, sdl, mode, parallel, q);

    process
    begin
      clk <= '1';
      wait for 2 ns;

      clk <= '0';
      wait for 2 ns;
    end process;

    process
    begin
      clr<= '1';
      sdr <= '1';
      sdl <= '1';
      mode <= "11";
      parallel <= "01101100";
      wait for 5 ns;
      clr<= '0';
      sdr <= '1';
      sdl <= '1';
      mode <= "11";
      parallel <= "01001100";
      wait for 5 ns;
    end process;
  end log;
