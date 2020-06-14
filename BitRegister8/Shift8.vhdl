library ieee;
use ieee.std_logic_1164.all;

entity shift8 is
  port(clk, clr, sdr, sdl: in std_logic;
      mode: in std_logic_vector(1 downto 0);
      parallel: in std_logic_vector (7 downto 0);
      q: out std_logic_vector (7 downto 0));
end entity;

architecture log of shift8 is
  component shiftregister
    port(
        clk, clr, sdr, sdl : in std_logic;
        mode : in std_logic_vector(1 downto 0);
        parallel : in std_logic_vector(3 downto 0);
        q : out std_logic_vector(3 downto 0)
    );
  end component;

  begin
    uut1: shiftregister port map(clk, clr, sdr, sdl, mode, parallel(7 downto 4), q(7 downto 4));
    uut2: shiftregister port map(clk, clr, sdr, sdl, mode, parallel (3 downto 0), q(3 downto 0));


end log;
