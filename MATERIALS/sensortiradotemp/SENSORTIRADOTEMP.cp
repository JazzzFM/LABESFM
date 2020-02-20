#line 1 "C:/Users/Lnvo-PC/Documents/ALL JAZZZZ/2- FUCKIN' ACADEMIC/1.- LABORATORIOS DE FÍSICA ESFM/LAB. FÍSICA 2/sensortiradotemp/SENSORTIRADOTEMP.c"
#line 9 "C:/Users/Lnvo-PC/Documents/ALL JAZZZZ/2- FUCKIN' ACADEMIC/1.- LABORATORIOS DE FÍSICA ESFM/LAB. FÍSICA 2/sensortiradotemp/SENSORTIRADOTEMP.c"
sbit LCD_RS at RC4_bit;
sbit LCD_EN at RC5_bit;
sbit LCD_D4 at RC0_bit;
sbit LCD_D5 at RC1_bit;
sbit LCD_D6 at RC2_bit;
sbit LCD_D7 at RC3_bit;

sbit LCD_RS_Direction at TRISC4_bit;
sbit LCD_EN_Direction at TRISC5_bit;
sbit LCD_D4_Direction at TRISC0_bit;
sbit LCD_D5_Direction at TRISC1_bit;
sbit LCD_D6_Direction at TRISC2_bit;
sbit LCD_D7_Direction at TRISC3_bit;

float temp = 0;
unsigned int datoADC = 0;
char tempString[15];
char txt1[] = "Temperatura: ";
char txt2[] = "Termometro Digital";
char txt3[] = "Laboratorio de Física II";

void printStrings();
void getTemp();
void main(){

ANSEL = 0x01;
ANSELH = 0x00;
TRISA0_bit = 1;
C1ON_bit = 0;
C2ON_bit = 0;

ADC_Init();
Delay_us(100);
Lcd_Init();

printStrings();while(1){
getTemp();
Delay_ms(50);
}
}
void printStrings(){
int i;
Lcd_Cmd(_LCD_CLEAR);
Lcd_Cmd(_LCD_CURSOR_OFF);
Lcd_Out(1,3,"IPN - ESFM");
Lcd_Out(2,2,"Salvador Tirado G.");
delay_ms(1000);
Lcd_Cmd(_LCD_CLEAR);
Lcd_Out(1,1,txt2);

delay_ms(400);

for(i = 3; i > 0; i--){
Lcd_Cmd(_LCD_SHIFT_LEFT);
delay_ms(500);
}
Lcd_Cmd(_LCD_CLEAR);
Lcd_Out(1,1, txt1);
Lcd_Chr(2,9,223);
Lcd_Chr(2,10,'C');
Delay_ms(100);
}
void getTemp(){
datoADC = ADC_Get_Sample(0);
delay_ms(600);
temp = (float)(datoADC * 0.488);
#line 88 "C:/Users/Lnvo-PC/Documents/ALL JAZZZZ/2- FUCKIN' ACADEMIC/1.- LABORATORIOS DE FÍSICA ESFM/LAB. FÍSICA 2/sensortiradotemp/SENSORTIRADOTEMP.c"
FloatToStr(temp, tempString);
Lcd_Out(2,1, tempString);
}
