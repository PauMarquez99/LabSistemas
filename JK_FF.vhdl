entity JK_FF is
  port(J, K, CLK: in bit; Q, NQ: out bit);
end JK_FF;

architecture behav of JK_FF is
signal Qsignal: bit;
  begin
    process(CLK) is
    begin
      if(CLK = '1' and CLK'EVENT) then
        if(J = '0' and K = '0') then
        Qsignal <= Qsignal;
        elsif(J = '1' and K = '1') then
        Qsignal <= not Qsignal;
        elsif(J = '0' and K = '1') then
        Qsignal <= '0';
        else
        Qsignal <= '1';
        end if;
      end if;
    end process;
    Q <= Qsignal;
    NQ <= not Qsignal;
end behav;
