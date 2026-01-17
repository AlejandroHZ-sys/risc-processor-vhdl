----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:09:55 10/02/2023 
-- Design Name: 
-- Module Name:    ram - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ram is
    Port ( clk : in  STD_LOGIC;
           we : in  STD_LOGIC;
           WD : in  STD_LOGIC_VECTOR (15 downto 0);
           RD : out  STD_LOGIC_VECTOR (15 downto 0);
           A : in  STD_LOGIC_VECTOR (3 downto 0));
end ram;

architecture Behavioral of ram is
type ram is array(15 downto 0) of STD_LOGIC_VECTOR(15 downto 0);
signal dato : ram;
begin

escritura: process(clk, we)
	begin
		if(clk'event and clk='1' and we='1') then
			dato(conv_integer(A))<=WD;
		end if;
	end process;
	
	RD<=dato(conv_integer(A));

end Behavioral;

