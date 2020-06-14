library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity contador74 is
  port(
      clk : in std_logic;
      reset : in std_logic;
      up_down : in std_logic;
      count_o : out std_logic_vector(7 downto 0);
      end_o   : out std_logic
  );
end entity;

architecture log of contador74 is
    signal cuenta : integer range 0 to 255;

    begin
    process(reset,clk)
    begin
        if reset='1' then
            cuenta <= 0;
            end_o <= '0';
        elsif clk'event and clk='1' then
            end_o <= '0';
            if(up_down='1') then
              if(cuenta=15) then
                  cuenta <= 0;
                  end_o  <= '1';
              else
                  cuenta <= cuenta + 1;
              end if;
            else
              if(cuenta=0) then
                  cuenta <= 15;
                  end_o <= '1';
              else
                  cuenta <= cuenta-1;
              end if;
            end if;
        end if;
    end process;

    count_o <= std_logic_vector(to_unsigned(cuenta, 8));
end log;
