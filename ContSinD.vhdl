entity ContSinD is
  port(CLK: in bit; R: out bit_vector(3 downto 0));
end ContSinD;

architecture logic of ContSinD is
  component JK_FF
    port(SN, RN, J, K, CLK: in bit; Q, NQ: out bit);
  end component;
  signal Q: bit_vector(6 downto 0);
  signal T: bit_vector(3 downto 0);
  begin
    JK_FF0: JK_FF port map ('1', Q(6), '1', '1', CLK, Q(0), T(0));
    JK_FF1: JK_FF port map ('1', Q(6), Q(0), Q(0), CLK, Q(1), T(1));
    JK_FF2: JK_FF port map ('1', Q(6), Q(2), Q(2), CLK, Q(3), T(2));
    JK_FF3: JK_FF port map ('1', Q(6), Q(4), Q(4), CLK, Q(5), T(3));
    Q(2) <= Q(0) and Q(1);
    Q(4) <= Q(2) and Q(3);
    Q(6) <= not (Q(1) and Q(5));
    R(0) <= Q(0);
    R(1) <= Q(1);
    R(2) <= Q(3);
    R(3) <= Q(5);
  end logic;
