library ieee;
use ieee.std_logic_1164.all;

entity controller is
  port(GO_i, clk: in std_logic;
      X_sel, Y_sel: out std_logic;
      X_ld, Y_ld: out std_logic;
      X_gt_Y, X_eq_Y, X_lt_Y: in  std_logic;
      X_sub, Y_sub: out std_logic;
      O_enb: out std_logic
      );
end entity;

architecture log of controller is
  signal state: integer range 0 to 3:= 0;

  begin
  process(clk)
  begin
  if clk'event and clk = '1' then
    case state is
      when 0 =>
        if Go_i = '1' then
          if X_gt_Y = '1' then
            X_sel <= '1';
            Y_sel <= '0';
            state <= 1;
          elsif X_lt_Y = '1' then
            X_sel <= '0';
            Y_sel <= '1';
            state <= 1;
          else
            X_sel <= '0';
            Y_sel <= '0';
            state <= 1;
          end if;
        else
          state <= 0;
        end if;

      when 1 =>
        X_ld <= '1';
        Y_ld <= '1';
        state <= 2;

      when 2 =>
        X_ld <= '0';
        Y_ld <= '0';
        state <= 3;

      when 3 =>
        if X_eq_Y = '1' then
          O_enb <= '1';
          state <= 3;
        else
          state <= 0;
        end if;

      end case;
    end if;
    end process;
end log;
