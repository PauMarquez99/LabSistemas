library ieee;
use ieee.std_logic_1164.all;

entity ls194 is
  port(clk,mr_n,s0,s1,dsr,dsl_ser: in std_logic;
  p : in std_logic_vector(3 downto 0);
  q : out std_logic_vector(3 downto 0)
  );
end ls194;
architecture behav of ls194 is
  signal temp: std_logic_vector(3 downto 0);
  signal ctrl: std_logic_vector (1 downto 0);
  begin
    ctrl <= s0 & s1;
    shift_proc: process(clk, mr_n )
    begin
      if (mr_n = '0') then
        temp <= (others => '0');
      elsif (rising_edge(clk)) then
      case ctrl is
        when "11" => temp <= p;
        when "10" => temp <= dsr & temp(3 downto 1);
        when "01"=> temp <= temp(2 downto 0) & dsl;
        when others => temp <= temp;
      end case;
      end if;
    end process;
    q <= temp;
end behav;
