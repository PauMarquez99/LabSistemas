entity displays4 is
  port(CLK: in bit;
  A, B, C, D, DEC: in bit_vector(3 downto 0);
  DIS0, DIS1, DIS2, DIS3: out bit_vector(7 downto 1));
end displays4;

architecture behavioral of displays4 is
  component bdc_seven
    port(EN, DEC: in bit; DECOUT: out bit;
    bdc: in bit_vector(3 downto 0); seven: out bit_vector(7 downto 1));
  end component;

  component cont2
    port(clk, SN, RN: in bit; Q, NQ: out bit_vector(1 downto 0));
  end component;

  signal Qout, NQout: bit_vector (1 downto 0);
  signal bdc: bit_vector(3 downto 0);
  signal DECin, DECout: bit;
  signal seven: bit_vector(7 downto 1);

begin
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

process (Qout)
begin
  if Qout(0) = '0' and Qout(1) = '0' then
    DIS0(1) <= seven(1);
    DIS0(2) <= seven(2);
    DIS0(3) <= seven(3);
    DIS0(4) <= seven(4);
    DIS0(5) <= seven(5);
    DIS0(6) <= seven(6);
    DIS0(7) <= seven(7);

    DIS1 <= "0000000";
    DIS2 <= "0000000";
    DIS3 <= "0000000";

  elsif Qout(0) = '1' and Qout(1) = '0' then
    DIS1(1) <= seven(1);
    DIS1(2) <= seven(2);
    DIS1(3) <= seven(3);
    DIS1(4) <= seven(4);
    DIS1(5) <= seven(5);
    DIS1(6) <= seven(6);
    DIS1(7) <= seven(7);

    DIS0 <= "0000000";
    DIS2 <= "0000000";
    DIS3 <= "0000000";

  elsif Qout(0) = '0' and Qout(1) = '1' then
    DIS2(1) <= seven(1);
    DIS2(2) <= seven(2);
    DIS2(3) <= seven(3);
    DIS2(4) <= seven(4);
    DIS2(5) <= seven(5);
    DIS2(6) <= seven(6);
    DIS2(7) <= seven(7);

    DIS0 <= "0000000";
    DIS1 <= "0000000";
    DIS3 <= "0000000";

  elsif Qout(0) = '1' and Qout(1) = '1' then
    DIS3(1) <= seven(1);
    DIS3(2) <= seven(2);
    DIS3(3) <= seven(3);
    DIS3(4) <= seven(4);
    DIS3(5) <= seven(5);
    DIS3(6) <= seven(6);
    DIS3(7) <= seven(7);

    DIS0 <= "0000000";
    DIS1 <= "0000000";
    DIS2 <= "0000000";
end if;
end process;

end behavioral;
