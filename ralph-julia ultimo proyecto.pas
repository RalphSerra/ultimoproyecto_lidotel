program lidotel;
	uses crt, dos;			 
	type	
		usuario = record	
			estado : boolean;	
			nombre, apellido: string[20];	
			cedula : longint;	
			edad,tlf: integer;	
			total, a : real;	
			correo, edia : string[12];	
			habi: string [1] ;
		end;
		
var
		fichero : file of usuario;	
		  Dato1, datos : usuario;	
			linea1: char;    	
	var
	ver : longint; 
		b: integer;
	phabi,inicio,iteracciones,adulto,nino,boton: integer;
		
			
function registrar (registrarbd : usuario) : boolean; 
	var
		based : usuario;	
	matrizaux : file of usuario;	
	
		begin
			registrar := false;
			assign(fichero,'text.dat');
			reset(fichero);
		if ioresult <> 0 then begin
				rewrite(fichero);
					write(fichero,registrarbd);
						close(fichero);
					registrar := true;
				end
			else
				begin
					assign(matrizaux,'notext.dat');
					rewrite(matrizaux);
						while not eof(fichero) do begin
								read(fichero,based);
									write(matrizaux,based);
							end;
					write(matrizaux,registrarbd);		
					close(fichero); erase(fichero);
					close(matrizaux); rename(matrizaux,'text.dat');
					registrar := true;
				end;
		end;
	
function calculate (dia: integer): integer;
begin
  calculate := dia - 1;
end;

		 
procedure nuevo_cliente; 
		var
			verfi,logi : longint; 
			registrarbd : usuario; 
			auxbd : boolean; 
			opcion : char; 
			prueba,cont1,x,i : integer; 
			aux : string; 
	begin	
	clrscr;
			gotoxy (4,1);writeln ('----------------------------------------------');
			gotoxy (4,2);writeln ('|               L I D O T E L                |');
				gotoxy (4,3);writeln ('----------------------------------------------');		
			gotoxy (4,4); writeln('----------------------------------------------');
			gotoxy (4,5); writeln('|   [1] Solo                                 |');
			gotoxy (4,6); writeln('|   [2] Acompanado                           |');
			gotoxy (4,7); writeln('|   [3] Grupo/familia                        |');
			gotoxy (4,8); writeln('|   [4] Salir                                |');
			gotoxy (4,9); writeln('----------------------------------------------');
			gotoxy (4,10); readln (inicio);
				while (inicio <> 1) and (inicio <> 2) and (inicio <> 3) and (inicio <> 4) do
						begin
						writeln('----------------------------------------------');
						writeln('|  No ha seleccionado ninguna opcion         |');
						writeln('----------------------------------------------');
						readln (inicio);
						end; 
				case inicio of 
			1: begin 
				inicio := 1;				
				end;				
				
			2: begin 
				inicio := 2;				
				end;
				
			3: begin
				clrscr;
				gotoxy (4,2);writeln('----------------------------------------------');
				gotoxy (4,3);writeln('|  Ingrese el numero de adultos              |');
				gotoxy (4,4);writeln('----------------------------------------------');
				gotoxy (4,5);readln (adulto);
				gotoxy (4,6);writeln('----------------------------------------------');
				gotoxy (4,7);writeln('|  Ingrese el numero de niños                |');
				gotoxy (4,8);writeln('----------------------------------------------');
				gotoxy (4,9);readln (nino);
				inicio := adulto + nino;
				end;
				4: begin
				end;
end;
			
		clrscr;
		writeln(' ===============================================================================================');
		writeln(' |                              I N G R E S E  D A T O S                                       |');
		writeln(' ===============================================================================================');
		 for iteracciones := 1 to inicio do
		with datos do
{N O M B R E} begin
				prueba := 0;
				estado := true;
						writeln;
						writeln(' |        Cliente       : ',iteracciones);
						write(' | Nombre               : ');
						readln(nombre);
							for i := 1 to length(nombre) do
								if ord(nombre[i]) in[32,50..90,91..120,160,165] then
						else
							auxbd := false;
							prueba := prueba + 1;
							prueba := 0;
		 			
 {A P E L L I D O}	begin
					auxbd := true;			
					write(' | apellido             : ');
					readln(apellido);
					for i := 1 to length(apellido) do
						if ord(apellido[i]) in[32,50..90,91..120,160,165] then begin
						end	
						else
						auxbd := false;
						prueba := prueba + 1;
						prueba := 0;

{C E D U L A}repeat
					if prueba > 0 then
						begin
						writeln;	
						writeln('     ----------------------------------------------');					
						writeln('     | U S U A R I O    Y A    E X I S T E N T E  |');
						writeln('     |   Ingrese un numero de cedula diferente    |');
						writeln('     ----------------------------------------------');	
						writeln;
						end;
						begin
							write(' | Cedula               : ');
							readln(aux);
							val(aux,verfi,x);							
						end;
					begin
							auxbd := false;
							logi := 0;
							assign(fichero,'text.dat');
							reset(fichero); 
							if ioresult <> 0 then
								begin
									close(fichero);
								end
							else
								begin
									for logi := 0 to filesize(fichero) - 1 do
										begin
											seek(fichero,logi);
											read(fichero,registrarbd);
											if registrarbd.cedula = verfi then
												begin
													auxbd := true;
													
												end;
										end;								
									close(fichero);
								end;				
						end;
				prueba := prueba + 1;
				until auxbd = false;
					cedula := verfi;
					x := 1;
					cont1 := 0;
				while x <> 0 do
{E D A D}			begin
					repeat
						if prueba > 0 then				
							write(' | Edad                 : ');
							readln(aux);
							val(aux,verfi,x);
							cont1 := cont1 + 1;
						until verfi in [1..90];
					end;				
					edad := verfi;
				prueba := 0;
				
{D I A			}begin				
					prueba := 0;
				estado := true;
						write(' | Dias de estadia       : ');
						readln(edia);
							for i := 1 to length(edia) do
								if ord(edia[i]) in[32,50..90,91..120,160,165] then
									else
							auxbd := false;
							prueba := prueba + 1;
							prueba := 0;
					end;
				end;							
			begin																	
				writeln;
				writeln('-----------------------------------------------------'); 
				writeln('|  Para guaradar datos    [S]                       |');
				writeln('|  Para salir presione    [N]                       |');
				writeln('-----------------------------------------------------'); 
				repeat
					opcion := upcase(readkey);
				until opcion in['S','N'];
				if opcion = 'S' then
				if opcion = 'S' then
					begin
						if registrar (datos) = true then
							begin
								writeln;
								writeln('-----------------------------------------------------'); 
								writeln('|            Pulse Una Tecla Para continuar         |');
								writeln('-----------------------------------------------------'); 
								readkey;
							end;										
				end;				
		end;	
	end;
end;

procedure dat (verfi : longint); 
	var
	a : longint; 
	registrarbd : usuario; 	
	begin	
		a := 0;
		assign(fichero,'text.dat');
		reset(fichero); 			
			begin
				for a := 0 to filesize(fichero) - 1 do
					begin
						seek(fichero,a);
						read(fichero,registrarbd);
						if registrarbd.cedula = verfi then
							begin							
								with registrarbd do
									begin
									clrscr;
										gotoxy (4,2);writeln('----------------------------------------------');
										gotoxy (4,3);writeln('|               Base de datos                |');
										gotoxy (4,4);writeln('----------------------------------------------');
										writeln;
										gotoxy (4,5); writeln('| Nombre               = ',nombre);
										gotoxy (4,6); writeln('| Apellido             = ',apellido);										
										gotoxy (4,7); writeln('| Edad                 = ',edad);
										gotoxy (4,8); writeln('| Num. de Cedula       = ',cedula);	
										gotoxy (4,9); writeln('| Dias de estadia      = ',edia);							
										gotoxy (4,10); writeln('| tipo habitacion     = ',habi);
										gotoxy (4,11);writeln('----------------------------------------------');
									writeln;
									end;
							end;
					end;			
			begin;			
			close(fichero);				
			writeln('-----------------------------------------------------'); 
			writeln('|       No se encuentra en la base de datos         |');
			writeln('-----------------------------------------------------'); 
		end;
	end;
end;	
	

procedure Facturar_habitacion;
var
		a : longint; 
		dato1 : usuario; 
		si : boolean; 
		verfi : longint; 
		aux1 : string; 
		prueba: integer; 
begin				
	prueba := 0;
		begin
				writeln('-----------------------------------------------------'); 
				writeln('|        Para confirmar ingrese su cedula           |');
				writeln('-----------------------------------------------------'); 
					write('   cedula  : ');
					readln(aux1);
					val(aux1,verfi);
					prueba := prueba + 1;
				end;
				ver := verfi;
				
		if prueba > 0 then 		
				begin
		si := false;
		a := 0;
		assign(fichero,'text.dat');
		reset(fichero);
		if ioresult <> 0 then
			begin	
				writeln('-----------------------------------------------------'); 
				writeln('|         Presione una tecla para salir             |');
				writeln('-----------------------------------------------------'); 
				readkey;
				close(fichero);
			end
		else
			begin
				for a := 0 to filesize(fichero) - 1 do
					begin
						seek(fichero,a);
						read(fichero,dato1);
						if dato1.cedula = verfi then
							begin
								si := true;
								break;
							end;
					end;
				if si = true then
					begin
						if dato1.estado = true then
							begin
								with dato1 do
									repeat 
									 clrscr;
										writeln;
										writeln(' -----------------------------------------------------------------------------------------------');
										writeln('                                         F A C T U R A                                          ');
										writeln(' -----------------------------------------------------------------------------------------------');
										writeln(' Nombre:  ',dato1.nombre);
										writeln(' -----------------------------------------------------------------------------------------------');
										writeln(' Nombre:  ',dato1.apellido);
										writeln(' -----------------------------------------------------------------------------------------------');
										writeln(' Habitacion selecciona:  ',dato1.habi);
										writeln(' -----------------------------------------------------------------------------------------------');
										writeln(' Precio por noche  :',phabi,' $');
										writeln(' -----------------------------------------------------------------------------------------------');
										writeln(' Numero de ninos  :',nino);								
										writeln(' -----------------------------------------------------------------------------------------------');
										writeln(' Dias de estadia :',dato1.edia);
										writeln(' -----------------------------------------------------------------------------------------------');
										writeln(' Precio:  ',phabi*b);
										writeln(' -----------------------------------------------------------------------------------------------');
									writeln;						
								until phabi <> 0;
								end;
						end;
				end;				
		end;
		writeln('-----------------------------------------------------'); 
		writeln('|          Presione una tecla para salir            |');
		writeln('-----------------------------------------------------'); 
		readkey;
end;	


procedure habitacion_lidotel ;
var linea,ss: integer;	
begin
clrscr; 
	gotoxy (4,2);writeln ('-----------------------------------------------------');
	gotoxy (4,3);writeln ('|                     L I D O T E L                 |');
	gotoxy (4,4);writeln ('-----------------------------------------------------');		
	gotoxy (4,5); writeln('-----------------------------------------------------'); 	
	gotoxy (4,6); writeln('|    Ingrese el nuemero de dias que desea reservar   |');
	gotoxy (4,7);writeln ('-----------------------------------------------------'); 
	gotoxy (4,8);readln (b);
	gotoxy (4,9); writeln('-----------------------------------------------------'); 	
	gotoxy (4,10); writeln('| Presione 1 para ver las habitaciiones disponibles |');
	gotoxy (4,11);writeln ('-----------------------------------------------------'); 
	gotoxy (4,11);readln (linea);
		case linea of 
		1:begin		
			clrscr;
			writeln(' -----------------------------------------------------------------------------------------------');
			writeln(' |             [1]           FAMILY ROOM (200$ por noche)                                       ');
			writeln(' -----------------------------------------------------------------------------------------------');
			writeln('  - Calida y confortable habitación decorada con un estilo vanguardista');  
			writeln('  - 100% libre de humo');
			writeln('  - Cama Lidotel Royal King');
			writeln('  - Con reloj despertador');  
			writeln('  - TV 32” HD Plasma con cable');
			writeln('  - Baño con ducha');
			writeln('  - Cafetera eléctrica');
			writeln('  - Nevera ejecutiva');
			writeln('  - Caja electrónica de seguridad');
			writeln('  - Secador de cabello');
			writeln('  - Armario adicional amplio');
			writeln('  - Una habitación separada con 2 camas full');
			writeln('  - Baño con ducha');
			writeln(' -----------------------------------------------------------------------------------------------');
			writeln('                                           Incluye:                                             ');
			writeln(' -----------------------------------------------------------------------------------------------');
			writeln('  - Desayuno Buffet en el Restaurant Le Nouveau');
			writeln('  - Acceso inalámbrico a Internet (WIFI)');
			writeln('  - Business Center');
			writeln('  - Uso de nuestra exclusiva piscina');
			writeln('  - Acceso a nuestro gimnasio');
			writeln('  - Sillas y toldos en la playa');
			writeln('  - Kit de vanidades');
			writeln('  - Niños de 0 a 2 años sin recargos');
			writeln(' -----------------------------------------------------------------------------------------------');
			writeln ('Presione "a" para seleccionar la opcion en pantalla');
			writeln ('Presione "d" para ver mas opciones');	
			readln (linea1);
								while (linea1 <> 'a') and (linea1 <> 'd') do
									begin
									writeln('No ha seleccionado ninguna opcion');
									readln (linea1);
									end;																	
					case linea1 of
					'a': begin				
						clrscr;						
						phabi := 200;
						writeln(' -----------------------------------------------------------------------------------------------');
						writeln(' | Ha seleccionado:          FAMILY ROOM  (200$ por noche)                                       ');
						writeln(' -----------------------------------------------------------------------------------------------');	
						writeln (' Presione [1] para continuar ');							
						readln (ss);
							if ss = 1 then begin dato1.habi := dato1.habi + 'FAMILY ROOM '; end;
						while (ss <> 1) do 
						 begin
							write('Por favor elige una opcion en pantalla : '); 
							readln(ss);
						end;				
		begin
			Facturar_habitacion;
		end;
end;
					'd': begin
					clrscr;
						writeln(' -----------------------------------------------------------------------------------------------');
						writeln(' |                              SENCILLA  (60$ por noche)                                        ');
						writeln(' -----------------------------------------------------------------------------------------------');
						writeln('  - Amplia y confortable habitacion decorada con un estilo vanguardista');
						writeln('  - Cama Lidotel Royal King con sábanas de algodón egipcio');
						writeln('  - Soporte para iPod con reloj despertador');
						writeln('  - TV 32” HD Plasma con cable');
						writeln('  - Baño con ducha');
						writeln('  - Cafetera eléctrica');
						writeln('  - Nevera ejecutiva');
						writeln('  - Caja electronica de seguridad');
						writeln('  - Secador de cabello');
						writeln(' -----------------------------------------------------------------------------------------------');
						writeln('                                     Incluye:                                                  ');
						writeln(' -----------------------------------------------------------------------------------------------');
						writeln('  - Desayuno Buffet en el Restaurant Le Nouveau');
						writeln('  - Acceso inalámbrico a Internet (WIFI)');
						writeln('  - Business Center');
						writeln('  - Uso de nuestra exclusiva piscina');
						writeln('  - Acceso a nuestro gimnasio');
						writeln('  - Sillas y toldos en la playa');
						writeln('  - Kit de vanidades');
						writeln('  - Niños de 0 a 2 años sin recargos');
						writeln(' -----------------------------------------------------------------------------------------------');
						writeln ('Presione "a" para seleccionar la opcion en pantalla');
						writeln ('Presione "d" para ver mas opciones');	
						readln (linea1);
								while (linea1 <> 'a') and (linea1 <> 'd') do
									begin
									writeln('No ha seleccionado ninguna opcion');
									readln (linea1);
									end;																	
					case linea1 of
						'a': begin
						clrscr;
						phabi := 60;
						
						writeln(' -----------------------------------------------------------------------------------------------');
						writeln(' | Ha seleccionado:          SENCILLA  (60$ por noche)                                          ');
						writeln(' -----------------------------------------------------------------------------------------------');						 
		begin
			Facturar_habitacion;
	end;
	end;
					
					'd':begin
					clrscr;
						writeln(' ===============================================================================================');
					    writeln(' |  			 [3]	          DOBLE (120$ por noche)                                         ');
					    writeln(' ===============================================================================================');
					    writeln(' - Amplia y confortable habitación decorada con un estilo vanguardista');
					    writeln(' - Dos Camas Lidotel Full con sabanas de algodón egipcio');
					    writeln('  - Soporte para iPod con reloj despertador');
						writeln('  - TV 32” HD Plasma con cable');  
						writeln('  - Baño con ducha');
						writeln('  - Cafetera eléctrica');
						writeln('  - Nevera ejecutiva');
						writeln('  - Caja electronica de seguridad');
						writeln('  - Secador de cabello'); 
						writeln(' ===============================================================================================');
						writeln('                                        Incluye:                                                 ');
						writeln(' ===============================================================================================');
						writeln('  - Desayuno Buffet en el Restaurant Le Nouveau');
						writeln('  - Acceso inalámbrico a Internet (WIFI)');
						writeln('  - Business Center');
						writeln('  - Uso de nuestra exclusiva piscina');
						writeln('  - Acceso a nuestro gimnasio');
						writeln('  - Sillas y toldos en la playa');
						writeln('  - Kit de vanidades');
						writeln('  - Niños de 0 a 2 años sin recargos ');
						writeln(' ===============================================================================================');
						writeln ('Presione "a" para seleccionar la opcion en pantalla');
						writeln ('Presione "d" para ver mas opciones');	
						readln (linea1);
								while (linea1 <> 'a') and (linea1 <> 'd') do
									begin
									writeln('No ha seleccionado ninguna opcion');
									readln (linea1);
									end;																	
					case linea1 of
					'a': begin
						clrscr;
						phabi := 120;
						
						writeln(' -----------------------------------------------------------------------------------------------');
						writeln(' | Ha seleccionado:          DOBLE (120$ por noche)                                             ');
						writeln(' -----------------------------------------------------------------------------------------------');
		begin
			Facturar_habitacion;
	end;
	end;
							'd':begin
							clrscr;
							writeln(' ===============================================================================================');
							writeln(' | 	         [4]              SUITE (300$ por noche)                                        ');
							writeln(' ===============================================================================================');
							writeln(' - Cálida y confortable habitación decorada con un estilo vanguardista');
							writeln('  - 100% libre de humo');
							writeln('  - Cama Lidotel Royal King');
							writeln('  - Con reloj despertador');  
							writeln('  - TV 32” HD Plasma con cable');
							writeln('  - 2 Baños con ducha');
							writeln('  - Cafetera eléctrica');
							writeln('  - Nevera ejecutiva');
							writeln('  - Caja electrónica de seguridad');
							writeln('  - Secador de cabello');
							writeln('  - Armario adicional amplio');
							writeln('  - Una habitación separada con 2 camas full');
							writeln('  - Baño con ducha');
							writeln('  - Area separada con 2 sofá-cama individuales');
							writeln(' ===============================================================================================');
							writeln('                                             Incluye:                                           ');
							writeln(' ===============================================================================================');
							writeln('  - Desayuno Buffet en el Restaurant Le Nouveau');
							writeln('  - Acceso inalámbrico a Internet (WIFI)');
							writeln('  - Business Center');
							writeln('  - Uso de nuestra exclusiva piscina');
							writeln('  - Acceso a nuestro gimnasio');
							writeln('  - Sillas y toldos en la playa');
							writeln('  - Kit de vanidades');
							writeln('  - Niños de 0 a 2 años sin recargos ');
							writeln(' ===============================================================================================');
							writeln ('Presione "a" para seleccionar la opcion en pantalla');
							readln (linea1);
								while (linea1 <> 'a') do
								begin
								writeln('No ha seleccionado ninguna opcion');
								readln (linea1)
								end;
							case linea1 of
					'a': begin
						clrscr;
						phabi := 300;
						
						writeln(' -----------------------------------------------------------------------------------------------');
						writeln(' | Ha seleccionado:          SUITE (300$ por noche)                                             ');
						writeln(' -----------------------------------------------------------------------------------------------');
		begin
			Facturar_habitacion;
	end;
	end;						
end;
end;
end;
end;
end;
end;
enD;
end;
end;
end;

procedure modificar_cliente(verfi : longint); 
	var
		fin, auxbd : boolean; 
		 prueba,modi, x : integer; 
		edia, aux1 : string; 
		cas1, opcion : char; 
		modificar, datver : usuario; 
		arch, i, numeraux : longint; 
	begin
		fin := false;
		assign(fichero,'text.dat');
		 reset(fichero); 
		if ioresult <> 0 then
			begin
				writeln('-----------------------------------------------------'); 
				writeln('|           Presione [ENTER] para salir             |');
				writeln('-----------------------------------------------------'); 
				readkey;
			end
			else
			begin
				for i := 0 to filesize(fichero) - 1 do
					begin
						seek(fichero,i);
						read(fichero,datver);
					if datver.cedula = verfi then
						begin
							fin := true;
							arch := i;
							modificar := datver;
							break;
						end;						
					end;
						if fin = true then
					begin
						if datver.estado = true then
							begin
								fin := false;
								repeat
									clrscr;
									with datver do
										begin
											writeln ('----------------------------------------------');
											writeln ('|                  Modificar                 |');
											writeln ('----------------------------------------------');
											writeln;
											writeln (' [1] Nombre          = ',nombre);
											writeln (' [2] Apellido        = ',apellido);											
											writeln (' [3] Edad            = ',edad);
											writeln (' [4] Cedula          = ',cedula);											
											writeln (' [5] dias de estadia = ',edia);
											writeln;
											writeln ('----------------------------------------------');
											writeln (' [6] = Guardar Cambios y Regresar');
											writeln ('----------------------------------------------');
											writeln ('       Seleccione uno numero indicado         ');	
											writeln ('----------------------------------------------');
										end;
									repeat
										cas1 := upcase(readkey);
									until cas1 in['1','2','3','4','5','6'];
									clrscr;
									case cas1 of
										'1' : begin
												prueba := 0;												
												repeat
													auxbd := true;
													if prueba > 0 then
														begin
															writeln;
															writeln('-----------------------------------------------------'); 
															writeln('|                  Solo usar Letras                 |');								
															writeln('-----------------------------------------------------'); 
														end;
													write(' Nombre : ');
													readln(modificar.nombre);
													for modi := 1 to length(modificar.nombre) do
														if ord(modificar.nombre[modi]) in[32,65..90,97..122,164,165] then
															begin
															end
														else
															auxbd := false;
													prueba := prueba + 1;
												until (auxbd = true) and (modi = Length(modificar.nombre));  end;
										'2' : begin
												prueba := 0;												
												repeat
													auxbd := true;
													if prueba > 0 then
														begin
															writeln;
															writeln;
															writeln('-----------------------------------------------------'); 
															writeln('|                  Solo usar Letras                 |');								
															writeln('-----------------------------------------------------'); 
															writeln;
														end;
													writeln('-----------------------------------------------------'); 	
													write(' Apellido : ');
													writeln('-----------------------------------------------------'); 	
													readln(modificar.apellido);
													for modi := 1 to length(modificar.apellido) do
														if ord(modificar.apellido[modi]) in[32,65..90,97..122,164,165] then
															begin
															end
														else
															auxbd := false;
													prueba := prueba + 1;
												until (auxbd = true) and (modi = Length(modificar.apellido)); end;										
										'3' : begin
												x := 1;
												prueba := 0;
												while x <> 0 do
													begin
														repeat
															if prueba > 0 then
																begin
																	writeln;
																	writeln('-----------------------------------------------------'); 															
																	writeln('|        Solo se permiten caracter numericos        |');
																	writeln('-----------------------------------------------------'); 			
																	writeln;
																end;
															writeln('-----------------------------------------------------'); 	
															write('  Digite la Edad: ');
															writeln('-----------------------------------------------------'); 	
															readln(aux1);
															val(aux1,numeraux,x);
															prueba := prueba + 1;
														until numeraux in [1..90];
													end;
													modificar.edad := numeraux;
											  end;
										'4' : begin
												x := 1;
												prueba := 0;
												while x <> 0 do
													begin
															writeln('-----------------------------------------------------'); 			
															write  (' Cedula : ');
															writeln('-----------------------------------------------------'); 	
															readln(aux1);
															val(aux1,numeraux,x);
															prueba := prueba + 1;
													end;
													modificar.cedula := numeraux;
											  end; 
										'5' : begin
												prueba := 0;
													repeat
														if prueba > 0 then
															begin
															end;
															writeln('-----------------------------------------------------'); 	
														write('  Dias de estadia:  ');
														
														readln(edia);													
													until edia = edia ;
												modificar.edia := edia;
											  end;
										'6' : begin
												writeln;
												writeln('-----------------------------------------------------'); 
												writeln('|  Para modificar datos presione [S]                |');
												writeln('|  Para salir presione           [N]                |');
												writeln('-----------------------------------------------------'); 
												repeat
													opcion := upcase(readkey);
												until opcion in['S','N'];
												if opcion = 'S' then
													begin
														fin := true;
													end;
													if opcion = 'N' then
														begin
															clrscr;
															modificar := datver;
															fin := true;
														end;
													end;
												end;
								until fin = true; datver := modificar;
								seek(fichero,arch);
								write(fichero,datver);
							end;	
						if datver.estado = false then
							begin
								fin := false;
									repeat
									clrscr;
									with datver do
										begin
											writeln ('----------------------------------------------');
											writeln ('|                  Modificar                 |');
											writeln ('----------------------------------------------');
											writeln;
											writeln (' [1] Nombre          = ',nombre);
											writeln (' [2] Apellido        = ',apellido);											
											writeln (' [3] Edad            = ',edad);
											writeln (' [4] Cedula          = ',cedula);											
											writeln (' [5] dias de estadia = ',edia);
											writeln;
											writeln ('----------------------------------------------');
											writeln (' [6] = Guardar Cambios y Regresar');
											writeln ('----------------------------------------------');										
											writeln ('  seleccione uno de los numero indicado ');
										end;
									repeat
										cas1 := upcase(readkey);
									until cas1 in['7'];
										clrscr;
									case cas1 of
											'6' : begin
													writeln('-----------------------------------------------------'); 
													writeln('|  Para modificar datos presione [S]                |');
													writeln('|  Para salir presione           [N]                |');
													writeln('-----------------------------------------------------'); 
														repeat
															opcion := upcase(readkey);
														until opcion in['S','N'];
												if opcion = 'S' then
													begin
														fin := true;
													end;
												if opcion = 'N' then
													begin
														clrscr;
														modificar := datver;
														fin := true;
														end;
												end;
											end;
								  until fin = true;
								  datver := modificar;
								  seek(fichero,arch);
								 write(fichero,datver);
					end;
				close(fichero);
				dat(verfi);
				writeln;
				writeln('-----------------------------------------------------'); 
				writeln('|           Presione una tecla para salir           |');
				writeln('-----------------------------------------------------'); 
				readkey;
			end;
	end;
end;
	
procedure Buscar_cliente; 
var				
		ver, verfi : longint; 
		aux1 : string; 
		prueba, x : integer; 
begin
				x := 1;
				prueba := 0;
				while x <> 0 do
				begin
					if prueba > 0 then
					begin
					clrscr;
						writeln;
						writeln('----------------------------------------------');
						writeln('|            Solo utilice numeros            |');
						writeln('----------------------------------------------');
						writeln;
					end;
					clrscr;
						gotoxy (4,2); writeln('----------------------------------------------');
						gotoxy (4,3); writeln('|  Cedula :                                  |');
						gotoxy (4,4); writeln('----------------------------------------------');
						gotoxy (4,5); readln(aux1);
					val(aux1,verfi,x);
					prueba := prueba + 1;
					end;
					ver := verfi;
				dat(ver);		
				writeln;
				writeln('-----------------------------------------------------'); 
				writeln('|        Presione una tecla para continuar          |');
				writeln('-----------------------------------------------------'); 
				readkey;
end;
			  
procedure eliminar (verfi : longint);
	var
		check, iterac: longint; 
		verif: boolean; 
		respal: file of usuario; 
		datosE: usuario; 
		opcion : char; 
		prueba, x : integer; 
		aux1 : string; 
		
	begin
			x := 1;
				prueba := 0;
				while x <> 0 do
					begin
						if prueba > 0 then
							begin
							clrscr;
								writeln;
								writeln('----------------------------------------------');
								writeln('|             Solo utilice numeros           |');
								writeln('----------------------------------------------');
								writeln;
							end;
							clrscr;
						gotoxy (4,2); writeln('----------------------------------------------');
						gotoxy (4,3) ; writeln('|  Cedula :                                  |');
						gotoxy (4,4); writeln('----------------------------------------------');
						gotoxy (4,5); readln(aux1);
						val(aux1,verfi,x);
						prueba := prueba + 1;
					end;
		begin
		dat (verfi);
		writeln;
			writeln('-----------------------------------------------------'); 
			writeln('|           Presione [ENTER] para salir             |');
			writeln('-----------------------------------------------------'); 
		readkey;
		writeln;
		verif := false;
		assign(fichero,'text.dat');
		reset(fichero);
		if ioresult <> 0 then
			begin
				writeln('-----------------------------------------------------'); 
				writeln('|          Presione una tecla para salir            |');
				writeln('-----------------------------------------------------'); 
				readkey;
				close(fichero);
			end
		else
			begin
				for check := 0 to filesize(fichero) - 1 do
				begin
					seek(fichero,check);
					read(fichero,datosE);
					if datosE.cedula = verfi then
						begin
							verif := true;
							iterac := check;
						end;
				end;
				if verif = true then
					begin
						writeln;
						writeln('-----------------------------------------------------'); 
						writeln('|  Para eliminar presione [S]                       |');
						writeln('|  Para salir presione    [N]                       |');
						writeln('-----------------------------------------------------'); 
						repeat
							opcion := upcase(readkey);
						until opcion in['S','N'];
						if opcion = 'S' then
							begin
								assign(respal,'notext.dat');
								rewrite(respal);
								for check := 0 to filesize(fichero) - 1 do
									begin
										seek(fichero,check);
										if check <> iterac then
											begin
												read(fichero,datosE);
												write(respal,datosE);
											end;
									end;
								close(fichero);
								close(respal);
								erase(fichero);
								rename(respal,'text.dat');
							end;
						if opcion = 'N' then
							begin
								close(fichero);
							end;
					end
				else
					begin		
						close(fichero);
					end;
			end;
	end;
end;
	

procedure registo_completo; 
	var lista : longint; 
		begin
			assign(fichero,'text.dat');
			reset(fichero); 
			begin
			clrscr;
			gotoxy (4,2); writeln('-----------------------------------------------------'); 
			gotoxy (4,3);writeln('|                      lidotel                      |');
			gotoxy (4,4);writeln('-----------------------------------------------------'); 	
			gotoxy (4,5); writeln('-----------------------------------------------------'); 
			gotoxy (4,6);writeln('|                  Base De Datos                    |');
			gotoxy (4,7);writeln('-----------------------------------------------------'); 	
			gotoxy (4,8);writeln('|    C.I    |         Nombre    ');	
			
				for lista := 0 to filesize(fichero) - 1 do
					begin
						seek(fichero,lista);
						read(fichero,dato1);
						 writeln('   |  ',dato1.cedula,' |  ',dato1.nombre,' ',dato1.apellido,' ',dato1.habi);
					end;
				close(fichero);
				writeln;
				writeln('   -----------------------------------------------------'); 
				writeln('   |           Presione [ENTER] para salir             |');
				writeln('   -----------------------------------------------------'); 	
				readkey;
			end;
	end;
	
procedure Comfirmar_mdo;
var 
	prueba, x : integer;
	ver, verfi : longint; 
	aux1 : string; 
	
 begin
				x := 1;
				prueba := 0;
				while x <> 0 do begin
						if prueba > 0 then
							begin
							clrscr;
								writeln;
								writeln('----------------------------------------------');
								writeln('|             Solo utilice numeros           |');
								writeln('----------------------------------------------');
								writeln;
							end;
							clrscr;
						gotoxy (4,2);writeln('----------------------------------------------');
						gotoxy (4,3);writeln('|      Ingrse la cedula para comfirmar       |');
						gotoxy (4,4);writeln('----------------------------------------------');
						gotoxy (4,5);writeln('----------------------------------------------');
						gotoxy (4,6);writeln('|  Cedula :                                  |');
						gotoxy (4,7);writeln('----------------------------------------------');
						gotoxy (4,8);readln(aux1);
						val(aux1,verfi,x);
						prueba := prueba + 1;
					end;
					ver := verfi;
					modificar_cliente(ver);
		  end;

begin	
 			writeln;			
 repeat   
 clrscr;
			writeln ('----------------------------------------------');
			writeln ('|               L I D O T E L                |');
			writeln ('----------------------------------------------');
			
			writeln ('----------------------------------------------');
			writeln ('|               Menu Principal               |');
			writeln ('----------------------------------------------');
			writeln;
			writeln('   1 = Nuevo cliente');
			writeln('   2 = Buscar clientes');
			writeln('   3 = Modificar clientes');
			writeln('   4 = Eliminar');
			writeln('   5 = reservacion');
			writeln('   6 = Registro del sistema');
			writeln('   7 = Salir');
			writeln;
			writeln ('----------------------------------------------');
			writeln ('|              Elija Una Opcion              |');
			writeln ('----------------------------------------------');
			readln (boton);
		case boton of
		1 : begin 
				nuevo_cliente;
				habitacion_lidotel;
			  end;
			  
		2 : begin
				buscar_cliente;
			  end;
		3 : begin 
				Comfirmar_mdo;
			 end;
		4 : begin				
				eliminar(ver);	
			  end;	  
		5 : begin 
				habitacion_lidotel;	
			  end;			
		6 : begin 
				registo_completo;
			  end;
end;
 until boton = 7
end.

