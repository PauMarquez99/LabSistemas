library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity contador99_tb is
end entity;

architecture log of contador99_tb is
  component contador99
    port(en : in std_logic;
        clk : in std_logic;
        reset : in std_logic;
        up_down : in std_logic;
        count_o1, count_o2 : out std_logic_vector(3 downto 0);
        end_o   : out std_logic
    );
  end component;

  signal en, clk, reset, up_down: std_logic;
  signal count_o1, count_o2: std_logic_vector(3 downto 0);
  signal end_o: std_logic;

  begin

  uut: contador99 port map(en, clk, reset, up_down, count_o1, count_o2, end_o);

  process
  begin
    clk <= '1';
    wait for 5 ns;
    clk <= '0';
    wait for 5 ns;
  end process;

  process
  begin
    en <= '1';
    reset <= '0';
    up_down <= '1';
    wait for 50 ns;
    en <= '1';
    reset <= '0';
    up_down <= '0';
    wait for 50 ns;
    en <= '1';
    reset <= '1';
    up_down <= '1';
    wait for 15 ns;
  end process;
end log;
