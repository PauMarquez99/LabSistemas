library ieee;
use ieee.std_logic_1164.all;

entity merge_tb is
end entity;

architecture behav of merge_tb is
  component merge
    port(Go_i, clk: in std_logic;
        X_i, Y_i: in std_logic_vector(3 downto 0);
        Data_O: out std_logic_vector(3 downto 0)
        );
    end component;

    signal Go_i, clk: std_logic;
    signal X_i, Y_i, Data_O: std_logic_vector(3 downto 0);

    begin
      uut1: merge port map(Go_i, clk, X_i, Y_i, Data_O);

    process
    begin
      clk <= '1';
      wait for 5 ns;
      clk<= '0';
      wait for 5 ns;
    end process;

    process
    begin
      GO_i <= '1';
      X_i <= "1011";
      Y_i <= "1001";
      wait for 50 ns;

      GO_i <= '1';
      X_i <= "0111";
      Y_i <= "1001";
      wait for 50 ns;
    end process;
  end behav;
