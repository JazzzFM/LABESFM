/*
                        INSTITUTO POLIT�CNICO NACIONAL
                   ESCUELA SUPERIOR DE F�SICA Y MATEM�TICAS
///////////////////////////////////////////////////////////////////////////////
  Term�metro Digital con LM35 y Display LCD de 16x2
  MCU: PIC16F886    Osc: Interno a 4 MHz
  Lenguaje de Programaci�n: MikroC (dialecto de C orientado a microcontroladores)
  Complejidad computacional del algoritmo: O = n
  Hardware
  - PIC16F886
  - LCD 16x2 con controlador Hitachi
  - Fuente de CC de 5V
  - Capacitor electrol�tico de 100uF (filtrado de se�ales)
  - Protoboard
  - Sensor LM35
  - Potenci�metro de 5KOhms
  Software
  - MikroC IDE
  - PicKit2
  Alumno: Flores Rodr�guez Jaziel David
  Profe, �ya esta homoerectus?
*/
// Conexiones de la LCD
sbit LCD_RS at RC4_bit;
sbit LCD_EN at RC5_bit;
sbit LCD_D4 at RC0_bit;
sbit LCD_D5 at RC1_bit;
sbit LCD_D6 at RC2_bit;
sbit LCD_D7 at RC3_bit;
//Direccionamiento de los puertos (Entrada, Salida o Alta Impedancia)
sbit LCD_RS_Direction at TRISC4_bit;
sbit LCD_EN_Direction at TRISC5_bit;
sbit LCD_D4_Direction at TRISC0_bit;
sbit LCD_D5_Direction at TRISC1_bit;
sbit LCD_D6_Direction at TRISC2_bit;
sbit LCD_D7_Direction at TRISC3_bit;

//Declaraci�n de variables globales
float temp = 0;              // Valor obtenido del Analog/Digital Converter (ADC)
unsigned int datoADC = 0;    // Variable que almacena lo obtenido en el ADC
char tempString[15];        // Almacena temperatura como cadena de caracteres
char txt1[] = "Temperatura: ";
char txt2[] = "Term�metro Digital";

//Declaraci�n de funciones
void printStrings();   //Funci�n tipo void (no regresa ning�n dato)
void getTemp();

void main(){

 // Configuraci�n de bits y puertos
 ANSEL  = 0x01;            // Establece bit RA0 como anal�gico
 ANSELH = 0x00;            // Configura otros bits an�logicos como digitales
 TRISA0_bit = 1;           // Establece bit RA0 como entrada
 C1ON_bit = 0;             // Deshabilita comparador 1
 C2ON_bit = 0;             // Deshabilita comparador 2

 //Inicializaci�n de funciones externas
 ADC_Init();               // Inicializa el Modulo ADC
 Delay_us(100);            // Retardo para estabilizaci�n del ADC
 Lcd_Init();               // Inicializa el LCD

 //Llamado a funci�n printStrings()
 printStrings();

 while(1){
  getTemp();
  Delay_ms(50);
  }
}

void printStrings(){
 int i;
 Lcd_Cmd(_LCD_CLEAR);      // Comando para limpiar el LCD
 Lcd_Cmd(_LCD_CURSOR_OFF); // Comando para quitar el cursor
 Lcd_Out(1,3,"IPN - ESFM");//Imprime texto personalizado
 Lcd_Out(2,2,"Alumno: Jaziel Flores. Profesor: Salvador Tirado Guerra");
 delay_ms(1000);
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(1,1,txt2);
 delay_ms(400);
 //Bucle de desplazamiento de texto en la LCD (para m�s de 16 caracteres)
 for(i = 3; i > 0; i--){
       Lcd_Cmd(_LCD_SHIFT_LEFT);
       delay_ms(500);
 }
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(1,1, txt1);       // Se imprime la cadena text LCD
 Lcd_Chr(2,9,223);         // Imprime el caracter "�" con c�digo ASCII 223
 Lcd_Chr(2,10,'C');        // Imprime "C" de Celsius
 Delay_ms(100);
}

void getTemp(){
 datoADC = ADC_Get_Sample(0);     // Obtenemos lectura del AN0
 delay_ms(600);                   // Periodo de actualizaci�n de datos
 temp = (float)(datoADC * 0.488); // El 0.488 se obtiene de la siguiente manera
 /*
    El ADC maneja un concepto que es la resoluci�n, la cual se expresa:
                              ADCres = (VRef/2^# de bits)
                              Donde:
                              VRef = 5V;
                              # bits = 10;
    Por tanto:
                              ADCres = (5/2^10) = 5/1024 = 0.004888
    Pero eso se multiplica por 100 para obtenerlo en escala de �Celsius
    Por tanto el resultado de la temperatura estara en funci�n de la lectura o
    datoADC, multiplicada por esta constante que se obtuvo a trav�s de la
    teor�a del ADC.
 */
 FloatToStr(temp, tempString); //Se convierte de float a string para la LCD
 Lcd_Out(2,1, tempString);     //Se imprime el resultado o temperatura
}