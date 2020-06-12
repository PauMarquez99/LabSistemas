library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ShiftRegister74 is
  port(A, B, C, D, S1, S0, SR, SL, Clk, Clr: in std_logic; QA, QB, QC, QD: out bit);
end entity;

architecture behavioural of ShiftRegister74 is

  signal LogicA, LogicB, LogicC, LogicD: std_logic;
  signal SQA, SQB, SQC, SQD: std_logic;

  begin
    LogicA <= (SR and not(S1) and S0) or (A and S1 and S0) or (SQB and not(S0) and S1) or (S0 and not(S1) and SQA);
    LogicB <= (SQA and not (S1) and S0) or (S0 and S1 and B) or (not (S0) and S1 and SQC) or (not (S0) and not (S1) and SQB);
     
