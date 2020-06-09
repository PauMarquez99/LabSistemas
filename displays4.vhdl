entity displays4 is
  port(CLK: in bit;
  A, B, C, D, DEC: in bit_vector(3 downto 0);
  DIS0, DIS1, DIS2, DIS3: out bit_vector(7 downto 1));
end displays4;

architecture behavioral of displays4 is
  component bdc_seven
    port(EN, DEC: in bit; DECOUT: outbit;
    bdc: in bit_vector(3 downto 0); seven: out bit_vector(7 downto 1));
  end component;

  component cont2
    port(clk, SN, RN: in bit; Q, NQ: out bit_vector(1 downto 0));
  end component;

  signal Qout, NQout: bit_vector (1 downto 0);
  signal bdc: bit_vector(3 downto 0);
  signal DECin, DECout: bit;
  signal seven: bit_vector(7 downto 1);

  uut1: cont2 port map(clk, '1', '1', Qout, NQout);
  uut2: bdc_seven port map('1', DECin, DECout, bdc, seven);

  
