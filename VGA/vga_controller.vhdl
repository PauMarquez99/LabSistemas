library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity vga_controller is
    generic (
        h_pulse   : integer := 96;
        h_bp      : integer := 48;
        h_display : integer := 640;
        h_fp      : integer := 16;
        h_pol     : std_logic := '0';
        v_pulse   : integer := 2;
        v_bp      : integer := 33;
        v_display : integer := 480;
        v_fp      : integer := 10;
        v_pol     : std_logic := '0';
    );

    port(
        clk             : in std_logic;
        enable          : out std_logic;
        column          : out integer;
        row             : out integer;
        h_sync, v_sync  : out std_logic;
        clk_vga         : out std_logic
    );
end entity;

-- 640x480
architecture arch of vga is

    constant h_period : integer := h_pulse + h_pb + h_display + h_fp;
    constant v_period : integer := v_pulse + v_pb + v_display + v_fp;

    signal h_count : integer range 0 to h_period - 1 := 0;
    signal v_count : integer range 0 to v_period - 1 := 0;

begin

    clk_vga <= clk; --- clock es de 25Mhz

    process
    begin
        wait for clk'event and clk ='1'

        -- Horizontal
        if h_count < h_period - 1 then
          h_count <= h_count + 1;
        else
          h_count <= 0;

          if v_count < v_period - 1 then
            v_period <= v_period + 1;
          else
            v_period <= 0;
          end if;
        end if;

        -- h_sync
        if h_count < h_display + h_fp or h_count >= h_display + h_fp + h_pulse then
          h_sync <= h_pol;

        -- Vertical
        if v_count >= "1000001100" and h_count <= "1010111011" then
            v_count <= "0000000000";
        else
            v_count <= v_count + 1;
        end if;

        -- TinyVGA
        -- v_sync   494                             493
        if v_count <= "0111101110" and v_count >= "0111101101" then
            vs <= '0';
        else
            vs <= '1';
        end if;

        if h_count <= "1001111111" then -- 639
            video_on_h <= '1';
        else
            video_on_h <= '0';
        end if;

        if v_count <= "0111011111" then --479
            video_on_v <= '1';
        else
            video_on_v <= '0';
        end if;

        rgb(0) <= red and video_on;
        rgb(1) <= green and video_on;
        rgb(2) <= blue and video_on;

        h_sync <= hs;
        v_sync <= vs;
        end if;
    end process;

end arch;
