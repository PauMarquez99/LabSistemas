entity addsub_tb is
end addsub_tb;

architecture TRY of addsub_tb is
component addsub
PORT (
   A : IN BIT_VECTOR(7 DOWNTO 0);
   B : IN BIT_VECTOR(7 DOWNTO 0);
   T : IN BIT;
   C_FLAG : OUT BIT;
   OV_FLAG : OUT BIT;
   R : OUT BIT_VECTOR(7 DOWNTO 0)
);
end component;

signal A, B: BIT_VECTOR(7 DOWNTO 0);
signal T: BIT;
signal C_FLAG, OV_FLAG: bit;
signal R: BIT_VECTOR(7 DOWNTO 0);

begin
  addsub0: addsub1 port map(A(0), A(1), A(2), A(3), A(4), A(5), A(6), A(7),
                            B(0), B(1), B(2), B(3), B(4), B(5), B(6), B(7)
                            T, C_FLAG, OV_FLAG,
                            R(0), R(1), R(2), R(3), R(4), R(5), R(6), R(7));
  process
  begin
    
end TRY;
