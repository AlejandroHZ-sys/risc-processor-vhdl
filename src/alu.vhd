----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:05:21 09/22/2023 
-- Design Name: 
-- Module Name:    alu - Behavioral 
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

entity alu is
    Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
           sel_alu : in  STD_LOGIC_VECTOR (2 downto 0);
           F : out  STD_LOGIC_VECTOR (7 downto 0);
           Z : out  STD_LOGIC);
end alu;

architecture Behavioral of alu is
	signal f_aux : STD_LOGIC_VECTOR(8 downto 0);
begin

	process(A,B,sel_alu)
	begin
		case sel_alu is
		when "000" => f_aux<=('0'&A)+('0'&B);
		when "001" => f_aux<=('0'&A)-('0'&B);
		when "010" => f_aux<=('0'&A) and ('0'&B);
		when "011" => f_aux<=('0'&A) or ('0'&B);
		when "100" => f_aux<=('0'&A) xor ('0'&B);
		when "101" => f_aux<=not ('0'&A);
		when "110" => f_aux(8 downto 1)<=A; f_aux(0)<='0';
		when others => f_aux(6 downto 0)<=A(7 downto 1); f_aux(8 downto 7)<="00";
		end case;
	end process;
	
	F<=f_aux(7 downto 0);
	Z<=not (f_aux(7) or f_aux(6) or f_aux(5) or f_aux(4) or f_aux(3) or f_aux(2) or f_aux(1) or f_aux(0));

end Behavioral;

