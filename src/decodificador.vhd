----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:52:17 11/12/2023 
-- Design Name: 
-- Module Name:    decodificador - Behavioral 
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

entity decodificador is
    Port ( I : in  STD_LOGIC_VECTOR (15 downto 0);
           sel_alu : out  STD_LOGIC_VECTOR (2 downto 0);
           l_d : out  STD_LOGIC;
           sel_rel : out  STD_LOGIC;
           Br : out  STD_LOGIC;
           sel_read_d : out  STD_LOGIC_VECTOR (4 downto 0);
           sel_read_r : out  STD_LOGIC_VECTOR (4 downto 0);
           sel_w_d : out  STD_LOGIC_VECTOR (4 downto 0);
           en_w : out  STD_LOGIC;
           en_portb : out  STD_LOGIC;
			  en_portd : out  STD_LOGIC;
           en_sreg : out  STD_LOGIC;
           ld_mov : out  STD_LOGIC;
           ret_s : out  STD_LOGIC;
           Bn : out  STD_LOGIC;
           s1 : out  STD_LOGIC;
           s0 : out  STD_LOGIC;
			  imed : out STD_LOGIC;
			  inc_dec : out STD_LOGIC);
end decodificador;

architecture Behavioral of decodificador is

begin

	process(I)
	begin
		case I(15 downto 12) is
		when "0000" => --add, lsl, nop
			if(I(11 downto 10)="00") then --nop
				sel_alu <= "000";
			   l_d <= '0';
			   sel_rel <= '0';
			   Br <= '0';
			   sel_read_d <= "00000";
			   sel_read_r <= "00000";
			   sel_w_d <= "00000";
			   en_w <= '0';
			   en_portb <= '0';
				en_portd <= '0';
			   en_sreg <= '0';
			   ld_mov <= '0';
			   ret_s <= '0';
			   Bn <= '0';
			   s1 <= '0';
			   s0 <= '0';
				imed <= '0';
				inc_dec <= '0';
				
			elsif(I(11 downto 10)="11") then --add, lsl
				if(I(9)&I(3 downto 0) = I(8 downto 4)) then --lsl
					sel_alu <= "110";
					l_d <= '0';
					sel_rel <= '0';
					Br <= '0';
					sel_read_d <= I(8 downto 4);
					sel_read_r <= "00000";
					sel_w_d <= I(8 downto 4);
					en_w <= '1';
					en_portb <= '0';
					en_portd <= '0';
					en_sreg <= '1';
					ld_mov <= '1';
					ret_s <= '0';
					Bn <= '0';
					s1 <= '0';
					s0 <= '0';
					imed <= '0';
					inc_dec <= '0';
				else --add
					sel_alu <= "000";
					l_d <= '0';
					sel_rel <= '0';
					Br <= '0';
					sel_read_d <= I(8 downto 4);
					sel_read_r <= I(9)&I(3 downto 0);
					sel_w_d <= I(8 downto 4);
					en_w <= '1';
					en_portb <= '0';
					en_portd <= '0';
					en_sreg <= '1';
					ld_mov <= '1';
					ret_s <= '0';
					Bn <= '0';
					s1 <= '0';
					s0 <= '0';
					imed <= '0';
					inc_dec <= '0';
				end if;
			else
				sel_alu <= "000";
			   l_d <= '0';
			   sel_rel <= '0';
			   Br <= '0';
			   sel_read_d <= "00000";
			   sel_read_r <= "00000";
			   sel_w_d <= "00000";
			   en_w <= '0';
			   en_portb <= '0';
				en_portd <= '0';
			   en_sreg <= '0';
			   ld_mov <= '0';
			   ret_s <= '0';
			   Bn <= '0';
			   s1 <= '0';
			   s0 <= '0';
				imed <= '0';
				inc_dec <= '0';

			end if;
		
		when "0001" => --sub, cp
			if(I(11 downto 10)="01") then --cp
				sel_alu <= "001";
				l_d <= '0';
				sel_rel <= '0';
				Br <= '0';
				sel_read_d <= I(8 downto 4);
				sel_read_r <= I(9)&I(3 downto 0);
				sel_w_d <= I(8 downto 4);
				en_w <= '0';
				en_portb <= '0';
				en_portd <= '0';
				en_sreg <= '1';
				ld_mov <= '1';
				ret_s <= '0';
				Bn <= '0';
				s1 <= '0';
				s0 <= '0';
				imed <= '0';
				inc_dec <= '0';
			else --sub
				sel_alu <= "001";
				l_d <= '0';
				sel_rel <= '0';
				Br <= '0';
				sel_read_d <= I(8 downto 4);
				sel_read_r <= I(9)&I(3 downto 0);
				sel_w_d <= I(8 downto 4);
				en_w <= '1';
				en_portb <= '0';
				en_portd <= '0';
				en_sreg <= '1';
				ld_mov <= '1';
				ret_s <= '0';
				Bn <= '0';
				s1 <= '0';
				s0 <= '0';
				imed <= '0';
				inc_dec <= '0';
			end if;
			
			
		when "0010" => --and, or, eor, mov
			if(I(11 downto 10)="00") then --and
				sel_alu <= "010";
			   l_d <= '0';
			   sel_rel <= '0';
			   Br <= '0';
			   sel_read_d <= I(8 downto 4);
				sel_read_r <= I(9)&I(3 downto 0);
				sel_w_d <= I(8 downto 4);
			   en_w <= '1';
			   en_portb <= '0';
				en_portd <= '0';
			   en_sreg <= '1';
			   ld_mov <= '1';
			   ret_s <= '0';
			   Bn <= '0';
			   s1 <= '0';
			   s0 <= '0';
				imed <= '0';
				inc_dec <= '0';
				
			elsif(I(11 downto 10)="10") then --or
				sel_alu <= "011";
			   l_d <= '0';
			   sel_rel <= '0';
			   Br <= '0';
			   sel_read_d <= I(8 downto 4);
				sel_read_r <= I(9)&I(3 downto 0);
				sel_w_d <= I(8 downto 4);
			   en_w <= '1';
			   en_portb <= '0';
				en_portd <= '0';
			   en_sreg <= '1';
			   ld_mov <= '1';
			   ret_s <= '0';
			   Bn <= '0';
			   s1 <= '0';
			   s0 <= '0';
				imed <= '0';
				inc_dec <= '0';
			
			elsif(I(11 downto 10)="01") then --eor
				sel_alu <= "100";
			   l_d <= '0';
			   sel_rel <= '0';
			   Br <= '0';
			   sel_read_d <= I(8 downto 4);
				sel_read_r <= I(9)&I(3 downto 0);
				sel_w_d <= I(8 downto 4);
			   en_w <= '1';
			   en_portb <= '0';
				en_portd <= '0';
			   en_sreg <= '1';
			   ld_mov <= '1';
			   ret_s <= '0';
			   Bn <= '0';
			   s1 <= '0';
			   s0 <= '0';
				imed <= '0';
				inc_dec <= '0';
				
			else --mov
				sel_alu <= "000";
			   l_d <= '1';
			   sel_rel <= '0';
			   Br <= '0';
			   sel_read_d <= I(8 downto 4);
				sel_read_r <= I(9)&I(3 downto 0);
				sel_w_d <= I(8 downto 4);
			   en_w <= '1';
			   en_portb <= '0';
				en_portd <= '0';
			   en_sreg <= '0';
			   ld_mov <= '0';
			   ret_s <= '0';
			   Bn <= '0';
			   s1 <= '0';
			   s0 <= '0';
				imed <= '0';
				inc_dec <= '0';
			end if;
		
		when "0011" => --cpi
			sel_alu <= "001";
			l_d <= '0';
			sel_rel <= '0';
			Br <= '0';
			sel_read_d <= '1'&I(7 downto 4);
			sel_read_r <= "00000";
			sel_w_d <= "00000";
			en_w <= '0';
			en_portb <= '0';
			en_portd <= '0';
			en_sreg <= '1';
			ld_mov <= '1';
			ret_s <= '0';
			Bn <= '0';
			s1 <= '0';
			s0 <= '0';
			imed <= '1';
			inc_dec <= '0';
			
		when "1001" => --com, lsr, ret, inc, dec
			if(I(3 downto 0)="0000") then --com
				sel_alu <= "101";
			   l_d <= '0';
			   sel_rel <= '0';
			   Br <= '0';
			   sel_read_d <= I(8 downto 4);
				sel_read_r <= "00000";
				sel_w_d <= I(8 downto 4);
			   en_w <= '1';
			   en_portb <= '0';
				en_portd <= '0';
			   en_sreg <= '1';
			   ld_mov <= '1';
			   ret_s <= '0';
			   Bn <= '0';
			   s1 <= '0';
			   s0 <= '0';
				imed <= '0';
				inc_dec <= '0';
				
			elsif(I(3 downto 0)="0110") then --lsr
				sel_alu <= "111";
			   l_d <= '0';
			   sel_rel <= '0';
			   Br <= '0';
			   sel_read_d <= I(8 downto 4);
				sel_read_r <= "00000";
				sel_w_d <= I(8 downto 4);
			   en_w <= '1';
			   en_portb <= '0';
				en_portd <= '0';
			   en_sreg <= '1';
			   ld_mov <= '1';
			   ret_s <= '0';
			   Bn <= '0';
			   s1 <= '0';
			   s0 <= '0';
				imed <= '0';
				inc_dec <= '0';
				
			elsif(I(3 downto 0)="1000") then --ret
				sel_alu <= "000";
			   l_d <= '0';
			   sel_rel <= '0';
			   Br <= '0';
			   sel_read_d <= "00000";
			   sel_read_r <= "00000";
			   sel_w_d <= "00000";
			   en_w <= '0';
			   en_portb <= '0';
				en_portd <= '0';
			   en_sreg <= '0';
			   ld_mov <= '0';
			   ret_s <= '1';
			   Bn <= '0';
			   s1 <= '1';
			   s0 <= '0';
				imed <= '0';
				inc_dec <= '0';
			
			elsif(I(3 downto 0)="0011") then --inc
				sel_alu <= "000";
				l_d <= '0';
				sel_rel <= '0';
				Br <= '0';
				sel_read_d <= I(8 downto 4);
				sel_read_r <= "00000";
				sel_w_d <= I(8 downto 4);
				en_w <= '1';
				en_portb <= '0';
				en_portd <= '0';
				en_sreg <= '1';
				ld_mov <= '1';
				ret_s <= '0';
				Bn <= '0';
				s1 <= '0';
				s0 <= '0';
				imed <= '0';
				inc_dec <= '1';
			
			elsif(I(3 downto 0)="1010") then --dec
				sel_alu <= "001";
				l_d <= '0';
				sel_rel <= '0';
				Br <= '0';
				sel_read_d <= I(8 downto 4);
				sel_read_r <= "00000";
				sel_w_d <= I(8 downto 4);
				en_w <= '1';
				en_portb <= '0';
				en_portd <= '0';
				en_sreg <= '1';
				ld_mov <= '1';
				ret_s <= '0';
				Bn <= '0';
				s1 <= '0';
				s0 <= '0';
				imed <= '0';
				inc_dec <= '1';
			else
				sel_alu <= "000";
			   l_d <= '0';
			   sel_rel <= '0';
			   Br <= '0';
			   sel_read_d <= "00000";
			   sel_read_r <= "00000";
			   sel_w_d <= "00000";
			   en_w <= '0';
			   en_portb <= '0';
				en_portd <= '0';
			   en_sreg <= '0';
			   ld_mov <= '0';
			   ret_s <= '0';
			   Bn <= '0';
			   s1 <= '0';
			   s0 <= '0';
				imed <= '0';
				inc_dec <= '0';

			end if;
		
		when "1110" => --ldi
			sel_alu <= "111";
			l_d <= '0';
			sel_rel <= '0';
			Br <= '0';
			sel_read_d <= '1'&I(7 downto 4);
			sel_read_r <= "00000";
			sel_w_d <= '1'&I(7 downto 4);
			en_w <= '1';
			en_portb <= '0';
			en_portd <= '0';
			en_sreg <= '0';
			ld_mov <= '0';
			ret_s <= '0';
			Bn <= '0';
			s1 <= '0';
			s0 <= '0';
			imed <= '0';
			inc_dec <= '0';
			
		when "1111" => --breq
			if(I(11 downto 10)="00") then --breq
				sel_alu <= "000";
				l_d <= '0';
				sel_rel <= '0';
				Br <= '1';
				sel_read_d <= "00000";
				sel_read_r <= "00000";
				sel_w_d <= "00000";
				en_w <= '0';
				en_portb <= '0';
				en_portd <= '0';
				en_sreg <= '0';
				ld_mov <= '0';
				ret_s <= '0';
				Bn <= '0';
				s1 <= '0';
				s0 <= '0';
				imed <= '0';
				inc_dec <= '0';
				
			elsif(I(11 downto 10)="01") then --brne
				sel_alu <= "000";
				l_d <= '0';
				sel_rel <= '0';
				Br <= '0';
				sel_read_d <= "00000";
				sel_read_r <= "00000";
				sel_w_d <= "00000";
				en_w <= '0';
				en_portb <= '0';
				en_portd <= '0';
				en_sreg <= '0';
				ld_mov <= '0';
				ret_s <= '0';
				Bn <= '1';
				s1 <= '0';
				s0 <= '0';
				imed <= '0';
				inc_dec <= '0';
				
			else
				sel_alu <= "000";
			   l_d <= '0';
			   sel_rel <= '0';
			   Br <= '0';
			   sel_read_d <= "00000";
			   sel_read_r <= "00000";
			   sel_w_d <= "00000";
			   en_w <= '0';
			   en_portb <= '0';
				en_portd <= '0';
			   en_sreg <= '0';
			   ld_mov <= '0';
			   ret_s <= '0';
			   Bn <= '0';
			   s1 <= '0';
			   s0 <= '0';
				imed <= '0';
				inc_dec <= '0';

			end if;
		
		when "1101" => --rcall
			sel_alu <= "000";
			l_d <= '0';
			sel_rel <= '1';
			Br <= '0';
			sel_read_d <= "00000";
			sel_read_r <= "00000";
			sel_w_d <= "00000";
			en_w <= '0';
			en_portb <= '0';
			en_portd <= '0';
			en_sreg <= '0';
			ld_mov <= '0';
			ret_s <= '0';
			Bn <= '0';
			s1 <= '0';
			s0 <= '1';
			imed <= '0';
			inc_dec <= '0';
		
		when "1100" => --rjmp
			sel_alu <= "000";
			l_d <= '0';
			sel_rel <= '1';
			Br <= '0';
			sel_read_d <= "00000";
			sel_read_r <= "00000";
			sel_w_d <= "00000";
			en_w <= '0';
			en_portb <= '0';
			en_portd <= '0';
			en_sreg <= '0';
			ld_mov <= '0';
			ret_s <= '0';
			Bn <= '0';
			s1 <= '0';
			s0 <= '0';
			imed <= '0';
			inc_dec <= '0';
		
		when others => --out
			if(I(10 downto 9)&I(3 downto 0)="000101") then --out portb
				sel_alu <= "000";
				l_d <= '0';
				sel_rel <= '0';
				Br <= '0';
				sel_read_d <= "00000";
				sel_read_r <= I(8 downto 4);
				sel_w_d <= "00000";
				en_w <= '0';
				en_portb <= '1';
				en_portd <= '0';
				en_sreg <= '0';
				ld_mov <= '0';
				ret_s <= '0';
				Bn <= '0';
				s1 <= '0';
				s0 <= '0';
				imed <= '0';
				inc_dec <= '0';

			elsif(I(10 downto 9)&I(3 downto 0)="001011") then --out portd
				sel_alu <= "000";
				l_d <= '0';
				sel_rel <= '0';
				Br <= '0';
				sel_read_d <= "00000";
				sel_read_r <= I(8 downto 4);
				sel_w_d <= "00000";
				en_w <= '0';
				en_portb <= '0';
				en_portd <= '1';
				en_sreg <= '0';
				ld_mov <= '0';
				ret_s <= '0';
				Bn <= '0';
				s1 <= '0';
				s0 <= '0';
				imed <= '0';
				inc_dec <= '0';
				
			else
				sel_alu <= "000";
			   l_d <= '0';
			   sel_rel <= '0';
			   Br <= '0';
			   sel_read_d <= "00000";
			   sel_read_r <= "00000";
			   sel_w_d <= "00000";
			   en_w <= '0';
			   en_portb <= '0';
				en_portd <= '0';
			   en_sreg <= '0';
			   ld_mov <= '0';
			   ret_s <= '0';
			   Bn <= '0';
			   s1 <= '0';
			   s0 <= '0';
				imed <= '0';
				inc_dec <= '0';
			end if;
		end case;
	end process;

end Behavioral;

