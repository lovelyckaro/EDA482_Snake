/*
 * 	startup.c
 *  
 */
#include <libGPIO.h>
#include <stdint.h>
#include <stdbool.h>
#include "nb_delay.h"
#include "Graphics.h"
#include "errno.h"
#include <stdlib.h>

void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );

void startup ( void )
{
asm volatile(
    " LDR R0,=stack_top\n"  	/* set stack */
	" MOV SP,R0\n"
    " BL _crt_init\n"
	" BL main\n"				/* call main */
	".L1: B .L1\n"				/* never return */
	) ;
}

extern char heap_low;
extern char heap_top;
char* heap_end;

char* _sbrk(int incr) {
    char *prev_heap_end;
    if (heap_end == 0) {
        heap_end = &heap_low;
    }
    prev_heap_end = heap_end;
    if (heap_end + incr > &heap_top) {
        errno = ENOMEM;
        return (char *)-1;
    }
    heap_end += incr;
    return (char *) prev_heap_end;
}

static void _crt_init() {
    extern char __bss_start__;
    extern char __bss_end__;
    char *s;
    heap_end = 0;
    s = &__bss_start__;
    while (s < &__bss_end__) {
        *s++ = 0;
    }
    s = &heap_low;
    while (s < &heap_top) {
        *s++ = 0;
    }
}

#ifdef SIMULATOR
    #define DELAY_COUNT 100
#else
    #define DELAY_COUNT 100000
#endif

#define MAX_SNEK_SIZE 10

typedef struct point {
    uint8_t x;
    uint8_t y;
}POINT;

typedef struct node {
    POINT pos;
    struct node* next;
}NODE;

typedef struct snek {
    POINT velocity;
    POINT head;
    NODE* next;
    void (*move)(struct snek*);
    void (*draw)(struct snek*);
}SNEK;


void SNEK_move(SNEK* self) {
    // Collision detection
    // Lägg till ditt förra huvud, som första noden i listan
    NODE* new_node = (NODE*) malloc(sizeof(NODE));
    new_node->pos = self->head;
    new_node->next = self->next;
    self->next = new_node;
    // Gå fram ett steg rita ditt nya huvud
    self->head.x += self->velocity.x;
    self->head.y += self->velocity.y;
    pixel(self->head.x, self->head.y, true);
    // Ta bort sista elementet i listan, cleara den pixeln
    NODE* iterator = self->next;
    while (iterator->next->next != (NODE*) -1) {
        iterator = iterator->next;
    }
    pixel(iterator->next->pos.x, iterator->next->pos.y, false);
    free(iterator->next);
    iterator->next = (NODE*) -1;
        
}

void SNEK_draw(SNEK* self) {
    pixel(self->head.x, self->head.y, true);
    for (NODE* iter = self->next; iter->next != (NODE*) -1; iter = iter->next) {
        pixel(iter->pos.x, iter->pos.y, true); 
    }
}

extern volatile bool systick_flag;

SNEK* player;

void snek_init(void) {
    player->head = (POINT) {64,32};
    player->next = malloc(sizeof (NODE));
    player->next->pos = (POINT) {64,31};
    player->next->next = (NODE*) -1;
    player->draw = SNEK_draw;
    player->move = SNEK_move;
    player->velocity = (POINT) {1,0};
}

void app_init(void) {
    GPIO_output(GPIO_D);
    nb_init_delay();
    snek_init();
    graphic_init();
    graphic_clear_screen();
}

int main(void)
{
    char *dbuf1, *dbuf2, *dbuf3;
    dbuf1 = malloc(100);
    dbuf2 = malloc(150);
    dbuf3 = malloc(15);
    free(dbuf2);
    dbuf2 = malloc(50);
    free(dbuf1);
    free(dbuf2);
    free(dbuf3);
    
    
    while (true) {
        // Grejer som ska göras varje gametick
        
        
        nb_delay(DELAY_COUNT); // Calla inte delay efter det här
        while (true) {
            // Grejer som kan göras medans delay är igång (INTE GREJER SOM KRÄVER DELAY)
            if (systick_flag) {
                break;
            }
        }
    }
    
    
    return 0;
}

