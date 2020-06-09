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

  
