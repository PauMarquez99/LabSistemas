entity ContSinUD_tb is
end ContSinUD_tb;

architecture logic of ContSinUD_tb is
  component ContSinUD
    port(EN, UD, CLK: in bit; LIM: out bit; R: out bit_vector(3 downto 0));
  end component;

  signal EN, UD, CLK, LIM: bit;
  signal R: bit_vector(3 downto 0);
  begin
    ConUP1: ContSinUD port map(EN, UD, CLK, LIM, R);
    CLK <= not CLK after 5 ns;
    process
    begin
    EN <= '1';
    UD <= '0';
    wait for 120 ns;
    EN <= '1';
    UD <= '1';
    wait for 200 ns;
    end process;
end logic;
