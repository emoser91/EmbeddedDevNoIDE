#include <avr/io.h>
#include <util/delay.h>
#include <stdbool.h>


//Define F_CPU here or in the cmake file
// #define F_CPU 16000000UL
#define BLINK_MS 1000

int main(void)
{
    // DDRB |= 0b00100000;
    DDRB |= (1<<PORTB5);

    while(1)
    {
        // PORTB |= 0b00100000;
        PORTB |= (1<<PORTB5); 
        _delay_ms(BLINK_MS);
        
        PORTB &= ~0b00100000;
        _delay_ms(BLINK_MS);
    }
    return 0;
}