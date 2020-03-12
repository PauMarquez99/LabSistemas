  entity mux_4_1 is
  port(A, B, C, D: in bit;
        S1,S2: in bit;
        z: out bit);
end mux_4_1;

architecture comport of mux_4_1 is
    begin process (A, B, C, D, S1, S2) is
      begin
        if (S1 = '0' and S2 = '0') then
          z <= A;
        elsif (S1 = '1' and S2 = '0') then
          z <= B;
        elsif (S1 = '0' and S2 = '1') then
          z <= C;
        else
          z <= D;
      end if;
    end process;
  end comport;
