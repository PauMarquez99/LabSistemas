library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity contador99 is
  port(en : in std_logic;
      clk : in std_logic;
      reset : in std_logic;
      up_down : in std_logic;
      count_o1, count_o2 : out std_logic_vector(3 downto 0);
      end_o   : out std_logic:= '0'
  );
  end entity;
architecture log of contador99 is
    signal cuenta1, cuenta2 : integer range 0 to 9;
begin
    process(en, clk,reset)
    begin
        if (reset='1') then
            cuenta1 <= 0;
            cuenta2 <= 0;
            end_o <= '0';
        elsif(rising_edge(clk)) then
        if en = '1' then
            end_o <= '0';
            if(up_down='1') then
              if(cuenta1=9) then
                  cuenta1 <= 0;
                  cuenta2 <= cuenta2 + 1;
                  end_o <= '0';
              elsif (cuenta1 = 9 and cuenta2= 9)then
                  end_o <= '1';
                  cuenta1 <= 0;
                  cuenta2 <= 0;
              else
                  cuenta1 <= cuenta1 + 1;
                  end_o <= '0';
              end if;
            else
              if(cuenta1=0) then
                  cuenta1 <= 9;
                  cuenta2 <= cuenta2 - 1;
                  end_o <= '0';
              elsif (cuenta1 = 0 and cuenta2= 0)then
                  end_o <= '1';
                  cuenta1 <= 9;
                  cuenta2 <= 9;
              else
                  cuenta1 <= cuenta1-1;
                  end_o <= '0';
              end if;
            end if;
        end if;
      end if;
    end process;
    count_o1 <= std_logic_vector(to_unsigned(cuenta1, 4));
    count_o2 <= std_logic_vector(to_unsigned(cuenta2, 4));
end log;
