----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/14/2019 01:17:42 AM
-- Design Name: 
-- Module Name: q1 - Behavioral
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

entity q2 is
    Port ( clk, X1,X2 : in STD_LOGIC;
           Z : out STD_LOGIC);
end q2;

architecture Behavioral of q2 is
signal PY : STD_LOGIC_VECTOR (1 downto 0) := "10";
signal NY : STD_LOGIC_VECTOR (1 downto 0) := "10";

begin

sync_p: process (CLK,NY)
    begin
        if (rising_edge(CLK)) then
            PY <= NY;
        end if;
end process sync_p;


    process (clk, X1,X2) begin
            Case PY is
            When "10"
            => if (X1 = '0') then
                    Z <= '0';
                elsif (X1 = '1') then
                    NY <= "01";
                    Z <= '0';
                end if;
            When "01"
            => if (X2 = '0') then
                    Z <= '1';
                    NY <= "10";
                elsif (X2 = '1') then
                    Z <= '0';
                end if;
           When "11"
           => if (X2 = '1') then
                Z <= '0';
            elsif (X2 = '0') then
                Z <= '1';
                NY <= "10";
            end if;
            When others
            => NY <= "10";
        end case;
        PY <= NY;
    
end process;

end Behavioral;
