#include <stdint.h>

typedef struct{
    uint32_t ctrl;
    uint32_t load;
    uint32_t val;
    uint32_t calib;
}STK;

#define SysTick ((volatile STK*) 0xE000E010)

void nb_delay_micro(void);
void nb_init_delay(void);
void nb_delay(uint32_t us);