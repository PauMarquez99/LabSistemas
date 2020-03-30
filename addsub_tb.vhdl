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
  addsub0: addsub port map(A, B, T, C_FLAG, OV_FLAG, R);
  process
  begin
    A <= "00001011";
    B <= "00010010";
    T <= '0';
    wait for 20 ns;   --CASO 1 SUMA DOS POSITIVOS
    A <= "00100101";
    B <= "01100101";
    T <= '0';
    wait for 20 ns;    --CASO 2 SUMA DOS POSITIVOS
    A <= "00100101";
    B <= "10100101";
    T <= '0';
    wait for 20 ns;    --CASO 1 SUMA POSITIVO C/NEGATIVO
    A <= "01100101";
    B <= "10001101";
    T <= '0';
    wait for 20 ns;    --CASO 2 SUMA POSITIVO C/NEGATIVO
    A <= "10100101";
    B <= "00100101";
    T <= '0';
    wait for 20 ns;    --CASO 1 SUMA NEGATIVO C/POSITIVO
    A <= "11001101";
    B <= "00000101";
    T <= '0';
    wait for 20 ns;    --CASO 2 SUMA NEGATIVO C/POSITIVO
    A <= "11001011";
    B <= "01011010";
    T <= '0';
    wait for 20 ns;    --CASO 1 C/OVERFLOW SUMA
    A <= "01110001";
    B <= "11100100";
    T <= '0';
    wait for 20 ns;    --CASO 2 C/OVERFLOW SUMA
    A <= "01100100";
    B <= "11001000";
    T <= '1';
    wait for 20 ns;    --CASO 1 C/OVERFLOW RESTA
    A <= "01111110";
    B <= "11000000";
    T <= '1';
    wait for 20 ns;    --CASO 2 C/OVERFLOW RESTA
    A <= "11111110";
    B <= "11111011";
    T <= '0';
    wait for 20 ns;    --CASO 1 C/CARRY OUT SUMA
    A <= "11110101";
    B <= "11010010";
    T <= '0';
    wait for 20 ns;    --CASO 2 C/CARRY OUT SUMA
    A <= "11111101";
    B <= "11001001";
    T <= '1';
    wait for 20 ns;    --CASO 1 C/CARRY OUT RESTA
    A <= "11111000";
    B <= "11101000";
    T <= '1';
    wait for 20 ns;    --CASO 2 C/CARRY OUT RESTA
    end process;
end TRY;
