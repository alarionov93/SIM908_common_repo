//interrupts learning

#include <avr/interrupt.h> 
#include <avr/io.h>
#include <SoftwareSerial.h>

#define SS_RX 2
#define SS_TX 3

char buffer[100];
volatile int state = LOW;

SoftwareSerial SoftSerial(SS_RX, SS_TX); // RX, TX

void setup()
{
   pinMode(4, OUTPUT); 
   pinMode(6, OUTPUT); 

   Serial.begin(9600);
   SoftSerial.begin(115200);

   attachInterrupt(0, blink, RISING);

   sei();
}

void loop()
{
  for(int i = 0; i < 255; i++) {
    analogWrite(6, i);
    delay(5);
  }
}

void blink()
{
  	// state = !state;
  	// digitalWrite(4, HIGH);   // set the LED on
    // digitalWrite(6, LOW);   // set the LED off
  	// delay(1000);
  	// digitalWrite(4, LOW);   // set the LED on       
  	if(SoftSerial.available() > 0) {
		Serial.write(SoftSerial.read());
	}
	reti();
}