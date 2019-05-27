#include <stdint.h>
#include <stdbool.h>
#include "nb_delay.h"

volatile bool systick_flag;
volatile int32_t delay_count;

void nb_delay_micro(void) {
    systick_flag = false;
    SysTick->ctrl = 0;
    SysTick->load = 168-1;
    SysTick->val = 0;
    SysTick->ctrl = 7;
}

void systick_irq_handler(void) {
    delay_count--;
    if (delay_count) {
        nb_delay_micro();
    }else {
        systick_flag = true;
		SysTick->ctrl = 0;
    }
}

void nb_init_delay(void) {
    *((void (**)(void)) 0x2001C03C) = systick_irq_handler;
    systick_flag = false;
}

void nb_delay(uint32_t us) {
    delay_count = us;
    nb_delay_micro();
}
