library ieee;
use ieee.std_logic_1164.all;

entity OutputRegister_tb is
end entity;

architecture log of OutputRegister_tb is
  component OutputRegister
    port(clk, O_enb: in std_logic;
      input: in std_logic_vector(3 downto 0);
      Data_O: out std_logic_vector(3 downto 0)
    );
  end component;

  signal clk, O_enb: std_logic;
  signal input, Data_O: std_logic_vector(3 downto 0);

  begin
    uut: OutputRegister port map(clk, O_enb, input, Data_O);

    process
    begin
      clk <= '1';
      wait for 5 ns;
      clk <= '0';
      wait for 5 ns;
    end process;

    process
    begin
      O_enb <= '1';
      input <= "1001";
      wait for 10 ns;
      O_enb <= '1';
      input <= "1011";
      wait for 10 ns;
      O_enb <= '0';
      input <= "1011";
      wait for 10 ns;
    end process;
  end log; 
