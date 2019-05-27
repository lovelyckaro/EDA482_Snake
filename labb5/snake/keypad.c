#include <libGPIO.h>
#include "keypad.h"

// init moder, pudpr, and otyper for keypad in a port. If not high, uses low
void init_keypad(volatile GPIO* port) {
    uint32_t moder_mask, pudpr_mask, moder_set, pudpr_set;
    uint16_t otyper_mask, otyper_set;
	moder_mask = 0x0000FFFF;
	moder_set  = 0x55000000;
	otyper_mask = 0x00FF;
	otyper_set  = 0x0F00;
	pudpr_mask = 0x0000FFFF;
	pudpr_set  = 0x00AA0000;
    
    uint32_t moder = port->moder;
    port->moder = (moder & moder_mask) | moder_set; // b31-b24 = 01010101, b23-b16 = 00000000, keep the rest
    uint16_t otyper = port->otyper;
    port->otyper = (otyper & otyper_mask) | otyper_set; // b15-b12 = 0000, b11-b8 = 1111, keep the rest
    uint32_t pudpr = port->pudpr;
    port->pudpr = (pudpr & pudpr_mask) | pudpr_set;
}

void kactivate_row(volatile GPIO* port, int8_t row_num) {
	port->odr_high = (8<<row_num);
}

int8_t kread_column(volatile GPIO* port) {
    uint8_t idr;
	idr = port->idr_high & 0x0F;
    int8_t col = 0;
    while (idr) {
        col++;
        idr = idr >> 1;
    }
    return col;
}

int8_t kkey_value(int8_t row, int8_t col) {
    uint8_t keys[4][4] = {{1,2,3,10}
                        ,{4,5,6,11}
                        ,{7,8,9,12}
                        ,{14,0,15,13}
                        };
    if (row > 0 && row <= 4 && col > 0 && col <= 4) {
        return keys[row-1][col-1];
    }else{
        return 0;
    }
}

uint8_t kread_keypad(volatile GPIO* port) {
    for (int8_t row = 1; row <= 4; row++) {
        kactivate_row(port, row);
        int8_t column = kread_column(port);
        if (column) {
            return kkey_value(row, column);
        }
    }
    return 16;
}