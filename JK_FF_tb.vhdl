entity JK_FF_tb is
end entity;

architecture logic of JK_FF_tb is
  component JK_FF
    port(EN, SN, RN, J, K, CLK: in bit; Q, NQ: out bit);
  end component;
  signal EN, SN, RN, J, K, CLK, Q, NQ: bit;
  begin
  JK_FF1: JK_FF port map (EN, SN, RN, J, K, CLK, Q, NQ);
  CLK <= not CLK after 5 ns;
  EN <= '1';
  process
  begin
  SN <= '0';
  RN <= '0';
  J <= '0';
  K <= '0';
  wait for 15 ns;
  SN <= '1';
  RN <= '1';
  J <= '1';
  K <= '1';
  wait for 15 ns;
  SN <= '1';
  RN <= '1';
  J <= '0';
  K <= '1';
  wait for 15 ns;
  SN <= '1';
  RN <= '1';
  J <= '1';
  K <= '0';
  wait for 15 ns;
  SN <= '0';
  RN <= '1';
  J <= '1';
  K <= '1';
  wait for 15 ns;
  SN <= '1';
  RN <= '0';
  J <= '1';
  K <= '1';
  wait for 15 ns;
  SN <= '1';
  RN <= '1';
  J <= '0';
  K <= '0';
  wait for 15 ns;
  end process;
  end logic;
