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
  25              		.file 1 "Z:/EDA482_snake/labb5/circular_buffer/startup.c"
   1:Z:/EDA482_snake/labb5/circular_buffer\startup.c **** /*
   2:Z:/EDA482_snake/labb5/circular_buffer\startup.c ****  * 	startup.c
   3:Z:/EDA482_snake/labb5/circular_buffer\startup.c ****  *
   4:Z:/EDA482_snake/labb5/circular_buffer\startup.c ****  */
   5:Z:/EDA482_snake/labb5/circular_buffer\startup.c ****  
   6:Z:/EDA482_snake/labb5/circular_buffer\startup.c ****  #include <stdint.h>
   7:Z:/EDA482_snake/labb5/circular_buffer\startup.c **** void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
   8:Z:/EDA482_snake/labb5/circular_buffer\startup.c **** 
   9:Z:/EDA482_snake/labb5/circular_buffer\startup.c **** void startup ( void )
  10:Z:/EDA482_snake/labb5/circular_buffer\startup.c **** {
  26              		.loc 1 10 0
  27              		.cfi_startproc
  28              		@ Naked Function: prologue and epilogue provided by programmer.
  29              		@ args = 0, pretend = 0, frame = 0
  30              		@ frame_needed = 1, uses_anonymous_args = 0
  11:Z:/EDA482_snake/labb5/circular_buffer\startup.c **** __asm volatile(
  31              		.loc 1 11 0
  32              		.syntax divided
  33              	@ 11 "Z:/EDA482_snake/labb5/circular_buffer/startup.c" 1
  34 0000 0248     		 LDR R0,=0x2001C000
  35 0002 8546     	 MOV SP,R0
  36 0004 FFF7FEFF 	 BL main
  37 0008 FEE7     	_exit: B .
  38              	
  39              	@ 0 "" 2
  12:Z:/EDA482_snake/labb5/circular_buffer\startup.c **** 	" LDR R0,=0x2001C000\n"		/* set stack */
  13:Z:/EDA482_snake/labb5/circular_buffer\startup.c **** 	" MOV SP,R0\n"
  14:Z:/EDA482_snake/labb5/circular_buffer\startup.c **** 	" BL main\n"				/* call main */
  15:Z:/EDA482_snake/labb5/circular_buffer\startup.c **** 	"_exit: B .\n"				/* never return */
  16:Z:/EDA482_snake/labb5/circular_buffer\startup.c **** 	) ;
  17:Z:/EDA482_snake/labb5/circular_buffer\startup.c **** }
  40              		.loc 1 17 0
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
  18:Z:/EDA482_snake/labb5/circular_buffer\startup.c **** 
  19:Z:/EDA482_snake/labb5/circular_buffer\startup.c **** typedef struct {
  20:Z:/EDA482_snake/labb5/circular_buffer\startup.c ****     uint8_t* buffer;
  21:Z:/EDA482_snake/labb5/circular_buffer\startup.c ****     int top;
  22:Z:/EDA482_snake/labb5/circular_buffer\startup.c ****     int bottom;
  23:Z:/EDA482_snake/labb5/circular_buffer\startup.c **** 	int maxlen;
  24:Z:/EDA482_snake/labb5/circular_buffer\startup.c **** } circular_buffer;
  25:Z:/EDA482_snake/labb5/circular_buffer\startup.c **** 
  26:Z:/EDA482_snake/labb5/circular_buffer\startup.c **** int buffer_push(circular_buffer* c, uint8_t data)
  27:Z:/EDA482_snake/labb5/circular_buffer\startup.c **** {
  57              		.loc 1 27 0
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
  70 0008 0A00     		movs	r2, r1
  71 000a FB1C     		adds	r3, r7, #3
  72 000c 1A70     		strb	r2, [r3]
  28:Z:/EDA482_snake/labb5/circular_buffer\startup.c ****     int next;
  29:Z:/EDA482_snake/labb5/circular_buffer\startup.c **** 
  30:Z:/EDA482_snake/labb5/circular_buffer\startup.c ****     next = c->top + 1;  // next is where top will point to after this write.
  73              		.loc 1 30 0
  74 000e 7B68     		ldr	r3, [r7, #4]
  75 0010 5B68     		ldr	r3, [r3, #4]
  76 0012 0133     		adds	r3, r3, #1
  77 0014 FB60     		str	r3, [r7, #12]
  31:Z:/EDA482_snake/labb5/circular_buffer\startup.c ****     if (next >= c->maxlen)
  78              		.loc 1 31 0
  79 0016 7B68     		ldr	r3, [r7, #4]
  80 0018 DB68     		ldr	r3, [r3, #12]
  81 001a FA68     		ldr	r2, [r7, #12]
  82 001c 9A42     		cmp	r2, r3
  83 001e 01DB     		blt	.L3
  32:Z:/EDA482_snake/labb5/circular_buffer\startup.c ****         next = 0;
  84              		.loc 1 32 0
  85 0020 0023     		movs	r3, #0
  86 0022 FB60     		str	r3, [r7, #12]
  87              	.L3:
  33:Z:/EDA482_snake/labb5/circular_buffer\startup.c **** 
  34:Z:/EDA482_snake/labb5/circular_buffer\startup.c ****     if (next == c->bottom)  // if the top + 1 == bottom, circular buffer is full
  88              		.loc 1 34 0
  89 0024 7B68     		ldr	r3, [r7, #4]
  90 0026 9B68     		ldr	r3, [r3, #8]
  91 0028 FA68     		ldr	r2, [r7, #12]
  92 002a 9A42     		cmp	r2, r3
  93 002c 02D1     		bne	.L4
  35:Z:/EDA482_snake/labb5/circular_buffer\startup.c ****         return -1;
  94              		.loc 1 35 0
  95 002e 0123     		movs	r3, #1
  96 0030 5B42     		rsbs	r3, r3, #0
  97 0032 0BE0     		b	.L5
  98              	.L4:
  36:Z:/EDA482_snake/labb5/circular_buffer\startup.c **** 
  37:Z:/EDA482_snake/labb5/circular_buffer\startup.c ****     c->buffer[c->top] = data;  // Load data and then move
  99              		.loc 1 37 0
 100 0034 7B68     		ldr	r3, [r7, #4]
 101 0036 1A68     		ldr	r2, [r3]
 102 0038 7B68     		ldr	r3, [r7, #4]
 103 003a 5B68     		ldr	r3, [r3, #4]
 104 003c D318     		adds	r3, r2, r3
 105 003e FA1C     		adds	r2, r7, #3
 106 0040 1278     		ldrb	r2, [r2]
 107 0042 1A70     		strb	r2, [r3]
  38:Z:/EDA482_snake/labb5/circular_buffer\startup.c ****     c->top = next;             // top to next data offset.
 108              		.loc 1 38 0
 109 0044 7B68     		ldr	r3, [r7, #4]
 110 0046 FA68     		ldr	r2, [r7, #12]
 111 0048 5A60     		str	r2, [r3, #4]
  39:Z:/EDA482_snake/labb5/circular_buffer\startup.c ****     return 0;  // return success to indicate successful push.
 112              		.loc 1 39 0
 113 004a 0023     		movs	r3, #0
 114              	.L5:
  40:Z:/EDA482_snake/labb5/circular_buffer\startup.c **** }
 115              		.loc 1 40 0
 116 004c 1800     		movs	r0, r3
 117 004e BD46     		mov	sp, r7
 118 0050 04B0     		add	sp, sp, #16
 119              		@ sp needed
 120 0052 80BD     		pop	{r7, pc}
 121              		.cfi_endproc
 122              	.LFE1:
 124              		.align	1
 125              		.global	buffer_pop
 126              		.syntax unified
 127              		.code	16
 128              		.thumb_func
 129              		.fpu softvfp
 131              	buffer_pop:
 132              	.LFB2:
  41:Z:/EDA482_snake/labb5/circular_buffer\startup.c **** 
  42:Z:/EDA482_snake/labb5/circular_buffer\startup.c **** int buffer_pop(circular_buffer *c, uint8_t* data)
  43:Z:/EDA482_snake/labb5/circular_buffer\startup.c **** {
 133              		.loc 1 43 0
 134              		.cfi_startproc
 135              		@ args = 0, pretend = 0, frame = 16
 136              		@ frame_needed = 1, uses_anonymous_args = 0
 137 0054 80B5     		push	{r7, lr}
 138              		.cfi_def_cfa_offset 8
 139              		.cfi_offset 7, -8
 140              		.cfi_offset 14, -4
 141 0056 84B0     		sub	sp, sp, #16
 142              		.cfi_def_cfa_offset 24
 143 0058 00AF     		add	r7, sp, #0
 144              		.cfi_def_cfa_register 7
 145 005a 7860     		str	r0, [r7, #4]
 146 005c 3960     		str	r1, [r7]
  44:Z:/EDA482_snake/labb5/circular_buffer\startup.c ****     int next;
  45:Z:/EDA482_snake/labb5/circular_buffer\startup.c **** 
  46:Z:/EDA482_snake/labb5/circular_buffer\startup.c ****     if (c->top == c->bottom)  // if the top == bottom, we don't have any data
 147              		.loc 1 46 0
 148 005e 7B68     		ldr	r3, [r7, #4]
 149 0060 5A68     		ldr	r2, [r3, #4]
 150 0062 7B68     		ldr	r3, [r7, #4]
 151 0064 9B68     		ldr	r3, [r3, #8]
 152 0066 9A42     		cmp	r2, r3
 153 0068 02D1     		bne	.L7
  47:Z:/EDA482_snake/labb5/circular_buffer\startup.c ****         return -1;
 154              		.loc 1 47 0
 155 006a 0123     		movs	r3, #1
 156 006c 5B42     		rsbs	r3, r3, #0
 157 006e 16E0     		b	.L8
 158              	.L7:
  48:Z:/EDA482_snake/labb5/circular_buffer\startup.c **** 
  49:Z:/EDA482_snake/labb5/circular_buffer\startup.c ****     next = c->top - 1;  // next is where bottom will point to after this read.
 159              		.loc 1 49 0
 160 0070 7B68     		ldr	r3, [r7, #4]
 161 0072 5B68     		ldr	r3, [r3, #4]
 162 0074 013B     		subs	r3, r3, #1
 163 0076 FB60     		str	r3, [r7, #12]
  50:Z:/EDA482_snake/labb5/circular_buffer\startup.c ****     if(next < 0)
 164              		.loc 1 50 0
 165 0078 FB68     		ldr	r3, [r7, #12]
 166 007a 002B     		cmp	r3, #0
 167 007c 03DA     		bge	.L9
  51:Z:/EDA482_snake/labb5/circular_buffer\startup.c ****         next = c->maxlen - 1;
 168              		.loc 1 51 0
 169 007e 7B68     		ldr	r3, [r7, #4]
 170 0080 DB68     		ldr	r3, [r3, #12]
 171 0082 013B     		subs	r3, r3, #1
 172 0084 FB60     		str	r3, [r7, #12]
 173              	.L9:
  52:Z:/EDA482_snake/labb5/circular_buffer\startup.c **** 	c->top = next; // move
 174              		.loc 1 52 0
 175 0086 7B68     		ldr	r3, [r7, #4]
 176 0088 FA68     		ldr	r2, [r7, #12]
 177 008a 5A60     		str	r2, [r3, #4]
  53:Z:/EDA482_snake/labb5/circular_buffer\startup.c ****     *data = c->buffer[c->top];  // Read data
 178              		.loc 1 53 0
 179 008c 7B68     		ldr	r3, [r7, #4]
 180 008e 1A68     		ldr	r2, [r3]
 181 0090 7B68     		ldr	r3, [r7, #4]
 182 0092 5B68     		ldr	r3, [r3, #4]
 183 0094 D318     		adds	r3, r2, r3
 184 0096 1A78     		ldrb	r2, [r3]
 185 0098 3B68     		ldr	r3, [r7]
 186 009a 1A70     		strb	r2, [r3]
  54:Z:/EDA482_snake/labb5/circular_buffer\startup.c ****     return 0;  // return success to indicate successful push.
 187              		.loc 1 54 0
 188 009c 0023     		movs	r3, #0
 189              	.L8:
  55:Z:/EDA482_snake/labb5/circular_buffer\startup.c **** }
 190              		.loc 1 55 0
 191 009e 1800     		movs	r0, r3
 192 00a0 BD46     		mov	sp, r7
 193 00a2 04B0     		add	sp, sp, #16
 194              		@ sp needed
 195 00a4 80BD     		pop	{r7, pc}
 196              		.cfi_endproc
 197              	.LFE2:
 199              		.align	1
 200              		.global	buffer_unshift
 201              		.syntax unified
 202              		.code	16
 203              		.thumb_func
 204              		.fpu softvfp
 206              	buffer_unshift:
 207              	.LFB3:
  56:Z:/EDA482_snake/labb5/circular_buffer\startup.c **** 
  57:Z:/EDA482_snake/labb5/circular_buffer\startup.c **** int buffer_unshift(circular_buffer* c, uint8_t data) {
 208              		.loc 1 57 0
 209              		.cfi_startproc
 210              		@ args = 0, pretend = 0, frame = 16
 211              		@ frame_needed = 1, uses_anonymous_args = 0
 212 00a6 80B5     		push	{r7, lr}
 213              		.cfi_def_cfa_offset 8
 214              		.cfi_offset 7, -8
 215              		.cfi_offset 14, -4
 216 00a8 84B0     		sub	sp, sp, #16
 217              		.cfi_def_cfa_offset 24
 218 00aa 00AF     		add	r7, sp, #0
 219              		.cfi_def_cfa_register 7
 220 00ac 7860     		str	r0, [r7, #4]
 221 00ae 0A00     		movs	r2, r1
 222 00b0 FB1C     		adds	r3, r7, #3
 223 00b2 1A70     		strb	r2, [r3]
  58:Z:/EDA482_snake/labb5/circular_buffer\startup.c **** 	int next;
  59:Z:/EDA482_snake/labb5/circular_buffer\startup.c **** 
  60:Z:/EDA482_snake/labb5/circular_buffer\startup.c ****     next = c->bottom - 1;  // next is where bottom will point to after this write.
 224              		.loc 1 60 0
 225 00b4 7B68     		ldr	r3, [r7, #4]
 226 00b6 9B68     		ldr	r3, [r3, #8]
 227 00b8 013B     		subs	r3, r3, #1
 228 00ba FB60     		str	r3, [r7, #12]
  61:Z:/EDA482_snake/labb5/circular_buffer\startup.c ****     if (next < 0)
 229              		.loc 1 61 0
 230 00bc FB68     		ldr	r3, [r7, #12]
 231 00be 002B     		cmp	r3, #0
 232 00c0 03DA     		bge	.L11
  62:Z:/EDA482_snake/labb5/circular_buffer\startup.c ****         next = c->maxlen-1;
 233              		.loc 1 62 0
 234 00c2 7B68     		ldr	r3, [r7, #4]
 235 00c4 DB68     		ldr	r3, [r3, #12]
 236 00c6 013B     		subs	r3, r3, #1
 237 00c8 FB60     		str	r3, [r7, #12]
 238              	.L11:
  63:Z:/EDA482_snake/labb5/circular_buffer\startup.c **** 
  64:Z:/EDA482_snake/labb5/circular_buffer\startup.c ****     if (next == c->top)  // if the bottom - 1 == top, circular buffer is full
 239              		.loc 1 64 0
 240 00ca 7B68     		ldr	r3, [r7, #4]
 241 00cc 5B68     		ldr	r3, [r3, #4]
 242 00ce FA68     		ldr	r2, [r7, #12]
 243 00d0 9A42     		cmp	r2, r3
 244 00d2 02D1     		bne	.L12
  65:Z:/EDA482_snake/labb5/circular_buffer\startup.c ****         return -1;
 245              		.loc 1 65 0
 246 00d4 0123     		movs	r3, #1
 247 00d6 5B42     		rsbs	r3, r3, #0
 248 00d8 0BE0     		b	.L13
 249              	.L12:
  66:Z:/EDA482_snake/labb5/circular_buffer\startup.c **** 
  67:Z:/EDA482_snake/labb5/circular_buffer\startup.c ****     c->buffer[c->bottom] = data;  // Load data and then move
 250              		.loc 1 67 0
 251 00da 7B68     		ldr	r3, [r7, #4]
 252 00dc 1A68     		ldr	r2, [r3]
 253 00de 7B68     		ldr	r3, [r7, #4]
 254 00e0 9B68     		ldr	r3, [r3, #8]
 255 00e2 D318     		adds	r3, r2, r3
 256 00e4 FA1C     		adds	r2, r7, #3
 257 00e6 1278     		ldrb	r2, [r2]
 258 00e8 1A70     		strb	r2, [r3]
  68:Z:/EDA482_snake/labb5/circular_buffer\startup.c ****     c->bottom = next;             // top to next data offset.
 259              		.loc 1 68 0
 260 00ea 7B68     		ldr	r3, [r7, #4]
 261 00ec FA68     		ldr	r2, [r7, #12]
 262 00ee 9A60     		str	r2, [r3, #8]
  69:Z:/EDA482_snake/labb5/circular_buffer\startup.c ****     return 0; 					 // return success to indicate successful push.
 263              		.loc 1 69 0
 264 00f0 0023     		movs	r3, #0
 265              	.L13:
  70:Z:/EDA482_snake/labb5/circular_buffer\startup.c **** }
 266              		.loc 1 70 0
 267 00f2 1800     		movs	r0, r3
 268 00f4 BD46     		mov	sp, r7
 269 00f6 04B0     		add	sp, sp, #16
 270              		@ sp needed
 271 00f8 80BD     		pop	{r7, pc}
 272              		.cfi_endproc
 273              	.LFE3:
 275              		.align	1
 276              		.global	buffer_shift
 277              		.syntax unified
 278              		.code	16
 279              		.thumb_func
 280              		.fpu softvfp
 282              	buffer_shift:
 283              	.LFB4:
  71:Z:/EDA482_snake/labb5/circular_buffer\startup.c **** 
  72:Z:/EDA482_snake/labb5/circular_buffer\startup.c **** 
  73:Z:/EDA482_snake/labb5/circular_buffer\startup.c **** int buffer_shift(circular_buffer* c, uint8_t *data) {
 284              		.loc 1 73 0
 285              		.cfi_startproc
 286              		@ args = 0, pretend = 0, frame = 16
 287              		@ frame_needed = 1, uses_anonymous_args = 0
 288 00fa 80B5     		push	{r7, lr}
 289              		.cfi_def_cfa_offset 8
 290              		.cfi_offset 7, -8
 291              		.cfi_offset 14, -4
 292 00fc 84B0     		sub	sp, sp, #16
 293              		.cfi_def_cfa_offset 24
 294 00fe 00AF     		add	r7, sp, #0
 295              		.cfi_def_cfa_register 7
 296 0100 7860     		str	r0, [r7, #4]
 297 0102 3960     		str	r1, [r7]
  74:Z:/EDA482_snake/labb5/circular_buffer\startup.c ****     int next;
  75:Z:/EDA482_snake/labb5/circular_buffer\startup.c **** 
  76:Z:/EDA482_snake/labb5/circular_buffer\startup.c ****     if (c->top == c->bottom)  // if the top == bottom, we don't have any data
 298              		.loc 1 76 0
 299 0104 7B68     		ldr	r3, [r7, #4]
 300 0106 5A68     		ldr	r2, [r3, #4]
 301 0108 7B68     		ldr	r3, [r7, #4]
 302 010a 9B68     		ldr	r3, [r3, #8]
 303 010c 9A42     		cmp	r2, r3
 304 010e 02D1     		bne	.L15
  77:Z:/EDA482_snake/labb5/circular_buffer\startup.c ****         return -1;
 305              		.loc 1 77 0
 306 0110 0123     		movs	r3, #1
 307 0112 5B42     		rsbs	r3, r3, #0
 308 0114 16E0     		b	.L16
 309              	.L15:
  78:Z:/EDA482_snake/labb5/circular_buffer\startup.c **** 
  79:Z:/EDA482_snake/labb5/circular_buffer\startup.c ****     next = c->bottom + 1;  // next is where bottom will point to after this read.
 310              		.loc 1 79 0
 311 0116 7B68     		ldr	r3, [r7, #4]
 312 0118 9B68     		ldr	r3, [r3, #8]
 313 011a 0133     		adds	r3, r3, #1
 314 011c FB60     		str	r3, [r7, #12]
  80:Z:/EDA482_snake/labb5/circular_buffer\startup.c ****     if(next >= c->maxlen)
 315              		.loc 1 80 0
 316 011e 7B68     		ldr	r3, [r7, #4]
 317 0120 DB68     		ldr	r3, [r3, #12]
 318 0122 FA68     		ldr	r2, [r7, #12]
 319 0124 9A42     		cmp	r2, r3
 320 0126 01DB     		blt	.L17
  81:Z:/EDA482_snake/labb5/circular_buffer\startup.c ****         next = 0;
 321              		.loc 1 81 0
 322 0128 0023     		movs	r3, #0
 323 012a FB60     		str	r3, [r7, #12]
 324              	.L17:
  82:Z:/EDA482_snake/labb5/circular_buffer\startup.c **** 		
  83:Z:/EDA482_snake/labb5/circular_buffer\startup.c **** 	c->bottom = next; 
 325              		.loc 1 83 0
 326 012c 7B68     		ldr	r3, [r7, #4]
 327 012e FA68     		ldr	r2, [r7, #12]
 328 0130 9A60     		str	r2, [r3, #8]
  84:Z:/EDA482_snake/labb5/circular_buffer\startup.c ****     *data = c->buffer[c->bottom];  // Read data and then move
 329              		.loc 1 84 0
 330 0132 7B68     		ldr	r3, [r7, #4]
 331 0134 1A68     		ldr	r2, [r3]
 332 0136 7B68     		ldr	r3, [r7, #4]
 333 0138 9B68     		ldr	r3, [r3, #8]
 334 013a D318     		adds	r3, r2, r3
 335 013c 1A78     		ldrb	r2, [r3]
 336 013e 3B68     		ldr	r3, [r7]
 337 0140 1A70     		strb	r2, [r3]
  85:Z:/EDA482_snake/labb5/circular_buffer\startup.c ****                  // bottom to next offset.
  86:Z:/EDA482_snake/labb5/circular_buffer\startup.c ****     return 0;  // return success to indicate successful push.
 338              		.loc 1 86 0
 339 0142 0023     		movs	r3, #0
 340              	.L16:
  87:Z:/EDA482_snake/labb5/circular_buffer\startup.c **** }
 341              		.loc 1 87 0
 342 0144 1800     		movs	r0, r3
 343 0146 BD46     		mov	sp, r7
 344 0148 04B0     		add	sp, sp, #16
 345              		@ sp needed
 346 014a 80BD     		pop	{r7, pc}
 347              		.cfi_endproc
 348              	.LFE4:
 350              		.bss
 351              		.align	2
 352              	arr:
 353 0000 00000000 		.space	10
 353      00000000 
 353      0000
 355              		.data
 356              		.align	2
 359              	buff:
 360 0000 00000000 		.word	arr
 361 0004 00000000 		.word	0
 362 0008 00000000 		.word	0
 363 000c 0A000000 		.word	10
 364              		.text
 365              		.align	1
 366              		.global	main
 367              		.syntax unified
 368              		.code	16
 369              		.thumb_func
 370              		.fpu softvfp
 372              	main:
 373              	.LFB5:
  88:Z:/EDA482_snake/labb5/circular_buffer\startup.c **** 
  89:Z:/EDA482_snake/labb5/circular_buffer\startup.c **** static uint8_t arr[10];
  90:Z:/EDA482_snake/labb5/circular_buffer\startup.c **** static circular_buffer buff = {
  91:Z:/EDA482_snake/labb5/circular_buffer\startup.c **** 	.buffer = arr,
  92:Z:/EDA482_snake/labb5/circular_buffer\startup.c **** 	.top = 0,
  93:Z:/EDA482_snake/labb5/circular_buffer\startup.c **** 	.bottom = 0,
  94:Z:/EDA482_snake/labb5/circular_buffer\startup.c **** 	.maxlen = 10
  95:Z:/EDA482_snake/labb5/circular_buffer\startup.c **** };
  96:Z:/EDA482_snake/labb5/circular_buffer\startup.c **** 
  97:Z:/EDA482_snake/labb5/circular_buffer\startup.c **** 
  98:Z:/EDA482_snake/labb5/circular_buffer\startup.c **** 
  99:Z:/EDA482_snake/labb5/circular_buffer\startup.c **** 
 100:Z:/EDA482_snake/labb5/circular_buffer\startup.c **** void main(void)
 101:Z:/EDA482_snake/labb5/circular_buffer\startup.c **** {
 374              		.loc 1 101 0
 375              		.cfi_startproc
 376              		@ args = 0, pretend = 0, frame = 8
 377              		@ frame_needed = 1, uses_anonymous_args = 0
 378 014c 80B5     		push	{r7, lr}
 379              		.cfi_def_cfa_offset 8
 380              		.cfi_offset 7, -8
 381              		.cfi_offset 14, -4
 382 014e 82B0     		sub	sp, sp, #8
 383              		.cfi_def_cfa_offset 16
 384 0150 00AF     		add	r7, sp, #0
 385              		.cfi_def_cfa_register 7
 102:Z:/EDA482_snake/labb5/circular_buffer\startup.c **** 	buffer_push(&buff, 5);
 386              		.loc 1 102 0
 387 0152 0D4B     		ldr	r3, .L19
 388 0154 0521     		movs	r1, #5
 389 0156 1800     		movs	r0, r3
 390 0158 FFF7FEFF 		bl	buffer_push
 103:Z:/EDA482_snake/labb5/circular_buffer\startup.c **** 	uint8_t tmp;
 104:Z:/EDA482_snake/labb5/circular_buffer\startup.c **** 	buffer_pop(&buff, &tmp);
 391              		.loc 1 104 0
 392 015c FA1D     		adds	r2, r7, #7
 393 015e 0A4B     		ldr	r3, .L19
 394 0160 1100     		movs	r1, r2
 395 0162 1800     		movs	r0, r3
 396 0164 FFF7FEFF 		bl	buffer_pop
 105:Z:/EDA482_snake/labb5/circular_buffer\startup.c **** 	buffer_unshift(&buff, 7);
 397              		.loc 1 105 0
 398 0168 074B     		ldr	r3, .L19
 399 016a 0721     		movs	r1, #7
 400 016c 1800     		movs	r0, r3
 401 016e FFF7FEFF 		bl	buffer_unshift
 106:Z:/EDA482_snake/labb5/circular_buffer\startup.c **** 	buffer_shift(&buff, &tmp);
 402              		.loc 1 106 0
 403 0172 FA1D     		adds	r2, r7, #7
 404 0174 044B     		ldr	r3, .L19
 405 0176 1100     		movs	r1, r2
 406 0178 1800     		movs	r0, r3
 407 017a FFF7FEFF 		bl	buffer_shift
 107:Z:/EDA482_snake/labb5/circular_buffer\startup.c **** }
 408              		.loc 1 107 0
 409 017e C046     		nop
 410 0180 BD46     		mov	sp, r7
 411 0182 02B0     		add	sp, sp, #8
 412              		@ sp needed
 413 0184 80BD     		pop	{r7, pc}
 414              	.L20:
 415 0186 C046     		.align	2
 416              	.L19:
 417 0188 00000000 		.word	buff
 418              		.cfi_endproc
 419              	.LFE5:
 421              	.Letext0:
 422              		.file 2 "c:\\cseapp\\codelite\\tools\\gcc-arm\\arm-none-eabi\\include\\machine\\_default_types.h"
 423              		.file 3 "c:\\cseapp\\codelite\\tools\\gcc-arm\\arm-none-eabi\\include\\sys\\_stdint.h"
