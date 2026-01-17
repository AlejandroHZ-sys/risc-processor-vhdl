----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:34:34 11/13/2023 
-- Design Name: 
-- Module Name:    procesador - Behavioral 
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

entity procesador is
    Port ( clk : in  STD_LOGIC;
           clr : in  STD_LOGIC;
           PortB : out  STD_LOGIC_VECTOR (7 downto 0);
			  PortD : out  STD_LOGIC_VECTOR (7 downto 0));
end procesador;

architecture Behavioral of procesador is
component alu is
    Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
           sel_alu : in  STD_LOGIC_VECTOR (2 downto 0);
           F : out  STD_LOGIC_VECTOR (7 downto 0);
           Z : out  STD_LOGIC);
end component;

component decodificador is
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
end component;

component ext_sig_br is
    Port ( Ib : in  STD_LOGIC_VECTOR (15 downto 0);
           Ob : out  STD_LOGIC_VECTOR (15 downto 0));
end component;

component ext_sig_rjmp is
    Port ( I_r : in  STD_LOGIC_VECTOR (15 downto 0);
           O_r : out  STD_LOGIC_VECTOR (15 downto 0));
end component;

component memoria_registros is
    Port ( clk : in  STD_LOGIC;
           clr : in  STD_LOGIC;
           dato_w : in  STD_LOGIC_VECTOR (7 downto 0);
           en_w : in  STD_LOGIC;
           sel_w_d : in  STD_LOGIC_VECTOR (4 downto 0);
           sel_read_r : in  STD_LOGIC_VECTOR (4 downto 0);
           sel_read_d : in  STD_LOGIC_VECTOR (4 downto 0);
           O_r : out  STD_LOGIC_VECTOR (7 downto 0);
           O_d : out  STD_LOGIC_VECTOR (7 downto 0));
end component;

component registro is
    Port ( clk : in  STD_LOGIC;
           clr : in  STD_LOGIC;
           en : in  STD_LOGIC;
           I : in  STD_LOGIC_VECTOR (7 downto 0);
           O : out  STD_LOGIC_VECTOR (7 downto 0));
end component;

component mux is
    Port ( 
		sel_read : in  STD_LOGIC_VECTOR(4 downto 0);
        I : in  STD_LOGIC_VECTOR(255 downto 0);
        O : out  STD_LOGIC_VECTOR(7 downto 0)
	);
end component;

component decodificador5_32 is
    Port ( 
		en_w : in  STD_LOGIC;
        sel_w_d : in  STD_LOGIC_VECTOR(4 downto 0);
        O : out  STD_LOGIC_VECTOR(31 downto 0)
	);
end component;

component program_c is
    Port ( clk : in  STD_LOGIC;
           clr : in  STD_LOGIC;
           I : in  STD_LOGIC_VECTOR (15 downto 0);
           O : out  STD_LOGIC_VECTOR (15 downto 0));
end component;

component ram is
    Port ( clk : in  STD_LOGIC;
           we : in  STD_LOGIC;
           WD : in  STD_LOGIC_VECTOR (15 downto 0);
           RD : out  STD_LOGIC_VECTOR (15 downto 0);
           A : in  STD_LOGIC_VECTOR (3 downto 0));
end component;

component sreg is
    Port ( clk : in  STD_LOGIC;
           clr : in  STD_LOGIC;
           en_Sreg : in  STD_LOGIC;
           ent_Sreg : in  STD_LOGIC;
           sal_Sreg : out  STD_LOGIC);
end component;

component stack_pointer is
    Port ( clk : in  STD_LOGIC;
           clr : in  STD_LOGIC;
           I_sp : in  STD_LOGIC_VECTOR (3 downto 0);
           O_sp : out  STD_LOGIC_VECTOR (3 downto 0));
end component;

component rom is
    Port ( Arom : in  STD_LOGIC_VECTOR (15 downto 0);
           Orom : out  STD_LOGIC_VECTOR (15 downto 0));
end component;

signal I_aux, PC_aux, br_mux_aux, rd_aux, off_br_aux, off_rjmp_aux, offset_aux, I_PC_aux, wd_aux : STD_LOGIC_VECTOR(15 downto 0);

signal dato_I_aux, O_r_aux, O_d_aux, F_aux, B_aux : STD_LOGIC_VECTOR(7 downto 0);

signal sel_read_r_aux, sel_read_d_aux, sel_w_d_aux : STD_LOGIC_VECTOR(4 downto 0);

signal A_aux, I_sp_aux, O_sp_aux, call_aux, ret_aux : STD_LOGIC_VECTOR(3 downto 0);

signal sel_alu_aux : STD_LOGIC_VECTOR(2 downto 0);

signal ld_aux, sel_rel_aux, br_aux, en_w_aux, branch_aux, en_portb_aux, en_portd_aux, en_sreg_aux, ld_mov_aux, ret_s_aux, bn_aux, s1_aux, s0_aux, ent_sreg_aux, sal_sreg_aux, imed_aux, inc_dec_aux : STD_LOGIC;

begin
	offset_aux <= x"0001" when sel_rel_aux='0' and branch_aux='0' else
					  off_br_aux+1 when sel_rel_aux='0' and branch_aux='1' else
					  off_rjmp_aux+1;
					  
	I_PC_aux <= offset_aux + PC_aux;
	
	br_mux_aux <= rd_aux when ret_s_aux='1' else
					  I_PC_aux;
					  
	dato_I_aux <= I_aux(11 downto 8) & I_aux(3 downto 0) when ld_mov_aux='0' and ld_aux='0' else
					  O_r_aux when ld_mov_aux='0' and ld_aux='1' else
					  F_aux;
					  
	I_sp_aux <= O_sp_aux when s1_aux='0' and s0_aux='0' else
					call_aux when s1_aux='0' and s0_aux='1' else
					ret_aux;
					
	A_aux <= O_sp_aux when s1_aux='0' else
				ret_aux;
				
	call_aux <= O_sp_aux - 2;
	
	ret_aux <= O_sp_aux + 2;
	
	wd_aux <= PC_aux+1;
	
	branch_aux <= br_aux when sal_sreg_aux='1' else
					  bn_aux;
					  
	B_aux <= O_r_aux when inc_dec_aux='0' and imed_aux='0' else
				I_aux(11 downto 8) & I_aux(3 downto 0) when inc_dec_aux='0' and imed_aux='1' else
				x"01";
					  
	cto1: decodificador port map(I => I_aux,
           sel_alu => sel_alu_aux,
           l_d => ld_aux,
           sel_rel => sel_rel_aux,
           Br => br_aux,
           sel_read_d => sel_read_d_aux,
           sel_read_r => sel_read_r_aux,
           sel_w_d => sel_w_d_aux,
           en_w => en_w_aux,
           en_portb => en_portb_aux,
			  en_portd => en_portd_aux,
           en_sreg => en_sreg_aux,
           ld_mov => ld_mov_aux,
           ret_s => ret_s_aux,
           Bn => bn_aux,
           s1 => s1_aux,
           s0 => s0_aux,
			  imed => imed_aux,
			  inc_dec => inc_dec_aux);
			  
	cto2: alu port map(A => O_d_aux,
           B => B_aux,
           sel_alu => sel_alu_aux,
           F => F_aux,
           Z => ent_sreg_aux);
			  
	cto3: ext_sig_br port map(Ib => I_aux,
           Ob => off_br_aux);
			  
	cto4: ext_sig_rjmp port map(I_r => I_aux,
			  O_r => off_rjmp_aux);
			  
	cto5: program_c port map(clk => clk,
           clr => clr,
           I => br_mux_aux,
           O => PC_aux);
			  
	cto6: rom port map(Arom => PC_aux,
           Orom => I_aux);
	
	cto7: memoria_registros port map(clk => clk,
           clr => clr,
           dato_w => dato_I_aux,
           en_w => en_w_aux,
           sel_w_d => sel_w_d_aux,
           sel_read_r => sel_read_r_aux,
           sel_read_d => sel_read_d_aux,
           O_r => O_r_aux,
           O_d => O_d_aux);

	cto8: registro port map(clk => clk,
           clr => clr,
           en => en_portb_aux,
           I => O_r_aux,
           O => PortB);
			  
	cto9: Sreg port map(clk => clk,
           clr => clr,
           en_Sreg => en_sreg_aux,
           ent_Sreg => ent_sreg_aux,
           sal_Sreg => sal_sreg_aux);
			  
	cto10: ram port map(clk => clk,
           we => s0_aux,
           WD => wd_aux,
           RD => rd_aux,
           A => A_aux);
			  
	cto11: stack_pointer port map(clk => clk,
           clr => clr,
           I_sp => I_sp_aux,
           O_sp => O_sp_aux);
			  
	cto12: registro port map(clk => clk,
           clr => clr,
           en => en_portd_aux,
           I => O_r_aux,
           O => PortD);

end Behavioral;

