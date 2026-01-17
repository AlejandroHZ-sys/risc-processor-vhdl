----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:00:56 10/09/2023 
-- Design Name: 
-- Module Name:    top - Behavioral 
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

entity memoria_registros is
    Port ( clk : in  STD_LOGIC;
           clr : in  STD_LOGIC;
           dato_w : in  STD_LOGIC_VECTOR (7 downto 0);
           en_w : in  STD_LOGIC;
           sel_w_d : in  STD_LOGIC_VECTOR (4 downto 0);
           sel_read_r : in  STD_LOGIC_VECTOR (4 downto 0);
           sel_read_d : in  STD_LOGIC_VECTOR (4 downto 0);
           O_r : out  STD_LOGIC_VECTOR (7 downto 0);
           O_d : out  STD_LOGIC_VECTOR (7 downto 0));
end memoria_registros;

architecture Behavioral of memoria_registros is

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


signal O_en_aux: std_logic_vector(31 downto 0);

signal Q_aux: std_logic_vector(255 downto 0);

begin
--decodificador
decod:decodificador5_32 port map (en_w => en_w ,
        sel_w_d => sel_w_d,
        O => O_en_aux);
		  
-- los dos multiplexores
mux_r : mux port map ( sel_read => sel_read_r,
        I => Q_aux,
        O => O_r);

mux_d : mux port map ( sel_read => sel_read_d,
        I => Q_aux,
        O => O_d);
		  
-- 32 registros, de chill

registro0 : registro port map (clk => clk, clr => clr, en => O_en_aux(0),
           I => dato_w, O =>Q_aux (7 downto 0));
registro1 : registro port map (clk => clk, clr => clr, en => O_en_aux(1),
           I => dato_w, O =>Q_aux (15 downto 8));
registro2 : registro port map (clk => clk, clr => clr, en => O_en_aux(2),
           I => dato_w, O =>Q_aux (23 downto 16));
registro3 : registro port map (clk => clk, clr => clr, en => O_en_aux(3),
           I => dato_w, O =>Q_aux (31 downto 24));
registro4 : registro port map (clk => clk, clr => clr, en => O_en_aux(4),
           I => dato_w, O =>Q_aux (39 downto 32));
registro5 : registro port map (clk => clk, clr => clr, en => O_en_aux(5),
           I => dato_w, O =>Q_aux (47 downto 40));
registro6 : registro port map (clk => clk, clr => clr, en => O_en_aux(6),
           I => dato_w, O =>Q_aux (55 downto 48));
registro7 : registro port map (clk => clk, clr => clr, en => O_en_aux(7),
           I => dato_w, O =>Q_aux (63 downto 56));

registro8 : registro port map (clk => clk, clr => clr, en => O_en_aux(8),
           I => dato_w, O =>Q_aux (71 downto 64));
registro9 : registro port map (clk => clk, clr => clr, en => O_en_aux(9),
           I => dato_w, O =>Q_aux (79 downto 72));
registro10 : registro port map (clk => clk, clr => clr, en => O_en_aux(10),
           I => dato_w, O =>Q_aux (87 downto 80));
registro11 : registro port map (clk => clk, clr => clr, en => O_en_aux(11),
           I => dato_w, O =>Q_aux (95 downto 88));
registro12 : registro port map (clk => clk, clr => clr, en => O_en_aux(12),
           I => dato_w, O =>Q_aux (103 downto 96));
registro13 : registro port map (clk => clk, clr => clr, en => O_en_aux(13),
           I => dato_w, O =>Q_aux (111 downto 104));
registro14 : registro port map (clk => clk, clr => clr, en => O_en_aux(14),
           I => dato_w, O =>Q_aux (119 downto 112));
registro15 : registro port map (clk => clk, clr => clr, en => O_en_aux(15),
           I => dato_w, O =>Q_aux (127 downto 120));
			  
registro16 : registro port map (clk => clk, clr => clr, en => O_en_aux(16),
           I => dato_w, O =>Q_aux (135 downto 128));
registro17 : registro port map (clk => clk, clr => clr, en => O_en_aux(17),
           I => dato_w, O =>Q_aux (143 downto 136));
registro18 : registro port map (clk => clk, clr => clr, en => O_en_aux(18),
          I => dato_w, O =>Q_aux (151 downto 144));
registro19 : registro port map (clk => clk, clr => clr, en => O_en_aux(19),
           I => dato_w, O =>Q_aux (159 downto 152));
registro20 : registro port map (clk => clk, clr => clr, en => O_en_aux(20),
           I => dato_w, O =>Q_aux (167 downto 160));
registro21 : registro port map (clk => clk, clr => clr, en => O_en_aux(21),
           I => dato_w, O =>Q_aux (175 downto 168));
registro22 : registro port map (clk => clk, clr => clr, en => O_en_aux(22),
           I => dato_w, O =>Q_aux (183 downto 176));
registro23 : registro port map (clk => clk, clr => clr, en => O_en_aux(23),
           I => dato_w, O =>Q_aux (191 downto 184));
registro24 : registro port map (clk => clk, clr => clr, en => O_en_aux(24),
           I => dato_w, O =>Q_aux (199 downto 192));
registro25 : registro port map (clk => clk, clr => clr, en => O_en_aux(25),
           I => dato_w, O =>Q_aux (207 downto 200));
registro26 : registro port map (clk => clk, clr => clr, en => O_en_aux(26),
           I => dato_w, O =>Q_aux (215 downto 208));
registro27 : registro port map (clk => clk, clr => clr, en => O_en_aux(27),
           I => dato_w, O =>Q_aux (223 downto 216));
registro28 : registro port map (clk => clk, clr => clr, en => O_en_aux(28),
           I => dato_w, O =>Q_aux (231 downto 224));
registro29 : registro port map (clk => clk, clr => clr, en => O_en_aux(29),
           I => dato_w, O =>Q_aux (239 downto 232));
registro30 : registro port map (clk => clk, clr => clr, en => O_en_aux(30),
           I => dato_w, O =>Q_aux (247 downto 240));
registro31 : registro port map (clk => clk, clr => clr, en => O_en_aux(31),
           I => dato_w, O =>Q_aux (255 downto 248));
end Behavioral;

