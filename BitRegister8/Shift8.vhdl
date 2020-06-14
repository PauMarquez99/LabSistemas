library ieee;
use ieee.numeric_bit.all;

entity shiftregister is
    port(
        clk, clr, sdr, sdl : in bit;
        mode : in bit_vector(1 downto 0);
        parallel : in bit_vector(3 downto 0);
        q : out bit_vector(3 downto 0)
    );
end entity;

architecture arch of shiftregister is
    signal qn : bit_vector(3 downto 0) := "0000";
begin
    process(clr, clk)
    begin
        if clr = '0' then
            qn <= "0000";
        else
            if rising_edge(clk) then
                case mode is
                    when "00" =>
                        qn <= qn;
                    when "01" =>
                        qn <= qn(2 downto 0) & sdr;
                    when "10" =>
                        qn <= sdl & qn(3 downto 1);
                    when "11" =>
                        qn <= parallel;
                    when others =>
                        null;
                end case;
                q <= qn;
            end if;
        end if;
    end process;


end arch ; -- arch

entity shift8 is
  port(clk, clr, sdr, sdl: in bit;
      mode: in bit_vector(1 downto 0);
      parallel: in bit_vector (7 downto 0);
      q: out bit_vector (7 downto 0));
end entity;

architecture log of shift8 is
  component shiftregister
    port(
        clk, clr, sdr, sdl : in bit;
        mode : in bit_vector(1 downto 0);
        parallel : in bit_vector(3 downto 0);
        q : out bit_vector(3 downto 0)
    );
  end component;
  signal q_replace: bit_vector(7 downto 0);

  begin
    q_replace <= parallel;
    uut1: shiftregister port map(clk, clr, q_replace(3), sdl, mode, parallel(7 downto 4), q(7 downto 4));
    uut2: shiftregister port map(clk, clr, sdr, q_replace(4), mode, parallel (3 downto 0), q(3 downto 0));


end log;
