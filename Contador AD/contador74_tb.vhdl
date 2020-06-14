library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity contador74_tb is
end entity;

architecture log of contador74_tb is
  component contador74
    port(en : in std_logic;
        clk : in std_logic;
        reset : in std_logic;
        up_down : in std_logic;
        count_o : out std_logic_vector(3 downto 0);
        end_o   : out std_logic
    );
  end component;

  signal en, clk : std_logic;
  signal reset : std_logic;
  signal up_down : std_logic;
  signal count_o : std_logic_vector(3 downto 0);
  signal end_o   : std_logic;

  begin

  uut: contador74 port map (en, clk, reset, up_down, count_o, end_o);

  process
  begin
    clk <= '1';
    wait for 5 ns;
    clk <= '0';
    wait for 5 ns;
  end process;

  process
  begin
    up_down <= '1';
    wait for 50 ns;
    up_down <= '0';
    wait for 20 ns;
  end process;
end log;
