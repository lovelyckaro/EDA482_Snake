/*
 * 	startup.c
 *
 */
 
 #include <stdint.h>
void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );

void startup ( void )
{
__asm volatile(
	" LDR R0,=0x2001C000\n"		/* set stack */
	" MOV SP,R0\n"
	" BL main\n"				/* call main */
	"_exit: B .\n"				/* never return */
	) ;
}

typedef struct {
    uint8_t* buffer;
    int top;
    int bottom;
	int maxlen;
} circular_buffer;

int buffer_push(circular_buffer* c, uint8_t data)
{
    int next;

    next = c->top + 1;  // next is where top will point to after this write.
    if (next >= c->maxlen)
        next = 0;

    if (next == c->bottom)  // if the top + 1 == bottom, circular buffer is full
        return -1;

    c->buffer[c->top] = data;  // Load data and then move
    c->top = next;             // top to next data offset.
    return 0;  // return success to indicate successful push.
}

int buffer_pop(circular_buffer *c, uint8_t* data)
{
    int next;

    if (c->top == c->bottom)  // if the top == bottom, we don't have any data
        return -1;

    next = c->top - 1;  // next is where bottom will point to after this read.
    if(next < 0)
        next = c->maxlen - 1;
	c->top = next; // move
    *data = c->buffer[c->top];  // Read data
    return 0;  // return success to indicate successful push.
}

int buffer_unshift(circular_buffer* c, uint8_t data) {
	int next;

    next = c->bottom - 1;  // next is where bottom will point to after this write.
    if (next < 0)
        next = c->maxlen-1;

    if (next == c->top)  // if the bottom - 1 == top, circular buffer is full
        return -1;

    c->buffer[c->bottom] = data;  // Load data and then move
    c->bottom = next;             // top to next data offset.
    return 0; 					 // return success to indicate successful push.
}


int buffer_shift(circular_buffer* c, uint8_t *data) {
    int next;

    if (c->top == c->bottom)  // if the top == bottom, we don't have any data
        return -1;

    next = c->bottom + 1;  // next is where bottom will point to after this read.
    if(next >= c->maxlen)
        next = 0;
		
	c->bottom = next; 
    *data = c->buffer[c->bottom];  // Read data and then move
                 // bottom to next offset.
    return 0;  // return success to indicate successful push.
}

static uint8_t arr[10];
static circular_buffer buff = {
	.buffer = arr,
	.top = 0,
	.bottom = 0,
	.maxlen = 10
};



