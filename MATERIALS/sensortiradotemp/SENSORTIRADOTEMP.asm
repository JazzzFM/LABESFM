
_main:

;SENSORTIRADOTEMP.c,32 :: 		void main(){
;SENSORTIRADOTEMP.c,34 :: 		ANSEL = 0x01; // Establece bit RA0 como analógico
	MOVLW      1
	MOVWF      ANSEL+0
;SENSORTIRADOTEMP.c,35 :: 		ANSELH = 0x00; // Configura otros bits análogicos como digitales
	CLRF       ANSELH+0
;SENSORTIRADOTEMP.c,36 :: 		TRISA0_bit = 1; // Establece bit RA0 como entrada
	BSF        TRISA0_bit+0, BitPos(TRISA0_bit+0)
;SENSORTIRADOTEMP.c,37 :: 		C1ON_bit = 0; // Deshabilita comparador 1
	BCF        C1ON_bit+0, BitPos(C1ON_bit+0)
;SENSORTIRADOTEMP.c,38 :: 		C2ON_bit = 0; // Deshabilita comparador 2
	BCF        C2ON_bit+0, BitPos(C2ON_bit+0)
;SENSORTIRADOTEMP.c,40 :: 		ADC_Init(); // Inicializa el Modulo ADC
	CALL       _ADC_Init+0
;SENSORTIRADOTEMP.c,41 :: 		Delay_us(100); // Retardo para estabilización del ADC
	MOVLW      33
	MOVWF      R13+0
L_main0:
	DECFSZ     R13+0, 1
	GOTO       L_main0
;SENSORTIRADOTEMP.c,42 :: 		Lcd_Init(); // Inicializa el LCD
	CALL       _Lcd_Init+0
;SENSORTIRADOTEMP.c,44 :: 		printStrings();while(1){
	CALL       _printStrings+0
L_main1:
;SENSORTIRADOTEMP.c,45 :: 		getTemp();
	CALL       _getTemp+0
;SENSORTIRADOTEMP.c,46 :: 		Delay_ms(50);
	MOVLW      65
	MOVWF      R12+0
	MOVLW      238
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	NOP
;SENSORTIRADOTEMP.c,47 :: 		}
	GOTO       L_main1
;SENSORTIRADOTEMP.c,48 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

_printStrings:

;SENSORTIRADOTEMP.c,49 :: 		void printStrings(){
;SENSORTIRADOTEMP.c,51 :: 		Lcd_Cmd(_LCD_CLEAR); // Comando para limpiar el LCD
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;SENSORTIRADOTEMP.c,52 :: 		Lcd_Cmd(_LCD_CURSOR_OFF); // Comando para quitar el cursor
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;SENSORTIRADOTEMP.c,53 :: 		Lcd_Out(1,3,"IPN - ESFM");//Imprime texto personalizado
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      3
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_SENSORTIRADOTEMP+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;SENSORTIRADOTEMP.c,54 :: 		Lcd_Out(2,2,"Salvador Tirado G.");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_SENSORTIRADOTEMP+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;SENSORTIRADOTEMP.c,55 :: 		delay_ms(1000);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_printStrings4:
	DECFSZ     R13+0, 1
	GOTO       L_printStrings4
	DECFSZ     R12+0, 1
	GOTO       L_printStrings4
	DECFSZ     R11+0, 1
	GOTO       L_printStrings4
	NOP
	NOP
;SENSORTIRADOTEMP.c,56 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;SENSORTIRADOTEMP.c,57 :: 		Lcd_Out(1,1,txt2);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;SENSORTIRADOTEMP.c,59 :: 		delay_ms(400);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_printStrings5:
	DECFSZ     R13+0, 1
	GOTO       L_printStrings5
	DECFSZ     R12+0, 1
	GOTO       L_printStrings5
	DECFSZ     R11+0, 1
	GOTO       L_printStrings5
;SENSORTIRADOTEMP.c,61 :: 		for(i = 3; i > 0; i--){
	MOVLW      3
	MOVWF      printStrings_i_L0+0
	MOVLW      0
	MOVWF      printStrings_i_L0+1
L_printStrings6:
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      printStrings_i_L0+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__printStrings14
	MOVF       printStrings_i_L0+0, 0
	SUBLW      0
L__printStrings14:
	BTFSC      STATUS+0, 0
	GOTO       L_printStrings7
;SENSORTIRADOTEMP.c,62 :: 		Lcd_Cmd(_LCD_SHIFT_LEFT);
	MOVLW      24
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;SENSORTIRADOTEMP.c,63 :: 		delay_ms(500);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_printStrings9:
	DECFSZ     R13+0, 1
	GOTO       L_printStrings9
	DECFSZ     R12+0, 1
	GOTO       L_printStrings9
	DECFSZ     R11+0, 1
	GOTO       L_printStrings9
	NOP
	NOP
;SENSORTIRADOTEMP.c,61 :: 		for(i = 3; i > 0; i--){
	MOVLW      1
	SUBWF      printStrings_i_L0+0, 1
	BTFSS      STATUS+0, 0
	DECF       printStrings_i_L0+1, 1
;SENSORTIRADOTEMP.c,64 :: 		}
	GOTO       L_printStrings6
L_printStrings7:
;SENSORTIRADOTEMP.c,65 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;SENSORTIRADOTEMP.c,66 :: 		Lcd_Out(1,1, txt1); // Se imprime la cadena text LCD
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt1+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;SENSORTIRADOTEMP.c,67 :: 		Lcd_Chr(2,9,223); // Imprime el caracter "°" con código ASCII 223
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      9
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      223
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;SENSORTIRADOTEMP.c,68 :: 		Lcd_Chr(2,10,'C'); // Imprime "C" de Celsius
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      10
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      67
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;SENSORTIRADOTEMP.c,69 :: 		Delay_ms(100);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_printStrings10:
	DECFSZ     R13+0, 1
	GOTO       L_printStrings10
	DECFSZ     R12+0, 1
	GOTO       L_printStrings10
	NOP
	NOP
;SENSORTIRADOTEMP.c,70 :: 		}
L_end_printStrings:
	RETURN
; end of _printStrings

_getTemp:

;SENSORTIRADOTEMP.c,71 :: 		void getTemp(){
;SENSORTIRADOTEMP.c,72 :: 		datoADC = ADC_Get_Sample(0); // Obtenemos lectura del AN0
	CLRF       FARG_ADC_Get_Sample_channel+0
	CALL       _ADC_Get_Sample+0
	MOVF       R0+0, 0
	MOVWF      _datoADC+0
	MOVF       R0+1, 0
	MOVWF      _datoADC+1
;SENSORTIRADOTEMP.c,73 :: 		delay_ms(600); // Periodo de actualización de datos
	MOVLW      4
	MOVWF      R11+0
	MOVLW      12
	MOVWF      R12+0
	MOVLW      51
	MOVWF      R13+0
L_getTemp11:
	DECFSZ     R13+0, 1
	GOTO       L_getTemp11
	DECFSZ     R12+0, 1
	GOTO       L_getTemp11
	DECFSZ     R11+0, 1
	GOTO       L_getTemp11
	NOP
	NOP
;SENSORTIRADOTEMP.c,74 :: 		temp = (float)(datoADC * 0.488); // El 0.488 se obtiene de la siguiente manera
	MOVF       _datoADC+0, 0
	MOVWF      R0+0
	MOVF       _datoADC+1, 0
	MOVWF      R0+1
	CALL       _word2double+0
	MOVLW      35
	MOVWF      R4+0
	MOVLW      219
	MOVWF      R4+1
	MOVLW      121
	MOVWF      R4+2
	MOVLW      125
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      _temp+0
	MOVF       R0+1, 0
	MOVWF      _temp+1
	MOVF       R0+2, 0
	MOVWF      _temp+2
	MOVF       R0+3, 0
	MOVWF      _temp+3
;SENSORTIRADOTEMP.c,88 :: 		FloatToStr(temp, tempString); //Se convierte de float a string para la LCD
	MOVF       R0+0, 0
	MOVWF      FARG_FloatToStr_fnum+0
	MOVF       R0+1, 0
	MOVWF      FARG_FloatToStr_fnum+1
	MOVF       R0+2, 0
	MOVWF      FARG_FloatToStr_fnum+2
	MOVF       R0+3, 0
	MOVWF      FARG_FloatToStr_fnum+3
	MOVLW      _tempString+0
	MOVWF      FARG_FloatToStr_str+0
	CALL       _FloatToStr+0
;SENSORTIRADOTEMP.c,89 :: 		Lcd_Out(2,1, tempString); //Se imprime el resultado o temperatura
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _tempString+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;SENSORTIRADOTEMP.c,90 :: 		}
L_end_getTemp:
	RETURN
; end of _getTemp
