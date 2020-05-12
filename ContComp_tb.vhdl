entity ContComp_tb is
end entity;

architecture logic of ContComp_tb is
  component ContComp
    port(EN, UD, CLK: in bit; A, B: out bit_vector(3 downto 0));
  end component;

  signal EN, UD, CLK: bit;
  signal A, B: bit_vector(3 downto 0);

  begin
  ContComp0: ContComp port map (EN, UD, CLK, A, B);
  CLK <= not CLK after 5 ns;
  EN <= '1';
  process
  begin
    UD <= '0';
    EN <= '1';
    wait for 120 ns;
    UD <= '1';
    EN <= '1';
    wait for 100 ns;
  end process;
end logic;
