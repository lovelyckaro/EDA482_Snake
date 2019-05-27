/*
 * 	startup.c
 *  
 */
#include <libGPIO.h>
#include <stdint.h>
#include <stdbool.h>
#include <libdelay.h>
#include "nb_delay.h"
#include "Graphics.h"
#include "keypad.h"
#include "Ascii.h"
#include "PellesSuperRng.h"

void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );

void startup ( void )
{
asm volatile(
	" LDR R0,=0x2001C000\n"		/* set stack */
	" MOV SP,R0\n"
	" BL main\n"				/* call main */
	"_exit: B .\n"				/* never return */
	) ;
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

typedef struct vector {
	int8_t x;
	int8_t y;
}VECTOR;

typedef struct {
    POINT* buffer;
    int top;
    int bottom;
	int maxlen;
} circular_buffer;

typedef struct snek {
    VECTOR velocity;
    POINT head;
	circular_buffer* tail;
    void (*move)(struct snek*);
    void (*draw)(struct snek*);
	void (*turn_left)(struct snek*);
	void (*turn_right)(struct snek*);
}SNEK;


// Circular buffer stuff
int buffer_push(circular_buffer* c, POINT data) {
    int next;

    next = c->top + 1;  // next is where top will point to after this write.
    if (next >= c->maxlen) { // If next is too large, loop back to the beginning
		next = 0;
	}

    if (next == c->bottom){  // if the top + 1 == bottom, circular buffer is full
        return -1;
	}

    c->buffer[c->top].x = data.x;  // Load data and then move
	c->buffer[c->top].y = data.y;  // Load data and then move
    c->top = next;             // top to next data offset.
    return 0;  // return success to indicate successful push.
}

int buffer_pop(circular_buffer *c, POINT* data) {
    int next;

    if (c->top == c->bottom){  // if the top == bottom, we don't have any data
        return -1;
	}

    next = c->top - 1;  // next is where bottom will point to after this read.
    if(next < 0) {
		next = c->maxlen - 1;
	}
	c->top = next; // move
    data->x=c->buffer[c->top].x;  // Read data
	data->y=c->buffer[c->top].y; 
    return 0;  // return success to indicate successful push.
}

int buffer_unshift(circular_buffer* c, POINT data) {
	int next;

    next = c->bottom - 1;  // next is where bottom will point to after this write.
    if (next < 0){
        next = c->maxlen-1;
	}

    if (next == c->top) { // if the bottom - 1 == top, circular buffer is full
        return -1;
	}

    c->buffer[c->bottom].x = data.x;  // Load data and then move
    c->buffer[c->bottom].y = data.y;
	c->bottom = next;             // top to next data offset.
    return 0; 					 // return success to indicate successful push.
}


int buffer_shift(circular_buffer* c, POINT *data) {
    int next;

    if (c->top == c->bottom){  // if the top == bottom, we don't have any data
        return -1;
	}

    next = c->bottom + 1;  // next is where bottom will point to after this read.
    if(next >= c->maxlen) {
		next = 0;
	}
		
	c->bottom = next; 
    data->x = c->buffer[c->bottom].x;  // Read data and then move
	data->y = c->buffer[c->bottom].y;
                 // bottom to next offset.
    return 0;  // return success to indicate successful push.
}
// End of circular buffer stuff

bool GAME_OVER = false;
rngword_t rngState;
POINT food;
uint8_t points;

void gen_food(rngword_t state) {
	uint8_t x = nextRnd(&rngState);
	uint8_t y = nextRnd(&rngState);
	x %= 128;
	y %= 64;
	
	pixel(x, y, true);
	food.x = x;
	food.y = y;
}

void SNEK_move(SNEK* self) {
    // Collision detection
	POINT next_head = self->head;
	next_head.x += self->velocity.x;
	next_head.y += self->velocity.y;
	if (next_head.x < 0 || next_head.x >= 128 || next_head.y < 0 || next_head.y >= 64) {
		// We have collided
		GAME_OVER = true;
		return;
	}
	for (int i = self->tail->bottom; i != self->tail->top; i = (i + 1) % 50) {
		if (next_head.x == self->tail->buffer[i].x && next_head.y == self->tail->buffer[i].y) {
			GAME_OVER = true;
			return;
		}
	}
	
	
	bool nomnomnom = false;
	if (next_head.x == food.x && next_head.y == food.y) {
		nomnomnom = true;
		gen_food(rngState);
		points++;
		ascii_gotoxy(1,1);
		ascii_write_string("Length: ");
		ascii_write_char(points + '0');
	}
	
	
	
    // Lägg till ditt förra huvud, som första noden i listan
	buffer_push(self->tail ,self->head);
    // Gå fram ett steg rita ditt nya huvud
	self->head = next_head;
	pixel(self->head.x, self->head.y, true);
	
    // Ta bort sista elementet i listan, cleara den pixeln
	if (!nomnomnom) {
		POINT clearMe;
		buffer_shift(self->tail, &clearMe);
		pixel(clearMe.x, clearMe.y, false);
	}
        
}

void SNEK_draw(SNEK* self) {
    pixel(self->head.x, self->head.y, true);
}

void SNEK_turn_left(SNEK* self) {
	VECTOR new_velocity;
	new_velocity.x = self->velocity.y;
	new_velocity.y = -self->velocity.x;
	self->velocity = new_velocity;
}

void SNEK_turn_right(SNEK* self) {
	VECTOR new_velocity;
	new_velocity.x = -self->velocity.y;
	new_velocity.y = self->velocity.x;
	self->velocity = new_velocity;
}

extern volatile bool systick_flag;

POINT arr[50];
circular_buffer buff = {
	.buffer = arr,
	.top = 0,
	.bottom = 0,
	.maxlen = 50
};

SNEK player = {
	.head = (POINT) {64,32},
	.tail = &buff,
	.draw = SNEK_draw,
	.move = SNEK_move,
	.turn_left = SNEK_turn_left,
	.turn_right = SNEK_turn_right,
	.velocity = (VECTOR) {1,0}
};


void app_init(void) {
	#ifdef USBDM
		GPIO_clock_start();
		*((uint32_t*) 0x40023844) |= 0x4000;
		*((uint32_t*) 0xE000ED08) = 0x2001C000;
	#endif
	seedRng(&rngState, 0);
	nb_init_delay();
	graphic_init();
	init_keypad(GPIO_D);
}

void app_reset(void) {
	ascii_init();
	graphic_clear_screen();
	player.head = (POINT) {64, 32};
	player.tail->bottom = 0;
	player.tail->top = 0;
	buffer_unshift(player.tail, (POINT) {63,32});
	gen_food(rngState);
	points = 1;
}

int main(void) {
	app_init();
	while(true){
		app_reset();
		player.draw(&player);
		ascii_gotoxy(1,1);
		ascii_write_string("Press 5 to play");
		ascii_gotoxy(1,2);
		ascii_write_string("again!");
		while (kread_keypad(GPIO_D) != 5);
		ascii_init();
		ascii_write_string("Length: 1");
		
		while (true) {
			// Grejer som ska göras varje gametick;
			player.move(&player);
			
			
			
			nb_delay(10000); // Calla inte delay efter det här
			while (true) {
				// Grejer som kan göras medans delay är igång (INTE GREJER SOM KRÄVER DELAY)
				if (systick_flag) {
					break;
				}
			} // Nu är det fine att calla delay igen
			uint8_t c = kread_keypad(GPIO_D);
			switch(c) {
				case 4: 
					player.turn_left(&player);
					break;
				case 6:
					player.turn_right(&player);
					break;
			}
			if (GAME_OVER) {
				ascii_gotoxy(1,1);
				ascii_init();
				ascii_write_string("GAME OVER!");
				delay_millis(200000);
				GAME_OVER = false;
				break;
			}
		}
	}
    
    
    return 0;
}

