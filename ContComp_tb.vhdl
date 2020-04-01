entity ContComp_tb is
end entity;

architecture logic of ContComp_tb is
  component ContComp
    port(EN, UD, CLK: in bit; A, B: out bit_vector(3 downto 0));
  end component;

  signal EN, UD, CLK: bit;
  signal A, B: bit_vector(3 downto 0);

  begin
  CLK <= not CLK after 5 ns;
  EN <= '1';
  process
  begin
    UD <= '0';
    EN <= '1';
    wait for 180 ns;
    UD <= '1';
    EN <= '1';
    wait for 180 ns;
  end process;
end logic;
