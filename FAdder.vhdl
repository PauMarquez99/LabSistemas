entity FullAdd is
  port (A, B : in bit; BC : in bit;
    S : out bit;
    CO : out bit);
end FullAdd;

architecture archi of FullAdd is
  component mux_4_1
    port(A, B, C, D: in bit;
      S1,S2: in bit;
      z: out bit);
  end component;
signal cinnot : bit;
begin
  mux1: mux_4_1 port map(BC, cinnot, cinnot, BC, A, B, s);
  mux2: mux_4_1 port map('0', BC, BC, '1', A, B, CO);
  cinnot <= NOT BC;
end archi;
