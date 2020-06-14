library ieee;
use ieee.std_logic_1164.all;

entity datapath_tb is
end entity;

architecture log of datapath_tb is
  component datapath
    port (X_sel, Y_sel: in std_logic; --mux
          X_ld, Y_ld, O_enb : in std_logic; --registers
          X_gt_Y, X_eq_Y, X_lt_Y: out std_logic;      --comparator
          X_sub, Y_sub: in std_logic;             -- substractor
          X_i, Y_i: in std_logic_vector(3 downto 0);    -- input datapath
          Data_O: out std_logic_vector(3 downto 0);  --output register
          clk: in std_logic
    );
  end component;

  signal X_sel, Y_sel: std_logic; --mux
  signal X_ld, Y_ld, O_enb : std_logic; --registers
  signal X_gt_Y, X_eq_Y, X_lt_Y: std_logic;      --comparator
  signal X_sub, Y_sub: std_logic;             -- substractor
  signal X_i, Y_i: std_logic_vector(3 downto 0);    -- input datapath
  signal Data_O: std_logic_vector(3 downto 0);  --output register
  signal clk: std_logic;

  begin

  uut1: datapath port map(X_sel, Y_sel, X_ld, Y_ld, O_enb, X_gt_Y, X_eq_Y,
  X_lt_Y, X_sub, Y_sub, X_i, Y_i, Data_O, clk);

  process
  begin
  

  end process;

  end log;
