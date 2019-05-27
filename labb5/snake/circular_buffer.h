/*#include <stdint.h>

typedef struct point {
    uint8_t x;
    uint8_t y;
}POINT;

typedef struct {
    POINT* buffer;
    int top;
    int bottom;
	int maxlen;
} circular_buffer;

int buffer_push(circular_buffer* c, POINT data);
int buffer_pop(circular_buffer *c, POINT* data);
int buffer_unshift(circular_buffer* c, POINT data);
int buffer_shift(circular_buffer* c, POINT *data);*/