entity multiplier is
  port(a0, a1, a2, a3: in bit;
    b0, b1, b2, b3,: in bit;
    z0, z1, z2, z3, z4, z5, z6, z7: out bit);
end multiplier;

architecture logic for multiplier is
  component Full_Add
    port (i0, i1 : in bit; ci : in bit;
      s : out bit;
      co : out bit);
  end component;
  component HalfAdd
    port (i0, i1 : in bit;
      s : out bit;
      co : out bit);
    end component;
signal AN00, AN10, AN20, AN30: bit;
signal AN01, AN11, AN21, AN31: bit;
signal AN02, AN12, AN22, AN32: bit;
signal AN03, AN13, AN23, AN33: bit;
begin
  z0 <= AN00;
  HA1: HalfAdd port map();
  AN00 <= a0 AND b0;
  AN10 <= a1 AND b0;
  AN20 <= a2 AND b0;
  AN30 <= a3 NAND b0;
  AN01 <= a0 AND b1;
  AN11 <= a1 AND b1;
  AN21 <= a2 AND b1;
  AN31 <= a3 NAND b1;
  AN02 <= a0 AND b2;
  AN12 <= a1 AND b2;
  AN22 <= a2 AND b2;
  AN32 <= a3 NAND b2;
  AN03 <= a0 NAND b3;
  AN13 <= a1 NAND b3;
  AN23 <= a2 NAND b3;
  AN33 <= a3 AND b3;
