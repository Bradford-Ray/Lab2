----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/24/2025 08:42:28 PM
-- Design Name: 
-- Module Name: sevenseg_decoder_tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sevenseg_decoder_tb is
end sevenseg_decoder_tb;

architecture Behavioral of sevenseg_decoder_tb is

    component sevenseg_decoder is
        port(i_hex : in STD_LOGIC_VECTOR (3 downto 0);
             o_seg_n : out STD_LOGIC_VECTOR (6 downto 0));
    end component;

    signal w_hex :      STD_LOGIC_VECTOR (3 downto 0);
    signal w_seg :      STD_LOGIC_VECTOR (6 downto 0);

begin

    sevenseg_decoder_uut : sevenseg_decoder
    port map(
        i_hex => w_hex (3 downto 0),
        o_seg_n => w_seg (6 downto 0)
    );
    
    test_process : process
    begin
    
        w_hex <= X"0"; wait for 10 ns;
            assert w_seg = "0000001" report "bad x0" severity failure;
        w_hex <= X"2"; wait for 10 ns;
            assert w_seg = "0100100" report "bad x2" severity failure; 
        w_hex <= X"4"; wait for 10 ns;
            assert w_seg = "0011001" report "bad x4" severity failure;
        w_hex <= X"7"; wait for 10 ns;
            assert w_seg = "1111000" report "bad x7" severity failure;  
        w_hex <= X"F"; wait for 10 ns;
            assert w_seg = "0001110" report "bad xF" severity failure;
        wait;
    
    end process;

end Behavioral;
