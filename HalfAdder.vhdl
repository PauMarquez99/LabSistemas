entity HalfAdd is
  port (i0, i1 : in bit;
    s : out bit;
    co : out bit);
  end HalfAdd;

architecture archit of HalfAdd is
  component mux_4_1
    port(A, B, C, D: in bit;
      S1,S2: in bit;
      z: out bit);
  end component;
begin
mux1: mux_4_1 port map('0', '1', '1', '0', i0, i1, s);
mux2: mux_4_1 port map('0', '0', '0', '1', i0, i1, co);
end archit; 
