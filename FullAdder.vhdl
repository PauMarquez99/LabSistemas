entity FullAdder is
port(X, Y, Cin: in bit; --señales de entrada
    Cout, Suma: out bit); --señales de salida
end FullAdder;

architecture Logic of FullAdder is --comportamiento del FullAdder
begin
  Suma <= X xor Y xor Cin after 10 ns; --ecuación de la suma
  Cout <= (X and Y) or (X and Cin) or (Y and Cin) after 10 ns; --ecuación del carry out
end Logic;
