   1              		.arch armv6-m
   2              		.eabi_attribute 20, 1
   3              		.eabi_attribute 21, 1
   4              		.eabi_attribute 23, 3
   5              		.eabi_attribute 24, 1
   6              		.eabi_attribute 25, 1
   7              		.eabi_attribute 26, 1
   8              		.eabi_attribute 30, 6
   9              		.eabi_attribute 34, 0
  10              		.eabi_attribute 18, 4
  11              		.file	"startup.c"
  12              		.text
  13              	.Ltext0:
  14              		.cfi_sections	.debug_frame
  15              		.section	.start_section,"ax",%progbits
  16              		.align	1
  17              		.global	startup
  18              		.syntax unified
  19              		.code	16
  20              		.thumb_func
  21              		.fpu softvfp
  23              	startup:
  24              	.LFB0:
  25              		.file 1 "/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c"
   1:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c **** /*
   2:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c ****  * 	startup.c
   3:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c ****  *  
   4:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c ****  */
   5:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c **** #include <libGPIO.h>
   6:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c **** #include <stdint.h>
   7:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c **** #include <stdbool.h>
   8:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c **** #include "nb_delay.h"
   9:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c **** #include "Graphics.h"
  10:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c **** #include "errno.h"
  11:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c **** #include <stdlib.h>
  12:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c **** 
  13:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c **** void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
  14:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c **** 
  15:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c **** void startup ( void )
  16:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c **** {
  26              		.loc 1 16 1
  27              		.cfi_startproc
  28              		@ Naked Function: prologue and epilogue provided by programmer.
  29              		@ args = 0, pretend = 0, frame = 0
  30              		@ frame_needed = 1, uses_anonymous_args = 0
  17:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c **** asm volatile(
  31              		.loc 1 17 1
  32              		.syntax divided
  33              	@ 17 "/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c" 1
  34 0000 0348     		 LDR R0,=stack_top
  35 0002 8546     	 MOV SP,R0
  36 0004 FFF7FEFF 	 BL _crt_init
  37 0008 FFF7FEFF 	 BL main
  38 000c FEE7     	.L1: B .L1
  39              	
  40              	@ 0 "" 2
  18:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c ****     " LDR R0,=stack_top\n"  	/* set stack */
  19:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c **** 	" MOV SP,R0\n"
  20:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c ****     " BL _crt_init\n"
  21:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c **** 	" BL main\n"				/* call main */
  22:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c **** 	".L1: B .L1\n"				/* never return */
  23:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c **** 	) ;
  24:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c **** }
  41              		.loc 1 24 1
  42              		.thumb
  43              		.syntax unified
  44 000e C046     		nop
  45              		.cfi_endproc
  46              	.LFE0:
  48              		.comm	heap_end,4,4
  49              		.text
  50              		.align	1
  51              		.global	_sbrk
  52              		.syntax unified
  53              		.code	16
  54              		.thumb_func
  55              		.fpu softvfp
  57              	_sbrk:
  58              	.LFB1:
  25:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c **** 
  26:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c **** extern char heap_low;
  27:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c **** extern char heap_top;
  28:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c **** char* heap_end;
  29:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c **** 
  30:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c **** char* _sbrk(int incr) {
  59              		.loc 1 30 23
  60              		.cfi_startproc
  61              		@ args = 0, pretend = 0, frame = 16
  62              		@ frame_needed = 1, uses_anonymous_args = 0
  63 0000 80B5     		push	{r7, lr}
  64              		.cfi_def_cfa_offset 8
  65              		.cfi_offset 7, -8
  66              		.cfi_offset 14, -4
  67 0002 84B0     		sub	sp, sp, #16
  68              		.cfi_def_cfa_offset 24
  69 0004 00AF     		add	r7, sp, #0
  70              		.cfi_def_cfa_register 7
  71 0006 7860     		str	r0, [r7, #4]
  31:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c ****     char *prev_heap_end;
  32:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c ****     if (heap_end == 0) {
  72              		.loc 1 32 18
  73 0008 114B     		ldr	r3, .L6
  74 000a 1B68     		ldr	r3, [r3]
  75              		.loc 1 32 8
  76 000c 002B     		cmp	r3, #0
  77 000e 02D1     		bne	.L3
  33:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c ****         heap_end = &heap_low;
  78              		.loc 1 33 18
  79 0010 0F4B     		ldr	r3, .L6
  80 0012 104A     		ldr	r2, .L6+4
  81 0014 1A60     		str	r2, [r3]
  82              	.L3:
  34:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c ****     }
  35:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c ****     prev_heap_end = heap_end;
  83              		.loc 1 35 19
  84 0016 0E4B     		ldr	r3, .L6
  85 0018 1B68     		ldr	r3, [r3]
  86 001a FB60     		str	r3, [r7, #12]
  36:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c ****     if (heap_end + incr > &heap_top) {
  87              		.loc 1 36 18
  88 001c 0C4B     		ldr	r3, .L6
  89 001e 1A68     		ldr	r2, [r3]
  90 0020 7B68     		ldr	r3, [r7, #4]
  91 0022 D218     		adds	r2, r2, r3
  92              		.loc 1 36 8
  93 0024 0C4B     		ldr	r3, .L6+8
  94 0026 9A42     		cmp	r2, r3
  95 0028 07D9     		bls	.L4
  37:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c ****         errno = ENOMEM;
  96              		.loc 1 37 9
  97 002a FFF7FEFF 		bl	__errno
  98 002e 0300     		movs	r3, r0
  99              		.loc 1 37 15
 100 0030 0C22     		movs	r2, #12
 101 0032 1A60     		str	r2, [r3]
  38:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c ****         return (char *)-1;
 102              		.loc 1 38 16
 103 0034 0123     		movs	r3, #1
 104 0036 5B42     		rsbs	r3, r3, #0
 105 0038 06E0     		b	.L5
 106              	.L4:
  39:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c ****     }
  40:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c ****     heap_end += incr;
 107              		.loc 1 40 14
 108 003a 054B     		ldr	r3, .L6
 109 003c 1A68     		ldr	r2, [r3]
 110 003e 7B68     		ldr	r3, [r7, #4]
 111 0040 D218     		adds	r2, r2, r3
 112 0042 034B     		ldr	r3, .L6
 113 0044 1A60     		str	r2, [r3]
  41:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c ****     return (char *) prev_heap_end;
 114              		.loc 1 41 12
 115 0046 FB68     		ldr	r3, [r7, #12]
 116              	.L5:
  42:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c **** }
 117              		.loc 1 42 1
 118 0048 1800     		movs	r0, r3
 119 004a BD46     		mov	sp, r7
 120 004c 04B0     		add	sp, sp, #16
 121              		@ sp needed
 122 004e 80BD     		pop	{r7, pc}
 123              	.L7:
 124              		.align	2
 125              	.L6:
 126 0050 00000000 		.word	heap_end
 127 0054 00000000 		.word	heap_low
 128 0058 00000000 		.word	heap_top
 129              		.cfi_endproc
 130              	.LFE1:
 132              		.align	1
 133              		.syntax unified
 134              		.code	16
 135              		.thumb_func
 136              		.fpu softvfp
 138              	_crt_init:
 139              	.LFB2:
  43:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c **** 
  44:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c **** static void _crt_init() {
 140              		.loc 1 44 25
 141              		.cfi_startproc
 142              		@ args = 0, pretend = 0, frame = 8
 143              		@ frame_needed = 1, uses_anonymous_args = 0
 144 005c 80B5     		push	{r7, lr}
 145              		.cfi_def_cfa_offset 8
 146              		.cfi_offset 7, -8
 147              		.cfi_offset 14, -4
 148 005e 82B0     		sub	sp, sp, #8
 149              		.cfi_def_cfa_offset 16
 150 0060 00AF     		add	r7, sp, #0
 151              		.cfi_def_cfa_register 7
  45:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c ****     extern char __bss_start__;
  46:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c ****     extern char __bss_end__;
  47:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c ****     char *s;
  48:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c ****     heap_end = 0;
 152              		.loc 1 48 14
 153 0062 104B     		ldr	r3, .L13
 154 0064 0022     		movs	r2, #0
 155 0066 1A60     		str	r2, [r3]
  49:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c ****     s = &__bss_start__;
 156              		.loc 1 49 7
 157 0068 0F4B     		ldr	r3, .L13+4
 158 006a 7B60     		str	r3, [r7, #4]
  50:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c ****     while (s < &__bss_end__) {
 159              		.loc 1 50 11
 160 006c 04E0     		b	.L9
 161              	.L10:
  51:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c ****         *s++ = 0;
 162              		.loc 1 51 11
 163 006e 7B68     		ldr	r3, [r7, #4]
 164 0070 5A1C     		adds	r2, r3, #1
 165 0072 7A60     		str	r2, [r7, #4]
 166              		.loc 1 51 14
 167 0074 0022     		movs	r2, #0
 168 0076 1A70     		strb	r2, [r3]
 169              	.L9:
  50:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c ****     while (s < &__bss_end__) {
 170              		.loc 1 50 11
 171 0078 7A68     		ldr	r2, [r7, #4]
 172 007a 0C4B     		ldr	r3, .L13+8
 173 007c 9A42     		cmp	r2, r3
 174 007e F6D3     		bcc	.L10
  52:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c ****     }
  53:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c ****     s = &heap_low;
 175              		.loc 1 53 7
 176 0080 0B4B     		ldr	r3, .L13+12
 177 0082 7B60     		str	r3, [r7, #4]
  54:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c ****     while (s < &heap_top) {
 178              		.loc 1 54 11
 179 0084 04E0     		b	.L11
 180              	.L12:
  55:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c ****         *s++ = 0;
 181              		.loc 1 55 11
 182 0086 7B68     		ldr	r3, [r7, #4]
 183 0088 5A1C     		adds	r2, r3, #1
 184 008a 7A60     		str	r2, [r7, #4]
 185              		.loc 1 55 14
 186 008c 0022     		movs	r2, #0
 187 008e 1A70     		strb	r2, [r3]
 188              	.L11:
  54:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c ****     while (s < &heap_top) {
 189              		.loc 1 54 11
 190 0090 7A68     		ldr	r2, [r7, #4]
 191 0092 084B     		ldr	r3, .L13+16
 192 0094 9A42     		cmp	r2, r3
 193 0096 F6D3     		bcc	.L12
  56:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c ****     }
  57:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c **** }
 194              		.loc 1 57 1
 195 0098 C046     		nop
 196 009a C046     		nop
 197 009c BD46     		mov	sp, r7
 198 009e 02B0     		add	sp, sp, #8
 199              		@ sp needed
 200 00a0 80BD     		pop	{r7, pc}
 201              	.L14:
 202 00a2 C046     		.align	2
 203              	.L13:
 204 00a4 00000000 		.word	heap_end
 205 00a8 00000000 		.word	__bss_start__
 206 00ac 00000000 		.word	__bss_end__
 207 00b0 00000000 		.word	heap_low
 208 00b4 00000000 		.word	heap_top
 209              		.cfi_endproc
 210              	.LFE2:
 212              		.align	1
 213              		.global	SNEK_move
 214              		.syntax unified
 215              		.code	16
 216              		.thumb_func
 217              		.fpu softvfp
 219              	SNEK_move:
 220              	.LFB3:
  58:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c **** 
  59:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c **** #ifdef SIMULATOR
  60:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c ****     #define DELAY_COUNT 100
  61:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c **** #else
  62:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c ****     #define DELAY_COUNT 100000
  63:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c **** #endif
  64:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c **** 
  65:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c **** #define MAX_SNEK_SIZE 10
  66:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c **** 
  67:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c **** typedef struct point {
  68:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c ****     uint8_t x;
  69:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c ****     uint8_t y;
  70:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c **** }POINT;
  71:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c **** 
  72:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c **** typedef struct node {
  73:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c ****     POINT pos;
  74:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c ****     struct node* next;
  75:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c **** }NODE;
  76:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c **** 
  77:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c **** typedef struct snek {
  78:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c ****     POINT velocity;
  79:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c ****     POINT head;
  80:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c ****     NODE* next;
  81:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c ****     void (*move)(struct snek*);
  82:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c ****     void (*draw)(struct snek*);
  83:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c **** }SNEK;
  84:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c **** 
  85:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c **** 
  86:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c **** void SNEK_move(SNEK* self) {
 221              		.loc 1 86 28
 222              		.cfi_startproc
 223              		@ args = 0, pretend = 0, frame = 16
 224              		@ frame_needed = 1, uses_anonymous_args = 0
 225 00b8 80B5     		push	{r7, lr}
 226              		.cfi_def_cfa_offset 8
 227              		.cfi_offset 7, -8
 228              		.cfi_offset 14, -4
 229 00ba 84B0     		sub	sp, sp, #16
 230              		.cfi_def_cfa_offset 24
 231 00bc 00AF     		add	r7, sp, #0
 232              		.cfi_def_cfa_register 7
 233 00be 7860     		str	r0, [r7, #4]
  87:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c ****     // Collision detection
  88:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c ****     // Lägg till ditt förra huvud, som första noden i listan
  89:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c ****     NODE* new_node = (NODE*) malloc(sizeof(NODE));
 234              		.loc 1 89 30
 235 00c0 0820     		movs	r0, #8
 236 00c2 FFF7FEFF 		bl	malloc
 237 00c6 0300     		movs	r3, r0
 238 00c8 BB60     		str	r3, [r7, #8]
  90:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c ****     new_node->pos = self->head;
 239              		.loc 1 90 19
 240 00ca BB68     		ldr	r3, [r7, #8]
 241 00cc 7A68     		ldr	r2, [r7, #4]
 242 00ce 0221     		movs	r1, #2
 243 00d0 525A     		ldrh	r2, [r2, r1]
 244 00d2 1A80     		strh	r2, [r3]
  91:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c ****     new_node->next = self->next;
 245              		.loc 1 91 26
 246 00d4 7B68     		ldr	r3, [r7, #4]
 247 00d6 5A68     		ldr	r2, [r3, #4]
 248              		.loc 1 91 20
 249 00d8 BB68     		ldr	r3, [r7, #8]
 250 00da 5A60     		str	r2, [r3, #4]
  92:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c ****     self->next = new_node;
 251              		.loc 1 92 16
 252 00dc 7B68     		ldr	r3, [r7, #4]
 253 00de BA68     		ldr	r2, [r7, #8]
 254 00e0 5A60     		str	r2, [r3, #4]
  93:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c ****     // Gå fram ett steg rita ditt nya huvud
  94:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c ****     self->head.x += self->velocity.x;
 255              		.loc 1 94 18
 256 00e2 7B68     		ldr	r3, [r7, #4]
 257 00e4 9A78     		ldrb	r2, [r3, #2]
 258              		.loc 1 94 35
 259 00e6 7B68     		ldr	r3, [r7, #4]
 260 00e8 1B78     		ldrb	r3, [r3]
 261              		.loc 1 94 18
 262 00ea D318     		adds	r3, r2, r3
 263 00ec DAB2     		uxtb	r2, r3
 264 00ee 7B68     		ldr	r3, [r7, #4]
 265 00f0 9A70     		strb	r2, [r3, #2]
  95:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c ****     self->head.y += self->velocity.y;
 266              		.loc 1 95 18
 267 00f2 7B68     		ldr	r3, [r7, #4]
 268 00f4 DA78     		ldrb	r2, [r3, #3]
 269              		.loc 1 95 35
 270 00f6 7B68     		ldr	r3, [r7, #4]
 271 00f8 5B78     		ldrb	r3, [r3, #1]
 272              		.loc 1 95 18
 273 00fa D318     		adds	r3, r2, r3
 274 00fc DAB2     		uxtb	r2, r3
 275 00fe 7B68     		ldr	r3, [r7, #4]
 276 0100 DA70     		strb	r2, [r3, #3]
  96:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c ****     pixel(self->head.x, self->head.y, true);
 277              		.loc 1 96 5
 278 0102 7B68     		ldr	r3, [r7, #4]
 279 0104 9878     		ldrb	r0, [r3, #2]
 280 0106 7B68     		ldr	r3, [r7, #4]
 281 0108 DB78     		ldrb	r3, [r3, #3]
 282 010a 0122     		movs	r2, #1
 283 010c 1900     		movs	r1, r3
 284 010e FFF7FEFF 		bl	pixel
  97:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c ****     // Ta bort sista elementet i listan, cleara den pixeln
  98:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c ****     NODE* iterator = self->next;
 285              		.loc 1 98 11
 286 0112 7B68     		ldr	r3, [r7, #4]
 287 0114 5B68     		ldr	r3, [r3, #4]
 288 0116 FB60     		str	r3, [r7, #12]
  99:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c ****     while (iterator->next->next != (NODE*) -1) {
 289              		.loc 1 99 11
 290 0118 02E0     		b	.L16
 291              	.L17:
 100:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c ****         iterator = iterator->next;
 292              		.loc 1 100 18
 293 011a FB68     		ldr	r3, [r7, #12]
 294 011c 5B68     		ldr	r3, [r3, #4]
 295 011e FB60     		str	r3, [r7, #12]
 296              	.L16:
  99:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c ****     while (iterator->next->next != (NODE*) -1) {
 297              		.loc 1 99 20
 298 0120 FB68     		ldr	r3, [r7, #12]
 299 0122 5B68     		ldr	r3, [r3, #4]
  99:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c ****     while (iterator->next->next != (NODE*) -1) {
 300              		.loc 1 99 26
 301 0124 5B68     		ldr	r3, [r3, #4]
  99:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c ****     while (iterator->next->next != (NODE*) -1) {
 302              		.loc 1 99 11
 303 0126 0133     		adds	r3, r3, #1
 304 0128 F7D1     		bne	.L17
 101:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c ****     }
 102:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c ****     pixel(iterator->next->pos.x, iterator->next->pos.y, false);
 305              		.loc 1 102 19
 306 012a FB68     		ldr	r3, [r7, #12]
 307 012c 5B68     		ldr	r3, [r3, #4]
 308              		.loc 1 102 5
 309 012e 1878     		ldrb	r0, [r3]
 310              		.loc 1 102 42
 311 0130 FB68     		ldr	r3, [r7, #12]
 312 0132 5B68     		ldr	r3, [r3, #4]
 313              		.loc 1 102 5
 314 0134 5B78     		ldrb	r3, [r3, #1]
 315 0136 0022     		movs	r2, #0
 316 0138 1900     		movs	r1, r3
 317 013a FFF7FEFF 		bl	pixel
 103:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c ****     free(iterator->next);
 318              		.loc 1 103 18
 319 013e FB68     		ldr	r3, [r7, #12]
 320 0140 5B68     		ldr	r3, [r3, #4]
 321              		.loc 1 103 5
 322 0142 1800     		movs	r0, r3
 323 0144 FFF7FEFF 		bl	free
 104:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c ****     iterator->next = (NODE*) -1;
 324              		.loc 1 104 20
 325 0148 FB68     		ldr	r3, [r7, #12]
 326 014a 0122     		movs	r2, #1
 327 014c 5242     		rsbs	r2, r2, #0
 328 014e 5A60     		str	r2, [r3, #4]
 105:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c ****         
 106:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c **** }
 329              		.loc 1 106 1
 330 0150 C046     		nop
 331 0152 BD46     		mov	sp, r7
 332 0154 04B0     		add	sp, sp, #16
 333              		@ sp needed
 334 0156 80BD     		pop	{r7, pc}
 335              		.cfi_endproc
 336              	.LFE3:
 338              		.align	1
 339              		.global	SNEK_draw
 340              		.syntax unified
 341              		.code	16
 342              		.thumb_func
 343              		.fpu softvfp
 345              	SNEK_draw:
 346              	.LFB4:
 107:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c **** 
 108:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c **** void SNEK_draw(SNEK* self) {
 347              		.loc 1 108 28
 348              		.cfi_startproc
 349              		@ args = 0, pretend = 0, frame = 16
 350              		@ frame_needed = 1, uses_anonymous_args = 0
 351 0158 80B5     		push	{r7, lr}
 352              		.cfi_def_cfa_offset 8
 353              		.cfi_offset 7, -8
 354              		.cfi_offset 14, -4
 355 015a 84B0     		sub	sp, sp, #16
 356              		.cfi_def_cfa_offset 24
 357 015c 00AF     		add	r7, sp, #0
 358              		.cfi_def_cfa_register 7
 359 015e 7860     		str	r0, [r7, #4]
 109:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c ****     pixel(self->head.x, self->head.y, true);
 360              		.loc 1 109 5
 361 0160 7B68     		ldr	r3, [r7, #4]
 362 0162 9878     		ldrb	r0, [r3, #2]
 363 0164 7B68     		ldr	r3, [r7, #4]
 364 0166 DB78     		ldrb	r3, [r3, #3]
 365 0168 0122     		movs	r2, #1
 366 016a 1900     		movs	r1, r3
 367 016c FFF7FEFF 		bl	pixel
 368              	.LBB2:
 110:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c ****     for (NODE* iter = self->next; iter->next != (NODE*) -1; iter = iter->next) {
 369              		.loc 1 110 16
 370 0170 7B68     		ldr	r3, [r7, #4]
 371 0172 5B68     		ldr	r3, [r3, #4]
 372 0174 FB60     		str	r3, [r7, #12]
 373              		.loc 1 110 5
 374 0176 0AE0     		b	.L19
 375              	.L20:
 111:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c ****         pixel(iter->pos.x, iter->pos.y, true); 
 376              		.loc 1 111 9 discriminator 3
 377 0178 FB68     		ldr	r3, [r7, #12]
 378 017a 1878     		ldrb	r0, [r3]
 379 017c FB68     		ldr	r3, [r7, #12]
 380 017e 5B78     		ldrb	r3, [r3, #1]
 381 0180 0122     		movs	r2, #1
 382 0182 1900     		movs	r1, r3
 383 0184 FFF7FEFF 		bl	pixel
 110:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c ****     for (NODE* iter = self->next; iter->next != (NODE*) -1; iter = iter->next) {
 384              		.loc 1 110 66 discriminator 3
 385 0188 FB68     		ldr	r3, [r7, #12]
 386 018a 5B68     		ldr	r3, [r3, #4]
 387 018c FB60     		str	r3, [r7, #12]
 388              	.L19:
 110:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c ****     for (NODE* iter = self->next; iter->next != (NODE*) -1; iter = iter->next) {
 389              		.loc 1 110 39 discriminator 1
 390 018e FB68     		ldr	r3, [r7, #12]
 391 0190 5B68     		ldr	r3, [r3, #4]
 110:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c ****     for (NODE* iter = self->next; iter->next != (NODE*) -1; iter = iter->next) {
 392              		.loc 1 110 5 discriminator 1
 393 0192 0133     		adds	r3, r3, #1
 394 0194 F0D1     		bne	.L20
 395              	.LBE2:
 112:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c ****     }
 113:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c **** }
 396              		.loc 1 113 1
 397 0196 C046     		nop
 398 0198 C046     		nop
 399 019a BD46     		mov	sp, r7
 400 019c 04B0     		add	sp, sp, #16
 401              		@ sp needed
 402 019e 80BD     		pop	{r7, pc}
 403              		.cfi_endproc
 404              	.LFE4:
 406              		.comm	player,4,4
 407              		.section	.rodata
 408              		.align	2
 409              	.LC0:
 410 0000 40       		.byte	64
 411 0001 20       		.byte	32
 412 0002 0000     		.align	2
 413              	.LC1:
 414 0004 40       		.byte	64
 415 0005 1F       		.byte	31
 416              		.text
 417              		.align	1
 418              		.global	snek_init
 419              		.syntax unified
 420              		.code	16
 421              		.thumb_func
 422              		.fpu softvfp
 424              	snek_init:
 425              	.LFB5:
 114:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c **** 
 115:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c **** extern volatile bool systick_flag;
 116:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c **** 
 117:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c **** SNEK* player;
 118:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c **** 
 119:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c **** void snek_init(void) {
 426              		.loc 1 119 22
 427              		.cfi_startproc
 428              		@ args = 0, pretend = 0, frame = 16
 429              		@ frame_needed = 1, uses_anonymous_args = 0
 430 01a0 90B5     		push	{r4, r7, lr}
 431              		.cfi_def_cfa_offset 12
 432              		.cfi_offset 4, -12
 433              		.cfi_offset 7, -8
 434              		.cfi_offset 14, -4
 435 01a2 85B0     		sub	sp, sp, #20
 436              		.cfi_def_cfa_offset 32
 437 01a4 00AF     		add	r7, sp, #0
 438              		.cfi_def_cfa_register 7
 120:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c ****     player->head = (POINT) {64,32};
 439              		.loc 1 120 11
 440 01a6 154B     		ldr	r3, .L22
 441 01a8 1B68     		ldr	r3, [r3]
 442              		.loc 1 120 18
 443 01aa 0221     		movs	r1, #2
 444 01ac 144A     		ldr	r2, .L22+4
 445 01ae 1288     		ldrh	r2, [r2]
 446 01b0 5A52     		strh	r2, [r3, r1]
 121:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c ****     player->next = malloc(sizeof (NODE));
 447              		.loc 1 121 11
 448 01b2 124B     		ldr	r3, .L22
 449 01b4 1C68     		ldr	r4, [r3]
 450              		.loc 1 121 20
 451 01b6 0820     		movs	r0, #8
 452 01b8 FFF7FEFF 		bl	malloc
 453 01bc 0300     		movs	r3, r0
 454              		.loc 1 121 18
 455 01be 6360     		str	r3, [r4, #4]
 122:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c ****     player->next->pos = (POINT) {64,31};
 456              		.loc 1 122 11
 457 01c0 0E4B     		ldr	r3, .L22
 458 01c2 1B68     		ldr	r3, [r3]
 459 01c4 5B68     		ldr	r3, [r3, #4]
 460              		.loc 1 122 23
 461 01c6 0F4A     		ldr	r2, .L22+8
 462 01c8 1288     		ldrh	r2, [r2]
 463 01ca 1A80     		strh	r2, [r3]
 123:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c ****     player->next->next = (NODE*) -1;
 464              		.loc 1 123 11
 465 01cc 0B4B     		ldr	r3, .L22
 466 01ce 1B68     		ldr	r3, [r3]
 467 01d0 5B68     		ldr	r3, [r3, #4]
 468              		.loc 1 123 24
 469 01d2 0122     		movs	r2, #1
 470 01d4 5242     		rsbs	r2, r2, #0
 471 01d6 5A60     		str	r2, [r3, #4]
 124:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c ****     player->draw = SNEK_draw;
 472              		.loc 1 124 11
 473 01d8 084B     		ldr	r3, .L22
 474 01da 1B68     		ldr	r3, [r3]
 475              		.loc 1 124 18
 476 01dc 0A4A     		ldr	r2, .L22+12
 477 01de DA60     		str	r2, [r3, #12]
 125:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c ****     player->move = SNEK_move;
 478              		.loc 1 125 11
 479 01e0 064B     		ldr	r3, .L22
 480 01e2 1B68     		ldr	r3, [r3]
 481              		.loc 1 125 18
 482 01e4 094A     		ldr	r2, .L22+16
 483 01e6 9A60     		str	r2, [r3, #8]
 126:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c ****     player->velocity = (POINT) {1,0};
 484              		.loc 1 126 11
 485 01e8 044B     		ldr	r3, .L22
 486 01ea 1B68     		ldr	r3, [r3]
 487              		.loc 1 126 22
 488 01ec 0122     		movs	r2, #1
 489 01ee 1A70     		strb	r2, [r3]
 490 01f0 0022     		movs	r2, #0
 491 01f2 5A70     		strb	r2, [r3, #1]
 127:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c **** }
 492              		.loc 1 127 1
 493 01f4 C046     		nop
 494 01f6 BD46     		mov	sp, r7
 495 01f8 05B0     		add	sp, sp, #20
 496              		@ sp needed
 497 01fa 90BD     		pop	{r4, r7, pc}
 498              	.L23:
 499              		.align	2
 500              	.L22:
 501 01fc 00000000 		.word	player
 502 0200 00000000 		.word	.LC0
 503 0204 04000000 		.word	.LC1
 504 0208 00000000 		.word	SNEK_draw
 505 020c 00000000 		.word	SNEK_move
 506              		.cfi_endproc
 507              	.LFE5:
 509              		.align	1
 510              		.global	app_init
 511              		.syntax unified
 512              		.code	16
 513              		.thumb_func
 514              		.fpu softvfp
 516              	app_init:
 517              	.LFB6:
 128:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c **** 
 129:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c **** void app_init(void) {
 518              		.loc 1 129 21
 519              		.cfi_startproc
 520              		@ args = 0, pretend = 0, frame = 0
 521              		@ frame_needed = 1, uses_anonymous_args = 0
 522 0210 80B5     		push	{r7, lr}
 523              		.cfi_def_cfa_offset 8
 524              		.cfi_offset 7, -8
 525              		.cfi_offset 14, -4
 526 0212 00AF     		add	r7, sp, #0
 527              		.cfi_def_cfa_register 7
 130:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c ****     GPIO_output(GPIO_D);
 528              		.loc 1 130 5
 529 0214 074B     		ldr	r3, .L25
 530 0216 1800     		movs	r0, r3
 531 0218 FFF7FEFF 		bl	GPIO_output
 131:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c ****     nb_init_delay();
 532              		.loc 1 131 5
 533 021c FFF7FEFF 		bl	nb_init_delay
 132:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c ****     snek_init();
 534              		.loc 1 132 5
 535 0220 FFF7FEFF 		bl	snek_init
 133:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c ****     graphic_init();
 536              		.loc 1 133 5
 537 0224 FFF7FEFF 		bl	graphic_init
 134:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c ****     graphic_clear_screen();
 538              		.loc 1 134 5
 539 0228 FFF7FEFF 		bl	graphic_clear_screen
 135:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c **** }
 540              		.loc 1 135 1
 541 022c C046     		nop
 542 022e BD46     		mov	sp, r7
 543              		@ sp needed
 544 0230 80BD     		pop	{r7, pc}
 545              	.L26:
 546 0232 C046     		.align	2
 547              	.L25:
 548 0234 000C0240 		.word	1073875968
 549              		.cfi_endproc
 550              	.LFE6:
 552              		.align	1
 553              		.global	main
 554              		.syntax unified
 555              		.code	16
 556              		.thumb_func
 557              		.fpu softvfp
 559              	main:
 560              	.LFB7:
 136:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c **** 
 137:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c **** int main(void)
 138:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c **** {
 561              		.loc 1 138 1
 562              		.cfi_startproc
 563              		@ args = 0, pretend = 0, frame = 16
 564              		@ frame_needed = 1, uses_anonymous_args = 0
 565 0238 80B5     		push	{r7, lr}
 566              		.cfi_def_cfa_offset 8
 567              		.cfi_offset 7, -8
 568              		.cfi_offset 14, -4
 569 023a 84B0     		sub	sp, sp, #16
 570              		.cfi_def_cfa_offset 24
 571 023c 00AF     		add	r7, sp, #0
 572              		.cfi_def_cfa_register 7
 139:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c ****     char *dbuf1, *dbuf2, *dbuf3;
 140:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c ****     dbuf1 = malloc(100);
 573              		.loc 1 140 13
 574 023e 6420     		movs	r0, #100
 575 0240 FFF7FEFF 		bl	malloc
 576 0244 0300     		movs	r3, r0
 577 0246 FB60     		str	r3, [r7, #12]
 141:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c ****     dbuf2 = malloc(150);
 578              		.loc 1 141 13
 579 0248 9620     		movs	r0, #150
 580 024a FFF7FEFF 		bl	malloc
 581 024e 0300     		movs	r3, r0
 582 0250 BB60     		str	r3, [r7, #8]
 142:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c ****     dbuf3 = malloc(15);
 583              		.loc 1 142 13
 584 0252 0F20     		movs	r0, #15
 585 0254 FFF7FEFF 		bl	malloc
 586 0258 0300     		movs	r3, r0
 587 025a 7B60     		str	r3, [r7, #4]
 143:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c ****     free(dbuf2);
 588              		.loc 1 143 5
 589 025c BB68     		ldr	r3, [r7, #8]
 590 025e 1800     		movs	r0, r3
 591 0260 FFF7FEFF 		bl	free
 144:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c ****     dbuf2 = malloc(50);
 592              		.loc 1 144 13
 593 0264 3220     		movs	r0, #50
 594 0266 FFF7FEFF 		bl	malloc
 595 026a 0300     		movs	r3, r0
 596 026c BB60     		str	r3, [r7, #8]
 145:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c ****     free(dbuf1);
 597              		.loc 1 145 5
 598 026e FB68     		ldr	r3, [r7, #12]
 599 0270 1800     		movs	r0, r3
 600 0272 FFF7FEFF 		bl	free
 146:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c ****     free(dbuf2);
 601              		.loc 1 146 5
 602 0276 BB68     		ldr	r3, [r7, #8]
 603 0278 1800     		movs	r0, r3
 604 027a FFF7FEFF 		bl	free
 147:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c ****     free(dbuf3);
 605              		.loc 1 147 5
 606 027e 7B68     		ldr	r3, [r7, #4]
 607 0280 1800     		movs	r0, r3
 608 0282 FFF7FEFF 		bl	free
 609              	.L31:
 148:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c ****     
 149:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c ****     
 150:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c ****     while (true) {
 151:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c ****         // Grejer som ska göras varje gametick
 152:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c ****         
 153:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c ****         
 154:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c ****         nb_delay(DELAY_COUNT); // Calla inte delay efter det här
 610              		.loc 1 154 9
 611 0286 6420     		movs	r0, #100
 612 0288 FFF7FEFF 		bl	nb_delay
 613              	.L30:
 155:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c ****         while (true) {
 156:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c ****             // Grejer som kan göras medans delay är igång (INTE GREJER SOM KRÄVER DELAY)
 157:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c ****             if (systick_flag) {
 614              		.loc 1 157 17
 615 028c 034B     		ldr	r3, .L34
 616 028e 1B78     		ldrb	r3, [r3]
 617 0290 DBB2     		uxtb	r3, r3
 618              		.loc 1 157 16
 619 0292 002B     		cmp	r3, #0
 620 0294 00D1     		bne	.L33
 621 0296 F9E7     		b	.L30
 622              	.L33:
 158:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c ****                 break;
 623              		.loc 1 158 17
 624 0298 C046     		nop
 154:/home/love/Documents/skola/EDA482/labb5/labb5/snake/startup.c ****         while (true) {
 625              		.loc 1 154 9
 626 029a F4E7     		b	.L31
 627              	.L35:
 628              		.align	2
 629              	.L34:
 630 029c 00000000 		.word	systick_flag
 631              		.cfi_endproc
 632              	.LFE7:
 634              	.Letext0:
 635              		.file 2 "/usr/arm-none-eabi/include/machine/_default_types.h"
 636              		.file 3 "/usr/arm-none-eabi/include/sys/_stdint.h"
 637              		.file 4 "/home/love/Documents/skola/EDA482/libs/include/libGPIO.h"
 638              		.file 5 "/usr/arm-none-eabi/include/sys/lock.h"
 639              		.file 6 "/usr/arm-none-eabi/include/sys/_types.h"
 640              		.file 7 "/usr/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h"
 641              		.file 8 "/usr/arm-none-eabi/include/sys/reent.h"
 642              		.file 9 "/usr/arm-none-eabi/include/sys/errno.h"
 643              		.file 10 "/usr/arm-none-eabi/include/stdlib.h"
