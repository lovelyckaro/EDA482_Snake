/*#include "circular_buffer.h"
#include <stdint.h>

int buffer_push(circular_buffer* c, POINT data)
{
    int next;

    next = c->top + 1;  // next is where top will point to after this write.
    if (next >= c->maxlen) { // If next is too large, loop back to the beginning
		next = 0;
	}

    if (next == c->bottom){  // if the top + 1 == bottom, circular buffer is full
        return -1;
	}

    c->buffer[c->top] = data;  // Load data and then move
    c->top = next;             // top to next data offset.
    return 0;  // return success to indicate successful push.
}

int buffer_pop(circular_buffer *c, POINT* data)
{
    int next;

    if (c->top == c->bottom){  // if the top == bottom, we don't have any data
        return -1;
	}

    next = c->top - 1;  // next is where bottom will point to after this read.
    if(next < 0) {
		next = c->maxlen - 1;
	}
	c->top = next; // move
    *data = c->buffer[c->top];  // Read data
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

    c->buffer[c->bottom] = data;  // Load data and then move
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
    *data = c->buffer[c->bottom];  // Read data and then move
                 // bottom to next offset.
    return 0;  // return success to indicate successful push.
}*/