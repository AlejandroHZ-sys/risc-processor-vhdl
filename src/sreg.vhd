----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:18:12 11/13/2023 
-- Design Name: 
-- Module Name:    sreg - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sreg is
    Port ( clk : in  STD_LOGIC;
           clr : in  STD_LOGIC;
           en_Sreg : in  STD_LOGIC;
           ent_Sreg : in  STD_LOGIC;
           sal_Sreg : out  STD_LOGIC);
end sreg;

architecture Behavioral of sreg is
signal q_aux : STD_LOGIC;
begin
	process(clk,clr,en_Sreg)
	begin
		if(clr = '1') then
			q_aux <= '0';
		elsif(clk'event and clk = '1' and en_Sreg = '1') then
			q_aux <= ent_Sreg;
		end if;
	end process;
	
	sal_Sreg <= q_aux;

end Behavioral;

