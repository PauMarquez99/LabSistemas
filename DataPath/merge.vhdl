library ieee;
use ieee.std_logic_1164.all;

entity merge is
  port(Go_i, clk: in std_logic;
      X_i, Y_i: in std_logic_vector(3 downto 0);
      Data_O: out std_logic_vector(3 downto 0)
      );
end entity;

architecture logic of merge is
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

  component controller
    port(GO_i, clk: in std_logic;
        X_sel, Y_sel: out std_logic;
        X_ld, Y_ld: out std_logic;
        X_gt_Y, X_eq_Y, X_lt_Y: in  std_logic;
        X_sub, Y_sub: out std_logic;
        O_enb: out std_logic
        );
  end component;

      signal X_sel, Y_sel: std_logic;
      signal X_ld, Y_ld: std_logic;
      signal X_gt_Y, X_eq_Y, X_lt_Y: std_logic;
      signal X_sub, Y_sub: std_logic;
      signal O_enb: std_logic;

  begin

  uut1: controller port map(GO_i, clk, X_sel, Y_sel, X_ld, Y_ld, X_gt_Y, X_eq_Y, X_lt_Y, X_sub, Y_sub, O_enb);
  uut2: datapath port map(X_sel, Y_sel, X_ld, Y_ld, O_enb, X_gt_Y, X_eq_Y, X_lt_Y, X_sub, Y_sub, X_i, Y_i, Data_O, clk);

end logic;
