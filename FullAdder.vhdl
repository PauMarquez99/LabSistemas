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
