library ieee;
use ieee.std_logic_1164.all;

entity mux is
    port(
        x, y : in std_logic_vector(3 downto 0);
        sel : in std_logic;
        res : out std_logic_vector(3 downto 0)
    );
end entity;

architecture arch of mux is
    component mux1bit is
        port(
            x, y : in std_logic;
        sel : in std_logic;
        res : out std_logic);
    end component;
begin
    mux0: mux1bit port map (x(0), y(0), sel, res(0));
    mux1: mux1bit port map (x(1), y(1), sel, res(1));
    mux2: mux1bit port map (x(2), y(2), sel, res(2));
    mux3: mux1bit port map (x(3), y(3), sel, res(3));

end arch ;
