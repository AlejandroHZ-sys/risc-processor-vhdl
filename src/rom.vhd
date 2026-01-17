----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:30:16 11/13/2023 
-- Design Name: 
-- Module Name:    rom - Behavioral 
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

entity rom is
    Port ( Arom : in  STD_LOGIC_VECTOR (15 downto 0);
           Orom : out  STD_LOGIC_VECTOR (15 downto 0));
end rom;

architecture Behavioral of rom is

begin
Orom <=  x"ef0e" when Arom=x"0000" else
         x"b905" when Arom=x"0001" else
         x"ef0f" when Arom=x"0002" else
         x"b90b" when Arom=x"0003" else
         x"d024" when Arom=x"0004" else
         x"ef0d" when Arom=x"0005" else
         x"b905" when Arom=x"0006" else
         x"ef0f" when Arom=x"0007" else
         x"b90b" when Arom=x"0008" else
         x"d01f" when Arom=x"0009" else
         x"ef0b" when Arom=x"000a" else
         x"b905" when Arom=x"000b" else
         x"ec03" when Arom=x"000c" else
         x"b90b" when Arom=x"000d" else
         x"d01a" when Arom=x"000e" else
         x"ef07" when Arom=x"000f" else
         x"b905" when Arom=x"0010" else
         x"eb0d" when Arom=x"0011" else
         x"b90b" when Arom=x"0012" else
         x"d015" when Arom=x"0013" else
         x"ee0f" when Arom=x"0014" else
         x"b905" when Arom=x"0015" else
         x"eb0d" when Arom=x"0016" else
         x"b90b" when Arom=x"0017" else
         x"d010" when Arom=x"0018" else
         x"ed0f" when Arom=x"0019" else
         x"b905" when Arom=x"001a" else
         x"ec03" when Arom=x"001b" else
         x"b90b" when Arom=x"001c" else
         x"d00b" when Arom=x"001d" else
         x"eb0f" when Arom=x"001e" else
         x"b905" when Arom=x"001f" else
         x"ef0f" when Arom=x"0020" else
         x"b90b" when Arom=x"0021" else
         x"d006" when Arom=x"0022" else
         x"e70f" when Arom=x"0023" else
         x"b905" when Arom=x"0024" else
         x"ef0f" when Arom=x"0025" else
         x"b90b" when Arom=x"0026" else
         x"d001" when Arom=x"0027" else
         x"cfd7" when Arom=x"0028" else
         x"e015" when Arom=x"0029" else
         x"e624" when Arom=x"002a" else
         x"ec38" when Arom=x"002b" else
         x"0000" when Arom=x"002c" else
         x"0000" when Arom=x"002d" else
         x"0000" when Arom=x"002e" else
         x"0000" when Arom=x"002f" else
         x"953a" when Arom=x"0030" else
         x"f7d1" when Arom=x"0031" else
         x"952a" when Arom=x"0032" else
         x"f7b9" when Arom=x"0033" else
         x"951a" when Arom=x"0034" else
         x"f7a1" when Arom=x"0035" else
         x"9508" when Arom=x"0036" else
         x"ffff";
end Behavioral;

