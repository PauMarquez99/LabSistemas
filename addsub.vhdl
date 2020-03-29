ENTITY addsub IS
   PORT (
      A : IN BIT_VECTOR(7 DOWNTO 0);
      B : IN BIT_VECTOR(7 DOWNTO 0);
      T : IN BIT;
      C_FLAG : OUT BIT;
      OV_FLAG : OUT BIT;
      R : OUT BIT_VECTOR(7 DOWNTO 0)
   );
END ENTITY;

architecture LOGIC of addsub is
component FullAdd
  port (A, B : in bit; BC : in bit;
    S : out bit;
    CO : out bit);
end component;
signal CA: BIT_VECTOR(7 DOWNTO 0); --carry
begin
  FA0: FullAdd port map(A(0), B(0), T, R(0), CA(0));
  FA1: FullAdd port map(A(1), B(1), CA(0), R(1), CA(1));
  FA2: FullAdd port map(A(2), B(2), CA(1), R(2), CA(2));
  FA3: FullAdd port map(A(3), B(3), CA(2), R(3), CA(3));
  FA4: FullAdd port map(A(4), B(4), CA(3), R(4), CA(4));
  FA5: FullAdd port map(A(5), B(5), CA(4), R(5), CA(5));
  FA6: FullAdd port map(A(6), B(6), CA(5), R(6), CA(6));
  FA7: FullAdd port map(A(7), B(7), CA(6), R(7), CA(7));
  C_FLAG <= CA(7);
  OV_FLAG <= CA(7) xor CA(6);
end LOGIC;
