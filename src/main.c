/* Blinky for STM32F4 Discovery
 * Written by Matt Krol
 */

#include "stm32f4xx.h"

int main(void){
    RCC->AHB1ENR |= (1 << 3);
    GPIOD->MODER |= (1 << 24);
    GPIOD->ODR |= (1 << 12);
    while(1);
    return 0;
}
