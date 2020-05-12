entity ContSinUD is
  port(EN, UD, CLK: in bit; LIM: out bit; R: out bit_vector(3 downto 0));
end ContSinUD;

architecture logic of ContSinUD is
  component JK_FF
    port(EN, SN, RN, J, K, CLK: in bit; Q, NQ: out bit);
  end component;
  signal Q: bit_vector(3 downto 0);
  signal NQ: bit_vector(3 downto 0);
  signal QAnd: bit_vector(1 downto 0);
  signal QOR: bit_vector(4 downto 0);
  begin
  JK_FF0: JK_FF port map(EN, QAND(0), QAND(1), '1', '1', CLK, Q(0), NQ(0));
  JK_FF1: JK_FF port map(EN, '1', QOR(4), QOR(0), QOR(0), CLK, Q(1), NQ(1));
  JK_FF2: JK_FF port map(EN, '1', QOR(4), QOR(1), QOR(1), CLK, Q(2), NQ(2));
  JK_FF3: JK_FF port map(EN, QAND(0), QAND(1), QOR(2), QOR(2), CLK, Q(3), NQ(3));

  QAND(0) <= not(UD and Q(0) and Q(1) and Q(2) and Q(3));
  QAND(1) <= not((not UD) and NQ(0) and Q(1) and NQ(2) and Q(3));

  QOR(0) <= ((not UD) and Q(0)) or (UD and NQ(0));
  QOR(1) <= (Q(1) and (not UD) and Q(0)) or (NQ(1) and UD and NQ(0));
  QOR(2) <= (Q(2) and Q(1) and (not UD) and Q(0)) or (NQ(2) and NQ(1) and UD and NQ(0));
  QOR(3) <= (UD and Q(3) and (not UD) and Q(0)) or ((UD and NQ(0))) or ((not UD) and NQ(0) and NQ(1) and NQ(2) and NQ(3));
  QOR(4) <= not((UD and Q(0) and Q(1) and Q(2) and Q(3))) and (not((not UD) and NQ(0) and Q(1) and NQ(2) and Q(3)));

  R(0) <= Q(0);
  R(1) <= Q(1);
  R(2) <= Q(2);
  R(3) <= Q(3);
  LIM <= QOR(3);
end logic;
