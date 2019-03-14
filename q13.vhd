----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/14/2019 01:18:41 PM
-- Design Name: 
-- Module Name: q13 - Behavioral
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

entity q13 is
    Port ( clk, X1, X2 : in STD_LOGIC;
           CS : out STD_LOGIC;
           RD : out STD_LOGIC);
end q13;

architecture Behavioral of q13 is
signal PY : STD_LOGIC_VECTOR (2 DOWNTO 1) := "001";
signal NY : STD_LOGIC_VECTOR (2 DOWNTO 1);
begin
    process (clk) 
        begin 
            if (rising_edge(clk)) then
                Case PY is
                    When "001"
                        => if (X1 = '0') then
                                NY <= "010";
                                CS <= '0';
                                RD <= '1';
                            elsif (X1 = '1') then
                                NY <= "100";
                                CS <= '1';
                                RD <= '0';
                            end if;
                    When "010"
                        => NY <= "100";
                           CS <= '1';
                           RD <= '1';
                    When "100"
                        => if ( X2 = '1') then
                                CS <= '0';
                                RD <= '1';
                            elsif ( X2 = '0') then
                                CS <= '1';
                                RD <= '0';
                                NY <= "001";
                            end if;
                    When others
                        => NY <= "001";
                    end case;
                        PY <= NY;
            end if;
        end process;
end Behavioral;
