entity multiplier_tb is
end multiplier_tb;

architecture behav of multiplier_tb is
  component multiplier
    port(a0, a1, a2, a3: in bit;
      b0, b1, b2, b3: in bit;
      z0, z1, z2, z3, z4, z5, z6, z7, z8: out bit);
  end component;

  signal a0, a1, a2, a3: bit;
  signal  b0, b1, b2, b3: bit;
  signal  z0, z1, z2, z3, z4, z5, z6, z7, z8: bit;

  begin
    mult1: multiplier port map(a0, a1, a2, a3, b0, b1, b2, b3, z0, z1, z2, z3, z4, z5, z6, z7, z8);
    process
      begin
      a0 <= '1';
      a1 <= '1';
      a2 <= '0';
      a3 <= '0';
      b0 <= '1';
      b1 <= '0';
      b2 <= '1';
      b3 <= '0';
      wait for 50 ns;
      a0 <= '1';
      a1 <= '1';
      a2 <= '0';
      a3 <= '0';
      b0 <= '1';
      b1 <= '1';
      b2 <= '0';
      b3 <= '0';
      wait for 50 ns;
      a0 <= '0';
      a1 <= '1';
      a2 <= '0';
      a3 <= '0';
      b0 <= '1';
      b1 <= '1';
      b2 <= '0';
      b3 <= '0';
      wait for 50 ns;
    end process;
  end behav;
