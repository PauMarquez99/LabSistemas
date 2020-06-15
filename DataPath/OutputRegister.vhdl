library ieee;
use ieee.std_logic_1164.all;

entity OutputRegister is
  port(clk, O_enb: in std_logic;
    input: in std_logic_vector(3 downto 0);
    Data_O: out std_logic_vector(3 downto 0)
  );
end entity;

architecture log of OutputRegister is

begin
  process(clk)
  begin
    if O_enb = '1' then
      if clk'event and clk = '1' then
        Data_O <= input;
      end if;
    else
      Data_O <= "0000";
    end if;
  end process;

end log;
