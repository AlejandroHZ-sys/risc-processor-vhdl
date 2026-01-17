----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:11:43 11/13/2023 
-- Design Name: 
-- Module Name:    ext_sig_rjmp - Behavioral 
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

entity ext_sig_rjmp is
    Port ( I_r : in  STD_LOGIC_VECTOR (15 downto 0);
           O_r : out  STD_LOGIC_VECTOR (15 downto 0));
end ext_sig_rjmp;

architecture Behavioral of ext_sig_rjmp is

begin
	O_r(11 downto 0) <= I_r(11 downto 0);
	O_r(12) <= I_r(11);
	O_r(13) <= I_r(11);
	O_r(14) <= I_r(11);
	O_r(15) <= I_r(11);

end Behavioral;

