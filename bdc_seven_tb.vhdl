entity bdc_seven_tb is
end bdc_seven_tb;

architecture behavioral of bdc_seven_tb is
  component bdc_seven is
    port(bdc: in bit_vector(3 downto 0); seven: out bit_vector(7 downto 1));
  end component;
  signal bdc: bit_vector(3 downto 0);
  signal seven: bit_vector(7 downto 1);

  begin
  uut: bdc_seven port map(bdc, seven);

  stim_proc: process
  begin
    bdc <= "0000";
    wait for 100 ns;
    bdc <= "0001";
    wait for 100 ns;
    bdc <= "0010";
    wait for 100 ns;
    bdc <= "0011";
    wait for 100 ns;
    bdc <= "0100";
    wait for 100 ns;
    bdc <= "0101";
    wait for 100 ns;
    bdc <= "0110";
    wait for 100 ns;
    bdc <= "0111";
    wait for 100 ns;
    bdc <= "1000";
    wait for 100 ns;
    bdc <= "1001";
    wait for 100 ns;
  end process;
end behavioral;
