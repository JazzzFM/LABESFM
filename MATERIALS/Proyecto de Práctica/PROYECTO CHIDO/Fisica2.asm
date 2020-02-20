
_main:

;Fisica2.c,50 :: 		void main(){
;Fisica2.c,53 :: 		ANSEL  = 0x01;            // Establece bit RA0 como analógico
	MOVLW      1
	MOVWF      ANSEL+0
;Fisica2.c,54 :: 		ANSELH = 0x00;            // Configura otros bits análogicos como digitales
	CLRF       ANSELH+0
;Fisica2.c,55 :: 		TRISA0_bit = 1;           // Establece bit RA0 como entrada
	BSF        TRISA0_bit+0, BitPos(TRISA0_bit+0)
;Fisica2.c,56 :: 		C1ON_bit = 0;             // Deshabilita comparador 1
	BCF        C1ON_bit+0, BitPos(C1ON_bit+0)
;Fisica2.c,57 :: 		C2ON_bit = 0;             // Deshabilita comparador 2
	BCF        C2ON_bit+0, BitPos(C2ON_bit+0)
;Fisica2.c,60 :: 		ADC_Init();               // Inicializa el Modulo ADC
	CALL       _ADC_Init+0
;Fisica2.c,61 :: 		Delay_us(100);            // Retardo para estabilización del ADC
	MOVLW      66
	MOVWF      R13+0
L_main0:
	DECFSZ     R13+0, 1
	GOTO       L_main0
	NOP
;Fisica2.c,62 :: 		Lcd_Init();               // Inicializa el LCD
	CALL       _Lcd_Init+0
;Fisica2.c,65 :: 		printStrings();
	CALL       _printStrings+0
;Fisica2.c,67 :: 		while(1){
L_main1:
;Fisica2.c,68 :: 		getTemp();
	CALL       _getTemp+0
;Fisica2.c,69 :: 		Delay_ms(50);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	NOP
	NOP
;Fisica2.c,70 :: 		}
	GOTO       L_main1
;Fisica2.c,71 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

_printStrings:

;Fisica2.c,73 :: 		void printStrings(){
;Fisica2.c,75 :: 		Lcd_Cmd(_LCD_CLEAR);      // Comando para limpiar el LCD
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Fisica2.c,76 :: 		Lcd_Cmd(_LCD_CURSOR_OFF); // Comando para quitar el cursor
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Fisica2.c,77 :: 		Lcd_Out(1,3,"IPN - ESFM");//Imprime texto personalizado
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      3
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_Fisica2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Fisica2.c,78 :: 		delay_ms(700);
	MOVLW      8
	MOVWF      R11+0
	MOVLW      27
	MOVWF      R12+0
	MOVLW      39
	MOVWF      R13+0
L_printStrings4:
	DECFSZ     R13+0, 1
	GOTO       L_printStrings4
	DECFSZ     R12+0, 1
	GOTO       L_printStrings4
	DECFSZ     R11+0, 1
	GOTO       L_printStrings4
;Fisica2.c,79 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Fisica2.c,80 :: 		Lcd_Out(1,2,"Alumno:");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_Fisica2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Fisica2.c,81 :: 		Lcd_Out(2,1, txt3);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt3+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Fisica2.c,82 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_printStrings5:
	DECFSZ     R13+0, 1
	GOTO       L_printStrings5
	DECFSZ     R12+0, 1
	GOTO       L_printStrings5
	DECFSZ     R11+0, 1
	GOTO       L_printStrings5
	NOP
	NOP
;Fisica2.c,83 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Fisica2.c,84 :: 		Lcd_Out(1,4,"Profesor:");//Imprime texto personalizado
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      4
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr3_Fisica2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Fisica2.c,85 :: 		Lcd_Out(2,1, txt4);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt4+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Fisica2.c,86 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_printStrings6:
	DECFSZ     R13+0, 1
	GOTO       L_printStrings6
	DECFSZ     R12+0, 1
	GOTO       L_printStrings6
	DECFSZ     R11+0, 1
	GOTO       L_printStrings6
	NOP
	NOP
;Fisica2.c,87 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Fisica2.c,88 :: 		Lcd_Out(1,1,txt2);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Fisica2.c,89 :: 		delay_ms(400);
	MOVLW      5
	MOVWF      R11+0
	MOVLW      15
	MOVWF      R12+0
	MOVLW      241
	MOVWF      R13+0
L_printStrings7:
	DECFSZ     R13+0, 1
	GOTO       L_printStrings7
	DECFSZ     R12+0, 1
	GOTO       L_printStrings7
	DECFSZ     R11+0, 1
	GOTO       L_printStrings7
;Fisica2.c,91 :: 		for(i = 3; i > 0; i--){
	MOVLW      3
	MOVWF      printStrings_i_L0+0
	MOVLW      0
	MOVWF      printStrings_i_L0+1
L_printStrings8:
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      printStrings_i_L0+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__printStrings16
	MOVF       printStrings_i_L0+0, 0
	SUBLW      0
L__printStrings16:
	BTFSC      STATUS+0, 0
	GOTO       L_printStrings9
;Fisica2.c,92 :: 		Lcd_Cmd(_LCD_SHIFT_LEFT);
	MOVLW      24
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Fisica2.c,93 :: 		delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_printStrings11:
	DECFSZ     R13+0, 1
	GOTO       L_printStrings11
	DECFSZ     R12+0, 1
	GOTO       L_printStrings11
	DECFSZ     R11+0, 1
	GOTO       L_printStrings11
	NOP
	NOP
;Fisica2.c,91 :: 		for(i = 3; i > 0; i--){
	MOVLW      1
	SUBWF      printStrings_i_L0+0, 1
	BTFSS      STATUS+0, 0
	DECF       printStrings_i_L0+1, 1
;Fisica2.c,94 :: 		}
	GOTO       L_printStrings8
L_printStrings9:
;Fisica2.c,95 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Fisica2.c,96 :: 		Lcd_Out(1,1, txt1);       // Se imprime la cadena text LCD
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt1+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Fisica2.c,97 :: 		Lcd_Chr(2,9, "ppm");         // Imprime el caracter "°" con código ASCII 223
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      9
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      ?lstr_4_Fisica2+0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;Fisica2.c,98 :: 		Lcd_Chr(2,14,"ppm");        // Imprime ppm
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      14
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      ?lstr_5_Fisica2+0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;Fisica2.c,99 :: 		Delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_printStrings12:
	DECFSZ     R13+0, 1
	GOTO       L_printStrings12
	DECFSZ     R12+0, 1
	GOTO       L_printStrings12
	DECFSZ     R11+0, 1
	GOTO       L_printStrings12
	NOP
;Fisica2.c,100 :: 		}
L_end_printStrings:
	RETURN
; end of _printStrings

_getTemp:

;Fisica2.c,102 :: 		void getTemp(){
;Fisica2.c,103 :: 		datoADC = ADC_Get_Sample(0);     // Obtenemos lectura del AN0
	CLRF       FARG_ADC_Get_Sample_channel+0
	CALL       _ADC_Get_Sample+0
	MOVF       R0+0, 0
	MOVWF      _datoADC+0
	MOVF       R0+1, 0
	MOVWF      _datoADC+1
;Fisica2.c,104 :: 		delay_ms(600);                   // Periodo de actualización de datos
	MOVLW      7
	MOVWF      R11+0
	MOVLW      23
	MOVWF      R12+0
	MOVLW      106
	MOVWF      R13+0
L_getTemp13:
	DECFSZ     R13+0, 1
	GOTO       L_getTemp13
	DECFSZ     R12+0, 1
	GOTO       L_getTemp13
	DECFSZ     R11+0, 1
	GOTO       L_getTemp13
	NOP
;Fisica2.c,105 :: 		temp = (float)(datoADC *(5.0*0.00522));
	MOVF       _datoADC+0, 0
	MOVWF      R0+0
	MOVF       _datoADC+1, 0
	MOVWF      R0+1
	CALL       _word2double+0
	MOVLW      171
	MOVWF      R4+0
	MOVLW      207
	MOVWF      R4+1
	MOVLW      85
	MOVWF      R4+2
	MOVLW      121
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
;Fisica2.c,106 :: 		FloatToStr(temp, tempString); //Se convierte de float a string para la LCD
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
;Fisica2.c,107 :: 		Lcd_Out(2,1, tempString);     //Se imprime el resultado o temperatura
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _tempString+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Fisica2.c,108 :: 		}
L_end_getTemp:
	RETURN
; end of _getTemp
