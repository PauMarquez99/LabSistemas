library ieee;
use ieee.std_logic_1164.all;

entity datapath is
  port (X_sel, Y_sel: in std_logic; --mux
        X_ld, Y_ld: in std_logic; --registers
        X_gt_Y, X_eq_Y, X_lt_Y: out std_logic;      --comparator
        X_sub, Y_sub: in std_logic;             -- substractor
        X_i, Y_i; in std_logic_vector(3 downto 0);    -- input datapath
        Data_O: out std_logic_vector(3 downto 0);  --output register
        clk: in std_logic;
  );
end entity;

architecture log of datapath is
  component shiftregister
    port(
        clk, clr, sdr, sdl : in bit;
        mode : in bit_vector(1 downto 0);
        parallel : in bit_vector(3 downto 0);
        q : out bit_vector(3 downto 0)
    );
  end component;

  component mux
    port(
        x, y : in std_logic_vector(3 downto 0);
        sel : in std_logic;
        res : out std_logic_vector(3 downto 0)
    );
  end component;

  component comparator
    port(
        x, y : in std_logic_vector(3 downto 0);
        x_gt_y, x_eq_y, x_lt_y : out std_logic
    );
  end component;

  component substractor4
    port (X_i,
        a, b:in std_logic_vector(3 downto 0);
        bin : in std_logic;
        d: out std_logic_vector (3 downto 0);
        bout : out std_logic;
    );
  end component;

  signal X_sub_out, Y_sub_out: std_logic_vector(3 downto 0); --output substractor
  signal X_sel_out, Y_sel_out: std_logic_vector(3 downto 0); --output MUX
  signal X_reg_out, Y_reg_out: std_logic_vector(3 downto 0);
  signal aux: std_logic;

  begin

  uut1_MUX1: mux port map(X_i, X_sub_out, X_sel, X_sel_out);
  uut2_MUX2: mux port map(Y_i, Y_sub_out, Y_sel, Y_sel_out);
  uut3_REGISTER1: shiftregister port map(clk, '1',sdr,sdl,mode, X_sel_out, X_reg_out);
  uut4_REGISTER2: shiftregister port map(clk, '1',sdr,sdl,mode, Y_sel_out, Y_reg_out);
  uut5_COMPARATOR: comparator port map(X_reg_out, Y_reg_out, X_gt_Y, X_eq_Y, X_lt_Y);
  uut6_SUBSTRACTOR1: substractor4 port map(X_reg_out, Y_reg_out, X_sub, X_sub_out. aux );
  uut7_SUBSTRACTOR1: substractor4 port map(Y_reg_out, X_reg_out, Y_sub, Y_sub_out, aux );
  uut8_OUTPUT_REGISTER: shiftregister port map(clk, '1',sdr,sdl,mode, Y_sel_out, Y_reg_out);

  end log;
