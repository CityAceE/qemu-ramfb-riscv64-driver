#include  <stdint.h>

#define SERIAL_MMIO 0x10000000

void kprint(uint8_t *print_string);
uint8_t* uitoa(uint8_t *str, uint64_t num, int base);
void kprint_ui(uint64_t inp);