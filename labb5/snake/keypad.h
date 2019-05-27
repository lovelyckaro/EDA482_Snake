#include <libGPIO.h>

void init_keypad(volatile GPIO* port);
void kactivate_row(volatile GPIO* port, int8_t row_num);
int8_t kread_column(volatile GPIO* port);
int8_t kkey_value(int8_t row, int8_t col);
uint8_t kread_keypad(volatile GPIO* port);