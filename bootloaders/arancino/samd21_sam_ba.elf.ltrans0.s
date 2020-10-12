	.cpu cortex-m0plus
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 4
	.eabi_attribute 34, 0
	.file	"<artificial>"
	.text
	.align	1
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	serial_is_rx_ready, %function
serial_is_rx_ready:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L2
	@ sp needed
	ldrb	r0, [r3, #24]
	lsls	r0, r0, #29
	lsrs	r0, r0, #31
	bx	lr
.L3:
	.align	2
.L2:
	.word	1107298304
	.size	serial_is_rx_ready, .-serial_is_rx_ready
	.align	1
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	serial_getc, %function
serial_getc:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
.L5:
	bl	serial_is_rx_ready
	cmp	r0, #0
	beq	.L5
	ldr	r3, .L12
	movs	r2, r3
.L6:
	ldrb	r1, [r3, #24]
	lsls	r1, r1, #29
	bpl	.L6
	ldrh	r1, [r3, #26]
	lsls	r1, r1, #31
	bmi	.L7
	ldrh	r1, [r3, #26]
	lsls	r1, r1, #30
	bmi	.L7
	ldrh	r3, [r3, #26]
.L7:
	ldrh	r0, [r2, #40]
	@ sp needed
	uxtb	r0, r0
	pop	{r4, pc}
.L13:
	.align	2
.L12:
	.word	1107298304
	.size	serial_getc, .-serial_getc
	.align	1
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	getbytes, %function
getbytes:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, lr}
	movs	r5, #0
	movs	r6, r0
	movs	r7, r1
	movs	r4, r5
.L18:
	bl	serial_getc
	ldr	r2, .L25
	ldrb	r3, [r2]
	cmp	r3, #0
	bne	.L19
	movs	r1, #255
	lsrs	r3, r4, #8
	ands	r1, r0
	eors	r3, r1
	lsls	r1, r4, #8
	ldr	r4, .L25+4
	lsls	r3, r3, #1
	ldrh	r4, [r3, r4]
	ldrh	r3, [r2, #2]
	eors	r4, r1
	uxth	r4, r4
	cmp	r3, #0
	bne	.L16
	ldrb	r2, [r2, #4]
	cmp	r2, #0
	beq	.L17
.L16:
	strb	r0, [r6]
	adds	r6, r6, #1
	cmp	r7, #128
	bne	.L17
	ldr	r2, .L25
	subs	r3, r3, #1
	strh	r3, [r2, #2]
.L17:
	adds	r5, r5, #1
	uxth	r5, r5
	cmp	r7, r5
	bne	.L18
.L15:
	movs	r0, r4
	@ sp needed
	pop	{r3, r4, r5, r6, r7, pc}
.L19:
	movs	r4, #1
	b	.L15
.L26:
	.align	2
.L25:
	.word	.LANCHOR0
	.word	crc16Table
	.size	getbytes, .-getbytes
	.align	1
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	serial_getdata, %function
serial_getdata:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	movs	r4, r0
	bl	serial_getc
	@ sp needed
	strb	r0, [r4]
	movs	r0, #1
	pop	{r4, pc}
	.size	serial_getdata, .-serial_getdata
	.align	1
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	serial_putc, %function
serial_putc:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L32
	uxtb	r0, r0
.L29:
	ldrb	r2, [r3, #24]
	lsls	r2, r2, #31
	bpl	.L29
	uxth	r0, r0
	strh	r0, [r3, #40]
	@ sp needed
	movs	r0, #1
	bx	lr
.L33:
	.align	2
.L32:
	.word	1107298304
	.size	serial_putc, .-serial_putc
	.align	1
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	serial_getdata_xmd, %function
serial_getdata_xmd:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	movs	r3, #0
	push	{r4, r5, r6, r7, lr}
	ldr	r5, .L55
	sub	sp, sp, #20
	movs	r7, r0
	strb	r3, [r5]
	cmp	r1, r3
	bne	.L35
	adds	r3, r3, #1
.L53:
	movs	r4, #100
	strb	r3, [r5, #4]
.L43:
	movs	r0, #67
	bl	serial_putc
	ldr	r6, .L55+4
.L37:
	bl	serial_is_rx_ready
	cmp	r0, #0
	bne	.L38
	cmp	r6, #0
	bne	.L39
.L40:
	subs	r4, r4, #1
	cmp	r4, #0
	bne	.L43
	movs	r0, r4
	b	.L34
.L35:
	strh	r1, [r5, #2]
	b	.L53
.L39:
	subs	r6, r6, #1
	b	.L37
.L38:
	cmp	r6, #0
	beq	.L40
	movs	r6, #1
.L41:
	bl	serial_getc
	ldrb	r3, [r5]
	cmp	r3, #0
	beq	.L44
	movs	r0, #0
	strb	r0, [r5]
.L34:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L44:
	movs	r3, #255
	ands	r0, r3
	cmp	r0, #1
	beq	.L46
	cmp	r0, #4
	beq	.L47
.L45:
	movs	r3, #0
	movs	r0, #1
	strb	r3, [r5, #4]
	b	.L34
.L46:
	movs	r1, #2
	add	r0, sp, #12
	bl	getbytes
	movs	r1, #128
	movs	r0, r7
	bl	getbytes
	str	r0, [sp, #4]
	bl	serial_getc
	lsls	r0, r0, #8
	uxth	r4, r0
	bl	serial_getc
	ldr	r3, [sp, #4]
	adds	r4, r4, r0
	uxth	r4, r4
	cmp	r3, r4
	bne	.L48
	add	r3, sp, #8
	ldrb	r3, [r3, #4]
	cmp	r3, r6
	bne	.L48
	mvns	r3, r6
	add	r2, sp, #8
	ldrb	r2, [r2, #5]
	uxtb	r3, r3
	cmp	r2, r3
	beq	.L49
.L48:
	movs	r0, #24
.L54:
	bl	serial_putc
	b	.L45
.L49:
	movs	r0, #6
	adds	r6, r6, #1
	bl	serial_putc
	uxtb	r6, r6
	adds	r7, r7, #128
	b	.L41
.L47:
	movs	r0, #6
	b	.L54
.L56:
	.align	2
.L55:
	.word	.LANCHOR0
	.word	800000
	.size	serial_getdata_xmd, .-serial_getdata_xmd
	.align	1
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	serial_putdata_xmd, %function
serial_putdata_xmd:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	movs	r3, #0
	push	{r4, r5, r6, r7, lr}
	ldr	r5, .L92
	sub	sp, sp, #20
	str	r0, [sp, #12]
	movs	r4, r1
	strb	r3, [r5]
	cmp	r1, r3
	bne	.L58
	adds	r3, r3, #1
.L90:
	strb	r3, [r5, #4]
	movs	r3, #127
	tst	r4, r3
	beq	.L61
	adds	r4, r4, #128
	bics	r4, r3
.L61:
	bl	serial_getc
	ldrb	r3, [r5]
	cmp	r3, #0
	beq	.L91
	movs	r3, #0
	strb	r3, [r5]
	bl	serial_getc
.L91:
	uxtb	r0, r0
	cmp	r0, #67
	beq	.L74
	cmp	r0, #113
	beq	.L73
	cmp	r0, #21
	bne	.L61
.L74:
	movs	r3, #1
	str	r3, [sp, #4]
.L62:
	movs	r0, #1
	bl	serial_putc
	ldr	r0, [sp, #4]
	bl	serial_putc
	ldr	r3, [sp, #4]
	movs	r5, #128
	mvns	r0, r3
	movs	r7, #0
	uxtb	r0, r0
	bl	serial_putc
	ldr	r3, [sp, #12]
	str	r3, [sp, #8]
.L70:
	ldr	r2, .L92
	ldrh	r3, [r2, #2]
	cmp	r3, #0
	bne	.L68
	ldrb	r6, [r2, #4]
	cmp	r6, #0
	beq	.L69
.L68:
	ldr	r1, [sp, #8]
	subs	r3, r3, #1
	strh	r3, [r2, #2]
	movs	r3, r1
	ldrb	r6, [r1]
	adds	r3, r3, #1
	str	r3, [sp, #8]
.L69:
	movs	r0, r6
	bl	serial_putc
	lsrs	r3, r7, #8
	eors	r6, r3
	ldr	r3, .L92+4
	lsls	r6, r6, #1
	ldrh	r6, [r6, r3]
	lsls	r7, r7, #8
	eors	r6, r7
	sxth	r6, r6
	subs	r5, r5, #1
	uxth	r7, r6
	cmp	r5, #0
	bne	.L70
	lsrs	r0, r7, #8
	bl	serial_putc
	uxtb	r0, r6
	bl	serial_putc
	bl	serial_getc
	ldr	r6, .L92
	ldrb	r3, [r6]
	cmp	r3, #0
	beq	.L89
	strb	r5, [r6]
.L73:
	movs	r0, #0
	b	.L57
.L58:
	strh	r1, [r5, #2]
	b	.L90
.L89:
	movs	r3, #255
	ands	r0, r3
	cmp	r0, #6
	bne	.L66
	ldr	r3, [sp, #4]
	subs	r4, r4, #128
	adds	r3, r3, #1
	uxtb	r3, r3
	str	r3, [sp, #4]
	ldr	r3, [sp, #12]
	adds	r3, r3, #128
	str	r3, [sp, #12]
.L66:
	cmp	r4, #0
	bne	.L62
	movs	r0, #4
	bl	serial_putc
	bl	serial_getc
	movs	r0, #1
	strb	r4, [r6, #4]
.L57:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L93:
	.align	2
.L92:
	.word	.LANCHOR0
	.word	crc16Table
	.size	serial_putdata_xmd, .-serial_putdata_xmd
	.align	1
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	serial_putdata, %function
serial_putdata:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	movs	r4, r0
	movs	r5, r1
	adds	r6, r0, r1
.L95:
	cmp	r4, r6
	bne	.L96
	movs	r0, r5
	@ sp needed
	pop	{r4, r5, r6, pc}
.L96:
	ldrb	r0, [r4]
	bl	serial_putc
	adds	r4, r4, #1
	b	.L95
	.size	serial_putdata, .-serial_putdata
	.align	1
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	sam_ba_putdata.isra.0, %function
sam_ba_putdata.isra.0:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movs	r3, r0
	push	{r4, lr}
	movs	r0, r1
	movs	r1, r2
	blx	r3
	movs	r2, #128
	ldr	r3, .L98
	lsls	r2, r2, #20
	str	r2, [r3, #20]
	movs	r2, #100
	ldr	r3, .L98+4
	@ sp needed
	strh	r2, [r3, #6]
	pop	{r4, pc}
.L99:
	.align	2
.L98:
	.word	1090536448
	.word	.LANCHOR0
	.size	sam_ba_putdata.isra.0, .-sam_ba_putdata.isra.0
	.thumb_set sam_ba_putdata_xmd.isra.2,sam_ba_putdata.isra.0
	.align	1
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	sam_ba_putdata_term, %function
sam_ba_putdata_term:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	ldr	r3, .L112
	movs	r2, r1
	ldrb	r1, [r3, #8]
	sub	sp, sp, #20
	ldr	r4, [r3, #12]
	cmp	r1, #0
	beq	.L101
	cmp	r2, #4
	bne	.L102
	ldr	r0, [r0]
.L103:
	movs	r6, #15
	movs	r7, #48
	lsls	r2, r2, #1
	add	r3, sp, #16
	adds	r3, r3, r2
	subs	r3, r3, #11
	subs	r5, r3, r2
.L107:
	movs	r1, r0
	ands	r1, r6
	cmp	r1, #9
	bhi	.L105
	orrs	r1, r7
.L110:
	strb	r1, [r3]
	subs	r3, r3, #1
	lsrs	r0, r0, #4
	cmp	r5, r3
	bne	.L107
	movs	r0, #10
	ldr	r3, .L112+4
	add	r1, sp, #4
	strh	r3, [r1]
	adds	r3, r1, r2
	strb	r0, [r3, #2]
	adds	r0, r0, #3
	strb	r0, [r3, #3]
	adds	r2, r2, #4
.L111:
	ldr	r0, [r4, #12]
	bl	sam_ba_putdata.isra.0
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L102:
	cmp	r2, #2
	bne	.L104
	ldrh	r0, [r0]
	b	.L103
.L104:
	ldrb	r0, [r0]
	b	.L103
.L105:
	adds	r1, r1, #55
	b	.L110
.L101:
	movs	r1, r0
	b	.L111
.L113:
	.align	2
.L112:
	.word	.LANCHOR0
	.word	30768
	.size	sam_ba_putdata_term, .-sam_ba_putdata_term
	.align	1
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	SysTick_Handler, %function
SysTick_Handler:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L125
	ldr	r3, .L125+4
	ldrb	r1, [r2, #16]
	cmp	r1, #0
	bne	.L115
	ldrb	r1, [r3]
	ldrb	r0, [r3, #1]
	adds	r1, r1, r0
	movs	r0, #128
	uxtb	r1, r1
	strb	r1, [r3, #1]
	ldr	r1, .L125+8
	lsls	r0, r0, #10
	str	r0, [r1, #28]
.L115:
	ldrb	r1, [r2, #16]
	adds	r1, r1, #1
	uxtb	r1, r1
	strb	r1, [r2, #16]
	ldrb	r1, [r3, #1]
	cmp	r1, #240
	bhi	.L116
	ldrb	r1, [r3, #1]
	cmp	r1, #9
	bhi	.L117
.L116:
	ldrb	r1, [r3]
	rsbs	r1, r1, #0
	sxtb	r1, r1
	strb	r1, [r3]
	ldrb	r1, [r3]
	ldrb	r0, [r3, #1]
	adds	r1, r1, r0
	uxtb	r1, r1
	strb	r1, [r3, #1]
.L117:
	ldrb	r1, [r2, #16]
	ldrb	r3, [r3, #1]
	cmp	r1, r3
	bne	.L118
	movs	r1, #128
	ldr	r3, .L125+8
	lsls	r1, r1, #10
	str	r1, [r3, #28]
.L118:
	ldrh	r3, [r2, #6]
	cmp	r3, #0
	beq	.L120
	ldrh	r3, [r2, #6]
	subs	r3, r3, #1
	uxth	r3, r3
	strh	r3, [r2, #6]
	cmp	r3, #0
	bne	.L120
	movs	r1, #128
	ldr	r3, .L125+8
	lsls	r1, r1, #20
	str	r1, [r3, #24]
.L120:
	ldrh	r3, [r2, #18]
	cmp	r3, #0
	beq	.L114
	ldrh	r3, [r2, #18]
	subs	r3, r3, #1
	uxth	r3, r3
	strh	r3, [r2, #18]
	cmp	r3, #0
	bne	.L114
	movs	r2, #8
	ldr	r3, .L125+12
	str	r2, [r3]
.L114:
	@ sp needed
	bx	lr
.L126:
	.align	2
.L125:
	.word	.LANCHOR0
	.word	.LANCHOR1
	.word	1090536448
	.word	1090536600
	.size	SysTick_Handler, .-SysTick_Handler
	.align	1
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	PendSV_Handler, %function
PendSV_Handler:
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	.syntax divided
@ 139 "board_startup.c" 1
	bkpt 2
@ 0 "" 2
	.thumb
	.syntax unified
.L128:
	b	.L128
	.size	PendSV_Handler, .-PendSV_Handler
	.align	1
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	SVC_Handler, %function
SVC_Handler:
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	.syntax divided
@ 133 "board_startup.c" 1
	bkpt 5
@ 0 "" 2
	.thumb
	.syntax unified
.L130:
	b	.L130
	.size	SVC_Handler, .-SVC_Handler
	.align	1
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	HardFault_Handler, %function
HardFault_Handler:
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	.syntax divided
@ 127 "board_startup.c" 1
	bkpt 13
@ 0 "" 2
	.thumb
	.syntax unified
.L132:
	b	.L132
	.size	HardFault_Handler, .-HardFault_Handler
	.align	1
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	NMI_Handler, %function
NMI_Handler:
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	.syntax divided
@ 121 "board_startup.c" 1
	bkpt 14
@ 0 "" 2
	.thumb
	.syntax unified
.L134:
	b	.L134
	.size	NMI_Handler, .-NMI_Handler
	.align	1
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	dfll_sync, %function
dfll_sync:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movs	r3, #16
	ldr	r1, .L139
.L136:
	ldr	r2, [r1, #12]
	tst	r2, r3
	beq	.L136
	@ sp needed
	bx	lr
.L140:
	.align	2
.L139:
	.word	1073743872
	.size	dfll_sync, .-dfll_sync
	.align	1
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	gclk_sync, %function
gclk_sync:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L144
.L142:
	ldrb	r3, [r2, #1]
	sxtb	r3, r3
	cmp	r3, #0
	blt	.L142
	@ sp needed
	bx	lr
.L145:
	.align	2
.L144:
	.word	1073744896
	.size	gclk_sync, .-gclk_sync
	.align	1
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	USB_SendZlp, %function
USB_SendZlp:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L150
	adds	r0, r0, #255
	ldr	r3, [r2, #20]
	lsrs	r3, r3, #14
	lsls	r3, r3, #14
	str	r3, [r2, #20]
	movs	r3, #2
	strb	r3, [r0, #8]
	ldrb	r2, [r0, #6]
	subs	r3, r3, #130
	orrs	r3, r2
	strb	r3, [r0, #6]
.L147:
	ldrb	r3, [r0, #8]
	lsls	r3, r3, #30
	bpl	.L147
	@ sp needed
	bx	lr
.L151:
	.align	2
.L150:
	.word	usb_endpoint_table
	.size	USB_SendZlp, .-USB_SendZlp
	.align	1
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	sam_ba_monitor_run, %function
sam_ba_monitor_run:
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 56
	@ frame_needed = 1, uses_anonymous_args = 0
	movs	r2, #16
	movs	r3, #8
	push	{r4, r5, r6, r7, lr}
	sub	sp, sp, #60
	add	r7, sp, #0
	adds	r2, r7, r2
	adds	r1, r2, r3
	movs	r3, r1
	ldr	r2, .L243
	ldmia	r2!, {r0, r4, r5}
	stmia	r3!, {r0, r4, r5}
	ldmia	r2!, {r0, r4, r5}
	stmia	r3!, {r0, r4, r5}
	ldmia	r2!, {r0, r4}
	stmia	r3!, {r0, r4}
	ldr	r2, .L243+4
	ldr	r4, .L243+8
	ldr	r3, [r2, #8]
	lsls	r3, r3, #13
	lsrs	r3, r3, #29
	lsls	r3, r3, #2
	ldr	r3, [r3, r1]
	str	r3, [r4, #20]
	ldr	r1, [r2, #8]
	str	r2, [r7, #12]
	uxth	r1, r1
	muls	r3, r1
	str	r3, [r4, #24]
	movs	r3, #0
	movs	r1, #122
	str	r3, [r4, #28]
	adds	r3, r4, #1
	strb	r1, [r3, #31]
.L212:
	ldr	r3, [r4, #12]
	movs	r1, #64
	ldr	r3, [r3, #16]
	ldr	r0, .L243+12
	blx	r3
	cmp	r0, #0
	beq	.L153
	movs	r2, #8
	ldr	r3, .L243+16
	str	r2, [r3]
	movs	r3, #100
	strh	r3, [r4, #18]
.L153:
	ldr	r3, .L243+12
	str	r0, [r4, #100]
	str	r3, [r4, #104]
	movs	r3, #0
	str	r3, [r4, #108]
.L154:
	ldr	r3, [r4, #108]
	ldr	r2, [r4, #100]
	cmp	r3, r2
	bcs	.L212
	ldr	r3, [r4, #104]
	ldrb	r3, [r3]
	cmp	r3, #255
	beq	.L156
	cmp	r3, #35
	beq	.LCB961
	b	.L157	@long jump
.LCB961:
	ldrb	r3, [r4, #8]
	cmp	r3, #0
	beq	.L158
	ldr	r3, [r4, #12]
	movs	r2, #2
	ldr	r1, .L243+20
	ldr	r0, [r3, #12]
	bl	sam_ba_putdata.isra.0
.L158:
	adds	r0, r4, #1
	ldrb	r3, [r0, #31]
	cmp	r3, #83
	bne	.L159
	ldr	r3, [r4, #100]
	ldr	r5, [r4, #108]
	cmp	r3, r5
	bls	.L160
	ldr	r1, [r4, #104]
	ldr	r2, [r4, #112]
	adds	r5, r5, #1
	adds	r6, r1, #1
	str	r6, [r4, #104]
	str	r5, [r4, #108]
	subs	r3, r3, r5
	cmp	r3, r2
	bcs	.L161
	str	r3, [r4, #116]
.L162:
	ldr	r3, [r4, #116]
	movs	r1, r6
	movs	r2, r3
	ldr	r0, [r4, #28]
	str	r3, [r7, #8]
	bl	memcpy
	ldr	r3, [r7, #8]
	ldrb	r2, [r7, #8]
	adds	r5, r5, r3
	adds	r6, r6, r3
	movs	r3, r4
	adds	r3, r3, #120
	str	r5, [r4, #108]
	str	r6, [r4, #104]
	strb	r2, [r3]
.L160:
	ldr	r3, [r4, #108]
	ldr	r1, [r4, #112]
	subs	r3, r3, #1
	str	r3, [r4, #108]
	ldr	r3, [r4, #104]
	subs	r3, r3, #1
	str	r3, [r4, #104]
	movs	r3, r4
	adds	r3, r3, #120
	ldrb	r3, [r3]
	cmp	r3, r1
	bcs	.L164
	subs	r1, r1, r3
	ldr	r3, [r4, #12]
	ldr	r0, [r4, #28]
	ldr	r3, [r3, #24]
	blx	r3
	cmp	r0, #0
	beq	.L164
	movs	r2, #8
	ldr	r3, .L243+16
	str	r2, [r3]
	movs	r3, #100
	strh	r3, [r4, #18]
.L164:
	.syntax divided
@ 319 "sam_ba_monitor.c" 1
	nop
@ 0 "" 2
	.thumb
	.syntax unified
.L166:
	movs	r2, #122
	adds	r3, r4, #1
	strb	r2, [r3, #31]
	movs	r3, #0
	str	r3, [r4, #112]
	ldrb	r3, [r4, #8]
	cmp	r3, #0
	beq	.L156
	ldr	r3, [r4, #12]
	movs	r2, #1
	ldr	r1, .L243+24
	ldr	r0, [r3, #12]
	bl	sam_ba_putdata.isra.0
.L156:
	ldr	r3, [r4, #108]
	adds	r3, r3, #1
	str	r3, [r4, #108]
	ldr	r3, [r4, #104]
	adds	r3, r3, #1
	str	r3, [r4, #104]
	b	.L154
.L161:
	str	r2, [r4, #116]
	b	.L162
.L159:
	cmp	r3, #82
	bne	.L167
	ldr	r3, [r4, #12]
	ldr	r2, [r4, #112]
	ldr	r1, [r4, #28]
	ldr	r0, [r3, #20]
	bl	sam_ba_putdata_xmd.isra.2
	b	.L166
.L167:
	cmp	r3, #79
	bne	.L168
	ldr	r3, [r4, #112]
	ldr	r2, [r4, #28]
	strb	r3, [r2]
	b	.L166
.L168:
	cmp	r3, #72
	bne	.L169
	ldr	r3, [r4, #112]
	ldr	r2, [r4, #28]
	strh	r3, [r2]
	b	.L166
.L169:
	cmp	r3, #87
	bne	.L170
	ldr	r3, [r4, #28]
	ldr	r2, [r4, #112]
	str	r2, [r3]
	b	.L166
.L170:
	cmp	r3, #111
	bne	.L171
	movs	r1, #1
	ldr	r0, [r4, #28]
.L238:
	bl	sam_ba_putdata_term
	b	.L166
.L171:
	cmp	r3, #104
	bne	.L172
	ldr	r3, [r4, #28]
	adds	r0, r0, #111
	ldrh	r3, [r3]
	movs	r1, #2
	str	r3, [r4, #112]
	b	.L238
.L172:
	cmp	r3, #119
	bne	.L173
	ldr	r3, [r4, #28]
	adds	r0, r0, #111
	ldr	r3, [r3]
	movs	r1, #4
	str	r3, [r4, #112]
	b	.L238
.L173:
	cmp	r3, #71
	bne	.L174
	ldr	r3, [r4, #112]
	.syntax divided
@ 71 "/home/user/.arduino15/packages/arduino/tools/CMSIS/4.5.0/CMSIS/Include/cmsis_gcc.h" 1
	cpsid i
@ 0 "" 2
@ 177 "/home/user/.arduino15/packages/arduino/tools/CMSIS/4.5.0/CMSIS/Include/cmsis_gcc.h" 1
	MRS r2, msp

@ 0 "" 2
	.thumb
	.syntax unified
	str	r2, [r4, #124]
	ldr	r2, [r3]
	.syntax divided
@ 190 "/home/user/.arduino15/packages/arduino/tools/CMSIS/4.5.0/CMSIS/Include/cmsis_gcc.h" 1
	MSR msp, r2

@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r3, [r3, #4]
	.syntax divided
@ 241 "sam_ba_monitor.c" 1
	bx r3
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r3, [r4, #124]
	.syntax divided
@ 190 "/home/user/.arduino15/packages/arduino/tools/CMSIS/4.5.0/CMSIS/Include/cmsis_gcc.h" 1
	MSR msp, r3

@ 0 "" 2
@ 60 "/home/user/.arduino15/packages/arduino/tools/CMSIS/4.5.0/CMSIS/Include/cmsis_gcc.h" 1
	cpsie i
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r3, .L243+28
	ldrb	r3, [r3]
	cmp	r3, #0
	beq	.L166
	ldr	r3, [r4, #12]
	movs	r0, #6
	ldr	r3, [r3]
	blx	r3
	b	.L166
.L174:
	cmp	r3, #84
	bne	.L176
	subs	r3, r3, #83
	strb	r3, [r4, #8]
.L242:
	movs	r2, #2
	ldr	r3, [r4, #12]
	ldr	r1, .L243+20
.L239:
	ldr	r0, [r3, #12]
	bl	sam_ba_putdata.isra.0
	b	.L166
.L176:
	cmp	r3, #78
	bne	.L177
	ldrb	r3, [r4, #8]
	cmp	r3, #0
	bne	.L178
	ldr	r3, [r4, #12]
	movs	r2, #2
	ldr	r1, .L243+20
	ldr	r0, [r3, #12]
	bl	sam_ba_putdata.isra.0
.L178:
	movs	r3, #0
	strb	r3, [r4, #8]
	b	.L166
.L177:
	cmp	r3, #86
	bne	.L179
	ldr	r3, [r4, #12]
	movs	r2, #1
	ldr	r1, .L243+32
	ldr	r0, [r3, #12]
	bl	sam_ba_putdata.isra.0
	ldr	r3, [r4, #12]
	ldr	r1, .L243
	movs	r2, #3
	adds	r1, r1, #32
	ldr	r0, [r3, #12]
	bl	sam_ba_putdata.isra.0
	ldr	r5, .L243+36
	ldr	r3, [r4, #12]
	movs	r2, #1
	movs	r1, r5
	ldr	r0, [r3, #12]
	bl	sam_ba_putdata.isra.0
	ldr	r3, [r4, #12]
	ldr	r1, .L243
	movs	r2, #13
	adds	r1, r1, #36
	ldr	r0, [r3, #12]
	bl	sam_ba_putdata.isra.0
	ldr	r3, [r4, #12]
	movs	r2, #1
	movs	r1, r5
	ldr	r0, [r3, #12]
	bl	sam_ba_putdata.isra.0
	movs	r3, #0
	movs	r0, #1
	movs	r2, r3
	mov	ip, r0
	ldr	r1, .L243+40
	str	r3, [r4, #108]
.L180:
	ldr	r0, .L243+44
	ldrb	r6, [r1, r2]
	adds	r0, r0, r2
	cmp	r6, #0
	bne	.L181
	cmp	r3, #0
	beq	.L182
	str	r2, [r4, #108]
.L182:
	ldr	r3, [r4, #12]
	str	r0, [r4, #104]
	ldr	r2, [r4, #108]
	ldr	r0, [r3, #12]
	bl	sam_ba_putdata.isra.0
	ldr	r3, [r4, #12]
	movs	r2, #1
	movs	r1, r5
	ldr	r0, [r3, #12]
	bl	sam_ba_putdata.isra.0
	movs	r3, #0
	movs	r0, #1
	movs	r2, r3
	mov	ip, r0
	ldr	r1, .L243+48
	str	r3, [r4, #108]
	adds	r6, r1, #1
.L183:
	ldrb	r5, [r1, r2]
	adds	r0, r6, r2
	cmp	r5, #0
	bne	.L184
	cmp	r3, #0
	beq	.L185
	str	r2, [r4, #108]
.L185:
	ldr	r3, [r4, #12]
	str	r0, [r4, #104]
	ldr	r2, [r4, #108]
	ldr	r0, [r3, #12]
	bl	sam_ba_putdata.isra.0
	b	.L242
.L181:
	adds	r2, r2, #1
	mov	r3, ip
	b	.L180
.L184:
	adds	r2, r2, #1
	mov	r3, ip
	b	.L183
.L179:
	cmp	r3, #88
	bne	.L186
	ldr	r2, [r4, #20]
	ldr	r3, [r4, #112]
	ldr	r1, [r4, #24]
	ldr	r0, .L243+52
	lsls	r2, r2, #2
.L187:
	cmp	r3, r1
	bcc	.L189
	ldr	r3, [r4, #12]
	movs	r2, #3
	ldr	r1, .L243+56
	b	.L239
.L189:
	ldr	r6, [r7, #12]
	lsrs	r5, r3, #1
	str	r5, [r6, #28]
	ldr	r5, [r7, #12]
	strh	r0, [r5]
.L188:
	ldr	r5, [r7, #12]
	ldrb	r5, [r5, #20]
	lsls	r5, r5, #31
	bpl	.L188
	adds	r3, r3, r2
	b	.L187
.L186:
	cmp	r3, #89
	bne	.L190
	ldr	r3, [r4, #112]
	ldr	r1, [r4, #28]
	ldr	r2, .L243+28
	cmp	r3, #0
	bne	.L191
	str	r1, [r2, #4]
.L192:
	ldr	r3, [r4, #12]
	movs	r2, #3
	ldr	r1, .L243+60
	b	.L239
.L244:
	.align	2
.L243:
	.word	.LANCHOR2
	.word	1090535424
	.word	.LANCHOR0
	.word	.LANCHOR0+33
	.word	1090536596
	.word	.LC17
	.word	.LC37
	.word	.LANCHOR3
	.word	.LC20
	.word	.LC22
	.word	.LC24
	.word	.LC24+1
	.word	.LC26
	.word	-23294
	.word	.LC28
	.word	.LC30
.L191:
	movs	r0, #128
	ldr	r6, [r2, #4]
	ldr	r2, [r7, #12]
	lsrs	r3, r3, #2
	ldr	r2, [r2, #4]
	bics	r2, r0
	ldr	r0, [r7, #12]
	str	r2, [r0, #4]
	ldr	r2, [r4, #20]
	lsrs	r2, r2, #2
	str	r2, [r7, #4]
	ldr	r2, .L245
	mov	ip, r2
.L193:
	cmp	r3, #0
	beq	.L192
	mov	r0, ip
	ldr	r2, [r7, #12]
	strh	r0, [r2]
.L194:
	ldr	r2, [r7, #12]
	ldrb	r2, [r2, #20]
	lsls	r2, r2, #31
	bpl	.L194
	movs	r5, r1
	movs	r2, #0
	str	r6, [r7, #8]
.L195:
	ldr	r0, [r7, #4]
	movs	r1, r5
	ldr	r6, [r7, #8]
	cmp	r2, r0
	beq	.L196
	cmp	r2, r3
	bne	.L197
.L196:
	ldr	r0, [r7, #12]
	ldr	r5, .L245+4
	strh	r5, [r0]
.L198:
	ldr	r0, [r7, #12]
	ldrb	r0, [r0, #20]
	lsls	r0, r0, #31
	bpl	.L198
	subs	r3, r3, r2
	b	.L193
.L197:
	ldr	r0, [r7, #8]
	adds	r2, r2, #1
	ldmia	r0!, {r1}
	str	r0, [r7, #8]
	stmia	r5!, {r1}
	b	.L195
.L190:
	cmp	r3, #90
	beq	.LCB1463
	b	.L166	@long jump
.LCB1463:
	movs	r5, #0
	ldr	r3, [r4, #28]
	ldr	r2, [r4, #112]
	ldr	r0, .L245+8
	adds	r1, r3, r2
.L201:
	cmp	r1, r3
	bne	.L202
	ldr	r3, [r4, #12]
	movs	r2, #1
	ldr	r0, [r3, #12]
	ldr	r1, .L245+12
	bl	sam_ba_putdata.isra.0
	movs	r3, #7
.L205:
	movs	r2, #15
	ands	r2, r5
	uxtb	r0, r2
	movs	r1, r0
	lsrs	r5, r5, #4
	adds	r1, r1, #48
	cmp	r2, #9
	ble	.L204
	adds	r1, r1, #7
.L204:
	movs	r2, #16
	adds	r2, r7, r2
	strb	r1, [r2, r3]
	subs	r3, r3, #1
	bcs	.L205
	movs	r1, #16
	ldr	r3, [r4, #12]
	movs	r2, #8
	adds	r1, r7, r1
	ldr	r0, [r3, #12]
	bl	sam_ba_putdata.isra.0
	ldr	r3, [r4, #12]
	movs	r2, #3
	ldr	r1, .L245+16
	b	.L239
.L202:
	ldrb	r6, [r3]
	lsrs	r2, r5, #8
	eors	r2, r6
	lsls	r2, r2, #1
	ldrh	r2, [r2, r0]
	lsls	r5, r5, #8
	eors	r5, r2
	uxth	r5, r5
	adds	r3, r3, #1
	b	.L201
.L157:
	movs	r2, r3
	subs	r2, r2, #48
	uxtb	r1, r2
	cmp	r1, #9
	bhi	.L207
	ldr	r3, [r4, #112]
	lsls	r3, r3, #4
.L240:
	orrs	r3, r2
	str	r3, [r4, #112]
	b	.L156
.L207:
	movs	r2, r3
	subs	r2, r2, #65
	cmp	r2, #5
	bhi	.L208
	ldr	r2, [r4, #112]
	subs	r3, r3, #55
	lsls	r2, r2, #4
	b	.L240
.L208:
	movs	r2, r3
	subs	r2, r2, #97
	cmp	r2, #5
	bhi	.L209
	ldr	r2, [r4, #112]
	subs	r3, r3, #87
	lsls	r2, r2, #4
	b	.L240
.L209:
	movs	r2, #0
	cmp	r3, #44
	bne	.L210
	ldr	r3, [r4, #112]
	str	r3, [r4, #28]
.L241:
	str	r2, [r4, #112]
	b	.L156
.L210:
	adds	r1, r4, #1
	strb	r3, [r1, #31]
	b	.L241
.L246:
	.align	2
.L245:
	.word	-23228
	.word	-23292
	.word	crc16Table
	.word	.LC33
	.word	.LC35
	.size	sam_ba_monitor_run, .-sam_ba_monitor_run
	.align	1
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	USB_Read, %function
USB_Read:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, lr}
	ldr	r7, .L252
	movs	r6, r0
	ldrb	r3, [r7, #8]
	movs	r0, r1
	movs	r4, r2
	cmp	r3, #0
	bne	.L248
	ldr	r3, .L252+4
	ldr	r2, .L252+8
	ldr	r1, .L252+12
	str	r2, [r3, #64]
	ldr	r2, [r3, #68]
	lsrs	r2, r2, #14
	lsls	r2, r2, #14
	str	r2, [r3, #68]
	ldr	r2, [r3, #68]
	ands	r2, r1
	str	r2, [r3, #68]
	movs	r2, #162
	movs	r3, #64
	lsls	r2, r2, #1
	ldrb	r1, [r6, r2]
	orrs	r3, r1
	strb	r3, [r6, r2]
	movs	r3, #1
	strb	r3, [r7, #8]
.L248:
	movs	r5, #72
	adds	r5, r5, #255
	ldrb	r3, [r6, r5]
	lsls	r3, r3, #31
	lsrs	r3, r3, #31
	beq	.L251
	ldr	r2, .L252+4
	ldr	r3, [r2, #68]
	lsls	r3, r3, #18
	lsrs	r3, r3, #18
	cmp	r4, r3
	bls	.L250
	ldr	r4, [r2, #68]
	lsls	r4, r4, #18
	lsrs	r4, r4, #18
.L250:
	movs	r2, r4
	ldr	r1, .L252+8
	bl	memcpy
	movs	r3, #1
	strb	r3, [r6, r5]
	movs	r3, #0
	strb	r3, [r7, #8]
.L249:
	movs	r0, r4
	@ sp needed
	pop	{r3, r4, r5, r6, r7, pc}
.L251:
	movs	r4, r3
	b	.L249
.L253:
	.align	2
.L252:
	.word	.LANCHOR3
	.word	usb_endpoint_table
	.word	udd_ep_out_cache_buffer+64
	.word	-268419073
	.size	USB_Read, .-USB_Read
	.align	1
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	cdc_getc, %function
cdc_getc:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r4, lr}
	mov	r3, sp
	adds	r4, r3, #7
	ldr	r3, .L255
	movs	r2, #1
	movs	r1, r4
	ldr	r0, [r3, #12]
	bl	USB_Read
	@ sp needed
	ldrb	r0, [r4]
	pop	{r1, r2, r4, pc}
.L256:
	.align	2
.L255:
	.word	.LANCHOR3
	.size	cdc_getc, .-cdc_getc
	.align	1
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	USB_Write, %function
USB_Write:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	str	r0, [sp]
	movs	r0, #1
	ldr	r5, .L263
	movs	r4, r3
	lsls	r3, r3, #5
	movs	r6, r2
	str	r3, [sp, #4]
	adds	r2, r5, r3
	ldr	r3, [r2, #20]
	adds	r2, r2, #16
	lsls	r3, r3, #1
	lsrs	r3, r3, #29
	adds	r3, r3, #3
	lsls	r0, r0, r3
	cmp	r0, r6
	bhi	.L258
	movs	r3, #128
	ldr	r0, [r2, #4]
	lsls	r3, r3, #24
	orrs	r3, r0
	str	r3, [r2, #4]
.L259:
	lsls	r3, r4, #5
	adds	r5, r5, r3
	str	r1, [r5, #16]
	ldr	r3, [r5, #20]
	lsls	r1, r6, #18
	lsrs	r3, r3, #14
	lsrs	r1, r1, #18
	lsls	r3, r3, #14
	orrs	r3, r1
	str	r3, [r5, #20]
	ldr	r3, [r5, #20]
	ldr	r1, .L263+4
	adds	r4, r4, #8
	ands	r3, r1
	str	r3, [r5, #20]
	ldr	r3, [sp]
	lsls	r4, r4, #5
	adds	r4, r3, r4
	movs	r3, #2
	strb	r3, [r4, #7]
	ldrb	r2, [r4, #5]
	subs	r3, r3, #130
	orrs	r3, r2
	strb	r3, [r4, #5]
.L260:
	ldrb	r3, [r4, #7]
	lsls	r3, r3, #30
	bpl	.L260
	movs	r0, r6
	@ sp needed
	pop	{r1, r2, r3, r4, r5, r6, r7, pc}
.L258:
	ldr	r3, .L263+8
	lsls	r7, r4, #6
	adds	r7, r7, r3
	movs	r2, r6
	movs	r0, r7
	bl	memcpy
	movs	r1, r7
	b	.L259
.L264:
	.align	2
.L263:
	.word	usb_endpoint_table
	.word	-268419073
	.word	udd_ep_in_cache_buffer
	.size	USB_Write, .-USB_Write
	.align	1
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	cdc_write_buf, %function
cdc_write_buf:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	movs	r4, r1
	movs	r2, r1
	movs	r1, r0
	ldr	r0, .L266
	movs	r3, #1
	ldr	r0, [r0, #12]
	bl	USB_Write
	@ sp needed
	movs	r0, r4
	pop	{r4, pc}
.L267:
	.align	2
.L266:
	.word	.LANCHOR3
	.size	cdc_write_buf, .-cdc_write_buf
	.align	1
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	cdc_putc, %function
cdc_putc:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	movs	r3, #1
	push	{r0, r1, r2, lr}
	str	r0, [sp, #4]
	ldr	r0, .L269
	movs	r2, r3
	add	r1, sp, #4
	ldr	r0, [r0, #12]
	bl	USB_Write
	@ sp needed
	movs	r0, #1
	pop	{r1, r2, r3, pc}
.L270:
	.align	2
.L269:
	.word	.LANCHOR3
	.size	cdc_putc, .-cdc_putc
	.align	1
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	USB_SendString, %function
USB_SendString:
	@ args = 0, pretend = 0, frame = 256
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	movs	r5, r0
	sub	sp, sp, #256
	movs	r0, r1
	movs	r6, r2
	movs	r4, r1
	bl	strlen
	mov	r3, sp
	lsls	r0, r0, #1
	adds	r0, r0, #2
	strb	r0, [r3]
	mov	r2, sp
	movs	r3, #3
	lsrs	r6, r6, #1
	strb	r3, [r2, #1]
	subs	r3, r3, #2
.L272:
	subs	r2, r3, #1
	ldrb	r1, [r4, r2]
	lsls	r2, r3, #1
	cmp	r1, #0
	beq	.L275
	cmp	r6, r3
	bgt	.L274
.L275:
	movs	r3, #0
	mov	r1, sp
	movs	r0, r5
	bl	USB_Write
	add	sp, sp, #256
	@ sp needed
	pop	{r4, r5, r6, pc}
.L274:
	mov	r0, sp
	adds	r3, r3, #1
	strh	r1, [r0, r2]
	b	.L272
	.size	USB_SendString, .-USB_SendString
	.align	1
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	USB_IsConfigured, %function
USB_IsConfigured:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	ldr	r5, [r0]
	movs	r2, #8
	movs	r1, r5
	ldrh	r3, [r5, #28]
	movs	r6, r0
	ands	r3, r2
	adds	r1, r1, #255
	cmp	r3, #0
	beq	.L278
	movs	r3, #128
	movs	r0, #64
	movs	r4, #192
	strh	r2, [r5, #28]
	adds	r2, r2, #9
	strb	r3, [r5, #10]
	strb	r2, [r1, #1]
	strb	r0, [r1, #6]
	strb	r3, [r1, #5]
	ldr	r3, .L353
	ldr	r5, .L353+4
	ldr	r2, [r3, #4]
	lsls	r4, r4, #22
	ands	r2, r5
	orrs	r2, r4
	str	r2, [r3, #4]
	ldr	r2, [r3, #20]
	ands	r2, r5
	orrs	r4, r2
	ldr	r2, .L353+8
	str	r4, [r3, #20]
	str	r2, [r3]
	ldr	r2, .L353+12
	ldr	r4, .L353+16
	str	r2, [r3, #16]
	ldr	r2, [r3, #4]
	ands	r4, r2
	movs	r2, #128
	lsls	r2, r2, #10
	orrs	r2, r4
	str	r2, [r3, #4]
	ldr	r2, [r3, #4]
	lsrs	r2, r2, #14
	lsls	r2, r2, #14
	str	r2, [r3, #4]
	movs	r3, #0
	strb	r0, [r1, #5]
	strb	r3, [r6, #4]
.L279:
	ldrb	r0, [r6, #4]
	@ sp needed
	pop	{r1, r2, r3, r4, r5, r6, r7, pc}
.L278:
	movs	r0, #16
	ldrb	r2, [r1, #8]
	tst	r2, r0
	beq	.L279
	ldr	r2, .L353+8
	ldr	r4, .L353+20
	ldrb	r7, [r2]
	strb	r0, [r1, #8]
	strb	r7, [r4, #24]
	ldrb	r7, [r2, #1]
	strb	r7, [r4, #25]
	ldrb	r7, [r2, #2]
	strh	r7, [r4, #26]
	ldrh	r7, [r4, #26]
	mov	ip, r7
	mov	r0, ip
	ldrb	r7, [r2, #3]
	lsls	r7, r7, #8
	orrs	r7, r0
	strh	r7, [r4, #26]
	ldrb	r7, [r2, #4]
	strh	r7, [r4, #28]
	ldrb	r7, [r2, #5]
	ldrh	r0, [r4, #28]
	lsls	r7, r7, #8
	orrs	r7, r0
	strh	r7, [r4, #28]
	ldrb	r7, [r2, #6]
	strh	r7, [r4, #30]
	ldrb	r2, [r2, #7]
	ldrh	r7, [r4, #30]
	lsls	r2, r2, #8
	orrs	r2, r7
	movs	r7, #64
	strh	r2, [r4, #30]
	strb	r7, [r1, #5]
	ldrb	r2, [r4, #25]
	ldrb	r0, [r4, #24]
	lsls	r2, r2, #8
	orrs	r2, r0
	ldr	r0, .L353+24
	cmp	r2, r0
	bne	.LCB2045
	b	.L281	@long jump
.LCB2045:
	bgt	.L282
	movs	r0, #128
	lsls	r0, r0, #1
	cmp	r2, r0
	beq	.L280
	bgt	.L284
	cmp	r2, #129
	beq	.L285
	cmp	r2, #130
	bne	.LCB2057
	b	.L286	@long jump
.LCB2057:
	cmp	r2, #128
	bne	.L280
.L285:
	movs	r1, r4
	strh	r3, [r4, #32]
	adds	r1, r1, #32
.L352:
	movs	r2, #2
	b	.L349
.L284:
	movs	r3, #129
	lsls	r3, r3, #1
	cmp	r2, r3
	bne	.LCB2074
	b	.L288	@long jump
.LCB2074:
	bge	.LCB2076
	b	.L351	@long jump
.LCB2076:
	adds	r3, r3, #255
	adds	r3, r3, #255
	cmp	r2, r3
	bne	.LCB2080
	b	.L290	@long jump
.LCB2080:
	ldr	r3, .L353+28
	cmp	r2, r3
	bne	.LCB2083
	b	.L351	@long jump
.LCB2083:
.L280:
	movs	r3, #32
	adds	r5, r5, #255
	ldrb	r2, [r5, #6]
	orrs	r3, r2
	strb	r3, [r5, #6]
	b	.L279
.L282:
	movs	r1, #144
	lsls	r1, r1, #4
	cmp	r2, r1
	beq	.L292
	bgt	.L293
	movs	r1, #208
	lsls	r1, r1, #3
	cmp	r2, r1
	beq	.L294
	movs	r1, #136
	lsls	r1, r1, #4
	cmp	r2, r1
	bne	.LCB2107
	b	.L295	@long jump
.LCB2107:
	movs	r3, #160
	lsls	r3, r3, #3
	cmp	r2, r3
	bne	.L280
	movs	r0, r5
	bl	USB_SendZlp
	movs	r3, #128
	ldrh	r2, [r4, #26]
	rsbs	r3, r3, #0
	orrs	r3, r2
	ldr	r2, [r6]
	uxtb	r3, r3
	strb	r3, [r2, #10]
	b	.L279
.L293:
	ldr	r3, .L353+32
	cmp	r2, r3
	bne	.LCB2129
	b	.L351	@long jump
.LCB2129:
	ble	.L280
	ldr	r3, .L353+36
	cmp	r2, r3
	bne	.LCB2134
	b	.L299	@long jump
.LCB2134:
	ldr	r3, .L353+40
	cmp	r2, r3
	bne	.L280
	ldrh	r3, [r4, #26]
	strb	r3, [r6, #5]
	b	.L351
.L294:
	ldrh	r3, [r4, #26]
	lsrs	r3, r3, #8
	cmp	r3, #1
	bne	.L301
	movs	r2, #18
	ldrh	r3, [r4, #30]
	cmp	r3, r2
	bhi	.L302
	ldrh	r2, [r4, #30]
	uxth	r2, r2
.L302:
	movs	r3, #0
	ldr	r1, .L353+44
	adds	r1, r1, #52
.L349:
	movs	r0, r5
	bl	USB_Write
	b	.L279
.L301:
	ldrh	r3, [r4, #26]
	lsrs	r3, r3, #8
	cmp	r3, #2
	bne	.L303
	movs	r2, #67
	ldrh	r3, [r4, #30]
	cmp	r3, r2
	bhi	.L304
	ldrh	r2, [r4, #30]
	uxth	r2, r2
.L304:
	ldr	r1, .L353+48
	movs	r3, #0
	adds	r1, r1, #4
	b	.L349
.L303:
	ldrh	r3, [r4, #26]
	lsrs	r3, r3, #8
	cmp	r3, #3
	bne	.L280
	ldrh	r3, [r4, #26]
	uxtb	r3, r3
	cmp	r3, #1
	beq	.L307
	cmp	r3, #0
	beq	.L308
	cmp	r3, #2
	bne	.L280
	ldrh	r2, [r4, #30]
	ldr	r1, .L353+52
	uxtb	r2, r2
	b	.L350
.L308:
	ldr	r1, .L353+44
	movs	r2, #4
	adds	r1, r1, #70
	add	r0, sp, #4
	bl	memcpy
	movs	r2, #4
	ldrh	r3, [r4, #30]
	cmp	r3, r2
	bhi	.L310
	ldrh	r2, [r4, #30]
	uxth	r2, r2
.L310:
	movs	r3, #0
	add	r1, sp, #4
	b	.L349
.L307:
	ldrh	r2, [r4, #30]
	ldr	r1, .L353+56
	uxtb	r2, r2
.L350:
	movs	r0, r5
	bl	USB_SendString
	b	.L279
.L292:
	ldrh	r3, [r4, #26]
	movs	r0, r5
	strb	r3, [r6, #4]
	bl	USB_SendZlp
	movs	r3, #160
	movs	r2, #3
	movs	r1, #192
	lsls	r3, r3, #1
	strb	r2, [r5, r3]
	ldr	r3, .L353
	ldr	r0, .L353+4
	ldr	r2, [r3, #68]
	lsls	r1, r1, #22
	ands	r2, r0
	orrs	r2, r1
	str	r2, [r3, #68]
	movs	r2, #70
	adds	r2, r2, #255
	strb	r7, [r5, r2]
	ldr	r2, .L353+60
	movs	r4, #48
	str	r2, [r3, #64]
	movs	r2, #144
	lsls	r2, r2, #1
	strb	r4, [r5, r2]
	ldr	r2, [r3, #52]
	ands	r2, r0
	orrs	r1, r2
	movs	r2, #146
	str	r1, [r3, #52]
	movs	r1, #128
	lsls	r2, r2, #1
	strb	r1, [r5, r2]
	ldr	r2, .L353+64
	str	r2, [r3, #48]
	movs	r2, #176
	lsls	r2, r2, #1
	strb	r7, [r5, r2]
	ldr	r2, [r3, #116]
	ands	r0, r2
	str	r0, [r3, #116]
	movs	r3, #178
	lsls	r3, r3, #1
	strb	r1, [r5, r3]
	b	.L279
.L295:
	adds	r1, r6, #4
	movs	r2, #1
	b	.L349
.L286:
	movs	r2, #80
	movs	r0, #15
	strh	r3, [r4, #32]
	ldrh	r3, [r4, #28]
	ands	r3, r2
	adds	r2, r4, #3
	strb	r3, [r2, #31]
	ldrh	r3, [r4, #28]
	ands	r3, r0
	strh	r3, [r4, #28]
	ldrh	r3, [r4, #28]
	cmp	r3, #3
	bhi	.L290
	ldrb	r3, [r2, #31]
	cmp	r3, #0
	beq	.L312
	ldrh	r3, [r4, #28]
	adds	r3, r3, #8
	lsls	r3, r3, #5
	adds	r3, r5, r3
	ldrb	r3, [r3, #6]
	lsls	r3, r3, #26
.L346:
	movs	r1, r4
	lsrs	r3, r3, #31
	strh	r3, [r4, #32]
	adds	r1, r1, #32
	movs	r3, #0
	b	.L352
.L312:
	ldrh	r3, [r4, #28]
	adds	r3, r3, #8
	lsls	r3, r3, #5
	adds	r3, r5, r3
	ldrb	r3, [r3, #6]
	lsls	r3, r3, #27
	b	.L346
.L290:
	movs	r3, #32
	ldrb	r2, [r1, #6]
	orrs	r3, r2
	strb	r3, [r1, #6]
	b	.L279
.L281:
	movs	r2, #128
	movs	r1, #15
	ldrh	r3, [r4, #28]
	ands	r3, r2
	adds	r2, r4, #3
	strb	r3, [r2, #31]
	ldrh	r3, [r4, #28]
	ands	r3, r1
	strh	r3, [r4, #28]
	ldrh	r3, [r4, #26]
	cmp	r3, #0
	beq	.LCB2388
	b	.L280	@long jump
.LCB2388:
	ldrh	r3, [r4, #28]
	cmp	r3, #0
	bne	.LCB2392
	b	.L280	@long jump
.LCB2392:
	ldrh	r3, [r4, #28]
	cmp	r3, #3
	bls	.LCB2396
	b	.L280	@long jump
.LCB2396:
	ldrb	r3, [r2, #31]
	cmp	r3, #0
	beq	.L315
	movs	r2, #32
	ldrh	r3, [r4, #28]
	adds	r3, r3, #8
	lsls	r3, r3, #5
	adds	r3, r5, r3
.L347:
	strb	r2, [r3, #5]
.L351:
	movs	r0, r5
	bl	USB_SendZlp
	b	.L279
.L315:
	ldrh	r3, [r4, #28]
	movs	r2, #16
	adds	r3, r3, #8
	lsls	r3, r3, #5
	adds	r3, r5, r3
	b	.L347
.L354:
	.align	2
.L353:
	.word	usb_endpoint_table
	.word	-1879048193
	.word	udd_ep_out_cache_buffer
	.word	udd_ep_in_cache_buffer
	.word	-268419073
	.word	.LANCHOR3
	.word	770
	.word	769
	.word	8225
	.word	8609
	.word	8737
	.word	.LANCHOR2
	.word	.LANCHOR1
	.word	.LC66
	.word	.LC64
	.word	udd_ep_out_cache_buffer+64
	.word	udd_ep_in_cache_buffer+64
.L288:
	movs	r2, #128
	ldrh	r3, [r4, #28]
	ands	r3, r2
	adds	r2, r4, #3
	strb	r3, [r2, #31]
	movs	r2, #15
	ldrh	r3, [r4, #28]
	ands	r3, r2
	strh	r3, [r4, #28]
	ldrh	r3, [r4, #26]
	cmp	r3, #0
	beq	.LCB2466
	b	.L280	@long jump
.LCB2466:
	ldrh	r3, [r4, #28]
	cmp	r3, #0
	bne	.LCB2470
	b	.L280	@long jump
.LCB2470:
	ldrh	r3, [r4, #28]
	cmp	r3, #3
	bls	.LCB2474
	b	.L280	@long jump
.LCB2474:
	adds	r3, r4, #3
	ldrb	r3, [r3, #31]
	cmp	r3, #0
	beq	.L318
	ldrh	r3, [r4, #28]
	adds	r3, r3, #8
	lsls	r3, r3, #5
	adds	r3, r5, r3
	ldrb	r3, [r3, #6]
	lsls	r3, r3, #26
	bpl	.L351
	ldrh	r3, [r4, #28]
	adds	r2, r2, #17
	adds	r3, r3, #8
	lsls	r3, r3, #5
	adds	r3, r5, r3
	strb	r2, [r3, #4]
	ldrh	r3, [r4, #28]
	adds	r3, r3, #8
	lsls	r3, r3, #5
	adds	r3, r5, r3
	ldrb	r3, [r3, #7]
	lsls	r3, r3, #25
	bpl	.L351
	ldrh	r3, [r4, #28]
	adds	r2, r2, #32
	adds	r3, r3, #8
	lsls	r3, r3, #5
	adds	r3, r5, r3
	strb	r2, [r3, #7]
	ldrh	r3, [r4, #28]
	subs	r2, r2, #62
	adds	r3, r3, #8
	lsls	r3, r3, #5
	adds	r3, r5, r3
.L348:
	strb	r2, [r3, #4]
	b	.L351
.L318:
	ldrh	r3, [r4, #28]
	adds	r3, r3, #8
	lsls	r3, r3, #5
	adds	r3, r5, r3
	ldrb	r3, [r3, #6]
	lsls	r3, r3, #27
	bpl	.L351
	movs	r2, #16
	ldrh	r3, [r4, #28]
	adds	r3, r3, #8
	lsls	r3, r3, #5
	adds	r3, r5, r3
	strb	r2, [r3, #4]
	ldrh	r3, [r4, #28]
	adds	r3, r3, #8
	lsls	r3, r3, #5
	adds	r3, r5, r3
	ldrb	r3, [r3, #7]
	lsls	r3, r3, #26
	bmi	.LCB2557
	b	.L351	@long jump
.LCB2557:
	ldrh	r3, [r4, #28]
	adds	r2, r2, r2
	adds	r3, r3, #8
	lsls	r3, r3, #5
	adds	r3, r5, r3
	strb	r2, [r3, #7]
	ldrh	r3, [r4, #28]
	subs	r2, r2, #31
	adds	r3, r3, #8
	lsls	r3, r3, #5
	adds	r3, r5, r3
	b	.L348
.L299:
	movs	r2, #8
	ldrh	r3, [r4, #30]
	cmp	r3, r2
	bhi	.L322
	ldrh	r2, [r4, #30]
	uxth	r2, r2
.L322:
	ldr	r1, .L355
	movs	r3, #0
	adds	r1, r1, #72
	b	.L349
.L356:
	.align	2
.L355:
	.word	.LANCHOR1
	.size	USB_IsConfigured, .-USB_IsConfigured
	.align	1
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	cdc_read_buf_xmd, %function
cdc_read_buf_xmd:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, lr}
	ldr	r7, .L362
	movs	r6, r0
	movs	r0, r7
	adds	r0, r0, #12
	movs	r5, r1
	bl	USB_IsConfigured
	movs	r4, r5
	cmp	r0, #0
	bne	.L359
	movs	r5, r0
	b	.L358
.L360:
	movs	r2, r4
	movs	r1, r6
	ldr	r0, [r7, #12]
	bl	USB_Read
	subs	r4, r4, r0
	adds	r6, r6, r0
.L359:
	cmp	r4, #0
	bne	.L360
.L358:
	movs	r0, r5
	@ sp needed
	pop	{r3, r4, r5, r6, r7, pc}
.L363:
	.align	2
.L362:
	.word	.LANCHOR3
	.size	cdc_read_buf_xmd, .-cdc_read_buf_xmd
	.align	1
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	cdc_read_buf, %function
cdc_read_buf:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L368
	movs	r5, r0
	movs	r0, r4
	adds	r0, r0, #12
	movs	r6, r1
	bl	USB_IsConfigured
	movs	r3, r0
	movs	r0, #0
	cmp	r3, r0
	beq	.L364
	movs	r2, r6
	movs	r1, r5
	ldr	r0, [r4, #12]
	bl	USB_Read
.L364:
	@ sp needed
	pop	{r4, r5, r6, pc}
.L369:
	.align	2
.L368:
	.word	.LANCHOR3
	.size	cdc_read_buf, .-cdc_read_buf
	.align	1
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	cdc_is_rx_ready, %function
cdc_is_rx_ready:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L374
	movs	r0, r4
	adds	r0, r0, #12
	bl	USB_IsConfigured
	movs	r3, r0
	movs	r0, #0
	cmp	r3, r0
	beq	.L371
	movs	r3, #72
	ldr	r2, [r4, #12]
	adds	r3, r3, #255
	ldrb	r0, [r2, r3]
	lsls	r0, r0, #31
	lsrs	r0, r0, #31
.L371:
	@ sp needed
	pop	{r4, pc}
.L375:
	.align	2
.L374:
	.word	.LANCHOR3
	.size	cdc_is_rx_ready, .-cdc_is_rx_ready
	.section	.text.startup,"ax",%progbits
	.align	1
	.global	main
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	main, %function
main:
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	ldr	r2, .L433
	sub	sp, sp, #20
	ldr	r3, [r2]
	add	r7, sp, #0
	adds	r3, r3, #1
	beq	.L378
	ldr	r3, .L433+4
	ldr	r1, .L433+8
	uxtb	r0, r2
	str	r1, [r3, #36]
	cmp	r0, #0
	bne	.L378
	ldr	r3, .L433+12
	ldr	r1, .L433+16
	ldrb	r3, [r3]
	lsls	r3, r3, #31
	lsrs	r3, r3, #31
	beq	.L380
	str	r0, [r1]
.L381:
	ldr	r3, [r2]
	.syntax divided
@ 190 "/home/user/.arduino15/packages/arduino/tools/CMSIS/4.5.0/CMSIS/Include/cmsis_gcc.h" 1
	MSR msp, r3

@ 0 "" 2
	.thumb
	.syntax unified
	movs	r3, #255
	movs	r1, r2
	bics	r1, r3
	ldr	r3, .L433+20
	str	r1, [r3, #8]
	ldr	r3, [r2, #4]
	.syntax divided
@ 46 "main.c" 1
	bx r3
@ 0 "" 2
	.thumb
	.syntax unified
	b	.L378
.L380:
	ldr	r4, [r1]
	ldr	r0, .L433+24
	cmp	r4, r0
	beq	.LCB2760
	b	.L382	@long jump
.LCB2760:
	str	r3, [r1]
.L378:
	movs	r1, #30
	ldr	r2, .L433+28
	ldr	r5, .L433+32
	ldr	r3, [r2, #4]
	bics	r3, r1
	subs	r1, r1, #28
	orrs	r3, r1
	str	r3, [r2, #4]
	ldr	r3, .L433+36
	strh	r3, [r5, #20]
	ldrh	r3, [r5, #20]
	orrs	r3, r1
	strh	r3, [r5, #20]
	str	r1, [r7, #12]
.L384:
	ldr	r3, [r5, #12]
	ldr	r2, [r7, #12]
	tst	r3, r2
	beq	.L384
	movs	r3, #1
	ldr	r4, .L433+40
	movs	r6, #128
	str	r3, [r4, #8]
	bl	gclk_sync
	ldr	r3, .L433+44
	str	r3, [r4, #4]
	bl	gclk_sync
	movs	r3, #130
	lsls	r3, r3, #7
	strh	r3, [r4, #2]
	bl	gclk_sync
	ldrh	r3, [r5, #36]
	bics	r3, r6
	strh	r3, [r5, #36]
	bl	dfll_sync
	ldr	r3, .L433+48
	str	r3, [r5, #44]
	bl	dfll_sync
	ldrh	r2, [r5, #36]
	ldr	r3, .L433+52
	orrs	r3, r2
	strh	r3, [r5, #36]
	bl	dfll_sync
	ldrh	r3, [r5, #36]
	ldr	r2, [r7, #12]
	orrs	r2, r3
	strh	r2, [r5, #36]
	movs	r2, #64
	str	r4, [r7, #12]
.L385:
	ldr	r1, [r5, #12]
	tst	r1, r6
	beq	.L385
	ldr	r1, [r5, #12]
	tst	r1, r2
	beq	.L385
	movs	r5, #0
	bl	dfll_sync
	ldr	r3, [r7, #12]
	ldr	r6, .L433+56
	str	r5, [r3, #8]
	bl	gclk_sync
	ldr	r3, .L433+60
	ldr	r2, [r7, #12]
	str	r3, [r2, #4]
	bl	gclk_sync
	movs	r1, #192
	ldr	r3, .L433+64
	ldr	r0, .L433+20
	str	r3, [r6, #4]
	ldr	r3, [r0, #32]
	lsls	r1, r1, #24
	lsls	r3, r3, #8
	lsrs	r3, r3, #8
	orrs	r3, r1
	str	r3, [r0, #32]
	movs	r3, #7
	str	r5, [r6, #8]
	str	r3, [r6]
	.syntax divided
@ 60 "/home/user/.arduino15/packages/arduino/tools/CMSIS/4.5.0/CMSIS/Include/cmsis_gcc.h" 1
	cpsie i
@ 0 "" 2
	.thumb
	.syntax unified
	movs	r2, #1
	ldr	r5, .L433+68
	movs	r3, #2
	ldrb	r1, [r5]
	orrs	r1, r2
	strb	r1, [r5]
	movs	r5, #15
	ldr	r1, .L433+72
	ldrb	r4, [r1]
	bics	r4, r5
	strb	r4, [r1]
	ldrb	r4, [r1]
	orrs	r4, r3
	strb	r4, [r1]
	ldr	r4, .L433+76
	ldrb	r3, [r4]
	orrs	r3, r2
	strb	r3, [r4]
	ldrb	r3, [r1]
	ldr	r2, [r7, #12]
	ands	r3, r5
	strb	r3, [r1]
	movs	r3, #32
	ldrb	r5, [r1]
	orrs	r3, r5
	strb	r3, [r1]
	movs	r3, #4
	ldr	r1, .L433+80
	ldr	r5, [r1, #32]
	orrs	r3, r5
	str	r3, [r1, #32]
	ldr	r3, .L433+84
	strh	r3, [r2, #2]
	ldr	r3, .L433+64
	str	r0, [r7, #8]
	str	r3, [r7, #4]
.L387:
	ldr	r3, [r7, #12]
	ldrb	r3, [r3, #1]
	sxtb	r3, r3
	cmp	r3, #0
	blt	.L387
	ldr	r3, .L433+88
	movs	r2, r3
.L388:
	ldr	r0, [r3, #28]
	lsls	r0, r0, #30
	bmi	.L388
	movs	r5, #2
	ldr	r0, [r3]
	bics	r0, r5
	str	r0, [r3]
.L389:
	ldr	r3, [r2, #28]
	lsls	r3, r3, #31
	bmi	.L389
	movs	r3, #1
	ldr	r0, [r2]
	orrs	r3, r0
	str	r3, [r2]
.L390:
	ldr	r3, [r2]
	lsls	r3, r3, #31
	bmi	.L390
.L391:
	ldr	r3, [r2, #28]
	lsls	r3, r3, #31
	bmi	.L391
	ldr	r3, [r2, #28]
	lsls	r3, r3, #30
	bmi	.L391
	ldr	r3, .L433+92
	str	r3, [r2]
.L393:
	ldr	r3, [r2, #28]
	lsls	r3, r3, #29
	bmi	.L393
	movs	r3, #192
	lsls	r3, r3, #10
	str	r3, [r2, #4]
	ldr	r3, .L433+96
	strh	r3, [r2, #12]
.L394:
	ldr	r3, [r2, #28]
	lsls	r3, r3, #30
	lsrs	r3, r3, #31
	bne	.L394
	movs	r0, #2
	ldr	r5, [r2]
	orrs	r0, r5
	ldr	r5, .L433+4
	str	r0, [r2]
	movs	r2, r5
	adds	r2, r2, #40
	strb	r3, [r2]
	movs	r2, r5
	adds	r2, r2, #41
	strb	r3, [r2]
	movs	r2, r5
	adds	r2, r2, #42
	strb	r3, [r2]
	movs	r2, r5
	adds	r2, r2, #43
	strb	r3, [r2]
	movs	r2, r5
	adds	r2, r2, #44
	strb	r3, [r2]
	ldr	r2, .L433+100
	strb	r3, [r2]
	ldr	r2, [r1, #28]
	adds	r3, r3, #32
	orrs	r3, r2
	str	r3, [r1, #28]
	movs	r3, #1
	ldr	r1, .L433+104
	ldrb	r2, [r1]
	orrs	r2, r3
	strb	r2, [r1]
	movs	r1, #15
	ldr	r2, .L433+108
	ldrb	r0, [r2]
	bics	r0, r1
	strb	r0, [r2]
	ldrb	r0, [r2]
	mov	ip, r0
	movs	r0, #6
	mov	r4, ip
	orrs	r0, r4
	strb	r0, [r2]
	ldr	r0, .L433+112
	ldrb	r4, [r0]
	orrs	r3, r4
	strb	r3, [r0]
	ldrb	r3, [r2]
	ands	r3, r1
	strb	r3, [r2]
	movs	r3, #96
	ldrb	r1, [r2]
	orrs	r3, r1
	strb	r3, [r2]
	ldr	r3, .L433+116
	ldr	r2, [r7, #12]
	strh	r3, [r2, #2]
.L395:
	ldr	r3, [r7, #12]
	ldrb	r3, [r3, #1]
	sxtb	r3, r3
	cmp	r3, #0
	blt	.L395
	movs	r3, #1
	ldr	r4, .L433+120
	ldrb	r2, [r4]
	orrs	r3, r2
	strb	r3, [r4]
.L396:
	ldrb	r3, [r4, #2]
	lsls	r3, r3, #31
	bmi	.L396
	movs	r1, #31
	ldr	r2, .L433+124
	ldr	r3, [r2]
	str	r2, [r7, #12]
	lsrs	r0, r3, #13
	ands	r0, r1
	cmp	r0, r1
	bne	.L397
	movs	r0, #5
.L397:
	ldrh	r3, [r4, #40]
	ands	r0, r1
	mov	ip, r3
	mov	r2, ip
	ldr	r3, .L433+128
	lsls	r0, r0, #6
	ands	r3, r2
	orrs	r3, r0
	strh	r3, [r4, #40]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	lsrs	r3, r3, #18
	ands	r3, r1
	cmp	r3, #31
	bne	.L398
	subs	r3, r3, #2
.L398:
	movs	r0, #31
	movs	r2, #7
	ldrh	r1, [r4, #40]
	ands	r3, r0
	bics	r1, r0
	orrs	r3, r1
	strh	r3, [r4, #40]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	str	r2, [r7, #12]
	lsrs	r3, r3, #23
	ands	r3, r2
	cmp	r3, r2
	bne	.L399
	movs	r3, #3
.L399:
	ldr	r1, [r7, #12]
	ldrh	r2, [r4, #40]
	ands	r3, r1
	ldr	r1, .L433+132
	lsls	r3, r3, #12
	ands	r2, r1
	orrs	r3, r2
	movs	r2, #127
	strh	r3, [r4, #40]
	ldrb	r3, [r4]
	ldr	r0, .L433+136
	ands	r3, r2
	strb	r3, [r4]
	movs	r3, #4
	ldrb	r2, [r4]
	movs	r1, #0
	orrs	r3, r2
	movs	r2, #12
	strb	r3, [r4]
	str	r0, [r4, #36]
	ldrh	r3, [r4, #8]
	bics	r3, r2
	strh	r3, [r4, #8]
	ldrh	r3, [r4, #8]
	subs	r2, r2, #11
	bics	r3, r2
	strh	r3, [r4, #8]
	adds	r2, r2, #127
	bl	memset
	movs	r2, #0
	ldr	r3, .L433+140
	str	r4, [r5, #12]
	str	r3, [r5, #20]
	movs	r3, #2
	strh	r2, [r5, #16]
	ldrb	r1, [r4]
	ldr	r0, .L433+144
	orrs	r3, r1
	movs	r1, #128
	strb	r3, [r4]
	ldr	r3, .L433+148
	lsls	r1, r1, #10
	str	r1, [r3, #8]
	movs	r1, #8
	str	r1, [r0]
	ldr	r0, .L433+152
	str	r1, [r0]
	movs	r1, #128
	lsls	r1, r1, #20
	str	r1, [r3, #8]
	str	r1, [r3, #24]
	movs	r1, #192
	ldr	r3, [r7, #4]
	lsls	r1, r1, #24
	str	r3, [r6, #4]
	ldr	r3, [r7, #8]
	ldr	r3, [r3, #32]
	lsls	r3, r3, #8
	lsrs	r3, r3, #8
	orrs	r3, r1
	ldr	r1, [r7, #8]
	str	r3, [r1, #32]
	ldr	r3, [r7, #12]
	str	r2, [r6, #8]
	str	r3, [r6]
	movs	r6, #1
.L403:
	movs	r4, r5
	adds	r4, r4, #45
.L402:
	movs	r0, r5
	ldr	r3, [r5, #20]
	adds	r0, r0, #12
	blx	r3
	cmp	r0, #0
	beq	.L400
	strb	r6, [r4]
.L400:
	ldrb	r3, [r4]
	cmp	r3, #0
	beq	.L401
	ldr	r3, .L433+156
	ldr	r2, .L433+100
	adds	r3, r3, #76
	str	r3, [r2, #12]
.L432:
	bl	sam_ba_monitor_run
.L382:
	ldr	r3, .L433+160
	str	r0, [r1]
.L383:
	subs	r3, r3, #1
	cmp	r3, #0
	bne	.L383
	str	r3, [r1]
	b	.L381
.L401:
	ldrb	r3, [r4]
	cmp	r3, #0
	bne	.L402
	bl	serial_is_rx_ready
	cmp	r0, #0
	beq	.L403
	bl	serial_getc
	cmp	r0, #35
	bne	.L403
	ldr	r3, .L433+156
	ldr	r2, .L433+100
	adds	r3, r3, #104
	str	r3, [r2, #12]
	movs	r3, #1
	strb	r3, [r5]
	b	.L432
.L434:
	.align	2
.L433:
	.word	__sketch_vectors_ptr
	.word	.LANCHOR3
	.word	__sketch_vectors_ptr+4
	.word	1073742904
	.word	536903676
	.word	-536810240
	.word	125010229
	.word	1090535424
	.word	1073743872
	.word	1548
	.word	1073744896
	.word	66817
	.word	2113865144
	.word	2564
	.word	-536813552
	.word	198400
	.word	999
	.word	1090536522
	.word	1090536501
	.word	1090536523
	.word	1073742848
	.word	16404
	.word	1107298304
	.word	1076953092
	.word	-2518
	.word	.LANCHOR0
	.word	1090536536
	.word	1090536508
	.word	1090536537
	.word	16390
	.word	1090539520
	.word	8413220
	.word	-1985
	.word	-28673
	.word	usb_endpoint_table
	.word	USB_IsConfigured
	.word	1090536584
	.word	1090536448
	.word	1090536600
	.word	.LANCHOR2
	.word	125000
	.size	main, .-main
	.text
	.align	1
	.global	Reset_Handler
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	Reset_Handler, %function
Reset_Handler:
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L447
	ldr	r0, .L447+4
	push	{r4, r5, r6, lr}
	cmp	r2, r0
	bne	.L436
.L440:
	ldr	r2, .L447+8
	ldr	r3, .L447+12
	movs	r1, #0
	cmp	r3, r2
	bne	.L437
.L438:
	bl	main
.L436:
	ldr	r4, .L447+16
	movs	r3, #0
	cmp	r4, r2
	beq	.L440
.L439:
	adds	r1, r2, r3
	cmp	r0, r1
	bls	.L440
	ldr	r5, [r4, r3]
	adds	r3, r3, #4
	str	r5, [r1]
	b	.L439
.L442:
	stmia	r3!, {r1}
.L437:
	cmp	r3, r2
	bcc	.L442
	b	.L438
.L448:
	.align	2
.L447:
	.word	__data_start__
	.word	__data_end__
	.word	__bss_end__
	.word	__bss_start__
	.word	__etext
	.size	Reset_Handler, .-Reset_Handler
	.global	exception_table
	.section	.rodata
	.align	2
	.set	.LANCHOR2,. + 0
.LC14:
	.word	8
	.word	16
	.word	32
	.word	64
	.word	128
	.word	256
	.word	512
	.word	1024
	.type	RomBOOT_Version, %object
	.size	RomBOOT_Version, 4
RomBOOT_Version:
	.ascii	"2.0\000"
	.type	RomBOOT_ExtendedCapabilities, %object
	.size	RomBOOT_ExtendedCapabilities, 14
RomBOOT_ExtendedCapabilities:
	.ascii	"[Arduino:XYZ]\000"
	.space	2
	.type	devDescriptor, %object
	.size	devDescriptor, 18
devDescriptor:
	.byte	18
	.byte	1
	.byte	0
	.byte	2
	.byte	2
	.byte	0
	.byte	0
	.byte	64
	.byte	-40
	.byte	4
	.byte	-38
	.byte	-20
	.byte	0
	.byte	2
	.byte	1
	.byte	2
	.byte	0
	.byte	1
.LC63:
	.short	772
	.short	1033
	.space	2
	.type	usbcdc_if, %object
	.size	usbcdc_if, 28
usbcdc_if:
	.word	cdc_putc
	.word	cdc_getc
	.word	cdc_is_rx_ready
	.word	cdc_write_buf
	.word	cdc_read_buf
	.word	cdc_write_buf
	.word	cdc_read_buf_xmd
	.type	uart_if, %object
	.size	uart_if, 28
uart_if:
	.word	serial_putc
	.word	serial_getc
	.word	serial_is_rx_ready
	.word	serial_putdata
	.word	serial_getdata
	.word	serial_putdata_xmd
	.word	serial_getdata_xmd
	.type	crc16Table, %object
	.size	crc16Table, 512
crc16Table:
	.short	0
	.short	4129
	.short	8258
	.short	12387
	.short	16516
	.short	20645
	.short	24774
	.short	28903
	.short	-32504
	.short	-28375
	.short	-24246
	.short	-20117
	.short	-15988
	.short	-11859
	.short	-7730
	.short	-3601
	.short	4657
	.short	528
	.short	12915
	.short	8786
	.short	21173
	.short	17044
	.short	29431
	.short	25302
	.short	-27847
	.short	-31976
	.short	-19589
	.short	-23718
	.short	-11331
	.short	-15460
	.short	-3073
	.short	-7202
	.short	9314
	.short	13379
	.short	1056
	.short	5121
	.short	25830
	.short	29895
	.short	17572
	.short	21637
	.short	-23190
	.short	-19125
	.short	-31448
	.short	-27383
	.short	-6674
	.short	-2609
	.short	-14932
	.short	-10867
	.short	13907
	.short	9842
	.short	5649
	.short	1584
	.short	30423
	.short	26358
	.short	22165
	.short	18100
	.short	-18597
	.short	-22662
	.short	-26855
	.short	-30920
	.short	-2081
	.short	-6146
	.short	-10339
	.short	-14404
	.short	18628
	.short	22757
	.short	26758
	.short	30887
	.short	2112
	.short	6241
	.short	10242
	.short	14371
	.short	-13876
	.short	-9747
	.short	-5746
	.short	-1617
	.short	-30392
	.short	-26263
	.short	-22262
	.short	-18133
	.short	23285
	.short	19156
	.short	31415
	.short	27286
	.short	6769
	.short	2640
	.short	14899
	.short	10770
	.short	-9219
	.short	-13348
	.short	-1089
	.short	-5218
	.short	-25735
	.short	-29864
	.short	-17605
	.short	-21734
	.short	27814
	.short	31879
	.short	19684
	.short	23749
	.short	11298
	.short	15363
	.short	3168
	.short	7233
	.short	-4690
	.short	-625
	.short	-12820
	.short	-8755
	.short	-21206
	.short	-17141
	.short	-29336
	.short	-25271
	.short	32407
	.short	28342
	.short	24277
	.short	20212
	.short	15891
	.short	11826
	.short	7761
	.short	3696
	.short	-97
	.short	-4162
	.short	-8227
	.short	-12292
	.short	-16613
	.short	-20678
	.short	-24743
	.short	-28808
	.short	-28280
	.short	-32343
	.short	-20022
	.short	-24085
	.short	-12020
	.short	-16083
	.short	-3762
	.short	-7825
	.short	4224
	.short	161
	.short	12482
	.short	8419
	.short	20484
	.short	16421
	.short	28742
	.short	24679
	.short	-31815
	.short	-27752
	.short	-23557
	.short	-19494
	.short	-15555
	.short	-11492
	.short	-7297
	.short	-3234
	.short	689
	.short	4752
	.short	8947
	.short	13010
	.short	16949
	.short	21012
	.short	25207
	.short	29270
	.short	-18966
	.short	-23093
	.short	-27224
	.short	-31351
	.short	-2706
	.short	-6833
	.short	-10964
	.short	-15091
	.short	13538
	.short	9411
	.short	5280
	.short	1153
	.short	29798
	.short	25671
	.short	21540
	.short	17413
	.short	-22565
	.short	-18438
	.short	-30823
	.short	-26696
	.short	-6305
	.short	-2178
	.short	-14563
	.short	-10436
	.short	9939
	.short	14066
	.short	1681
	.short	5808
	.short	26199
	.short	30326
	.short	17941
	.short	22068
	.short	-9908
	.short	-13971
	.short	-1778
	.short	-5841
	.short	-26168
	.short	-30231
	.short	-18038
	.short	-22101
	.short	22596
	.short	18533
	.short	30726
	.short	26663
	.short	6336
	.short	2273
	.short	14466
	.short	10403
	.short	-13443
	.short	-9380
	.short	-5313
	.short	-1250
	.short	-29703
	.short	-25640
	.short	-21573
	.short	-17510
	.short	19061
	.short	23124
	.short	27191
	.short	31254
	.short	2801
	.short	6864
	.short	10931
	.short	14994
	.short	-722
	.short	-4849
	.short	-8852
	.short	-12979
	.short	-16982
	.short	-21109
	.short	-25112
	.short	-29239
	.short	31782
	.short	27655
	.short	23652
	.short	19525
	.short	15522
	.short	11395
	.short	7392
	.short	3265
	.short	-4321
	.short	-194
	.short	-12451
	.short	-8324
	.short	-20581
	.short	-16454
	.short	-28711
	.short	-24584
	.short	28183
	.short	32310
	.short	20053
	.short	24180
	.short	11923
	.short	16050
	.short	3793
	.short	7920
	.data
	.align	2
	.set	.LANCHOR1,. + 0
	.type	ledDirection, %object
	.size	ledDirection, 1
ledDirection:
	.byte	1
	.type	ledTargetValue, %object
	.size	ledTargetValue, 1
ledTargetValue:
	.byte	20
	.space	2
	.type	cfgDescriptor, %object
	.size	cfgDescriptor, 67
cfgDescriptor:
	.byte	9
	.byte	2
	.byte	67
	.byte	0
	.byte	2
	.byte	1
	.byte	0
	.byte	-128
	.byte	50
	.byte	9
	.byte	4
	.byte	0
	.byte	0
	.byte	1
	.byte	2
	.byte	2
	.byte	0
	.byte	0
	.byte	5
	.byte	36
	.byte	0
	.byte	16
	.byte	1
	.byte	4
	.byte	36
	.byte	2
	.byte	0
	.byte	5
	.byte	36
	.byte	6
	.byte	0
	.byte	1
	.byte	5
	.byte	36
	.byte	1
	.byte	0
	.byte	1
	.byte	7
	.byte	5
	.byte	-125
	.byte	3
	.byte	8
	.byte	0
	.byte	-1
	.byte	9
	.byte	4
	.byte	1
	.byte	0
	.byte	2
	.byte	10
	.byte	0
	.byte	0
	.byte	0
	.byte	7
	.byte	5
	.byte	-127
	.byte	2
	.byte	64
	.byte	0
	.byte	0
	.byte	7
	.byte	5
	.byte	2
	.byte	2
	.byte	64
	.byte	0
	.byte	0
	.space	1
	.type	line_coding, %object
	.size	line_coding, 8
line_coding:
	.word	115200
	.byte	0
	.byte	0
	.byte	8
	.space	1
	.type	g_interrupt_enabled, %object
	.size	g_interrupt_enabled, 1
g_interrupt_enabled:
	.byte	1
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.set	.LANCHOR3,. + 128
	.type	error_timeout, %object
	.size	error_timeout, 1
error_timeout:
	.space	1
	.space	1
	.type	size_of_data, %object
	.size	size_of_data, 2
size_of_data:
	.space	2
	.type	mode_of_transfer, %object
	.size	mode_of_transfer, 1
mode_of_transfer:
	.space	1
	.space	1
	.type	txLEDPulse, %object
	.size	txLEDPulse, 2
txLEDPulse:
	.space	2
	.type	b_terminal_mode, %object
	.size	b_terminal_mode, 1
b_terminal_mode:
	.space	1
	.space	3
	.type	ptr_monitor_if, %object
	.size	ptr_monitor_if, 4
ptr_monitor_if:
	.space	4
	.type	ledKeepValue, %object
	.size	ledKeepValue, 1
ledKeepValue:
	.space	1
	.space	1
	.type	rxLEDPulse, %object
	.size	rxLEDPulse, 2
rxLEDPulse:
	.space	2
	.type	PAGE_SIZE, %object
	.size	PAGE_SIZE, 4
PAGE_SIZE:
	.space	4
	.type	MAX_FLASH, %object
	.size	MAX_FLASH, 4
MAX_FLASH:
	.space	4
	.type	ptr_data, %object
	.size	ptr_data, 4
ptr_data:
	.space	4
	.type	command, %object
	.size	command, 1
command:
	.space	1
	.type	data, %object
	.size	data, 64
data:
	.space	64
	.space	3
	.type	length, %object
	.size	length, 4
length:
	.space	4
	.type	ptr, %object
	.size	ptr, 4
ptr:
	.space	4
	.type	i, %object
	.size	i, 4
i:
	.space	4
	.type	current_number, %object
	.size	current_number, 4
current_number:
	.space	4
	.type	u32tmp, %object
	.size	u32tmp, 4
u32tmp:
	.space	4
	.type	j, %object
	.size	j, 1
j:
	.space	1
	.space	3
	.type	sp, %object
	.size	sp, 4
sp:
	.space	4
	.type	b_sam_ba_interface_usart, %object
	.size	b_sam_ba_interface_usart, 1
b_sam_ba_interface_usart:
	.space	1
	.space	3
	.type	src_buff_addr.11924, %object
	.size	src_buff_addr.11924, 4
src_buff_addr.11924:
	.space	4
	.type	read_job, %object
	.size	read_job, 1
read_job:
	.space	1
	.space	3
	.type	sam_ba_cdc, %object
	.size	sam_ba_cdc, 12
sam_ba_cdc:
	.space	12
	.type	bmRequestType.10449, %object
	.size	bmRequestType.10449, 1
bmRequestType.10449:
	.space	1
	.type	bRequest.10450, %object
	.size	bRequest.10450, 1
bRequest.10450:
	.space	1
	.type	wValue.10452, %object
	.size	wValue.10452, 2
wValue.10452:
	.space	2
	.type	wIndex.10453, %object
	.size	wIndex.10453, 2
wIndex.10453:
	.space	2
	.type	wLength.10454, %object
	.size	wLength.10454, 2
wLength.10454:
	.space	2
	.type	wStatus.10455, %object
	.size	wStatus.10455, 2
wStatus.10455:
	.space	2
	.type	dir.10451, %object
	.size	dir.10451, 1
dir.10451:
	.space	1
	.space	1
	.type	pulSketch_Start_Address, %object
	.size	pulSketch_Start_Address, 4
pulSketch_Start_Address:
	.space	4
	.type	b_sharp_received, %object
	.size	b_sharp_received, 1
b_sharp_received:
	.space	1
	.type	idx_rx_read, %object
	.size	idx_rx_read, 1
idx_rx_read:
	.space	1
	.type	idx_rx_write, %object
	.size	idx_rx_write, 1
idx_rx_write:
	.space	1
	.type	idx_tx_read, %object
	.size	idx_tx_read, 1
idx_tx_read:
	.space	1
	.type	idx_tx_write, %object
	.size	idx_tx_write, 1
idx_tx_write:
	.space	1
	.type	main_b_cdc_enable, %object
	.size	main_b_cdc_enable, 1
main_b_cdc_enable:
	.space	1
	.type	buffer_rx_usart, %object
	.size	buffer_rx_usart, 128
buffer_rx_usart:
	.space	128
	.type	buffer_tx_usart, %object
	.size	buffer_tx_usart, 128
buffer_tx_usart:
	.space	128
	.space	2
	.type	udd_ep_in_cache_buffer, %object
	.size	udd_ep_in_cache_buffer, 128
udd_ep_in_cache_buffer:
	.space	128
	.type	udd_ep_out_cache_buffer, %object
	.size	udd_ep_out_cache_buffer, 128
udd_ep_out_cache_buffer:
	.space	128
	.type	usb_endpoint_table, %object
	.size	usb_endpoint_table, 128
usb_endpoint_table:
	.space	128
	.section	.isr_vector,"a",%progbits
	.align	2
	.type	exception_table, %object
	.size	exception_table, 64
exception_table:
	.word	__StackTop
	.word	Reset_Handler
	.word	NMI_Handler
	.word	HardFault_Handler
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	SVC_Handler
	.word	0
	.word	0
	.word	PendSV_Handler
	.word	SysTick_Handler
	.section	.rodata.str1.1,"aMS",%progbits,1
.LC17:
	.ascii	"\012\015\000"
.LC20:
	.ascii	"v\000"
.LC22:
	.ascii	" \000"
.LC24:
	.ascii	"Oct 12 2020\000"
.LC26:
	.ascii	"18:02:03\000"
.LC28:
	.ascii	"X\012\015\000"
.LC30:
	.ascii	"Y\012\015\000"
.LC33:
	.ascii	"Z\000"
.LC35:
	.ascii	"#\012\015\000"
.LC37:
	.ascii	">\000"
.LC64:
	.ascii	"smartme.IO\000"
.LC66:
	.ascii	"Arancino\000"
	.ident	"GCC: (GNU Tools for Arm Embedded Processors 7-2017-q4-major) 7.2.1 20170904 (release) [ARM/embedded-7-branch revision 255204]"
