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
  25              		.file 1 "Z:/EDA482_snake/labb5/snake/startup.c"
   1:Z:/EDA482_snake/labb5/snake\startup.c **** /*
   2:Z:/EDA482_snake/labb5/snake\startup.c ****  * 	startup.c
   3:Z:/EDA482_snake/labb5/snake\startup.c ****  *  
   4:Z:/EDA482_snake/labb5/snake\startup.c ****  */
   5:Z:/EDA482_snake/labb5/snake\startup.c **** #include <libGPIO.h>
   6:Z:/EDA482_snake/labb5/snake\startup.c **** #include <stdint.h>
   7:Z:/EDA482_snake/labb5/snake\startup.c **** #include <stdbool.h>
   8:Z:/EDA482_snake/labb5/snake\startup.c **** #include <libdelay.h>
   9:Z:/EDA482_snake/labb5/snake\startup.c **** #include "nb_delay.h"
  10:Z:/EDA482_snake/labb5/snake\startup.c **** #include "Graphics.h"
  11:Z:/EDA482_snake/labb5/snake\startup.c **** #include "keypad.h"
  12:Z:/EDA482_snake/labb5/snake\startup.c **** #include "Ascii.h"
  13:Z:/EDA482_snake/labb5/snake\startup.c **** #include "PellesSuperRng.h"
  14:Z:/EDA482_snake/labb5/snake\startup.c **** 
  15:Z:/EDA482_snake/labb5/snake\startup.c **** void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
  16:Z:/EDA482_snake/labb5/snake\startup.c **** 
  17:Z:/EDA482_snake/labb5/snake\startup.c **** void startup ( void )
  18:Z:/EDA482_snake/labb5/snake\startup.c **** {
  26              		.loc 1 18 0
  27              		.cfi_startproc
  28              		@ Naked Function: prologue and epilogue provided by programmer.
  29              		@ args = 0, pretend = 0, frame = 0
  30              		@ frame_needed = 1, uses_anonymous_args = 0
  19:Z:/EDA482_snake/labb5/snake\startup.c **** asm volatile(
  31              		.loc 1 19 0
  32              		.syntax divided
  33              	@ 19 "Z:/EDA482_snake/labb5/snake/startup.c" 1
  34 0000 0248     		 LDR R0,=0x2001C000
  35 0002 8546     	 MOV SP,R0
  36 0004 FFF7FEFF 	 BL main
  37 0008 FEE7     	_exit: B .
  38              	
  39              	@ 0 "" 2
  20:Z:/EDA482_snake/labb5/snake\startup.c **** 	" LDR R0,=0x2001C000\n"		/* set stack */
  21:Z:/EDA482_snake/labb5/snake\startup.c **** 	" MOV SP,R0\n"
  22:Z:/EDA482_snake/labb5/snake\startup.c **** 	" BL main\n"				/* call main */
  23:Z:/EDA482_snake/labb5/snake\startup.c **** 	"_exit: B .\n"				/* never return */
  24:Z:/EDA482_snake/labb5/snake\startup.c **** 	) ;
  25:Z:/EDA482_snake/labb5/snake\startup.c **** }
  40              		.loc 1 25 0
  41              		.thumb
  42              		.syntax unified
  43 000a C046     		nop
  44              		.cfi_endproc
  45              	.LFE0:
  47              		.text
  48              		.align	1
  49              		.global	buffer_push
  50              		.syntax unified
  51              		.code	16
  52              		.thumb_func
  53              		.fpu softvfp
  55              	buffer_push:
  56              	.LFB1:
  26:Z:/EDA482_snake/labb5/snake\startup.c **** 
  27:Z:/EDA482_snake/labb5/snake\startup.c **** #ifdef SIMULATOR
  28:Z:/EDA482_snake/labb5/snake\startup.c ****     #define DELAY_COUNT 100
  29:Z:/EDA482_snake/labb5/snake\startup.c **** #else
  30:Z:/EDA482_snake/labb5/snake\startup.c ****     #define DELAY_COUNT 100000
  31:Z:/EDA482_snake/labb5/snake\startup.c **** #endif
  32:Z:/EDA482_snake/labb5/snake\startup.c **** 
  33:Z:/EDA482_snake/labb5/snake\startup.c **** #define MAX_SNEK_SIZE 10
  34:Z:/EDA482_snake/labb5/snake\startup.c **** 
  35:Z:/EDA482_snake/labb5/snake\startup.c **** typedef struct point {
  36:Z:/EDA482_snake/labb5/snake\startup.c ****     uint8_t x;
  37:Z:/EDA482_snake/labb5/snake\startup.c ****     uint8_t y;
  38:Z:/EDA482_snake/labb5/snake\startup.c **** }POINT;
  39:Z:/EDA482_snake/labb5/snake\startup.c **** 
  40:Z:/EDA482_snake/labb5/snake\startup.c **** typedef struct vector {
  41:Z:/EDA482_snake/labb5/snake\startup.c **** 	int8_t x;
  42:Z:/EDA482_snake/labb5/snake\startup.c **** 	int8_t y;
  43:Z:/EDA482_snake/labb5/snake\startup.c **** }VECTOR;
  44:Z:/EDA482_snake/labb5/snake\startup.c **** 
  45:Z:/EDA482_snake/labb5/snake\startup.c **** typedef struct {
  46:Z:/EDA482_snake/labb5/snake\startup.c ****     POINT* buffer;
  47:Z:/EDA482_snake/labb5/snake\startup.c ****     int top;
  48:Z:/EDA482_snake/labb5/snake\startup.c ****     int bottom;
  49:Z:/EDA482_snake/labb5/snake\startup.c **** 	int maxlen;
  50:Z:/EDA482_snake/labb5/snake\startup.c **** } circular_buffer;
  51:Z:/EDA482_snake/labb5/snake\startup.c **** 
  52:Z:/EDA482_snake/labb5/snake\startup.c **** typedef struct snek {
  53:Z:/EDA482_snake/labb5/snake\startup.c ****     VECTOR velocity;
  54:Z:/EDA482_snake/labb5/snake\startup.c ****     POINT head;
  55:Z:/EDA482_snake/labb5/snake\startup.c **** 	circular_buffer* tail;
  56:Z:/EDA482_snake/labb5/snake\startup.c ****     void (*move)(struct snek*);
  57:Z:/EDA482_snake/labb5/snake\startup.c ****     void (*draw)(struct snek*);
  58:Z:/EDA482_snake/labb5/snake\startup.c **** 	void (*turn_left)(struct snek*);
  59:Z:/EDA482_snake/labb5/snake\startup.c **** 	void (*turn_right)(struct snek*);
  60:Z:/EDA482_snake/labb5/snake\startup.c **** }SNEK;
  61:Z:/EDA482_snake/labb5/snake\startup.c **** 
  62:Z:/EDA482_snake/labb5/snake\startup.c **** 
  63:Z:/EDA482_snake/labb5/snake\startup.c **** // Circular buffer stuff
  64:Z:/EDA482_snake/labb5/snake\startup.c **** int buffer_push(circular_buffer* c, POINT data) {
  57              		.loc 1 64 0
  58              		.cfi_startproc
  59              		@ args = 0, pretend = 0, frame = 16
  60              		@ frame_needed = 1, uses_anonymous_args = 0
  61 0000 80B5     		push	{r7, lr}
  62              		.cfi_def_cfa_offset 8
  63              		.cfi_offset 7, -8
  64              		.cfi_offset 14, -4
  65 0002 84B0     		sub	sp, sp, #16
  66              		.cfi_def_cfa_offset 24
  67 0004 00AF     		add	r7, sp, #0
  68              		.cfi_def_cfa_register 7
  69 0006 7860     		str	r0, [r7, #4]
  70 0008 3B00     		movs	r3, r7
  71 000a 1980     		strh	r1, [r3]
  65:Z:/EDA482_snake/labb5/snake\startup.c ****     int next;
  66:Z:/EDA482_snake/labb5/snake\startup.c **** 
  67:Z:/EDA482_snake/labb5/snake\startup.c ****     next = c->top + 1;  // next is where top will point to after this write.
  72              		.loc 1 67 0
  73 000c 7B68     		ldr	r3, [r7, #4]
  74 000e 5B68     		ldr	r3, [r3, #4]
  75 0010 0133     		adds	r3, r3, #1
  76 0012 FB60     		str	r3, [r7, #12]
  68:Z:/EDA482_snake/labb5/snake\startup.c ****     if (next >= c->maxlen) { // If next is too large, loop back to the beginning
  77              		.loc 1 68 0
  78 0014 7B68     		ldr	r3, [r7, #4]
  79 0016 DB68     		ldr	r3, [r3, #12]
  80 0018 FA68     		ldr	r2, [r7, #12]
  81 001a 9A42     		cmp	r2, r3
  82 001c 01DB     		blt	.L3
  69:Z:/EDA482_snake/labb5/snake\startup.c **** 		next = 0;
  83              		.loc 1 69 0
  84 001e 0023     		movs	r3, #0
  85 0020 FB60     		str	r3, [r7, #12]
  86              	.L3:
  70:Z:/EDA482_snake/labb5/snake\startup.c **** 	}
  71:Z:/EDA482_snake/labb5/snake\startup.c **** 
  72:Z:/EDA482_snake/labb5/snake\startup.c ****     if (next == c->bottom){  // if the top + 1 == bottom, circular buffer is full
  87              		.loc 1 72 0
  88 0022 7B68     		ldr	r3, [r7, #4]
  89 0024 9B68     		ldr	r3, [r3, #8]
  90 0026 FA68     		ldr	r2, [r7, #12]
  91 0028 9A42     		cmp	r2, r3
  92 002a 02D1     		bne	.L4
  73:Z:/EDA482_snake/labb5/snake\startup.c ****         return -1;
  93              		.loc 1 73 0
  94 002c 0123     		movs	r3, #1
  95 002e 5B42     		rsbs	r3, r3, #0
  96 0030 15E0     		b	.L5
  97              	.L4:
  74:Z:/EDA482_snake/labb5/snake\startup.c **** 	}
  75:Z:/EDA482_snake/labb5/snake\startup.c **** 
  76:Z:/EDA482_snake/labb5/snake\startup.c ****     c->buffer[c->top].x = data.x;  // Load data and then move
  98              		.loc 1 76 0
  99 0032 7B68     		ldr	r3, [r7, #4]
 100 0034 1A68     		ldr	r2, [r3]
 101 0036 7B68     		ldr	r3, [r7, #4]
 102 0038 5B68     		ldr	r3, [r3, #4]
 103 003a 5B00     		lsls	r3, r3, #1
 104 003c D318     		adds	r3, r2, r3
 105 003e 3A00     		movs	r2, r7
 106 0040 1278     		ldrb	r2, [r2]
 107 0042 1A70     		strb	r2, [r3]
  77:Z:/EDA482_snake/labb5/snake\startup.c **** 	c->buffer[c->top].y = data.y;  // Load data and then move
 108              		.loc 1 77 0
 109 0044 7B68     		ldr	r3, [r7, #4]
 110 0046 1A68     		ldr	r2, [r3]
 111 0048 7B68     		ldr	r3, [r7, #4]
 112 004a 5B68     		ldr	r3, [r3, #4]
 113 004c 5B00     		lsls	r3, r3, #1
 114 004e D318     		adds	r3, r2, r3
 115 0050 3A00     		movs	r2, r7
 116 0052 5278     		ldrb	r2, [r2, #1]
 117 0054 5A70     		strb	r2, [r3, #1]
  78:Z:/EDA482_snake/labb5/snake\startup.c ****     c->top = next;             // top to next data offset.
 118              		.loc 1 78 0
 119 0056 7B68     		ldr	r3, [r7, #4]
 120 0058 FA68     		ldr	r2, [r7, #12]
 121 005a 5A60     		str	r2, [r3, #4]
  79:Z:/EDA482_snake/labb5/snake\startup.c ****     return 0;  // return success to indicate successful push.
 122              		.loc 1 79 0
 123 005c 0023     		movs	r3, #0
 124              	.L5:
  80:Z:/EDA482_snake/labb5/snake\startup.c **** }
 125              		.loc 1 80 0
 126 005e 1800     		movs	r0, r3
 127 0060 BD46     		mov	sp, r7
 128 0062 04B0     		add	sp, sp, #16
 129              		@ sp needed
 130 0064 80BD     		pop	{r7, pc}
 131              		.cfi_endproc
 132              	.LFE1:
 134              		.align	1
 135              		.global	buffer_pop
 136              		.syntax unified
 137              		.code	16
 138              		.thumb_func
 139              		.fpu softvfp
 141              	buffer_pop:
 142              	.LFB2:
  81:Z:/EDA482_snake/labb5/snake\startup.c **** 
  82:Z:/EDA482_snake/labb5/snake\startup.c **** int buffer_pop(circular_buffer *c, POINT* data) {
 143              		.loc 1 82 0
 144              		.cfi_startproc
 145              		@ args = 0, pretend = 0, frame = 16
 146              		@ frame_needed = 1, uses_anonymous_args = 0
 147 0066 80B5     		push	{r7, lr}
 148              		.cfi_def_cfa_offset 8
 149              		.cfi_offset 7, -8
 150              		.cfi_offset 14, -4
 151 0068 84B0     		sub	sp, sp, #16
 152              		.cfi_def_cfa_offset 24
 153 006a 00AF     		add	r7, sp, #0
 154              		.cfi_def_cfa_register 7
 155 006c 7860     		str	r0, [r7, #4]
 156 006e 3960     		str	r1, [r7]
  83:Z:/EDA482_snake/labb5/snake\startup.c ****     int next;
  84:Z:/EDA482_snake/labb5/snake\startup.c **** 
  85:Z:/EDA482_snake/labb5/snake\startup.c ****     if (c->top == c->bottom){  // if the top == bottom, we don't have any data
 157              		.loc 1 85 0
 158 0070 7B68     		ldr	r3, [r7, #4]
 159 0072 5A68     		ldr	r2, [r3, #4]
 160 0074 7B68     		ldr	r3, [r7, #4]
 161 0076 9B68     		ldr	r3, [r3, #8]
 162 0078 9A42     		cmp	r2, r3
 163 007a 02D1     		bne	.L7
  86:Z:/EDA482_snake/labb5/snake\startup.c ****         return -1;
 164              		.loc 1 86 0
 165 007c 0123     		movs	r3, #1
 166 007e 5B42     		rsbs	r3, r3, #0
 167 0080 20E0     		b	.L8
 168              	.L7:
  87:Z:/EDA482_snake/labb5/snake\startup.c **** 	}
  88:Z:/EDA482_snake/labb5/snake\startup.c **** 
  89:Z:/EDA482_snake/labb5/snake\startup.c ****     next = c->top - 1;  // next is where bottom will point to after this read.
 169              		.loc 1 89 0
 170 0082 7B68     		ldr	r3, [r7, #4]
 171 0084 5B68     		ldr	r3, [r3, #4]
 172 0086 013B     		subs	r3, r3, #1
 173 0088 FB60     		str	r3, [r7, #12]
  90:Z:/EDA482_snake/labb5/snake\startup.c ****     if(next < 0) {
 174              		.loc 1 90 0
 175 008a FB68     		ldr	r3, [r7, #12]
 176 008c 002B     		cmp	r3, #0
 177 008e 03DA     		bge	.L9
  91:Z:/EDA482_snake/labb5/snake\startup.c **** 		next = c->maxlen - 1;
 178              		.loc 1 91 0
 179 0090 7B68     		ldr	r3, [r7, #4]
 180 0092 DB68     		ldr	r3, [r3, #12]
 181 0094 013B     		subs	r3, r3, #1
 182 0096 FB60     		str	r3, [r7, #12]
 183              	.L9:
  92:Z:/EDA482_snake/labb5/snake\startup.c **** 	}
  93:Z:/EDA482_snake/labb5/snake\startup.c **** 	c->top = next; // move
 184              		.loc 1 93 0
 185 0098 7B68     		ldr	r3, [r7, #4]
 186 009a FA68     		ldr	r2, [r7, #12]
 187 009c 5A60     		str	r2, [r3, #4]
  94:Z:/EDA482_snake/labb5/snake\startup.c ****     data->x=c->buffer[c->top].x;  // Read data
 188              		.loc 1 94 0
 189 009e 7B68     		ldr	r3, [r7, #4]
 190 00a0 1A68     		ldr	r2, [r3]
 191 00a2 7B68     		ldr	r3, [r7, #4]
 192 00a4 5B68     		ldr	r3, [r3, #4]
 193 00a6 5B00     		lsls	r3, r3, #1
 194 00a8 D318     		adds	r3, r2, r3
 195 00aa 1A78     		ldrb	r2, [r3]
 196 00ac 3B68     		ldr	r3, [r7]
 197 00ae 1A70     		strb	r2, [r3]
  95:Z:/EDA482_snake/labb5/snake\startup.c **** 	data->y=c->buffer[c->top].y; 
 198              		.loc 1 95 0
 199 00b0 7B68     		ldr	r3, [r7, #4]
 200 00b2 1A68     		ldr	r2, [r3]
 201 00b4 7B68     		ldr	r3, [r7, #4]
 202 00b6 5B68     		ldr	r3, [r3, #4]
 203 00b8 5B00     		lsls	r3, r3, #1
 204 00ba D318     		adds	r3, r2, r3
 205 00bc 5A78     		ldrb	r2, [r3, #1]
 206 00be 3B68     		ldr	r3, [r7]
 207 00c0 5A70     		strb	r2, [r3, #1]
  96:Z:/EDA482_snake/labb5/snake\startup.c ****     return 0;  // return success to indicate successful push.
 208              		.loc 1 96 0
 209 00c2 0023     		movs	r3, #0
 210              	.L8:
  97:Z:/EDA482_snake/labb5/snake\startup.c **** }
 211              		.loc 1 97 0
 212 00c4 1800     		movs	r0, r3
 213 00c6 BD46     		mov	sp, r7
 214 00c8 04B0     		add	sp, sp, #16
 215              		@ sp needed
 216 00ca 80BD     		pop	{r7, pc}
 217              		.cfi_endproc
 218              	.LFE2:
 220              		.align	1
 221              		.global	buffer_unshift
 222              		.syntax unified
 223              		.code	16
 224              		.thumb_func
 225              		.fpu softvfp
 227              	buffer_unshift:
 228              	.LFB3:
  98:Z:/EDA482_snake/labb5/snake\startup.c **** 
  99:Z:/EDA482_snake/labb5/snake\startup.c **** int buffer_unshift(circular_buffer* c, POINT data) {
 229              		.loc 1 99 0
 230              		.cfi_startproc
 231              		@ args = 0, pretend = 0, frame = 16
 232              		@ frame_needed = 1, uses_anonymous_args = 0
 233 00cc 80B5     		push	{r7, lr}
 234              		.cfi_def_cfa_offset 8
 235              		.cfi_offset 7, -8
 236              		.cfi_offset 14, -4
 237 00ce 84B0     		sub	sp, sp, #16
 238              		.cfi_def_cfa_offset 24
 239 00d0 00AF     		add	r7, sp, #0
 240              		.cfi_def_cfa_register 7
 241 00d2 7860     		str	r0, [r7, #4]
 242 00d4 3B00     		movs	r3, r7
 243 00d6 1980     		strh	r1, [r3]
 100:Z:/EDA482_snake/labb5/snake\startup.c **** 	int next;
 101:Z:/EDA482_snake/labb5/snake\startup.c **** 
 102:Z:/EDA482_snake/labb5/snake\startup.c ****     next = c->bottom - 1;  // next is where bottom will point to after this write.
 244              		.loc 1 102 0
 245 00d8 7B68     		ldr	r3, [r7, #4]
 246 00da 9B68     		ldr	r3, [r3, #8]
 247 00dc 013B     		subs	r3, r3, #1
 248 00de FB60     		str	r3, [r7, #12]
 103:Z:/EDA482_snake/labb5/snake\startup.c ****     if (next < 0){
 249              		.loc 1 103 0
 250 00e0 FB68     		ldr	r3, [r7, #12]
 251 00e2 002B     		cmp	r3, #0
 252 00e4 03DA     		bge	.L11
 104:Z:/EDA482_snake/labb5/snake\startup.c ****         next = c->maxlen-1;
 253              		.loc 1 104 0
 254 00e6 7B68     		ldr	r3, [r7, #4]
 255 00e8 DB68     		ldr	r3, [r3, #12]
 256 00ea 013B     		subs	r3, r3, #1
 257 00ec FB60     		str	r3, [r7, #12]
 258              	.L11:
 105:Z:/EDA482_snake/labb5/snake\startup.c **** 	}
 106:Z:/EDA482_snake/labb5/snake\startup.c **** 
 107:Z:/EDA482_snake/labb5/snake\startup.c ****     if (next == c->top) { // if the bottom - 1 == top, circular buffer is full
 259              		.loc 1 107 0
 260 00ee 7B68     		ldr	r3, [r7, #4]
 261 00f0 5B68     		ldr	r3, [r3, #4]
 262 00f2 FA68     		ldr	r2, [r7, #12]
 263 00f4 9A42     		cmp	r2, r3
 264 00f6 02D1     		bne	.L12
 108:Z:/EDA482_snake/labb5/snake\startup.c ****         return -1;
 265              		.loc 1 108 0
 266 00f8 0123     		movs	r3, #1
 267 00fa 5B42     		rsbs	r3, r3, #0
 268 00fc 15E0     		b	.L13
 269              	.L12:
 109:Z:/EDA482_snake/labb5/snake\startup.c **** 	}
 110:Z:/EDA482_snake/labb5/snake\startup.c **** 
 111:Z:/EDA482_snake/labb5/snake\startup.c ****     c->buffer[c->bottom].x = data.x;  // Load data and then move
 270              		.loc 1 111 0
 271 00fe 7B68     		ldr	r3, [r7, #4]
 272 0100 1A68     		ldr	r2, [r3]
 273 0102 7B68     		ldr	r3, [r7, #4]
 274 0104 9B68     		ldr	r3, [r3, #8]
 275 0106 5B00     		lsls	r3, r3, #1
 276 0108 D318     		adds	r3, r2, r3
 277 010a 3A00     		movs	r2, r7
 278 010c 1278     		ldrb	r2, [r2]
 279 010e 1A70     		strb	r2, [r3]
 112:Z:/EDA482_snake/labb5/snake\startup.c ****     c->buffer[c->bottom].y = data.y;
 280              		.loc 1 112 0
 281 0110 7B68     		ldr	r3, [r7, #4]
 282 0112 1A68     		ldr	r2, [r3]
 283 0114 7B68     		ldr	r3, [r7, #4]
 284 0116 9B68     		ldr	r3, [r3, #8]
 285 0118 5B00     		lsls	r3, r3, #1
 286 011a D318     		adds	r3, r2, r3
 287 011c 3A00     		movs	r2, r7
 288 011e 5278     		ldrb	r2, [r2, #1]
 289 0120 5A70     		strb	r2, [r3, #1]
 113:Z:/EDA482_snake/labb5/snake\startup.c **** 	c->bottom = next;             // top to next data offset.
 290              		.loc 1 113 0
 291 0122 7B68     		ldr	r3, [r7, #4]
 292 0124 FA68     		ldr	r2, [r7, #12]
 293 0126 9A60     		str	r2, [r3, #8]
 114:Z:/EDA482_snake/labb5/snake\startup.c ****     return 0; 					 // return success to indicate successful push.
 294              		.loc 1 114 0
 295 0128 0023     		movs	r3, #0
 296              	.L13:
 115:Z:/EDA482_snake/labb5/snake\startup.c **** }
 297              		.loc 1 115 0
 298 012a 1800     		movs	r0, r3
 299 012c BD46     		mov	sp, r7
 300 012e 04B0     		add	sp, sp, #16
 301              		@ sp needed
 302 0130 80BD     		pop	{r7, pc}
 303              		.cfi_endproc
 304              	.LFE3:
 306              		.align	1
 307              		.global	buffer_shift
 308              		.syntax unified
 309              		.code	16
 310              		.thumb_func
 311              		.fpu softvfp
 313              	buffer_shift:
 314              	.LFB4:
 116:Z:/EDA482_snake/labb5/snake\startup.c **** 
 117:Z:/EDA482_snake/labb5/snake\startup.c **** 
 118:Z:/EDA482_snake/labb5/snake\startup.c **** int buffer_shift(circular_buffer* c, POINT *data) {
 315              		.loc 1 118 0
 316              		.cfi_startproc
 317              		@ args = 0, pretend = 0, frame = 16
 318              		@ frame_needed = 1, uses_anonymous_args = 0
 319 0132 80B5     		push	{r7, lr}
 320              		.cfi_def_cfa_offset 8
 321              		.cfi_offset 7, -8
 322              		.cfi_offset 14, -4
 323 0134 84B0     		sub	sp, sp, #16
 324              		.cfi_def_cfa_offset 24
 325 0136 00AF     		add	r7, sp, #0
 326              		.cfi_def_cfa_register 7
 327 0138 7860     		str	r0, [r7, #4]
 328 013a 3960     		str	r1, [r7]
 119:Z:/EDA482_snake/labb5/snake\startup.c ****     int next;
 120:Z:/EDA482_snake/labb5/snake\startup.c **** 
 121:Z:/EDA482_snake/labb5/snake\startup.c ****     if (c->top == c->bottom){  // if the top == bottom, we don't have any data
 329              		.loc 1 121 0
 330 013c 7B68     		ldr	r3, [r7, #4]
 331 013e 5A68     		ldr	r2, [r3, #4]
 332 0140 7B68     		ldr	r3, [r7, #4]
 333 0142 9B68     		ldr	r3, [r3, #8]
 334 0144 9A42     		cmp	r2, r3
 335 0146 02D1     		bne	.L15
 122:Z:/EDA482_snake/labb5/snake\startup.c ****         return -1;
 336              		.loc 1 122 0
 337 0148 0123     		movs	r3, #1
 338 014a 5B42     		rsbs	r3, r3, #0
 339 014c 20E0     		b	.L16
 340              	.L15:
 123:Z:/EDA482_snake/labb5/snake\startup.c **** 	}
 124:Z:/EDA482_snake/labb5/snake\startup.c **** 
 125:Z:/EDA482_snake/labb5/snake\startup.c ****     next = c->bottom + 1;  // next is where bottom will point to after this read.
 341              		.loc 1 125 0
 342 014e 7B68     		ldr	r3, [r7, #4]
 343 0150 9B68     		ldr	r3, [r3, #8]
 344 0152 0133     		adds	r3, r3, #1
 345 0154 FB60     		str	r3, [r7, #12]
 126:Z:/EDA482_snake/labb5/snake\startup.c ****     if(next >= c->maxlen) {
 346              		.loc 1 126 0
 347 0156 7B68     		ldr	r3, [r7, #4]
 348 0158 DB68     		ldr	r3, [r3, #12]
 349 015a FA68     		ldr	r2, [r7, #12]
 350 015c 9A42     		cmp	r2, r3
 351 015e 01DB     		blt	.L17
 127:Z:/EDA482_snake/labb5/snake\startup.c **** 		next = 0;
 352              		.loc 1 127 0
 353 0160 0023     		movs	r3, #0
 354 0162 FB60     		str	r3, [r7, #12]
 355              	.L17:
 128:Z:/EDA482_snake/labb5/snake\startup.c **** 	}
 129:Z:/EDA482_snake/labb5/snake\startup.c **** 		
 130:Z:/EDA482_snake/labb5/snake\startup.c **** 	c->bottom = next; 
 356              		.loc 1 130 0
 357 0164 7B68     		ldr	r3, [r7, #4]
 358 0166 FA68     		ldr	r2, [r7, #12]
 359 0168 9A60     		str	r2, [r3, #8]
 131:Z:/EDA482_snake/labb5/snake\startup.c ****     data->x = c->buffer[c->bottom].x;  // Read data and then move
 360              		.loc 1 131 0
 361 016a 7B68     		ldr	r3, [r7, #4]
 362 016c 1A68     		ldr	r2, [r3]
 363 016e 7B68     		ldr	r3, [r7, #4]
 364 0170 9B68     		ldr	r3, [r3, #8]
 365 0172 5B00     		lsls	r3, r3, #1
 366 0174 D318     		adds	r3, r2, r3
 367 0176 1A78     		ldrb	r2, [r3]
 368 0178 3B68     		ldr	r3, [r7]
 369 017a 1A70     		strb	r2, [r3]
 132:Z:/EDA482_snake/labb5/snake\startup.c **** 	data->y = c->buffer[c->bottom].y;
 370              		.loc 1 132 0
 371 017c 7B68     		ldr	r3, [r7, #4]
 372 017e 1A68     		ldr	r2, [r3]
 373 0180 7B68     		ldr	r3, [r7, #4]
 374 0182 9B68     		ldr	r3, [r3, #8]
 375 0184 5B00     		lsls	r3, r3, #1
 376 0186 D318     		adds	r3, r2, r3
 377 0188 5A78     		ldrb	r2, [r3, #1]
 378 018a 3B68     		ldr	r3, [r7]
 379 018c 5A70     		strb	r2, [r3, #1]
 133:Z:/EDA482_snake/labb5/snake\startup.c ****                  // bottom to next offset.
 134:Z:/EDA482_snake/labb5/snake\startup.c ****     return 0;  // return success to indicate successful push.
 380              		.loc 1 134 0
 381 018e 0023     		movs	r3, #0
 382              	.L16:
 135:Z:/EDA482_snake/labb5/snake\startup.c **** }
 383              		.loc 1 135 0
 384 0190 1800     		movs	r0, r3
 385 0192 BD46     		mov	sp, r7
 386 0194 04B0     		add	sp, sp, #16
 387              		@ sp needed
 388 0196 80BD     		pop	{r7, pc}
 389              		.cfi_endproc
 390              	.LFE4:
 392              		.global	GAME_OVER
 393              		.bss
 396              	GAME_OVER:
 397 0000 00       		.space	1
 398              		.comm	rngState,4,4
 399              		.comm	food,2,4
 400              		.comm	points,1,1
 401              		.text
 402              		.align	1
 403              		.global	gen_food
 404              		.syntax unified
 405              		.code	16
 406              		.thumb_func
 407              		.fpu softvfp
 409              	gen_food:
 410              	.LFB5:
 136:Z:/EDA482_snake/labb5/snake\startup.c **** // End of circular buffer stuff
 137:Z:/EDA482_snake/labb5/snake\startup.c **** 
 138:Z:/EDA482_snake/labb5/snake\startup.c **** bool GAME_OVER = false;
 139:Z:/EDA482_snake/labb5/snake\startup.c **** rngword_t rngState;
 140:Z:/EDA482_snake/labb5/snake\startup.c **** POINT food;
 141:Z:/EDA482_snake/labb5/snake\startup.c **** uint8_t points;
 142:Z:/EDA482_snake/labb5/snake\startup.c **** 
 143:Z:/EDA482_snake/labb5/snake\startup.c **** void gen_food(rngword_t state) {
 411              		.loc 1 143 0
 412              		.cfi_startproc
 413              		@ args = 0, pretend = 0, frame = 16
 414              		@ frame_needed = 1, uses_anonymous_args = 0
 415 0198 B0B5     		push	{r4, r5, r7, lr}
 416              		.cfi_def_cfa_offset 16
 417              		.cfi_offset 4, -16
 418              		.cfi_offset 5, -12
 419              		.cfi_offset 7, -8
 420              		.cfi_offset 14, -4
 421 019a 84B0     		sub	sp, sp, #16
 422              		.cfi_def_cfa_offset 32
 423 019c 00AF     		add	r7, sp, #0
 424              		.cfi_def_cfa_register 7
 425 019e 7860     		str	r0, [r7, #4]
 144:Z:/EDA482_snake/labb5/snake\startup.c **** 	uint8_t x = nextRnd(&rngState);
 426              		.loc 1 144 0
 427 01a0 194B     		ldr	r3, .L19
 428 01a2 1800     		movs	r0, r3
 429 01a4 FFF7FEFF 		bl	nextRnd
 430 01a8 0200     		movs	r2, r0
 431 01aa 0F20     		movs	r0, #15
 432 01ac 0400     		movs	r4, r0
 433 01ae 3B18     		adds	r3, r7, r0
 434 01b0 1A70     		strb	r2, [r3]
 145:Z:/EDA482_snake/labb5/snake\startup.c **** 	uint8_t y = nextRnd(&rngState);
 435              		.loc 1 145 0
 436 01b2 154B     		ldr	r3, .L19
 437 01b4 1800     		movs	r0, r3
 438 01b6 FFF7FEFF 		bl	nextRnd
 439 01ba 0200     		movs	r2, r0
 440 01bc 0E25     		movs	r5, #14
 441 01be 7B19     		adds	r3, r7, r5
 442 01c0 1A70     		strb	r2, [r3]
 146:Z:/EDA482_snake/labb5/snake\startup.c **** 	x %= 128;
 443              		.loc 1 146 0
 444 01c2 2000     		movs	r0, r4
 445 01c4 3B18     		adds	r3, r7, r0
 446 01c6 3A18     		adds	r2, r7, r0
 447 01c8 1278     		ldrb	r2, [r2]
 448 01ca 7F21     		movs	r1, #127
 449 01cc 0A40     		ands	r2, r1
 450 01ce 1A70     		strb	r2, [r3]
 147:Z:/EDA482_snake/labb5/snake\startup.c **** 	y %= 64;
 451              		.loc 1 147 0
 452 01d0 7B19     		adds	r3, r7, r5
 453 01d2 7A19     		adds	r2, r7, r5
 454 01d4 1278     		ldrb	r2, [r2]
 455 01d6 3F21     		movs	r1, #63
 456 01d8 0A40     		ands	r2, r1
 457 01da 1A70     		strb	r2, [r3]
 148:Z:/EDA482_snake/labb5/snake\startup.c **** 	
 149:Z:/EDA482_snake/labb5/snake\startup.c **** 	pixel(x, y, true);
 458              		.loc 1 149 0
 459 01dc 7B19     		adds	r3, r7, r5
 460 01de 1978     		ldrb	r1, [r3]
 461 01e0 0400     		movs	r4, r0
 462 01e2 3B18     		adds	r3, r7, r0
 463 01e4 1B78     		ldrb	r3, [r3]
 464 01e6 0122     		movs	r2, #1
 465 01e8 1800     		movs	r0, r3
 466 01ea FFF7FEFF 		bl	pixel
 150:Z:/EDA482_snake/labb5/snake\startup.c **** 	food.x = x;
 467              		.loc 1 150 0
 468 01ee 074B     		ldr	r3, .L19+4
 469 01f0 2000     		movs	r0, r4
 470 01f2 3A18     		adds	r2, r7, r0
 471 01f4 1278     		ldrb	r2, [r2]
 472 01f6 1A70     		strb	r2, [r3]
 151:Z:/EDA482_snake/labb5/snake\startup.c **** 	food.y = y;
 473              		.loc 1 151 0
 474 01f8 044B     		ldr	r3, .L19+4
 475 01fa 7A19     		adds	r2, r7, r5
 476 01fc 1278     		ldrb	r2, [r2]
 477 01fe 5A70     		strb	r2, [r3, #1]
 152:Z:/EDA482_snake/labb5/snake\startup.c **** }
 478              		.loc 1 152 0
 479 0200 C046     		nop
 480 0202 BD46     		mov	sp, r7
 481 0204 04B0     		add	sp, sp, #16
 482              		@ sp needed
 483 0206 B0BD     		pop	{r4, r5, r7, pc}
 484              	.L20:
 485              		.align	2
 486              	.L19:
 487 0208 00000000 		.word	rngState
 488 020c 00000000 		.word	food
 489              		.cfi_endproc
 490              	.LFE5:
 492              		.global	__aeabi_idivmod
 493              		.section	.rodata
 494              		.align	2
 495              	.LC8:
 496 0000 4C656E67 		.ascii	"Length: \000"
 496      74683A20 
 496      00
 497              		.text
 498              		.align	1
 499              		.global	SNEK_move
 500              		.syntax unified
 501              		.code	16
 502              		.thumb_func
 503              		.fpu softvfp
 505              	SNEK_move:
 506              	.LFB6:
 153:Z:/EDA482_snake/labb5/snake\startup.c **** 
 154:Z:/EDA482_snake/labb5/snake\startup.c **** void SNEK_move(SNEK* self) {
 507              		.loc 1 154 0
 508              		.cfi_startproc
 509              		@ args = 0, pretend = 0, frame = 24
 510              		@ frame_needed = 1, uses_anonymous_args = 0
 511 0210 90B5     		push	{r4, r7, lr}
 512              		.cfi_def_cfa_offset 12
 513              		.cfi_offset 4, -12
 514              		.cfi_offset 7, -8
 515              		.cfi_offset 14, -4
 516 0212 87B0     		sub	sp, sp, #28
 517              		.cfi_def_cfa_offset 40
 518 0214 00AF     		add	r7, sp, #0
 519              		.cfi_def_cfa_register 7
 520 0216 7860     		str	r0, [r7, #4]
 155:Z:/EDA482_snake/labb5/snake\startup.c ****     // Collision detection
 156:Z:/EDA482_snake/labb5/snake\startup.c **** 	POINT next_head = self->head;
 521              		.loc 1 156 0
 522 0218 1021     		movs	r1, #16
 523 021a 0800     		movs	r0, r1
 524 021c 7B18     		adds	r3, r7, r1
 525 021e 7A68     		ldr	r2, [r7, #4]
 526 0220 0221     		movs	r1, #2
 527 0222 525A     		ldrh	r2, [r2, r1]
 528 0224 1A80     		strh	r2, [r3]
 157:Z:/EDA482_snake/labb5/snake\startup.c **** 	next_head.x += self->velocity.x;
 529              		.loc 1 157 0
 530 0226 0100     		movs	r1, r0
 531 0228 7B18     		adds	r3, r7, r1
 532 022a 1A78     		ldrb	r2, [r3]
 533 022c 7B68     		ldr	r3, [r7, #4]
 534 022e 1B78     		ldrb	r3, [r3]
 535 0230 5BB2     		sxtb	r3, r3
 536 0232 DBB2     		uxtb	r3, r3
 537 0234 D318     		adds	r3, r2, r3
 538 0236 DAB2     		uxtb	r2, r3
 539 0238 7B18     		adds	r3, r7, r1
 540 023a 1A70     		strb	r2, [r3]
 158:Z:/EDA482_snake/labb5/snake\startup.c **** 	next_head.y += self->velocity.y;
 541              		.loc 1 158 0
 542 023c 7B18     		adds	r3, r7, r1
 543 023e 5A78     		ldrb	r2, [r3, #1]
 544 0240 7B68     		ldr	r3, [r7, #4]
 545 0242 5B78     		ldrb	r3, [r3, #1]
 546 0244 5BB2     		sxtb	r3, r3
 547 0246 DBB2     		uxtb	r3, r3
 548 0248 D318     		adds	r3, r2, r3
 549 024a DAB2     		uxtb	r2, r3
 550 024c 7B18     		adds	r3, r7, r1
 551 024e 5A70     		strb	r2, [r3, #1]
 159:Z:/EDA482_snake/labb5/snake\startup.c **** 	if (next_head.x < 0 || next_head.x >= 128 || next_head.y < 0 || next_head.y >= 64) {
 552              		.loc 1 159 0
 553 0250 7B18     		adds	r3, r7, r1
 554 0252 1B78     		ldrb	r3, [r3]
 555 0254 5BB2     		sxtb	r3, r3
 556 0256 002B     		cmp	r3, #0
 557 0258 04DB     		blt	.L22
 558              		.loc 1 159 0 is_stmt 0 discriminator 1
 559 025a 1023     		movs	r3, #16
 560 025c FB18     		adds	r3, r7, r3
 561 025e 5B78     		ldrb	r3, [r3, #1]
 562 0260 3F2B     		cmp	r3, #63
 563 0262 03D9     		bls	.L23
 564              	.L22:
 160:Z:/EDA482_snake/labb5/snake\startup.c **** 		// We have collided
 161:Z:/EDA482_snake/labb5/snake\startup.c **** 		GAME_OVER = true;
 565              		.loc 1 161 0 is_stmt 1
 566 0264 4D4B     		ldr	r3, .L31
 567 0266 0122     		movs	r2, #1
 568 0268 1A70     		strb	r2, [r3]
 162:Z:/EDA482_snake/labb5/snake\startup.c **** 		return;
 569              		.loc 1 162 0
 570 026a 94E0     		b	.L21
 571              	.L23:
 572              	.LBB2:
 163:Z:/EDA482_snake/labb5/snake\startup.c **** 	}
 164:Z:/EDA482_snake/labb5/snake\startup.c **** 	for (int i = self->tail->bottom; i != self->tail->top; i = (i + 1) % 50) {
 573              		.loc 1 164 0
 574 026c 7B68     		ldr	r3, [r7, #4]
 575 026e 5B68     		ldr	r3, [r3, #4]
 576 0270 9B68     		ldr	r3, [r3, #8]
 577 0272 7B61     		str	r3, [r7, #20]
 578 0274 23E0     		b	.L25
 579              	.L27:
 165:Z:/EDA482_snake/labb5/snake\startup.c **** 		if (next_head.x == self->tail->buffer[i].x && next_head.y == self->tail->buffer[i].y) {
 580              		.loc 1 165 0
 581 0276 1023     		movs	r3, #16
 582 0278 FB18     		adds	r3, r7, r3
 583 027a 1A78     		ldrb	r2, [r3]
 584 027c 7B68     		ldr	r3, [r7, #4]
 585 027e 5B68     		ldr	r3, [r3, #4]
 586 0280 1968     		ldr	r1, [r3]
 587 0282 7B69     		ldr	r3, [r7, #20]
 588 0284 5B00     		lsls	r3, r3, #1
 589 0286 CB18     		adds	r3, r1, r3
 590 0288 1B78     		ldrb	r3, [r3]
 591 028a 9A42     		cmp	r2, r3
 592 028c 0FD1     		bne	.L26
 593              		.loc 1 165 0 is_stmt 0 discriminator 1
 594 028e 1023     		movs	r3, #16
 595 0290 FB18     		adds	r3, r7, r3
 596 0292 5A78     		ldrb	r2, [r3, #1]
 597 0294 7B68     		ldr	r3, [r7, #4]
 598 0296 5B68     		ldr	r3, [r3, #4]
 599 0298 1968     		ldr	r1, [r3]
 600 029a 7B69     		ldr	r3, [r7, #20]
 601 029c 5B00     		lsls	r3, r3, #1
 602 029e CB18     		adds	r3, r1, r3
 603 02a0 5B78     		ldrb	r3, [r3, #1]
 604 02a2 9A42     		cmp	r2, r3
 605 02a4 03D1     		bne	.L26
 166:Z:/EDA482_snake/labb5/snake\startup.c **** 			GAME_OVER = true;
 606              		.loc 1 166 0 is_stmt 1
 607 02a6 3D4B     		ldr	r3, .L31
 608 02a8 0122     		movs	r2, #1
 609 02aa 1A70     		strb	r2, [r3]
 167:Z:/EDA482_snake/labb5/snake\startup.c **** 			return;
 610              		.loc 1 167 0
 611 02ac 73E0     		b	.L21
 612              	.L26:
 164:Z:/EDA482_snake/labb5/snake\startup.c **** 		if (next_head.x == self->tail->buffer[i].x && next_head.y == self->tail->buffer[i].y) {
 613              		.loc 1 164 0 discriminator 2
 614 02ae 7B69     		ldr	r3, [r7, #20]
 615 02b0 0133     		adds	r3, r3, #1
 616 02b2 3221     		movs	r1, #50
 617 02b4 1800     		movs	r0, r3
 618 02b6 FFF7FEFF 		bl	__aeabi_idivmod
 619              	.LVL0:
 620 02ba 0B00     		movs	r3, r1
 621 02bc 7B61     		str	r3, [r7, #20]
 622              	.L25:
 164:Z:/EDA482_snake/labb5/snake\startup.c **** 		if (next_head.x == self->tail->buffer[i].x && next_head.y == self->tail->buffer[i].y) {
 623              		.loc 1 164 0 is_stmt 0 discriminator 1
 624 02be 7B68     		ldr	r3, [r7, #4]
 625 02c0 5B68     		ldr	r3, [r3, #4]
 626 02c2 5B68     		ldr	r3, [r3, #4]
 627 02c4 7A69     		ldr	r2, [r7, #20]
 628 02c6 9A42     		cmp	r2, r3
 629 02c8 D5D1     		bne	.L27
 630              	.LBE2:
 168:Z:/EDA482_snake/labb5/snake\startup.c **** 		}
 169:Z:/EDA482_snake/labb5/snake\startup.c **** 	}
 170:Z:/EDA482_snake/labb5/snake\startup.c **** 	
 171:Z:/EDA482_snake/labb5/snake\startup.c **** 	
 172:Z:/EDA482_snake/labb5/snake\startup.c **** 	bool nomnomnom = false;
 631              		.loc 1 172 0 is_stmt 1
 632 02ca 1323     		movs	r3, #19
 633 02cc FB18     		adds	r3, r7, r3
 634 02ce 0022     		movs	r2, #0
 635 02d0 1A70     		strb	r2, [r3]
 173:Z:/EDA482_snake/labb5/snake\startup.c **** 	if (next_head.x == food.x && next_head.y == food.y) {
 636              		.loc 1 173 0
 637 02d2 1023     		movs	r3, #16
 638 02d4 FB18     		adds	r3, r7, r3
 639 02d6 1A78     		ldrb	r2, [r3]
 640 02d8 314B     		ldr	r3, .L31+4
 641 02da 1B78     		ldrb	r3, [r3]
 642 02dc 9A42     		cmp	r2, r3
 643 02de 24D1     		bne	.L28
 644              		.loc 1 173 0 is_stmt 0 discriminator 1
 645 02e0 1023     		movs	r3, #16
 646 02e2 FB18     		adds	r3, r7, r3
 647 02e4 5A78     		ldrb	r2, [r3, #1]
 648 02e6 2E4B     		ldr	r3, .L31+4
 649 02e8 5B78     		ldrb	r3, [r3, #1]
 650 02ea 9A42     		cmp	r2, r3
 651 02ec 1DD1     		bne	.L28
 174:Z:/EDA482_snake/labb5/snake\startup.c **** 		nomnomnom = true;
 652              		.loc 1 174 0 is_stmt 1
 653 02ee 1323     		movs	r3, #19
 654 02f0 FB18     		adds	r3, r7, r3
 655 02f2 0122     		movs	r2, #1
 656 02f4 1A70     		strb	r2, [r3]
 175:Z:/EDA482_snake/labb5/snake\startup.c **** 		gen_food(rngState);
 657              		.loc 1 175 0
 658 02f6 2B4B     		ldr	r3, .L31+8
 659 02f8 1B68     		ldr	r3, [r3]
 660 02fa 1800     		movs	r0, r3
 661 02fc FFF7FEFF 		bl	gen_food
 176:Z:/EDA482_snake/labb5/snake\startup.c **** 		points++;
 662              		.loc 1 176 0
 663 0300 294B     		ldr	r3, .L31+12
 664 0302 1B78     		ldrb	r3, [r3]
 665 0304 0133     		adds	r3, r3, #1
 666 0306 DAB2     		uxtb	r2, r3
 667 0308 274B     		ldr	r3, .L31+12
 668 030a 1A70     		strb	r2, [r3]
 177:Z:/EDA482_snake/labb5/snake\startup.c **** 		ascii_gotoxy(1,1);
 669              		.loc 1 177 0
 670 030c 0121     		movs	r1, #1
 671 030e 0120     		movs	r0, #1
 672 0310 FFF7FEFF 		bl	ascii_gotoxy
 178:Z:/EDA482_snake/labb5/snake\startup.c **** 		ascii_write_string("Length: ");
 673              		.loc 1 178 0
 674 0314 254B     		ldr	r3, .L31+16
 675 0316 1800     		movs	r0, r3
 676 0318 FFF7FEFF 		bl	ascii_write_string
 179:Z:/EDA482_snake/labb5/snake\startup.c **** 		ascii_write_char(points + '0');
 677              		.loc 1 179 0
 678 031c 224B     		ldr	r3, .L31+12
 679 031e 1B78     		ldrb	r3, [r3]
 680 0320 3033     		adds	r3, r3, #48
 681 0322 DBB2     		uxtb	r3, r3
 682 0324 1800     		movs	r0, r3
 683 0326 FFF7FEFF 		bl	ascii_write_char
 684              	.L28:
 180:Z:/EDA482_snake/labb5/snake\startup.c **** 	}
 181:Z:/EDA482_snake/labb5/snake\startup.c **** 	
 182:Z:/EDA482_snake/labb5/snake\startup.c **** 	
 183:Z:/EDA482_snake/labb5/snake\startup.c **** 	
 184:Z:/EDA482_snake/labb5/snake\startup.c ****     // Lägg till ditt förra huvud, som första noden i listan
 185:Z:/EDA482_snake/labb5/snake\startup.c **** 	buffer_push(self->tail ,self->head);
 685              		.loc 1 185 0
 686 032a 7B68     		ldr	r3, [r7, #4]
 687 032c 5868     		ldr	r0, [r3, #4]
 688 032e 7B68     		ldr	r3, [r7, #4]
 689 0330 0222     		movs	r2, #2
 690 0332 9A5A     		ldrh	r2, [r3, r2]
 691 0334 0023     		movs	r3, #0
 692 0336 1204     		lsls	r2, r2, #16
 693 0338 120C     		lsrs	r2, r2, #16
 694 033a 1B0C     		lsrs	r3, r3, #16
 695 033c 1B04     		lsls	r3, r3, #16
 696 033e 1343     		orrs	r3, r2
 697 0340 1900     		movs	r1, r3
 698 0342 FFF7FEFF 		bl	buffer_push
 186:Z:/EDA482_snake/labb5/snake\startup.c ****     // Gå fram ett steg rita ditt nya huvud
 187:Z:/EDA482_snake/labb5/snake\startup.c **** 	self->head = next_head;
 699              		.loc 1 187 0
 700 0346 7B68     		ldr	r3, [r7, #4]
 701 0348 0221     		movs	r1, #2
 702 034a 1022     		movs	r2, #16
 703 034c BA18     		adds	r2, r7, r2
 704 034e 1288     		ldrh	r2, [r2]
 705 0350 5A52     		strh	r2, [r3, r1]
 188:Z:/EDA482_snake/labb5/snake\startup.c **** 	pixel(self->head.x, self->head.y, true);
 706              		.loc 1 188 0
 707 0352 7B68     		ldr	r3, [r7, #4]
 708 0354 9878     		ldrb	r0, [r3, #2]
 709 0356 7B68     		ldr	r3, [r7, #4]
 710 0358 DB78     		ldrb	r3, [r3, #3]
 711 035a 0122     		movs	r2, #1
 712 035c 1900     		movs	r1, r3
 713 035e FFF7FEFF 		bl	pixel
 189:Z:/EDA482_snake/labb5/snake\startup.c **** 	
 190:Z:/EDA482_snake/labb5/snake\startup.c ****     // Ta bort sista elementet i listan, cleara den pixeln
 191:Z:/EDA482_snake/labb5/snake\startup.c **** 	if (!nomnomnom) {
 714              		.loc 1 191 0
 715 0362 1323     		movs	r3, #19
 716 0364 FB18     		adds	r3, r7, r3
 717 0366 1B78     		ldrb	r3, [r3]
 718 0368 0122     		movs	r2, #1
 719 036a 5340     		eors	r3, r2
 720 036c DBB2     		uxtb	r3, r3
 721 036e 002B     		cmp	r3, #0
 722 0370 11D0     		beq	.L21
 723              	.LBB3:
 192:Z:/EDA482_snake/labb5/snake\startup.c **** 		POINT clearMe;
 193:Z:/EDA482_snake/labb5/snake\startup.c **** 		buffer_shift(self->tail, &clearMe);
 724              		.loc 1 193 0
 725 0372 7B68     		ldr	r3, [r7, #4]
 726 0374 5B68     		ldr	r3, [r3, #4]
 727 0376 0C22     		movs	r2, #12
 728 0378 1400     		movs	r4, r2
 729 037a BA18     		adds	r2, r7, r2
 730 037c 1100     		movs	r1, r2
 731 037e 1800     		movs	r0, r3
 732 0380 FFF7FEFF 		bl	buffer_shift
 194:Z:/EDA482_snake/labb5/snake\startup.c **** 		pixel(clearMe.x, clearMe.y, false);
 733              		.loc 1 194 0
 734 0384 2200     		movs	r2, r4
 735 0386 BB18     		adds	r3, r7, r2
 736 0388 1878     		ldrb	r0, [r3]
 737 038a BB18     		adds	r3, r7, r2
 738 038c 5B78     		ldrb	r3, [r3, #1]
 739 038e 0022     		movs	r2, #0
 740 0390 1900     		movs	r1, r3
 741 0392 FFF7FEFF 		bl	pixel
 742              	.L21:
 743              	.LBE3:
 195:Z:/EDA482_snake/labb5/snake\startup.c **** 	}
 196:Z:/EDA482_snake/labb5/snake\startup.c ****         
 197:Z:/EDA482_snake/labb5/snake\startup.c **** }
 744              		.loc 1 197 0
 745 0396 BD46     		mov	sp, r7
 746 0398 07B0     		add	sp, sp, #28
 747              		@ sp needed
 748 039a 90BD     		pop	{r4, r7, pc}
 749              	.L32:
 750              		.align	2
 751              	.L31:
 752 039c 00000000 		.word	GAME_OVER
 753 03a0 00000000 		.word	food
 754 03a4 00000000 		.word	rngState
 755 03a8 00000000 		.word	points
 756 03ac 00000000 		.word	.LC8
 757              		.cfi_endproc
 758              	.LFE6:
 760              		.align	1
 761              		.global	SNEK_draw
 762              		.syntax unified
 763              		.code	16
 764              		.thumb_func
 765              		.fpu softvfp
 767              	SNEK_draw:
 768              	.LFB7:
 198:Z:/EDA482_snake/labb5/snake\startup.c **** 
 199:Z:/EDA482_snake/labb5/snake\startup.c **** void SNEK_draw(SNEK* self) {
 769              		.loc 1 199 0
 770              		.cfi_startproc
 771              		@ args = 0, pretend = 0, frame = 8
 772              		@ frame_needed = 1, uses_anonymous_args = 0
 773 03b0 80B5     		push	{r7, lr}
 774              		.cfi_def_cfa_offset 8
 775              		.cfi_offset 7, -8
 776              		.cfi_offset 14, -4
 777 03b2 82B0     		sub	sp, sp, #8
 778              		.cfi_def_cfa_offset 16
 779 03b4 00AF     		add	r7, sp, #0
 780              		.cfi_def_cfa_register 7
 781 03b6 7860     		str	r0, [r7, #4]
 200:Z:/EDA482_snake/labb5/snake\startup.c ****     pixel(self->head.x, self->head.y, true);
 782              		.loc 1 200 0
 783 03b8 7B68     		ldr	r3, [r7, #4]
 784 03ba 9878     		ldrb	r0, [r3, #2]
 785 03bc 7B68     		ldr	r3, [r7, #4]
 786 03be DB78     		ldrb	r3, [r3, #3]
 787 03c0 0122     		movs	r2, #1
 788 03c2 1900     		movs	r1, r3
 789 03c4 FFF7FEFF 		bl	pixel
 201:Z:/EDA482_snake/labb5/snake\startup.c **** }
 790              		.loc 1 201 0
 791 03c8 C046     		nop
 792 03ca BD46     		mov	sp, r7
 793 03cc 02B0     		add	sp, sp, #8
 794              		@ sp needed
 795 03ce 80BD     		pop	{r7, pc}
 796              		.cfi_endproc
 797              	.LFE7:
 799              		.align	1
 800              		.global	SNEK_turn_left
 801              		.syntax unified
 802              		.code	16
 803              		.thumb_func
 804              		.fpu softvfp
 806              	SNEK_turn_left:
 807              	.LFB8:
 202:Z:/EDA482_snake/labb5/snake\startup.c **** 
 203:Z:/EDA482_snake/labb5/snake\startup.c **** void SNEK_turn_left(SNEK* self) {
 808              		.loc 1 203 0
 809              		.cfi_startproc
 810              		@ args = 0, pretend = 0, frame = 16
 811              		@ frame_needed = 1, uses_anonymous_args = 0
 812 03d0 80B5     		push	{r7, lr}
 813              		.cfi_def_cfa_offset 8
 814              		.cfi_offset 7, -8
 815              		.cfi_offset 14, -4
 816 03d2 84B0     		sub	sp, sp, #16
 817              		.cfi_def_cfa_offset 24
 818 03d4 00AF     		add	r7, sp, #0
 819              		.cfi_def_cfa_register 7
 820 03d6 7860     		str	r0, [r7, #4]
 204:Z:/EDA482_snake/labb5/snake\startup.c **** 	VECTOR new_velocity;
 205:Z:/EDA482_snake/labb5/snake\startup.c **** 	new_velocity.x = self->velocity.y;
 821              		.loc 1 205 0
 822 03d8 7B68     		ldr	r3, [r7, #4]
 823 03da 0122     		movs	r2, #1
 824 03dc 9A56     		ldrsb	r2, [r3, r2]
 825 03de 0C21     		movs	r1, #12
 826 03e0 7B18     		adds	r3, r7, r1
 827 03e2 1A70     		strb	r2, [r3]
 206:Z:/EDA482_snake/labb5/snake\startup.c **** 	new_velocity.y = -self->velocity.x;
 828              		.loc 1 206 0
 829 03e4 7B68     		ldr	r3, [r7, #4]
 830 03e6 1B78     		ldrb	r3, [r3]
 831 03e8 5BB2     		sxtb	r3, r3
 832 03ea DBB2     		uxtb	r3, r3
 833 03ec 5B42     		rsbs	r3, r3, #0
 834 03ee DBB2     		uxtb	r3, r3
 835 03f0 5AB2     		sxtb	r2, r3
 836 03f2 7B18     		adds	r3, r7, r1
 837 03f4 5A70     		strb	r2, [r3, #1]
 207:Z:/EDA482_snake/labb5/snake\startup.c **** 	self->velocity = new_velocity;
 838              		.loc 1 207 0
 839 03f6 7B68     		ldr	r3, [r7, #4]
 840 03f8 7A18     		adds	r2, r7, r1
 841 03fa 1288     		ldrh	r2, [r2]
 842 03fc 1A80     		strh	r2, [r3]
 208:Z:/EDA482_snake/labb5/snake\startup.c **** }
 843              		.loc 1 208 0
 844 03fe C046     		nop
 845 0400 BD46     		mov	sp, r7
 846 0402 04B0     		add	sp, sp, #16
 847              		@ sp needed
 848 0404 80BD     		pop	{r7, pc}
 849              		.cfi_endproc
 850              	.LFE8:
 852              		.align	1
 853              		.global	SNEK_turn_right
 854              		.syntax unified
 855              		.code	16
 856              		.thumb_func
 857              		.fpu softvfp
 859              	SNEK_turn_right:
 860              	.LFB9:
 209:Z:/EDA482_snake/labb5/snake\startup.c **** 
 210:Z:/EDA482_snake/labb5/snake\startup.c **** void SNEK_turn_right(SNEK* self) {
 861              		.loc 1 210 0
 862              		.cfi_startproc
 863              		@ args = 0, pretend = 0, frame = 16
 864              		@ frame_needed = 1, uses_anonymous_args = 0
 865 0406 80B5     		push	{r7, lr}
 866              		.cfi_def_cfa_offset 8
 867              		.cfi_offset 7, -8
 868              		.cfi_offset 14, -4
 869 0408 84B0     		sub	sp, sp, #16
 870              		.cfi_def_cfa_offset 24
 871 040a 00AF     		add	r7, sp, #0
 872              		.cfi_def_cfa_register 7
 873 040c 7860     		str	r0, [r7, #4]
 211:Z:/EDA482_snake/labb5/snake\startup.c **** 	VECTOR new_velocity;
 212:Z:/EDA482_snake/labb5/snake\startup.c **** 	new_velocity.x = -self->velocity.y;
 874              		.loc 1 212 0
 875 040e 7B68     		ldr	r3, [r7, #4]
 876 0410 5B78     		ldrb	r3, [r3, #1]
 877 0412 5BB2     		sxtb	r3, r3
 878 0414 DBB2     		uxtb	r3, r3
 879 0416 5B42     		rsbs	r3, r3, #0
 880 0418 DBB2     		uxtb	r3, r3
 881 041a 5AB2     		sxtb	r2, r3
 882 041c 0C21     		movs	r1, #12
 883 041e 7B18     		adds	r3, r7, r1
 884 0420 1A70     		strb	r2, [r3]
 213:Z:/EDA482_snake/labb5/snake\startup.c **** 	new_velocity.y = self->velocity.x;
 885              		.loc 1 213 0
 886 0422 7B68     		ldr	r3, [r7, #4]
 887 0424 0022     		movs	r2, #0
 888 0426 9A56     		ldrsb	r2, [r3, r2]
 889 0428 7B18     		adds	r3, r7, r1
 890 042a 5A70     		strb	r2, [r3, #1]
 214:Z:/EDA482_snake/labb5/snake\startup.c **** 	self->velocity = new_velocity;
 891              		.loc 1 214 0
 892 042c 7B68     		ldr	r3, [r7, #4]
 893 042e 7A18     		adds	r2, r7, r1
 894 0430 1288     		ldrh	r2, [r2]
 895 0432 1A80     		strh	r2, [r3]
 215:Z:/EDA482_snake/labb5/snake\startup.c **** }
 896              		.loc 1 215 0
 897 0434 C046     		nop
 898 0436 BD46     		mov	sp, r7
 899 0438 04B0     		add	sp, sp, #16
 900              		@ sp needed
 901 043a 80BD     		pop	{r7, pc}
 902              		.cfi_endproc
 903              	.LFE9:
 905              		.comm	arr,100,4
 906              		.global	buff
 907              		.data
 908              		.align	2
 911              	buff:
 912 0000 00000000 		.word	arr
 913 0004 00000000 		.word	0
 914 0008 00000000 		.word	0
 915 000c 32000000 		.word	50
 916              		.global	player
 917              		.align	2
 920              	player:
 921 0010 01       		.byte	1
 922 0011 00       		.byte	0
 923 0012 40       		.byte	64
 924 0013 20       		.byte	32
 925 0014 00000000 		.word	buff
 926 0018 00000000 		.word	SNEK_move
 927 001c 00000000 		.word	SNEK_draw
 928 0020 00000000 		.word	SNEK_turn_left
 929 0024 00000000 		.word	SNEK_turn_right
 930              		.text
 931              		.align	1
 932              		.global	app_init
 933              		.syntax unified
 934              		.code	16
 935              		.thumb_func
 936              		.fpu softvfp
 938              	app_init:
 939              	.LFB10:
 216:Z:/EDA482_snake/labb5/snake\startup.c **** 
 217:Z:/EDA482_snake/labb5/snake\startup.c **** extern volatile bool systick_flag;
 218:Z:/EDA482_snake/labb5/snake\startup.c **** 
 219:Z:/EDA482_snake/labb5/snake\startup.c **** POINT arr[50];
 220:Z:/EDA482_snake/labb5/snake\startup.c **** circular_buffer buff = {
 221:Z:/EDA482_snake/labb5/snake\startup.c **** 	.buffer = arr,
 222:Z:/EDA482_snake/labb5/snake\startup.c **** 	.top = 0,
 223:Z:/EDA482_snake/labb5/snake\startup.c **** 	.bottom = 0,
 224:Z:/EDA482_snake/labb5/snake\startup.c **** 	.maxlen = 50
 225:Z:/EDA482_snake/labb5/snake\startup.c **** };
 226:Z:/EDA482_snake/labb5/snake\startup.c **** 
 227:Z:/EDA482_snake/labb5/snake\startup.c **** SNEK player = {
 228:Z:/EDA482_snake/labb5/snake\startup.c **** 	.head = (POINT) {64,32},
 229:Z:/EDA482_snake/labb5/snake\startup.c **** 	.tail = &buff,
 230:Z:/EDA482_snake/labb5/snake\startup.c **** 	.draw = SNEK_draw,
 231:Z:/EDA482_snake/labb5/snake\startup.c **** 	.move = SNEK_move,
 232:Z:/EDA482_snake/labb5/snake\startup.c **** 	.turn_left = SNEK_turn_left,
 233:Z:/EDA482_snake/labb5/snake\startup.c **** 	.turn_right = SNEK_turn_right,
 234:Z:/EDA482_snake/labb5/snake\startup.c **** 	.velocity = (VECTOR) {1,0}
 235:Z:/EDA482_snake/labb5/snake\startup.c **** };
 236:Z:/EDA482_snake/labb5/snake\startup.c **** 
 237:Z:/EDA482_snake/labb5/snake\startup.c **** 
 238:Z:/EDA482_snake/labb5/snake\startup.c **** void app_init(void) {
 940              		.loc 1 238 0
 941              		.cfi_startproc
 942              		@ args = 0, pretend = 0, frame = 0
 943              		@ frame_needed = 1, uses_anonymous_args = 0
 944 043c 80B5     		push	{r7, lr}
 945              		.cfi_def_cfa_offset 8
 946              		.cfi_offset 7, -8
 947              		.cfi_offset 14, -4
 948 043e 00AF     		add	r7, sp, #0
 949              		.cfi_def_cfa_register 7
 239:Z:/EDA482_snake/labb5/snake\startup.c **** 	#ifdef USBDM
 240:Z:/EDA482_snake/labb5/snake\startup.c **** 		GPIO_clock_start();
 950              		.loc 1 240 0
 951 0440 FFF7FEFF 		bl	GPIO_clock_start
 241:Z:/EDA482_snake/labb5/snake\startup.c **** 		*((uint32_t*) 0x40023844) |= 0x4000;
 952              		.loc 1 241 0
 953 0444 0C4B     		ldr	r3, .L37
 954 0446 1A68     		ldr	r2, [r3]
 955 0448 0B4B     		ldr	r3, .L37
 956 044a 8021     		movs	r1, #128
 957 044c C901     		lsls	r1, r1, #7
 958 044e 0A43     		orrs	r2, r1
 959 0450 1A60     		str	r2, [r3]
 242:Z:/EDA482_snake/labb5/snake\startup.c **** 		*((uint32_t*) 0xE000ED08) = 0x2001C000;
 960              		.loc 1 242 0
 961 0452 0A4B     		ldr	r3, .L37+4
 962 0454 0A4A     		ldr	r2, .L37+8
 963 0456 1A60     		str	r2, [r3]
 243:Z:/EDA482_snake/labb5/snake\startup.c **** 	#endif
 244:Z:/EDA482_snake/labb5/snake\startup.c **** 	seedRng(&rngState, 0);
 964              		.loc 1 244 0
 965 0458 0A4B     		ldr	r3, .L37+12
 966 045a 0021     		movs	r1, #0
 967 045c 1800     		movs	r0, r3
 968 045e FFF7FEFF 		bl	seedRng
 245:Z:/EDA482_snake/labb5/snake\startup.c **** 	nb_init_delay();
 969              		.loc 1 245 0
 970 0462 FFF7FEFF 		bl	nb_init_delay
 246:Z:/EDA482_snake/labb5/snake\startup.c **** 	graphic_init();
 971              		.loc 1 246 0
 972 0466 FFF7FEFF 		bl	graphic_init
 247:Z:/EDA482_snake/labb5/snake\startup.c **** 	init_keypad(GPIO_D);
 973              		.loc 1 247 0
 974 046a 074B     		ldr	r3, .L37+16
 975 046c 1800     		movs	r0, r3
 976 046e FFF7FEFF 		bl	init_keypad
 248:Z:/EDA482_snake/labb5/snake\startup.c **** }
 977              		.loc 1 248 0
 978 0472 C046     		nop
 979 0474 BD46     		mov	sp, r7
 980              		@ sp needed
 981 0476 80BD     		pop	{r7, pc}
 982              	.L38:
 983              		.align	2
 984              	.L37:
 985 0478 44380240 		.word	1073887300
 986 047c 08ED00E0 		.word	-536810232
 987 0480 00C00120 		.word	536985600
 988 0484 00000000 		.word	rngState
 989 0488 000C0240 		.word	1073875968
 990              		.cfi_endproc
 991              	.LFE10:
 993              		.section	.rodata
 994 0009 000000   		.align	2
 995              	.LC0:
 996 000c 40       		.byte	64
 997 000d 20       		.byte	32
 998 000e 0000     		.align	2
 999              	.LC1:
 1000 0010 3F       		.byte	63
 1001 0011 20       		.byte	32
 1002              		.text
 1003              		.align	1
 1004              		.global	app_reset
 1005              		.syntax unified
 1006              		.code	16
 1007              		.thumb_func
 1008              		.fpu softvfp
 1010              	app_reset:
 1011              	.LFB11:
 249:Z:/EDA482_snake/labb5/snake\startup.c **** 
 250:Z:/EDA482_snake/labb5/snake\startup.c **** void app_reset(void) {
 1012              		.loc 1 250 0
 1013              		.cfi_startproc
 1014              		@ args = 0, pretend = 0, frame = 8
 1015              		@ frame_needed = 1, uses_anonymous_args = 0
 1016 048c 80B5     		push	{r7, lr}
 1017              		.cfi_def_cfa_offset 8
 1018              		.cfi_offset 7, -8
 1019              		.cfi_offset 14, -4
 1020 048e 82B0     		sub	sp, sp, #8
 1021              		.cfi_def_cfa_offset 16
 1022 0490 00AF     		add	r7, sp, #0
 1023              		.cfi_def_cfa_register 7
 251:Z:/EDA482_snake/labb5/snake\startup.c **** 	ascii_init();
 1024              		.loc 1 251 0
 1025 0492 FFF7FEFF 		bl	ascii_init
 252:Z:/EDA482_snake/labb5/snake\startup.c **** 	graphic_clear_screen();
 1026              		.loc 1 252 0
 1027 0496 FFF7FEFF 		bl	graphic_clear_screen
 253:Z:/EDA482_snake/labb5/snake\startup.c **** 	player.head = (POINT) {64, 32};
 1028              		.loc 1 253 0
 1029 049a 114B     		ldr	r3, .L40
 1030 049c 0221     		movs	r1, #2
 1031 049e 114A     		ldr	r2, .L40+4
 1032 04a0 1288     		ldrh	r2, [r2]
 1033 04a2 5A52     		strh	r2, [r3, r1]
 254:Z:/EDA482_snake/labb5/snake\startup.c **** 	player.tail->bottom = 0;
 1034              		.loc 1 254 0
 1035 04a4 0E4B     		ldr	r3, .L40
 1036 04a6 5B68     		ldr	r3, [r3, #4]
 1037 04a8 0022     		movs	r2, #0
 1038 04aa 9A60     		str	r2, [r3, #8]
 255:Z:/EDA482_snake/labb5/snake\startup.c **** 	player.tail->top = 0;
 1039              		.loc 1 255 0
 1040 04ac 0C4B     		ldr	r3, .L40
 1041 04ae 5B68     		ldr	r3, [r3, #4]
 1042 04b0 0022     		movs	r2, #0
 1043 04b2 5A60     		str	r2, [r3, #4]
 256:Z:/EDA482_snake/labb5/snake\startup.c **** 	buffer_unshift(player.tail, (POINT) {63,32});
 1044              		.loc 1 256 0
 1045 04b4 0A4B     		ldr	r3, .L40
 1046 04b6 5868     		ldr	r0, [r3, #4]
 1047 04b8 3B1D     		adds	r3, r7, #4
 1048 04ba 0B4A     		ldr	r2, .L40+8
 1049 04bc 1288     		ldrh	r2, [r2]
 1050 04be 1A80     		strh	r2, [r3]
 1051 04c0 3B1D     		adds	r3, r7, #4
 1052 04c2 1968     		ldr	r1, [r3]
 1053 04c4 FFF7FEFF 		bl	buffer_unshift
 257:Z:/EDA482_snake/labb5/snake\startup.c **** 	gen_food(rngState);
 1054              		.loc 1 257 0
 1055 04c8 084B     		ldr	r3, .L40+12
 1056 04ca 1B68     		ldr	r3, [r3]
 1057 04cc 1800     		movs	r0, r3
 1058 04ce FFF7FEFF 		bl	gen_food
 258:Z:/EDA482_snake/labb5/snake\startup.c **** 	points = 1;
 1059              		.loc 1 258 0
 1060 04d2 074B     		ldr	r3, .L40+16
 1061 04d4 0122     		movs	r2, #1
 1062 04d6 1A70     		strb	r2, [r3]
 259:Z:/EDA482_snake/labb5/snake\startup.c **** }
 1063              		.loc 1 259 0
 1064 04d8 C046     		nop
 1065 04da BD46     		mov	sp, r7
 1066 04dc 02B0     		add	sp, sp, #8
 1067              		@ sp needed
 1068 04de 80BD     		pop	{r7, pc}
 1069              	.L41:
 1070              		.align	2
 1071              	.L40:
 1072 04e0 00000000 		.word	player
 1073 04e4 0C000000 		.word	.LC0
 1074 04e8 10000000 		.word	.LC1
 1075 04ec 00000000 		.word	rngState
 1076 04f0 00000000 		.word	points
 1077              		.cfi_endproc
 1078              	.LFE11:
 1080              		.section	.rodata
 1081 0012 0000     		.align	2
 1082              	.LC17:
 1083 0014 50726573 		.ascii	"Press 5 to play\000"
 1083      73203520 
 1083      746F2070 
 1083      6C617900 
 1084              		.align	2
 1085              	.LC19:
 1086 0024 61676169 		.ascii	"again!\000"
 1086      6E2100
 1087 002b 00       		.align	2
 1088              	.LC21:
 1089 002c 4C656E67 		.ascii	"Length: 1\000"
 1089      74683A20 
 1089      3100
 1090 0036 0000     		.align	2
 1091              	.LC25:
 1092 0038 47414D45 		.ascii	"GAME OVER!\000"
 1092      204F5645 
 1092      522100
 1093              		.text
 1094              		.align	1
 1095              		.global	main
 1096              		.syntax unified
 1097              		.code	16
 1098              		.thumb_func
 1099              		.fpu softvfp
 1101              	main:
 1102              	.LFB12:
 260:Z:/EDA482_snake/labb5/snake\startup.c **** 
 261:Z:/EDA482_snake/labb5/snake\startup.c **** int main(void) {
 1103              		.loc 1 261 0
 1104              		.cfi_startproc
 1105              		@ args = 0, pretend = 0, frame = 8
 1106              		@ frame_needed = 1, uses_anonymous_args = 0
 1107 04f4 90B5     		push	{r4, r7, lr}
 1108              		.cfi_def_cfa_offset 12
 1109              		.cfi_offset 4, -12
 1110              		.cfi_offset 7, -8
 1111              		.cfi_offset 14, -4
 1112 04f6 83B0     		sub	sp, sp, #12
 1113              		.cfi_def_cfa_offset 24
 1114 04f8 00AF     		add	r7, sp, #0
 1115              		.cfi_def_cfa_register 7
 262:Z:/EDA482_snake/labb5/snake\startup.c **** 	app_init();
 1116              		.loc 1 262 0
 1117 04fa FFF7FEFF 		bl	app_init
 1118              	.L53:
 263:Z:/EDA482_snake/labb5/snake\startup.c **** 	while(true){
 264:Z:/EDA482_snake/labb5/snake\startup.c **** 		app_reset();
 1119              		.loc 1 264 0
 1120 04fe FFF7FEFF 		bl	app_reset
 265:Z:/EDA482_snake/labb5/snake\startup.c **** 		player.draw(&player);
 1121              		.loc 1 265 0
 1122 0502 324B     		ldr	r3, .L57
 1123 0504 DB68     		ldr	r3, [r3, #12]
 1124 0506 314A     		ldr	r2, .L57
 1125 0508 1000     		movs	r0, r2
 1126 050a 9847     		blx	r3
 1127              	.LVL1:
 266:Z:/EDA482_snake/labb5/snake\startup.c **** 		ascii_gotoxy(1,1);
 1128              		.loc 1 266 0
 1129 050c 0121     		movs	r1, #1
 1130 050e 0120     		movs	r0, #1
 1131 0510 FFF7FEFF 		bl	ascii_gotoxy
 267:Z:/EDA482_snake/labb5/snake\startup.c **** 		ascii_write_string("Press 5 to play");
 1132              		.loc 1 267 0
 1133 0514 2E4B     		ldr	r3, .L57+4
 1134 0516 1800     		movs	r0, r3
 1135 0518 FFF7FEFF 		bl	ascii_write_string
 268:Z:/EDA482_snake/labb5/snake\startup.c **** 		ascii_gotoxy(1,2);
 1136              		.loc 1 268 0
 1137 051c 0221     		movs	r1, #2
 1138 051e 0120     		movs	r0, #1
 1139 0520 FFF7FEFF 		bl	ascii_gotoxy
 269:Z:/EDA482_snake/labb5/snake\startup.c **** 		ascii_write_string("again!");
 1140              		.loc 1 269 0
 1141 0524 2B4B     		ldr	r3, .L57+8
 1142 0526 1800     		movs	r0, r3
 1143 0528 FFF7FEFF 		bl	ascii_write_string
 270:Z:/EDA482_snake/labb5/snake\startup.c **** 		while (kread_keypad(GPIO_D) != 5);
 1144              		.loc 1 270 0
 1145 052c C046     		nop
 1146              	.L43:
 1147              		.loc 1 270 0 is_stmt 0 discriminator 1
 1148 052e 2A4B     		ldr	r3, .L57+12
 1149 0530 1800     		movs	r0, r3
 1150 0532 FFF7FEFF 		bl	kread_keypad
 1151 0536 0300     		movs	r3, r0
 1152 0538 052B     		cmp	r3, #5
 1153 053a F8D1     		bne	.L43
 271:Z:/EDA482_snake/labb5/snake\startup.c **** 		ascii_init();
 1154              		.loc 1 271 0 is_stmt 1
 1155 053c FFF7FEFF 		bl	ascii_init
 272:Z:/EDA482_snake/labb5/snake\startup.c **** 		ascii_write_string("Length: 1");
 1156              		.loc 1 272 0
 1157 0540 264B     		ldr	r3, .L57+16
 1158 0542 1800     		movs	r0, r3
 1159 0544 FFF7FEFF 		bl	ascii_write_string
 1160              	.L52:
 1161              	.LBB4:
 273:Z:/EDA482_snake/labb5/snake\startup.c **** 		
 274:Z:/EDA482_snake/labb5/snake\startup.c **** 		while (true) {
 275:Z:/EDA482_snake/labb5/snake\startup.c **** 			// Grejer som ska göras varje gametick;
 276:Z:/EDA482_snake/labb5/snake\startup.c **** 			player.move(&player);
 1162              		.loc 1 276 0
 1163 0548 204B     		ldr	r3, .L57
 1164 054a 9B68     		ldr	r3, [r3, #8]
 1165 054c 1F4A     		ldr	r2, .L57
 1166 054e 1000     		movs	r0, r2
 1167 0550 9847     		blx	r3
 1168              	.LVL2:
 277:Z:/EDA482_snake/labb5/snake\startup.c **** 			
 278:Z:/EDA482_snake/labb5/snake\startup.c **** 			
 279:Z:/EDA482_snake/labb5/snake\startup.c **** 			
 280:Z:/EDA482_snake/labb5/snake\startup.c **** 			nb_delay(10000); // Calla inte delay efter det här
 1169              		.loc 1 280 0
 1170 0552 234B     		ldr	r3, .L57+20
 1171 0554 1800     		movs	r0, r3
 1172 0556 FFF7FEFF 		bl	nb_delay
 1173              	.L46:
 281:Z:/EDA482_snake/labb5/snake\startup.c **** 			while (true) {
 282:Z:/EDA482_snake/labb5/snake\startup.c **** 				// Grejer som kan göras medans delay är igång (INTE GREJER SOM KRÄVER DELAY)
 283:Z:/EDA482_snake/labb5/snake\startup.c **** 				if (systick_flag) {
 1174              		.loc 1 283 0
 1175 055a 224B     		ldr	r3, .L57+24
 1176 055c 1B78     		ldrb	r3, [r3]
 1177 055e DBB2     		uxtb	r3, r3
 1178 0560 002B     		cmp	r3, #0
 1179 0562 00D1     		bne	.L56
 1180 0564 F9E7     		b	.L46
 1181              	.L56:
 284:Z:/EDA482_snake/labb5/snake\startup.c **** 					break;
 1182              		.loc 1 284 0
 1183 0566 C046     		nop
 285:Z:/EDA482_snake/labb5/snake\startup.c **** 				}
 286:Z:/EDA482_snake/labb5/snake\startup.c **** 			} // Nu är det fine att calla delay igen
 287:Z:/EDA482_snake/labb5/snake\startup.c **** 			uint8_t c = kread_keypad(GPIO_D);
 1184              		.loc 1 287 0
 1185 0568 FC1D     		adds	r4, r7, #7
 1186 056a 1B4B     		ldr	r3, .L57+12
 1187 056c 1800     		movs	r0, r3
 1188 056e FFF7FEFF 		bl	kread_keypad
 1189 0572 0300     		movs	r3, r0
 1190 0574 2370     		strb	r3, [r4]
 288:Z:/EDA482_snake/labb5/snake\startup.c **** 			switch(c) {
 1191              		.loc 1 288 0
 1192 0576 FB1D     		adds	r3, r7, #7
 1193 0578 1B78     		ldrb	r3, [r3]
 1194 057a 042B     		cmp	r3, #4
 1195 057c 02D0     		beq	.L48
 1196 057e 062B     		cmp	r3, #6
 1197 0580 06D0     		beq	.L49
 1198 0582 0BE0     		b	.L47
 1199              	.L48:
 289:Z:/EDA482_snake/labb5/snake\startup.c **** 				case 4: 
 290:Z:/EDA482_snake/labb5/snake\startup.c **** 					player.turn_left(&player);
 1200              		.loc 1 290 0
 1201 0584 114B     		ldr	r3, .L57
 1202 0586 1B69     		ldr	r3, [r3, #16]
 1203 0588 104A     		ldr	r2, .L57
 1204 058a 1000     		movs	r0, r2
 1205 058c 9847     		blx	r3
 1206              	.LVL3:
 291:Z:/EDA482_snake/labb5/snake\startup.c **** 					break;
 1207              		.loc 1 291 0
 1208 058e 05E0     		b	.L47
 1209              	.L49:
 292:Z:/EDA482_snake/labb5/snake\startup.c **** 				case 6:
 293:Z:/EDA482_snake/labb5/snake\startup.c **** 					player.turn_right(&player);
 1210              		.loc 1 293 0
 1211 0590 0E4B     		ldr	r3, .L57
 1212 0592 5B69     		ldr	r3, [r3, #20]
 1213 0594 0D4A     		ldr	r2, .L57
 1214 0596 1000     		movs	r0, r2
 1215 0598 9847     		blx	r3
 1216              	.LVL4:
 294:Z:/EDA482_snake/labb5/snake\startup.c **** 					break;
 1217              		.loc 1 294 0
 1218 059a C046     		nop
 1219              	.L47:
 295:Z:/EDA482_snake/labb5/snake\startup.c **** 			}
 296:Z:/EDA482_snake/labb5/snake\startup.c **** 			if (GAME_OVER) {
 1220              		.loc 1 296 0
 1221 059c 124B     		ldr	r3, .L57+28
 1222 059e 1B78     		ldrb	r3, [r3]
 1223 05a0 002B     		cmp	r3, #0
 1224 05a2 D1D0     		beq	.L52
 297:Z:/EDA482_snake/labb5/snake\startup.c **** 				ascii_gotoxy(1,1);
 1225              		.loc 1 297 0
 1226 05a4 0121     		movs	r1, #1
 1227 05a6 0120     		movs	r0, #1
 1228 05a8 FFF7FEFF 		bl	ascii_gotoxy
 298:Z:/EDA482_snake/labb5/snake\startup.c **** 				ascii_init();
 1229              		.loc 1 298 0
 1230 05ac FFF7FEFF 		bl	ascii_init
 299:Z:/EDA482_snake/labb5/snake\startup.c **** 				ascii_write_string("GAME OVER!");
 1231              		.loc 1 299 0
 1232 05b0 0E4B     		ldr	r3, .L57+32
 1233 05b2 1800     		movs	r0, r3
 1234 05b4 FFF7FEFF 		bl	ascii_write_string
 300:Z:/EDA482_snake/labb5/snake\startup.c **** 				delay_millis(200000);
 1235              		.loc 1 300 0
 1236 05b8 0D4B     		ldr	r3, .L57+36
 1237 05ba 1800     		movs	r0, r3
 1238 05bc FFF7FEFF 		bl	delay_millis
 301:Z:/EDA482_snake/labb5/snake\startup.c **** 				GAME_OVER = false;
 1239              		.loc 1 301 0
 1240 05c0 094B     		ldr	r3, .L57+28
 1241 05c2 0022     		movs	r2, #0
 1242 05c4 1A70     		strb	r2, [r3]
 302:Z:/EDA482_snake/labb5/snake\startup.c **** 				break;
 1243              		.loc 1 302 0
 1244 05c6 C046     		nop
 1245              	.LBE4:
 264:Z:/EDA482_snake/labb5/snake\startup.c **** 		player.draw(&player);
 1246              		.loc 1 264 0
 1247 05c8 99E7     		b	.L53
 1248              	.L58:
 1249 05ca C046     		.align	2
 1250              	.L57:
 1251 05cc 00000000 		.word	player
 1252 05d0 14000000 		.word	.LC17
 1253 05d4 24000000 		.word	.LC19
 1254 05d8 000C0240 		.word	1073875968
 1255 05dc 2C000000 		.word	.LC21
 1256 05e0 10270000 		.word	10000
 1257 05e4 00000000 		.word	systick_flag
 1258 05e8 00000000 		.word	GAME_OVER
 1259 05ec 38000000 		.word	.LC25
 1260 05f0 400D0300 		.word	200000
 1261              		.cfi_endproc
 1262              	.LFE12:
 1264              	.Letext0:
 1265              		.file 2 "c:\\cseapp\\codelite\\tools\\gcc-arm\\arm-none-eabi\\include\\machine\\_default_types.h"
 1266              		.file 3 "c:\\cseapp\\codelite\\tools\\gcc-arm\\arm-none-eabi\\include\\sys\\_stdint.h"
 1267              		.file 4 "Z:\\EDA482\\libs\\include/libGPIO.h"
 1268              		.file 5 "Z:/EDA482_snake/labb5/snake/PellesSuperRng.h"
