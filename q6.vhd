----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/14/2019 12:42:49 PM
-- Design Name: 
-- Module Name: q6 - Behavioral
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

entity q6 is
    Port ( X, clk : in STD_LOGIC;
           Z1, Z2 : out STD_LOGIC);
end q6;

architecture Behavioral of q6 is
signal PS : STD_LOGIC_VECTOR (1 downto 0) := "00";
signal NS : STD_LOGIC_VECTOR (1 downto 0) := "00";
begin
    process (clk) begin
        if (rising_edge(clk)) then
            case PS is
                When "00"
                    => Z1 <= '1';
                       Z2 <= '0';
                        if ( X = '0') then
                            NS <= "10";
                        end if;
                When "10" 
                    => Z1 <= '1';
                       Z2 <= '0';
                       if ( X = '1') then
                            NS <= "00";
                        elsif (X = '0') then
                            NS <= "01"; 
                       end if;
                When "01"
                    => Z1 <= '0';
                       Z2 <= '0';
                       if (X = '0') then 
                            NS <= "11";
                       end if;
                When "11"
                    => Z1 <= '0';
                       if (X = '1') then 
                            NS <= "01";
                            Z2 <= '0';
                       elsif (X = '0') then
                            NS <= "00";
                            Z2 <= '1';
                        end if;
                When others
                    => NS <= "00";
            end case;
            PS <= NS;
        end if;
    end process;
end Behavioral;
