entity ContSin is
  port(CLK: in bit; R: out bit_vector(3 downto 0));
end ContSin;

architecture Structure of ContSin is
  component JK_FF
    port(SN, RN, J, K, CLK: in bit; Q, NQ: out bit);
  end component;
  signal Q: bit_vector(5 downto 0);
  signal T: bit_vector(3 downto 0);
  begin
    FF_JK0: JK_FF port map ('1', '1', '1', '1', CLK, Q(0), T(0));
    FF_JK1: JK_FF port map ('1', '1', Q(0), Q(0), CLK, Q(1), T(1));
    FF_JK2: JK_FF port map ('1', '1', Q(2), Q(2), CLK, Q(3), T(2));
    FF_JK3: JK_FF port map ('1', '1', Q(4), Q(4), CLK, Q(5), T(3));
    Q(2) <= Q(0) and Q(1);
    Q(4) <= Q(2) and Q(3);
    R(0) <= Q(0);
    R(1) <= Q(1);
    R(2) <= Q(3);
    R(3) <= Q(5);
end Structure;
