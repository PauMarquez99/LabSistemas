entity ContComp is
  port(EN, UD, CLK: in bit; A, B: out bit_vector(3 downto 0));
end ContComp;

architecture logic of ContComp is
  component ContSinUD
    port(EN, UD, CLK: in bit; LIM: out bit; R: out bit_vector(3 downto 0));
  end component;

  signal EN, UD, CLK, LIM, LIMS: bit;
  signal R: bit_vector(3 downto 0);

  begin
    ContSinUD0: ContSinUD port map(EN, UD, CLK, LIM, A);
    ContSinUD1: ContSinUD port map(LIM, UD, CLK, LIMS, B);
  end logic;
