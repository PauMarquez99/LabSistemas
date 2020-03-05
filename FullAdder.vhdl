entity Full_Add is
  port (i0, i1 : in bit; ci : in bit;
    s : out bit;
    co : out bit);
end Full_Add;

architecture archi of Full_Add is
  component mux_4_1
    port(A, B, C, D: in bit;
      S1,S2: in bit;
      z: out bit);
  end component;
signal cinnot : bit;
begin
  mux1: mux_4_1 port map(ci, cinnot, cinnot, ci, i0, i1, s);
  mux2: mux_4_1 port map('0', ci, ci, '1', i0, i1, co);
  cinnot <= NOT ci;
end archi;
