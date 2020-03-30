entity FullAdd is
  port (A, B : in bit; BC : in bit;
    S : out bit;
    CO : out bit);
end FullAdd;

architecture archi of FullAdd is

signal X1, A1, A2 : bit;
begin
  X1 <= A xor B;
  S <= BC xor X1;
  A1 <= BC and A1;
  A2 <= A and B;
  CO <= A1 or A2;
end archi;
