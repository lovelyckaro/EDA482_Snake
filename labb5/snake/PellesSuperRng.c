#include "PellesSuperRng.h"

// typedef rngword_t uint32_t;

void seedRng(rngword_t* state, uint32_t s)
{
    *state = s;
    for(int i = 0; i < 10; i++) {
	nextRnd(state);
    }
}

uint32_t nextRnd(rngword_t* state)
{
    *state = 0x23456789 * *state + 1;
    rngword_t x = *state;
    for(int i = 0; i < 3; i++) {
	x *= 0x87654321;
	x ^= x >> 17;
	x += i;
    }
    return x;
}
