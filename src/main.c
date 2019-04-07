/* Blinky for STM32F4 Discovery
 * Written by Matt Krol
 */

#include "stm32f4xx.h"

int main(void){
    /* Enable clock on GPIOD */
    RCC->AHB1ENR |= (1 << 3);
    /* Enable GPOID pin 12 for output */
    GPIOD->MODER |= (1 << 24);
    /* Turn on green led on port D pin 12 */
    GPIOD->ODR |= (1 << 12);
    while(1);
    return 0;
}
