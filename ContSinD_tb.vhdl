entity ContSinD_tb is
end ContSinD_tb;

architecture logic of ContSinD_tb is
  component ContSinD
    port(CLK: in bit; R: out bit_vector(3 downto 0));
  end component;
  signal CLK: bit;
  signal R: bit_vector(3 downto 0);
  begin
  ContSinD1: ContSinD port map(CLK, R);
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
