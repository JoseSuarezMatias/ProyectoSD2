Library ieee;
Use ieee.std_logic_1164.all;

Entity MSS_Sd2 is
port( Reset, Clock, Start, Opc_1, Opc_2, Opc_3, Opc_4, Fin_RAM, Fin_15s,
		ig_vacuna, ig_edad, Costa, Sierra, Oriente, C_menor_S, S_menor_O, C_menor_O: in std_logic;
		
		En_add_RAM, Ld_add_RAM, En_cnt_C, Ld_cnt_C, En_cnt_S, Ld_cnt_S,
		En_cnt_O, Ld_cnt_O, En_Reg_int, En_menor, En_Reg_union, Sel_oper, En_oper,
		Sel_Reg_min, En_Reg_min, En_cnt15s, Ld_cnt15s,
		Listo: out std_logic;
		
		Sel_menor: out std_logic_vector(1 downto 0));
		
End MSS_Sd2;

Architecture func of MSS_Sd2 is
Type Estado is ( s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, s13, s14, s15,
					  s16, s17, s18, s19, s20, s21, s22, s23, s24, s25, s26, s27, s28, s29, s30,
					  s31, s32, s33, s34, s35, s36, s37, s38, s39, s40, s41, s42, s43, s44,
					  s45, s46, s47, s48, s49, s50, s51, s52, s53, s54, s55, s56, s57, s58, s59, s60);

signal y: Estado; 

Begin
	Process(Reset, Clock)
	Begin
		if Reset = '1' then y <= s1;
		elsif (Clock'event and Clock = '1') then 
			
			case y is
				when s1 =>
					y <= s2;
				when s2 =>
					if start = '1' then y <= s3;
					else y <= s2; end if;
				when s3 =>
					y <= s4;
				when s4 =>
					if Opc_1 = '1' then y <= s5;
					elsif Opc_2 = '1' then y <= s6;
					elsif Opc_3 = '1' then y <= S7;
					elsif Opc_4 = '1' then y <= s8;
					else y <= s4; end if;
					
				--Escoge la operación
				when s5 =>
					y <= s9;
				when s6 =>
					y <= s22; 
				when s7 =>
					y <= s35;
				when s8 =>
					y <= s48;
				
				--Opcion 1: Intersecion en vacunas
				when s9 =>
					if ig_vacuna = '1' then y <= s10;
					else y <= s14; end if;			
				when s10 =>
					if Costa = '1' then y <= s11;
					elsif Sierra = '1' then y <= s12;
					elsif Oriente = '1' then y <= S13;
					else y <= s10; end if;
				when s11 =>
					y <= s14;
				when s12 =>
					y <= s14;
				when s13 =>
					y <= s14;
				when s14 =>
					if Fin_RAM = '1' then y <= s16;
					else y <= s15; end if; 
				when s15 =>
					y <= s5;
				when s16 =>
					if (C_menor_S='1' and C_menor_O='1') then y <= s17;
					elsif (C_menor_S='0' and S_menor_O='1') then y <= S19;
					else y <= s18; end if;
				when s17 =>
					y <= s20;
				when s18 =>
					y <= s20;
				when s19 =>
					y <= s20;
					
				--Listo
				when s20 =>
					y <= s21;
					
				--Mostrar resultados
				when s21 =>
					if Fin_15s ='1' then y <= s3;
					else y <= s21; end if;
				
				--Opcion 2: Interseción en edad
				when s22 =>
					if ig_edad = '1' then y <= s23;
					else y <= s27; end if;			
				when s23 =>
					if Costa = '1' then y <= s24;
					elsif Sierra = '1' then y <= s25;
					elsif Oriente = '1' then y <= S26;
					else y <= s23; end if;
				when s24 =>
					y <= s27;
				when s25 =>
					y <= s27;
				when s26 =>
					y <= s27;
				when s27 =>
					if Fin_RAM = '1' then y <= s29;
					else y <= s28; end if; 
				when s28 =>
					y <= s6;
				when s29 =>
					if (C_menor_S='1' and C_menor_O='1') then y <= s30;
					elsif (C_menor_S='0' and S_menor_O='1') then y <= S32;
					else y <= s31; end if;
				when s30 =>
					y <= s33;
				when s31 =>
					y <= s33;
				when s32 =>
					y <= s33;
				--Listo
				when s33 =>
					y <= s34;
				--Mostrar Resultado
				when s34 =>
					if Fin_15s ='1' then y <= s3;
					else y <= s34; end if;
					
				--Opcion 3: Union en vacunas
				when s35 =>
					if ig_vacuna = '1' then y <= s36;
					else y <= s40; end if;			
				when s36 =>
					if Costa = '1' then y <= s37;
					elsif Sierra = '1' then y <= s38;
					elsif Oriente = '1' then y <= S39;
					else y <= s36; end if;
				when s37 =>
					y <= s40;
				when s38 =>
					y <= s40;
				when s39 =>
					y <= s40;
				when s40 =>
					if Fin_RAM = '1' then y <= s42;
					else y <= s41; end if; 
				when s41 =>
					y <= s7;
				when s42 =>
					if (C_menor_S='1' and C_menor_O='1') then y <= s43;
					elsif (C_menor_S='0' and S_menor_O='1') then y <= S45;
					else y <= s44; end if;
					--y <= s43;
				when s43 =>
					y <= s46;
				when s44 =>
					y <= s46;
				when s45 =>
					y <= s46;
				--Listo
				when s46 =>
					y <= s47;
				--Mostrar datos 
				when s47 =>
					if Fin_15s ='1' then y <= s3;
					else y <= s47; end if;
					
					
				--Opcion 4: Union en edad	
				when s48 =>
					if ig_edad = '1' then y <= s49;
					else y <= s53; end if;			
				when s49 =>
					if Costa = '1' then y <= s50;
					elsif Sierra = '1' then y <= s51;
					elsif Oriente = '1' then y <= S52;
					else y <= s49; end if;
				when s50 =>
					y <= s53;
				when s51 =>
					y <= s53;
				when s52 =>
					y <= s53;
				when s53 =>
					if Fin_RAM = '1' then y <= s55;
					else y <= s54; end if; 
				when s54 =>
					y <= s8;
				when s55 =>
					if (C_menor_S='1' and C_menor_O='1') then y <= s56;
					elsif (C_menor_S='0' and S_menor_O='1') then y <= s58;
					else y <= s57; end if;
				when s56 =>
					y <= s59;
				when s57 =>
					y <= s59;
				when s58 =>
					y <= s59;
				--Listo
				when s59 =>
					y <= s60;
				--Mostrar resultados
				when s60 =>
					if Fin_15s ='1' then y <= s3;
					else y <= s60; end if;
					
					
				
			end case;
		end if;
	end process;


Process(y)
Begin
En_add_RAM<='0'; Ld_add_RAM<='0'; En_cnt_C<='0'; Ld_cnt_C<='0'; En_cnt_S<='0'; Ld_cnt_S<='0';
En_cnt_O<='0'; Ld_cnt_O<='0'; En_Reg_int<='0'; En_menor<='0'; En_Reg_union<='0'; Sel_oper<='0'; En_oper<='0';
Listo<='0'; Sel_menor<="00"; Sel_Reg_min<='0'; En_Reg_min<='0'; En_cnt15s<='0'; Ld_cnt15s<='0';
	case y is
		when s1 =>
		when s2 =>
		when s3 =>
		when s4 => En_add_RAM<='1'; Ld_add_RAM<='1'; En_cnt15s<='1'; Ld_cnt15s<='1';
		
		--Escoge la operación
		when s5 =>
		when s6 => 
		when s7 =>
		when s8 =>
		
		--Opción 1: Intersección en vacunas
		when s9 =>
		when s10 =>
		when s11 => En_cnt_C <= '1';
		when s12 => En_cnt_S <= '1';  
		when s13 => En_cnt_O <= '1';   
		when s14 => 
		when s15 => En_add_RAM <= '1';
		when s16 =>
		when s17 => Sel_menor<="01"; En_menor<='1'; En_Reg_int<='1';
		when s18 => Sel_menor<="11"; En_menor<='1'; En_Reg_int<='1';
		when s19 => Sel_menor<="10"; En_menor<='1'; En_Reg_int<='1';
		--Listo
		when s20 => Listo <= '1';
		--Mostrar resultados
		when s21 => En_oper <= '1'; En_Reg_min<='1'; En_cnt15s<='1';
		
		
		--Opción 2: Intersección en edad
		when s22 =>
		when s23 =>
		when s24 => En_cnt_C <= '1';
		when s25 => En_cnt_S <= '1';  
		when s26 => En_cnt_O <= '1';   
		when s27 => 
		when s28 => En_add_RAM <= '1';
		when s29 =>
		when s30 => Sel_menor<="01"; En_menor<='1'; En_Reg_int<='1';
		when s31 => Sel_menor<="11"; En_menor<='1'; En_Reg_int<='1';
		when s32 => Sel_menor<="10"; En_menor<='1'; En_Reg_int<='1';
		--Listo
		when s33 => Listo <= '1';
		--Mostrar resultados
		when s34 => En_oper <= '1'; En_Reg_min<='1'; En_cnt15s<='1';
		
		--Opcion 3: Union en vacunas
		when s35 =>
		when s36 =>
		when s37 => En_cnt_C <= '1';
		when s38 => En_cnt_S <= '1';  
		when s39 => En_cnt_O <= '1';   
		when s40 =>
		when s41 => En_add_RAM <= '1';
		when s42 => En_Reg_union<='1';
		when s43 => Sel_menor<="01"; En_menor<='1';
		when s44 => Sel_menor<="11"; En_menor<='1';
		when s45 => Sel_menor<="10"; En_menor<='1';
		--Listo
		when s46 => Listo <= '1';
		--Mostrar resultados
		when s47 => Sel_oper<='1'; En_oper<='1'; En_Reg_min<='1'; En_cnt15s<='1';
		
		
		
		--Opcion 4: Union en edad
		when s48 =>
		when s49 =>
		when s50 => En_cnt_C <= '1';
		when s51 => En_cnt_S <= '1';  
		when s52 => En_cnt_O <= '1';   
		when s53 =>
		when s54 => En_add_RAM <= '1';
		when s55 => En_Reg_union<='1';
		when s56 => Sel_menor<="01"; En_menor<='1';
		when s57 => Sel_menor<="11"; En_menor<='1';
		when s58 => Sel_menor<="10"; En_menor<='1';
		--Listo
		when s59 => Listo <= '1';
		--Mostrar resultados
		when s60 => Sel_oper<='1'; En_oper<='1'; En_Reg_min<='1'; En_cnt15s<='1';
		
		
		
		
	end case;
end process;
end func;
