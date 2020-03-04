entity FullAdder is
port(X, Y, Cin: in bit;
    Cout, Suma: out bit);
end FullAdder;

architecture Logic of FullAdder is
begin
  Suma <= X xor Y xor Cin after 10 ns;
  Cout <= (X and Y) or (X and Cin) or (Y and Cin) after 10 ns;
end Logic;
