entity JK_FF is
  port(EN, SN, RN, J, K, CLK: in bit; Q, NQ: out bit);
end JK_FF;

architecture behav of JK_FF is
signal Qsignal: bit;
  begin
    process(EN, SN, RN, CLK) is
    begin
    if EN = '1' then
    if RN = '0' then Qsignal <= '0';
      elsif SN = '0' then Qsignal <= '1';
      elsif CLK'event and CLK = '0' then
        Qsignal <= (J and not Qsignal) or (not K and Qsignal);
      end if;
    end if;
    end process;
    Q <= Qsignal;
    NQ <= not Qsignal;
end behav;
