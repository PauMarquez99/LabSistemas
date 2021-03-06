entity cont2 is
  port(clk, SN, RN: in bit; Q, NQ: out bit_vector(1 downto 0));
end cont2;

architecture behavioral of cont2 is
  component JK_FF
    port(EN, SN, RN, J, K, CLK: in bit; Q, NQ: out bit);
  end component;

  signal Q0, Q1: bit;

  begin
    Q(0) <= Q0;
    Q(1) <= Q1;

    uut1: JK_FF port map ('1', SN, RN, '1', '1', CLK, Q0, NQ(0));
    uut2: JK_FF port map ('1', SN, RN, '1', '1', CLK, Q1, NQ(1));

end behavioral;
