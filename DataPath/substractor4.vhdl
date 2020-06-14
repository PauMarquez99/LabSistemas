library ieee;
use ieee.std_logic_1164.all;

entity substractor4 is
    port (
        a, b:in std_logic_vector(3 downto 0);
        bin : in std_logic;
        d: out std_logic_vector (3 downto 0);
        bout : out std_logic
    );
end entity;

architecture arch of substractor4 is
   component substractor
     port (
         a, b, bin : in std_logic;
         d, bout :   out std_logic
     );
  end component;

  signal aux: std_logic_vector(2 downto 0);

begin
    uut1: substractor port map(a(0), b(0), bin, d(0), aux(0));
    uut2: substractor port map(a(1), b(1), aux(0), d(1), aux(1));
    uut3: substractor port map(a(2), b(2), aux(1), d(2), aux(2));
    uut4: substractor port map(a(3), b(3), aux(2), d(3), bout);
end arch;
