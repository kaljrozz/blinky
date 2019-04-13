/* Blinky for STM32F4 Discovery
 * Written by Matt Krol
 */

#include "stm32f4xx.h"

void TIM2_IRQHandler(void){
    /* toggle green led on GPIOD pin 12 */
    GPIOD->ODR ^= (1 << 12);
    /* clear interrupt flag */
    TIM2->SR &= ~1;
}
int main(void){
    /* enable GPIOD clock */
    RCC->AHB1ENR |= RCC_AHB1ENR_GPIODEN;
    /* enable TIM2 clock */
    RCC->APB1ENR |= RCC_APB1ENR_TIM2EN; 

    /* enable GPOID pin 12 for output */
    GPIOD->MODER |= (1 << 24);

    /* enable TIM2 interrupts first on the NVIC and then on TIM2 itself */
    NVIC->ISER[0] |= (1 << TIM2_IRQn);
    TIM2->DIER |= TIM_DIER_UIE;
    
    /* set TIM2 prescaler and autoreload values so
     * period = (PSC+1)*(ARR+1)/16MHz = 1 sec */
    TIM2->PSC = 999;
    TIM2->ARR = 15999;

    /* enable TIM2 */
    TIM2->CR1 |= TIM_CR1_CEN;

    while(1);
    return 0;
}
