entity displays4_tb is
end entity displays4_tb;

architecture behavioral of displays4_tb is
  component displays4
    port(CLK: in bit;
    A, B, C, D, DEC: in bit_vector(3 downto 0);
    DIS0, DIS1, DIS2, DIS3: out bit_vector(7 downto 1));
  end component;

  signal CLK: bit;
  signal A, B, C, D, DEC: bit_vector(3 downto 0);
  signal DIS0, DIS1, DIS2, DIS3: bit_vector(7 downto 0);

  constant clk_period: time := 10ns;

  begin

  uut: displays4 port map(CLK, A, B, C, D, DIS0, DIS1, DIS2, DIS3);

  clkprocess: process
  begin
    CLK <= '0';
    wait for clk_period/2;
    CLK <= '1';
    wait for clk_period/2;
  end process;

  process:
  begin
    A <= "0001";
    B <= "0010";
    C <= "0100";
    D <= "1000";
    DEC <= "1000";
    wait for 100ns;
    A <= "0101";
    B <= "0110";
    C <= "01110";
    D <= "1001";
    DEC <= "1000";
    wait for 100ns;
end process;

end behavioral;
