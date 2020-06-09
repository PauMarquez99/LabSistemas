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

  process(Qout)
  begin
    if Qout(0) = '0' and Qout(1) = '0' then
      DECin <= DEC(0);
      bdc(0) <= A(0);
      bdc(1) <= A(1);
      bdc(2) <= A(2);
      bdc(3) <= A(3);

    elsif Qout(0) = '1' and Qout(1) = '0' then
      DECin <= DEC(1);
      bdc(0) <= B(0);
      bdc(1) <= B(1);
      bdc(2) <= B(2);
      bdc(3) <= B(3);

    elsif Qout(0) = '0' and Qout(1) = '1' then
      DECin <= DEC(2);
      bdc(0) <= C(0);
      bdc(1) <= C(1);
      bdc(2) <= C(2);
      bdc(3) <= C(3);

    elsif Qout(0) = '1' and Qout(1) = '1' then
      DECin <= DEC(3);
      bdc(0) <= D(0);
      bdc(1) <= D(1);
      bdc(2) <= D(2);
      bdc(3) <= D(3);

  end if;
end process;
