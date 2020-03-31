entity JK_FF is
  port(SN, RN, J, K, CLK: in bit; Q, NQ: out bit);
end JK_FF;

architecture behav of JK_FF is
signal Qsignal: bit;
  begin
    process(SN, RN, CLK) is
    begin
    if RN = '0' then Qsignal <= '0';
      elsif SN = '0' then Qsignal <= '1';
      elsif CLK'event and CLK = '0' then
        Qsignal <= (J and not Qsignal) or (not K and Qsignal);
      end if;
    end process;
    Q <= Qsignal;
    NQ <= not Qsignal;
end behav;
