library ieee;
use ieee.std_logic_1164.all;

entity shift8_tb is
end entity;

architecture log of shift8_tb is
  component shift8
    port(clk, clr, sdr, sdl: in std_logic;
        mode: in std_logic_vector(1 downto 0);
        parallel: in std_logic_vector (7 downto 0);
        q: out std_logic_vector (7 downto 0));
  end component;

  signal clk, clr, sdr, sdl: std_logic;
  signal mode: std_logic_vector(1 downto 0);
  signal parallel: std_logic_vector (7 downto 0);
  signal q : std_logic_vector (7 downto 0);

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
      sdr <= '1';
      sdl <= '1';
      mode <= "10";
      parallel <= "11111111";
      wait for 5 ns;
      sdr <= '0';
      sdl <= '1';
      mode <= "11";
      parallel <= "11001100";
      wait for 5 ns;
    end process;
  end log;
