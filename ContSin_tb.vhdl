entity ContSin_tb is
end ContSin_tb;

architecture logic of ContSin_tb is
  component ContSin
    port(CLK: in bit; R: out bit_vector(3 downto 0));
  end component;
  signal CLK: bit;
  signal R: bit_vector(3 downto 0);
  begin
  ContSin1: ContSin port map (CLK, R);
  CLK <= not CLK after 5 ns;
  process
  begin
  wait for 10 ns;
  wait for 10 ns;
  wait for 10 ns;
  wait for 10 ns;
  wait for 10 ns;
  wait for 10 ns;
  wait for 10 ns;
  wait for 10 ns;
  wait for 10 ns;
  wait for 10 ns;
  wait for 10 ns;
  wait for 10 ns;
  end process;
  end logic;
