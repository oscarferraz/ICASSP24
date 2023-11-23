	.text
	.file	"device.c"
                                        // Start of file scope inline assembly
	.section	.data.my_barrier,"aw",@progbits
	.type	my_barrier,@object
	.globl	my_barrier
	.p2align	2
my_barrier:
	.byte	255
	.byte	16
	.byte	16
	.byte	__atomic_bit_barrier_my_barrier
	.size	my_barrier, 4
	.text

                                        // End of file scope inline assembly
	.file	1 "/home/oferraz/upmem/upmem/64_code/upmem/8-bit_multiple_threads" "device.c"
	.file	2 "/usr/bin/../share/upmem/include/stdlib" "stdint.h"
	.file	3 "/usr/bin/../share/upmem/include/syslib" "perfcounter.h"
	.section	.text.main,"ax",@progbits
	.globl	main                            // -- Begin function main
	.type	main,@function
main:                                   // @main
.Lfunc_begin0:
	.loc	1 34 0                          // device.c:34:0
	.cfi_sections .debug_frame
	.cfi_startproc
// %bb.0:
	.cfi_def_cfa_offset -120
	.cfi_offset 23, -8
	.cfi_offset 22, -4
	sd r22, 112, d22
	add r22, r22, 120
	.cfi_offset 15, -96
	.cfi_offset 14, -92
	sd r22, -96, d14
	.cfi_offset 17, -104
	.cfi_offset 16, -100
	sd r22, -104, d16
	.cfi_offset 19, -112
	.cfi_offset 18, -108
	sd r22, -112, d18
	.cfi_offset 21, -120
	.cfi_offset 20, -116
	sd r22, -120, d20
	move r0, 1
.Ltmp0:
	.loc	1 35 2 prologue_end             // device.c:35:2
	move r1, r0
	call r23, perfcounter_config
.Ltmp1:
	.file	4 "/usr/bin/../share/upmem/include/syslib" "defs.h"
	.loc	4 35 12 is_stmt 0               // /usr/bin/../share/upmem/include/syslib/defs.h:35:12
	move r0, id
.Ltmp2:
	sw r22, -12, r0
	.loc	1 183 4 is_stmt 1               // device.c:183:4
	move r6, id4
.Ltmp3:
	//DEBUG_VALUE: main:true_codeword <- 0
	//DEBUG_VALUE: main:max_iter <- 5
	//DEBUG_VALUE: i <- $r6
	.loc	1 184 45                        // device.c:184:45
	extsh r7, id4
	.loc	1 184 61 is_stmt 0              // device.c:184:61
	add r8, id4, 4
.Ltmp4:
	.loc	1 183 4 is_stmt 1               // device.c:183:4
	lsl_add r9, r6, id, 4
.Ltmp5:
	//DEBUG_VALUE: main:k <- $r9
	//DEBUG_VALUE: i <- $r6
	.loc	1 184 2                         // device.c:184:2
	jleu r8, r7, .LBB0_3
.Ltmp6:
// %bb.1:
	//DEBUG_VALUE: main:k <- $r9
	//DEBUG_VALUE: i <- $r6
	//DEBUG_VALUE: main:max_iter <- 5
	//DEBUG_VALUE: main:true_codeword <- 0
	.loc	1 0 2 is_stmt 0                 // device.c:0:2
	move r2, r7
	move r0, r9
	move r1, r6
.Ltmp7:
.LBB0_2:                                // =>This Inner Loop Header: Depth=1
	//DEBUG_VALUE: main:max_iter <- 5
	//DEBUG_VALUE: main:true_codeword <- 0
	//DEBUG_VALUE: i <- $r1
	//DEBUG_VALUE: main:k <- $r0
	.loc	1 185 20 is_stmt 1              // device.c:185:20
	lbs r3, r2, L
	.loc	1 185 7 is_stmt 0               // device.c:185:7
	extsh r2, r0
	lsl r2, r2, 1
	lhs r2, r2, LUT_VN
	.loc	1 185 15                        // device.c:185:15
	add r4, r0, 1
.Ltmp8:
	//DEBUG_VALUE: main:k <- $r4
	.loc	1 185 19                        // device.c:185:19
	sb r2, Rcv, r3
	.loc	1 186 15 is_stmt 1              // device.c:186:15
	add r2, r0, 2
.Ltmp9:
	//DEBUG_VALUE: main:k <- $r2
	.loc	1 186 7 is_stmt 0               // device.c:186:7
	extsh r4, r4
	lsl r4, r4, 1
	lhs r4, r4, LUT_VN
	.loc	1 187 15 is_stmt 1              // device.c:187:15
	add r5, r0, 3
.Ltmp10:
	//DEBUG_VALUE: main:k <- $r5
	.loc	1 187 7 is_stmt 0               // device.c:187:7
	extsh r2, r2
	lsl r2, r2, 1
	lhs r2, r2, LUT_VN
	.loc	1 188 7 is_stmt 1               // device.c:188:7
	extsh r5, r5
.Ltmp11:
	lsl r5, r5, 1
	lhs r5, r5, LUT_VN
	.loc	1 186 19                        // device.c:186:19
	sb r4, Rcv, r3
	.loc	1 187 19                        // device.c:187:19
	sb r2, Rcv, r3
	.loc	1 188 15                        // device.c:188:15
	add r2, r0, 4
.Ltmp12:
	//DEBUG_VALUE: main:k <- $r2
	.loc	1 188 19 is_stmt 0              // device.c:188:19
	sb r5, Rcv, r3
	.loc	1 189 7 is_stmt 1               // device.c:189:7
	extsh r2, r2
.Ltmp13:
	lsl r2, r2, 1
	lhs r4, r2, LUT_VN
	.loc	1 189 15 is_stmt 0              // device.c:189:15
	add r0, r0, 5
.Ltmp14:
	//DEBUG_VALUE: main:k <- $r0
	.loc	1 184 84 is_stmt 1              // device.c:184:84
	add r1, r1, 1
.Ltmp15:
	//DEBUG_VALUE: i <- $r1
	.loc	1 184 45 is_stmt 0              // device.c:184:45
	extsh r2, r1
.Ltmp16:
	.loc	1 189 19 is_stmt 1              // device.c:189:19
	sb r4, Rcv, r3
.Ltmp17:
	.loc	1 184 2                         // device.c:184:2
	jgtu r8, r2, .LBB0_2
.Ltmp18:
.LBB0_3:
	//DEBUG_VALUE: main:max_iter <- 5
	//DEBUG_VALUE: main:true_codeword <- 0
	sw r22, -36, r9
	sw r22, -40, r8
	sw r22, -44, r7
	lw r1, r22, -12
	.loc	1 193 4                         // device.c:193:4
	lsl r0, r1, 2
	lsl_add r0, r0, r1, 3
.Ltmp19:
	.loc	1 194 24                        // device.c:194:24
	add r18, r6, 64
.Ltmp20:
	//DEBUG_VALUE: i <- $r18
	.loc	1 194 47 is_stmt 0              // device.c:194:47
	extsh r19, r18
	sw r22, -48, r6
	.loc	1 194 65                        // device.c:194:65
	add r20, r6, 68
.Ltmp21:
	.loc	1 193 4 is_stmt 1               // device.c:193:4
	add r0, r0, 320
.Ltmp22:
	//DEBUG_VALUE: main:k <- $r0
	sw r22, -56, r0
.Ltmp23:
	//DEBUG_VALUE: main:k <- [DW_OP_constu 56, DW_OP_minus] [$r22+0]
	//DEBUG_VALUE: i <- $r18
	.loc	1 194 2                         // device.c:194:2
	jleu r20, r19, .LBB0_6
.Ltmp24:
// %bb.4:
	//DEBUG_VALUE: main:k <- [DW_OP_constu 56, DW_OP_minus] [$r22+0]
	//DEBUG_VALUE: i <- $r18
	//DEBUG_VALUE: main:max_iter <- 5
	//DEBUG_VALUE: main:true_codeword <- 0
	.loc	1 0 2 is_stmt 0                 // device.c:0:2
	move r2, r19
	lw r0, r22, -56
	move r1, r18
.Ltmp25:
.LBB0_5:                                // =>This Inner Loop Header: Depth=1
	//DEBUG_VALUE: main:max_iter <- 5
	//DEBUG_VALUE: main:true_codeword <- 0
	//DEBUG_VALUE: main:k <- $r0
	//DEBUG_VALUE: i <- $r1
	.loc	1 195 20 is_stmt 1              // device.c:195:20
	lbs r3, r2, L
	.loc	1 195 15 is_stmt 0              // device.c:195:15
	add r2, r0, 1
.Ltmp26:
	//DEBUG_VALUE: main:k <- $r2
	.loc	1 195 7                         // device.c:195:7
	extsh r4, r0
	lsl r4, r4, 1
	lhs r4, r4, LUT_VN
	.loc	1 196 7 is_stmt 1               // device.c:196:7
	extsh r2, r2
.Ltmp27:
	lsl r2, r2, 1
	lhs r2, r2, LUT_VN
	.loc	1 195 19                        // device.c:195:19
	sb r4, Rcv, r3
	.loc	1 196 15                        // device.c:196:15
	add r4, r0, 2
.Ltmp28:
	//DEBUG_VALUE: main:k <- $r4
	.loc	1 196 19 is_stmt 0              // device.c:196:19
	sb r2, Rcv, r3
	.loc	1 197 7 is_stmt 1               // device.c:197:7
	extsh r2, r4
	lsl r2, r2, 1
	lhs r4, r2, LUT_VN
.Ltmp29:
	.loc	1 197 15 is_stmt 0              // device.c:197:15
	add r0, r0, 3
.Ltmp30:
	//DEBUG_VALUE: main:k <- $r0
	.loc	1 194 88 is_stmt 1              // device.c:194:88
	add r1, r1, 1
.Ltmp31:
	//DEBUG_VALUE: i <- $r1
	.loc	1 194 47 is_stmt 0              // device.c:194:47
	extsh r2, r1
.Ltmp32:
	.loc	1 197 19 is_stmt 1              // device.c:197:19
	sb r4, Rcv, r3
.Ltmp33:
	.loc	1 194 2                         // device.c:194:2
	jgtu r20, r2, .LBB0_5
.Ltmp34:
.LBB0_6:
	//DEBUG_VALUE: main:max_iter <- 5
	//DEBUG_VALUE: main:true_codeword <- 0
	.loc	1 207 2                         // device.c:207:2
	move r0, my_barrier
	call r23, barrier_wait
.Ltmp35:
	//DEBUG_VALUE: main:num_iter <- 0
	.loc	1 0 2 is_stmt 0                 // device.c:0:2
	lw r0, r22, -12
	lsl r0, r0, 5
.Ltmp36:
	.loc	1 210 2 is_stmt 1               // device.c:210:2
	extsh r0, r0
	move r1, Rcv
	add r0, r0, r1
	move r1, 0
	add r0, r0, 7
	sw r22, -16, r0
	sw r22, -20, r1
	move r0, r1
	sw r22, -32, r18
	sw r22, -28, r19
	sw r22, -24, r20
	jump .LBB0_7
.Ltmp37:
.LBB0_120:                              //   in Loop: Header=BB0_7 Depth=1
	//DEBUG_VALUE: main:num_iter <- [DW_OP_constu 52, DW_OP_minus] [$r22+0]
	//DEBUG_VALUE: main:max_iter <- 5
	//DEBUG_VALUE: main:true_codeword <- 0
	.loc	1 590 3                         // device.c:590:3
	move r0, my_barrier
	call r23, barrier_wait
.Ltmp38:
	.loc	1 0 3 is_stmt 0                 // device.c:0:3
	lw r1, r22, -52
.Ltmp39:
	.loc	1 210 44 is_stmt 1              // device.c:210:44
	add r0, r1, 1
.Ltmp40:
	//DEBUG_VALUE: main:num_iter <- $r0
	and r1, r1, 255
.Ltmp41:
	//DEBUG_VALUE: main:num_iter <- $r0
	.loc	1 210 2 is_stmt 0               // device.c:210:2
	jgeu r1, 4, .LBB0_121
.Ltmp42:
.LBB0_7:                                // =>This Loop Header: Depth=1
                                        //     Child Loop BB0_8 Depth 2
                                        //     Child Loop BB0_125 Depth 2
                                        //     Child Loop BB0_126 Depth 2
                                        //     Child Loop BB0_127 Depth 2
                                        //     Child Loop BB0_128 Depth 2
	//DEBUG_VALUE: main:max_iter <- 5
	//DEBUG_VALUE: main:true_codeword <- 0
	//DEBUG_VALUE: main:k <- [DW_OP_constu 12, DW_OP_minus, DW_OP_deref_size 4, DW_OP_LLVM_convert 32 7, DW_OP_LLVM_convert 16 7, DW_OP_constu 5, DW_OP_shl, DW_OP_stack_value] $r22
	//DEBUG_VALUE: main:num_iter <- $r0
	sw r22, -52, r0
.Ltmp43:
	//DEBUG_VALUE: main:num_iter <- [DW_OP_constu 52, DW_OP_minus] [$r22+0]
	.loc	1 0 2                           // device.c:0:2
	lw r20, r22, -16
	lw r7, r22, -20
	//DEBUG_VALUE: j <- 0
	jump .LBB0_8
.Ltmp44:
.LBB0_115:                              //   in Loop: Header=BB0_8 Depth=2
	//DEBUG_VALUE: main:num_iter <- [DW_OP_constu 52, DW_OP_minus] [$r22+0]
	//DEBUG_VALUE: j <- $r7
	//DEBUG_VALUE: main:max_iter <- 5
	//DEBUG_VALUE: main:true_codeword <- 0
	sb r20, 0, r0
.Ltmp45:
	//DEBUG_VALUE: main:k <- [DW_OP_plus_uconst 8, DW_OP_stack_value] undef
	.loc	1 219 46 is_stmt 1              // device.c:219:46
	add r0, r18, 1
.Ltmp46:
	//DEBUG_VALUE: j <- $r0
	.loc	1 219 3 is_stmt 0               // device.c:219:3
	add r20, r20, 8
.Ltmp47:
	.loc	1 219 46                        // device.c:219:46
	and r1, r18, 255
	move r7, r0
.Ltmp48:
	//DEBUG_VALUE: j <- $r7
	.loc	1 219 3                         // device.c:219:3
	jgeu r1, 3, .LBB0_116
.Ltmp49:
.LBB0_8:                                //   Parent Loop BB0_7 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	//DEBUG_VALUE: main:num_iter <- [DW_OP_constu 52, DW_OP_minus] [$r22+0]
	//DEBUG_VALUE: main:max_iter <- 5
	//DEBUG_VALUE: main:true_codeword <- 0
	//DEBUG_VALUE: main:k <- undef
	//DEBUG_VALUE: j <- $r7
	//DEBUG_VALUE: main:min1 <- 127
	//DEBUG_VALUE: main:min2 <- 127
	//DEBUG_VALUE: index <- 0
	//DEBUG_VALUE: sign <- 1
	.loc	1 229 24 is_stmt 1              // device.c:229:24
	lbs r0, r20, -7
.Ltmp50:
	//DEBUG_VALUE: main:abs_Rcv <- undef
	//DEBUG_VALUE: mask <- [DW_OP_constu 7, DW_OP_shra, DW_OP_stack_value] $r0
	.loc	1 0 24 is_stmt 0                // device.c:0:24
	extsb r1, r0
	.loc	1 233 7 is_stmt 1               // device.c:233:7
	jlts r1, 0, .LBB0_9
.Ltmp51:
// %bb.10:                              //   in Loop: Header=BB0_8 Depth=2
	//DEBUG_VALUE: main:num_iter <- [DW_OP_constu 52, DW_OP_minus] [$r22+0]
	//DEBUG_VALUE: j <- $r7
	//DEBUG_VALUE: mask <- [DW_OP_constu 7, DW_OP_shra, DW_OP_stack_value] $r0
	//DEBUG_VALUE: sign <- 1
	//DEBUG_VALUE: index <- 0
	//DEBUG_VALUE: main:min2 <- 127
	//DEBUG_VALUE: main:min1 <- 127
	//DEBUG_VALUE: main:max_iter <- 5
	//DEBUG_VALUE: main:true_codeword <- 0
	.loc	1 0 7 is_stmt 0                 // device.c:0:7
	move r17, 1
.Ltmp52:
	//DEBUG_VALUE: main:min1 <- undef
	//DEBUG_VALUE: sign <- $r17
	//DEBUG_VALUE: main:abs_Rcv <- undef
	.loc	1 249 10 is_stmt 1              // device.c:249:10
	lbs r21, r20, -6
	//DEBUG_VALUE: main:abs_Rcv <- undef
.Ltmp53:
	//DEBUG_VALUE: mask <- [DW_OP_constu 7, DW_OP_shra, DW_OP_stack_value] $r21
	.loc	1 0 10 is_stmt 0                // device.c:0:10
	extsb r1, r21
	.loc	1 251 7 is_stmt 1               // device.c:251:7
	jges r1, 0, .LBB0_13
.Ltmp54:
.LBB0_12:                               //   in Loop: Header=BB0_8 Depth=2
	//DEBUG_VALUE: main:num_iter <- [DW_OP_constu 52, DW_OP_minus] [$r22+0]
	//DEBUG_VALUE: mask <- [DW_OP_constu 7, DW_OP_shra, DW_OP_stack_value] $r21
	//DEBUG_VALUE: sign <- $r17
	//DEBUG_VALUE: j <- $r7
	//DEBUG_VALUE: index <- 0
	//DEBUG_VALUE: main:min2 <- 127
	//DEBUG_VALUE: main:max_iter <- 5
	//DEBUG_VALUE: main:true_codeword <- 0
	.loc	1 0 7 is_stmt 0                 // device.c:0:7
	neg r17, r17
.Ltmp55:
.LBB0_13:                               //   in Loop: Header=BB0_8 Depth=2
	//DEBUG_VALUE: main:num_iter <- [DW_OP_constu 52, DW_OP_minus] [$r22+0]
	//DEBUG_VALUE: mask <- [DW_OP_constu 7, DW_OP_shra, DW_OP_stack_value] $r21
	//DEBUG_VALUE: j <- $r7
	//DEBUG_VALUE: index <- 0
	//DEBUG_VALUE: main:min2 <- 127
	//DEBUG_VALUE: main:max_iter <- 5
	//DEBUG_VALUE: main:true_codeword <- 0
	asr r1, r0, 31
	add r2, r0, r1
	xor r1, r2, r1
	extsb r2, r1
.Ltmp56:
	//DEBUG_VALUE: main:min1 <- $r2
	asr r1, r21, 31
	add r3, r21, r1
	xor r1, r3, r1
.Ltmp57:
	//DEBUG_VALUE: main:abs_Rcv <- $r1
	extsb r5, r1
.Ltmp58:
	//DEBUG_VALUE: sign <- $r17
	.loc	1 255 7 is_stmt 1               // device.c:255:7
	move r4, r5
	move r6, r2
	jlts r5, r2, .LBB0_15
.Ltmp59:
// %bb.14:                              //   in Loop: Header=BB0_8 Depth=2
	//DEBUG_VALUE: main:num_iter <- [DW_OP_constu 52, DW_OP_minus] [$r22+0]
	//DEBUG_VALUE: mask <- [DW_OP_constu 7, DW_OP_shra, DW_OP_stack_value] $r21
	//DEBUG_VALUE: sign <- $r17
	//DEBUG_VALUE: j <- $r7
	//DEBUG_VALUE: main:min1 <- $r2
	//DEBUG_VALUE: main:abs_Rcv <- $r1
	//DEBUG_VALUE: index <- 0
	//DEBUG_VALUE: main:min2 <- 127
	//DEBUG_VALUE: main:max_iter <- 5
	//DEBUG_VALUE: main:true_codeword <- 0
	move r4, r2
	move r6, r5
.Ltmp60:
.LBB0_15:                               //   in Loop: Header=BB0_8 Depth=2
	//DEBUG_VALUE: main:num_iter <- [DW_OP_constu 52, DW_OP_minus] [$r22+0]
	//DEBUG_VALUE: mask <- [DW_OP_constu 7, DW_OP_shra, DW_OP_stack_value] $r21
	//DEBUG_VALUE: sign <- $r17
	//DEBUG_VALUE: j <- $r7
	//DEBUG_VALUE: main:min1 <- $r2
	//DEBUG_VALUE: main:abs_Rcv <- $r1
	//DEBUG_VALUE: index <- 0
	//DEBUG_VALUE: main:min2 <- 127
	//DEBUG_VALUE: main:max_iter <- 5
	//DEBUG_VALUE: main:true_codeword <- 0
	//DEBUG_VALUE: main:min1 <- $r4
	//DEBUG_VALUE: main:min2 <- $r6
	//DEBUG_VALUE: index <- undef
	.loc	1 268 10                        // device.c:268:10
	lbs r3, r20, -5
.Ltmp61:
	//DEBUG_VALUE: main:abs_Rcv <- undef
	//DEBUG_VALUE: mask <- [DW_OP_constu 7, DW_OP_shra, DW_OP_stack_value] $r3
	.loc	1 0 10 is_stmt 0                // device.c:0:10
	extsb r1, r3
	.loc	1 270 7 is_stmt 1               // device.c:270:7
	jges r1, 0, .LBB0_17
.Ltmp62:
// %bb.16:                              //   in Loop: Header=BB0_8 Depth=2
	//DEBUG_VALUE: main:num_iter <- [DW_OP_constu 52, DW_OP_minus] [$r22+0]
	//DEBUG_VALUE: sign <- $r17
	//DEBUG_VALUE: j <- $r7
	//DEBUG_VALUE: main:min2 <- $r6
	//DEBUG_VALUE: main:min1 <- $r4
	//DEBUG_VALUE: mask <- [DW_OP_constu 7, DW_OP_shra, DW_OP_stack_value] $r3
	//DEBUG_VALUE: main:max_iter <- 5
	//DEBUG_VALUE: main:true_codeword <- 0
	.loc	1 0 7 is_stmt 0                 // device.c:0:7
	neg r17, r17
.Ltmp63:
.LBB0_17:                               //   in Loop: Header=BB0_8 Depth=2
	//DEBUG_VALUE: main:num_iter <- [DW_OP_constu 52, DW_OP_minus] [$r22+0]
	//DEBUG_VALUE: j <- $r7
	//DEBUG_VALUE: main:min2 <- $r6
	//DEBUG_VALUE: main:min1 <- $r4
	//DEBUG_VALUE: mask <- [DW_OP_constu 7, DW_OP_shra, DW_OP_stack_value] $r3
	//DEBUG_VALUE: main:max_iter <- 5
	//DEBUG_VALUE: main:true_codeword <- 0
	asr r1, r3, 31
	sw r22, -68, r3
	add r3, r3, r1
.Ltmp64:
	xor r1, r3, r1
.Ltmp65:
	//DEBUG_VALUE: main:abs_Rcv <- $r1
	extsb r1, r1
.Ltmp66:
	//DEBUG_VALUE: sign <- $r17
	.loc	1 274 7 is_stmt 1               // device.c:274:7
	move r3, r1
	jlts r1, r6, .LBB0_19
.Ltmp67:
// %bb.18:                              //   in Loop: Header=BB0_8 Depth=2
	//DEBUG_VALUE: main:num_iter <- [DW_OP_constu 52, DW_OP_minus] [$r22+0]
	//DEBUG_VALUE: sign <- $r17
	//DEBUG_VALUE: j <- $r7
	//DEBUG_VALUE: main:min2 <- $r6
	//DEBUG_VALUE: main:min1 <- $r4
	//DEBUG_VALUE: main:max_iter <- 5
	//DEBUG_VALUE: main:true_codeword <- 0
	move r3, r6
.Ltmp68:
.LBB0_19:                               //   in Loop: Header=BB0_8 Depth=2
	//DEBUG_VALUE: main:num_iter <- [DW_OP_constu 52, DW_OP_minus] [$r22+0]
	//DEBUG_VALUE: sign <- $r17
	//DEBUG_VALUE: j <- $r7
	//DEBUG_VALUE: main:min2 <- $r6
	//DEBUG_VALUE: main:min1 <- $r4
	//DEBUG_VALUE: main:max_iter <- 5
	//DEBUG_VALUE: main:true_codeword <- 0
	.loc	1 0 7 is_stmt 0                 // device.c:0:7
	move r19, 2
	.loc	1 274 7                         // device.c:274:7
	jges r1, r4, .LBB0_21
.Ltmp69:
// %bb.20:                              //   in Loop: Header=BB0_8 Depth=2
	//DEBUG_VALUE: main:num_iter <- [DW_OP_constu 52, DW_OP_minus] [$r22+0]
	//DEBUG_VALUE: sign <- $r17
	//DEBUG_VALUE: j <- $r7
	//DEBUG_VALUE: main:min2 <- $r6
	//DEBUG_VALUE: main:min1 <- $r4
	//DEBUG_VALUE: main:max_iter <- 5
	//DEBUG_VALUE: main:true_codeword <- 0
	move r3, r4
.Ltmp70:
	//DEBUG_VALUE: main:min1 <- $r1
	//DEBUG_VALUE: main:min2 <- $r3
	//DEBUG_VALUE: index <- $r19
	.loc	1 284 10 is_stmt 1              // device.c:284:10
	lbs r5, r20, -4
.Ltmp71:
	//DEBUG_VALUE: main:abs_Rcv <- undef
	//DEBUG_VALUE: mask <- [DW_OP_constu 7, DW_OP_shra, DW_OP_stack_value] $r5
	.loc	1 0 10 is_stmt 0                // device.c:0:10
	extsb r2, r5
	jges r2, 0, .LBB0_24
	jump .LBB0_23
.Ltmp72:
.LBB0_21:                               //   in Loop: Header=BB0_8 Depth=2
	//DEBUG_VALUE: main:num_iter <- [DW_OP_constu 52, DW_OP_minus] [$r22+0]
	//DEBUG_VALUE: sign <- $r17
	//DEBUG_VALUE: j <- $r7
	//DEBUG_VALUE: main:min2 <- $r6
	//DEBUG_VALUE: main:min1 <- $r4
	//DEBUG_VALUE: main:max_iter <- 5
	//DEBUG_VALUE: main:true_codeword <- 0
	sub r19, r5, r2, lts
	.loc	1 274 7 is_stmt 1               // device.c:274:7
	move r1, r4
.Ltmp73:
	//DEBUG_VALUE: main:min1 <- $r1
	//DEBUG_VALUE: main:min2 <- $r3
	//DEBUG_VALUE: index <- $r19
	.loc	1 284 10                        // device.c:284:10
	lbs r5, r20, -4
.Ltmp74:
	//DEBUG_VALUE: main:abs_Rcv <- undef
	//DEBUG_VALUE: mask <- [DW_OP_constu 7, DW_OP_shra, DW_OP_stack_value] $r5
	.loc	1 0 10 is_stmt 0                // device.c:0:10
	extsb r2, r5
	.loc	1 286 7 is_stmt 1               // device.c:286:7
	jges r2, 0, .LBB0_24
.Ltmp75:
.LBB0_23:                               //   in Loop: Header=BB0_8 Depth=2
	//DEBUG_VALUE: main:num_iter <- [DW_OP_constu 52, DW_OP_minus] [$r22+0]
	//DEBUG_VALUE: index <- $r19
	//DEBUG_VALUE: sign <- $r17
	//DEBUG_VALUE: j <- $r7
	//DEBUG_VALUE: mask <- [DW_OP_constu 7, DW_OP_shra, DW_OP_stack_value] $r5
	//DEBUG_VALUE: main:min2 <- $r3
	//DEBUG_VALUE: main:min1 <- $r1
	//DEBUG_VALUE: main:max_iter <- 5
	//DEBUG_VALUE: main:true_codeword <- 0
	.loc	1 0 7 is_stmt 0                 // device.c:0:7
	neg r17, r17
.Ltmp76:
.LBB0_24:                               //   in Loop: Header=BB0_8 Depth=2
	//DEBUG_VALUE: main:num_iter <- [DW_OP_constu 52, DW_OP_minus] [$r22+0]
	//DEBUG_VALUE: index <- $r19
	//DEBUG_VALUE: j <- $r7
	//DEBUG_VALUE: mask <- [DW_OP_constu 7, DW_OP_shra, DW_OP_stack_value] $r5
	//DEBUG_VALUE: main:min2 <- $r3
	//DEBUG_VALUE: main:min1 <- $r1
	//DEBUG_VALUE: main:max_iter <- 5
	//DEBUG_VALUE: main:true_codeword <- 0
	asr r2, r5, 31
	add r4, r5, r2
	xor r2, r4, r2
.Ltmp77:
	//DEBUG_VALUE: main:abs_Rcv <- $r2
	extsb r2, r2
.Ltmp78:
	//DEBUG_VALUE: sign <- $r17
	.loc	1 290 7 is_stmt 1               // device.c:290:7
	move r4, r2
	jlts r2, r3, .LBB0_26
.Ltmp79:
// %bb.25:                              //   in Loop: Header=BB0_8 Depth=2
	//DEBUG_VALUE: main:num_iter <- [DW_OP_constu 52, DW_OP_minus] [$r22+0]
	//DEBUG_VALUE: index <- $r19
	//DEBUG_VALUE: sign <- $r17
	//DEBUG_VALUE: j <- $r7
	//DEBUG_VALUE: mask <- [DW_OP_constu 7, DW_OP_shra, DW_OP_stack_value] $r5
	//DEBUG_VALUE: main:min2 <- $r3
	//DEBUG_VALUE: main:min1 <- $r1
	//DEBUG_VALUE: main:max_iter <- 5
	//DEBUG_VALUE: main:true_codeword <- 0
	move r4, r3
.Ltmp80:
.LBB0_26:                               //   in Loop: Header=BB0_8 Depth=2
	//DEBUG_VALUE: main:num_iter <- [DW_OP_constu 52, DW_OP_minus] [$r22+0]
	//DEBUG_VALUE: index <- $r19
	//DEBUG_VALUE: sign <- $r17
	//DEBUG_VALUE: j <- $r7
	//DEBUG_VALUE: mask <- [DW_OP_constu 7, DW_OP_shra, DW_OP_stack_value] $r5
	//DEBUG_VALUE: main:min2 <- $r3
	//DEBUG_VALUE: main:min1 <- $r1
	//DEBUG_VALUE: main:max_iter <- 5
	//DEBUG_VALUE: main:true_codeword <- 0
	.loc	1 0 7 is_stmt 0                 // device.c:0:7
	move r3, 3
.Ltmp81:
	.loc	1 290 7                         // device.c:290:7
	jges r2, r1, .LBB0_28
.Ltmp82:
// %bb.27:                              //   in Loop: Header=BB0_8 Depth=2
	//DEBUG_VALUE: main:num_iter <- [DW_OP_constu 52, DW_OP_minus] [$r22+0]
	//DEBUG_VALUE: index <- $r19
	//DEBUG_VALUE: sign <- $r17
	//DEBUG_VALUE: j <- $r7
	//DEBUG_VALUE: mask <- [DW_OP_constu 7, DW_OP_shra, DW_OP_stack_value] $r5
	//DEBUG_VALUE: main:min1 <- $r1
	//DEBUG_VALUE: main:max_iter <- 5
	//DEBUG_VALUE: main:true_codeword <- 0
	move r4, r1
	move r19, r3
.Ltmp83:
	//DEBUG_VALUE: main:min1 <- $r2
	//DEBUG_VALUE: main:min2 <- $r4
	//DEBUG_VALUE: index <- $r19
	.loc	1 300 10 is_stmt 1              // device.c:300:10
	lbs r8, r20, -3
.Ltmp84:
	//DEBUG_VALUE: main:abs_Rcv <- undef
	//DEBUG_VALUE: mask <- [DW_OP_constu 7, DW_OP_shra, DW_OP_stack_value] $r8
	.loc	1 0 10 is_stmt 0                // device.c:0:10
	extsb r1, r8
	jges r1, 0, .LBB0_31
	jump .LBB0_30
.Ltmp85:
.LBB0_28:                               //   in Loop: Header=BB0_8 Depth=2
	//DEBUG_VALUE: main:num_iter <- [DW_OP_constu 52, DW_OP_minus] [$r22+0]
	//DEBUG_VALUE: index <- $r19
	//DEBUG_VALUE: sign <- $r17
	//DEBUG_VALUE: j <- $r7
	//DEBUG_VALUE: mask <- [DW_OP_constu 7, DW_OP_shra, DW_OP_stack_value] $r5
	//DEBUG_VALUE: main:min1 <- $r1
	//DEBUG_VALUE: main:max_iter <- 5
	//DEBUG_VALUE: main:true_codeword <- 0
	.loc	1 290 7 is_stmt 1               // device.c:290:7
	move r2, r1
.Ltmp86:
	//DEBUG_VALUE: main:min1 <- $r2
	//DEBUG_VALUE: main:min2 <- $r4
	//DEBUG_VALUE: index <- $r19
	.loc	1 300 10                        // device.c:300:10
	lbs r8, r20, -3
.Ltmp87:
	//DEBUG_VALUE: main:abs_Rcv <- undef
	//DEBUG_VALUE: mask <- [DW_OP_constu 7, DW_OP_shra, DW_OP_stack_value] $r8
	.loc	1 0 10 is_stmt 0                // device.c:0:10
	extsb r1, r8
	.loc	1 302 7 is_stmt 1               // device.c:302:7
	jges r1, 0, .LBB0_31
.Ltmp88:
.LBB0_30:                               //   in Loop: Header=BB0_8 Depth=2
	//DEBUG_VALUE: main:num_iter <- [DW_OP_constu 52, DW_OP_minus] [$r22+0]
	//DEBUG_VALUE: index <- $r19
	//DEBUG_VALUE: sign <- $r17
	//DEBUG_VALUE: mask <- [DW_OP_constu 7, DW_OP_shra, DW_OP_stack_value] $r8
	//DEBUG_VALUE: j <- $r7
	//DEBUG_VALUE: main:min2 <- $r4
	//DEBUG_VALUE: main:min1 <- $r2
	//DEBUG_VALUE: main:max_iter <- 5
	//DEBUG_VALUE: main:true_codeword <- 0
	.loc	1 0 7 is_stmt 0                 // device.c:0:7
	neg r17, r17
.Ltmp89:
.LBB0_31:                               //   in Loop: Header=BB0_8 Depth=2
	//DEBUG_VALUE: main:num_iter <- [DW_OP_constu 52, DW_OP_minus] [$r22+0]
	//DEBUG_VALUE: index <- $r19
	//DEBUG_VALUE: mask <- [DW_OP_constu 7, DW_OP_shra, DW_OP_stack_value] $r8
	//DEBUG_VALUE: j <- $r7
	//DEBUG_VALUE: main:min2 <- $r4
	//DEBUG_VALUE: main:min1 <- $r2
	//DEBUG_VALUE: main:max_iter <- 5
	//DEBUG_VALUE: main:true_codeword <- 0
	asr r1, r8, 31
	add r3, r8, r1
	xor r1, r3, r1
.Ltmp90:
	//DEBUG_VALUE: main:abs_Rcv <- $r1
	extsb r1, r1
.Ltmp91:
	//DEBUG_VALUE: sign <- $r17
	.loc	1 306 7 is_stmt 1               // device.c:306:7
	move r3, r1
	jlts r1, r4, .LBB0_33
.Ltmp92:
// %bb.32:                              //   in Loop: Header=BB0_8 Depth=2
	//DEBUG_VALUE: main:num_iter <- [DW_OP_constu 52, DW_OP_minus] [$r22+0]
	//DEBUG_VALUE: index <- $r19
	//DEBUG_VALUE: sign <- $r17
	//DEBUG_VALUE: mask <- [DW_OP_constu 7, DW_OP_shra, DW_OP_stack_value] $r8
	//DEBUG_VALUE: j <- $r7
	//DEBUG_VALUE: main:min2 <- $r4
	//DEBUG_VALUE: main:min1 <- $r2
	//DEBUG_VALUE: main:max_iter <- 5
	//DEBUG_VALUE: main:true_codeword <- 0
	move r3, r4
.Ltmp93:
.LBB0_33:                               //   in Loop: Header=BB0_8 Depth=2
	//DEBUG_VALUE: main:num_iter <- [DW_OP_constu 52, DW_OP_minus] [$r22+0]
	//DEBUG_VALUE: index <- $r19
	//DEBUG_VALUE: sign <- $r17
	//DEBUG_VALUE: mask <- [DW_OP_constu 7, DW_OP_shra, DW_OP_stack_value] $r8
	//DEBUG_VALUE: j <- $r7
	//DEBUG_VALUE: main:min2 <- $r4
	//DEBUG_VALUE: main:min1 <- $r2
	//DEBUG_VALUE: main:max_iter <- 5
	//DEBUG_VALUE: main:true_codeword <- 0
	.loc	1 0 7 is_stmt 0                 // device.c:0:7
	move r4, 4
.Ltmp94:
	.loc	1 306 7                         // device.c:306:7
	jges r1, r2, .LBB0_35
.Ltmp95:
// %bb.34:                              //   in Loop: Header=BB0_8 Depth=2
	//DEBUG_VALUE: main:num_iter <- [DW_OP_constu 52, DW_OP_minus] [$r22+0]
	//DEBUG_VALUE: index <- $r19
	//DEBUG_VALUE: sign <- $r17
	//DEBUG_VALUE: mask <- [DW_OP_constu 7, DW_OP_shra, DW_OP_stack_value] $r8
	//DEBUG_VALUE: j <- $r7
	//DEBUG_VALUE: main:min1 <- $r2
	//DEBUG_VALUE: main:max_iter <- 5
	//DEBUG_VALUE: main:true_codeword <- 0
	move r3, r2
	move r19, r4
.Ltmp96:
	//DEBUG_VALUE: main:min1 <- $r1
	//DEBUG_VALUE: main:min2 <- $r3
	//DEBUG_VALUE: index <- $r19
	.loc	1 316 10 is_stmt 1              // device.c:316:10
	lbs r6, r20, -2
.Ltmp97:
	//DEBUG_VALUE: main:abs_Rcv <- undef
	//DEBUG_VALUE: mask <- [DW_OP_constu 7, DW_OP_shra, DW_OP_stack_value] $r6
	.loc	1 0 10 is_stmt 0                // device.c:0:10
	extsb r2, r6
	jges r2, 0, .LBB0_38
	jump .LBB0_37
.Ltmp98:
.LBB0_35:                               //   in Loop: Header=BB0_8 Depth=2
	//DEBUG_VALUE: main:num_iter <- [DW_OP_constu 52, DW_OP_minus] [$r22+0]
	//DEBUG_VALUE: index <- $r19
	//DEBUG_VALUE: sign <- $r17
	//DEBUG_VALUE: mask <- [DW_OP_constu 7, DW_OP_shra, DW_OP_stack_value] $r8
	//DEBUG_VALUE: j <- $r7
	//DEBUG_VALUE: main:min1 <- $r2
	//DEBUG_VALUE: main:max_iter <- 5
	//DEBUG_VALUE: main:true_codeword <- 0
	.loc	1 306 7 is_stmt 1               // device.c:306:7
	move r1, r2
.Ltmp99:
	//DEBUG_VALUE: main:min1 <- $r1
	//DEBUG_VALUE: main:min2 <- $r3
	//DEBUG_VALUE: index <- $r19
	.loc	1 316 10                        // device.c:316:10
	lbs r6, r20, -2
.Ltmp100:
	//DEBUG_VALUE: main:abs_Rcv <- undef
	//DEBUG_VALUE: mask <- [DW_OP_constu 7, DW_OP_shra, DW_OP_stack_value] $r6
	.loc	1 0 10 is_stmt 0                // device.c:0:10
	extsb r2, r6
	.loc	1 318 7 is_stmt 1               // device.c:318:7
	jges r2, 0, .LBB0_38
.Ltmp101:
.LBB0_37:                               //   in Loop: Header=BB0_8 Depth=2
	//DEBUG_VALUE: main:num_iter <- [DW_OP_constu 52, DW_OP_minus] [$r22+0]
	//DEBUG_VALUE: index <- $r19
	//DEBUG_VALUE: sign <- $r17
	//DEBUG_VALUE: j <- $r7
	//DEBUG_VALUE: mask <- [DW_OP_constu 7, DW_OP_shra, DW_OP_stack_value] $r6
	//DEBUG_VALUE: main:min2 <- $r3
	//DEBUG_VALUE: main:min1 <- $r1
	//DEBUG_VALUE: main:max_iter <- 5
	//DEBUG_VALUE: main:true_codeword <- 0
	.loc	1 0 7 is_stmt 0                 // device.c:0:7
	neg r17, r17
.Ltmp102:
.LBB0_38:                               //   in Loop: Header=BB0_8 Depth=2
	//DEBUG_VALUE: main:num_iter <- [DW_OP_constu 52, DW_OP_minus] [$r22+0]
	//DEBUG_VALUE: index <- $r19
	//DEBUG_VALUE: j <- $r7
	//DEBUG_VALUE: mask <- [DW_OP_constu 7, DW_OP_shra, DW_OP_stack_value] $r6
	//DEBUG_VALUE: main:min2 <- $r3
	//DEBUG_VALUE: main:min1 <- $r1
	//DEBUG_VALUE: main:max_iter <- 5
	//DEBUG_VALUE: main:true_codeword <- 0
	asr r2, r6, 31
	add r4, r6, r2
	xor r2, r4, r2
.Ltmp103:
	//DEBUG_VALUE: main:abs_Rcv <- $r2
	extsb r2, r2
.Ltmp104:
	//DEBUG_VALUE: sign <- $r17
	.loc	1 322 7 is_stmt 1               // device.c:322:7
	move r4, r2
	jlts r2, r3, .LBB0_40
.Ltmp105:
// %bb.39:                              //   in Loop: Header=BB0_8 Depth=2
	//DEBUG_VALUE: main:num_iter <- [DW_OP_constu 52, DW_OP_minus] [$r22+0]
	//DEBUG_VALUE: index <- $r19
	//DEBUG_VALUE: sign <- $r17
	//DEBUG_VALUE: j <- $r7
	//DEBUG_VALUE: mask <- [DW_OP_constu 7, DW_OP_shra, DW_OP_stack_value] $r6
	//DEBUG_VALUE: main:min2 <- $r3
	//DEBUG_VALUE: main:min1 <- $r1
	//DEBUG_VALUE: main:max_iter <- 5
	//DEBUG_VALUE: main:true_codeword <- 0
	move r4, r3
.Ltmp106:
.LBB0_40:                               //   in Loop: Header=BB0_8 Depth=2
	//DEBUG_VALUE: main:num_iter <- [DW_OP_constu 52, DW_OP_minus] [$r22+0]
	//DEBUG_VALUE: index <- $r19
	//DEBUG_VALUE: sign <- $r17
	//DEBUG_VALUE: j <- $r7
	//DEBUG_VALUE: mask <- [DW_OP_constu 7, DW_OP_shra, DW_OP_stack_value] $r6
	//DEBUG_VALUE: main:min2 <- $r3
	//DEBUG_VALUE: main:min1 <- $r1
	//DEBUG_VALUE: main:max_iter <- 5
	//DEBUG_VALUE: main:true_codeword <- 0
	.loc	1 0 7 is_stmt 0                 // device.c:0:7
	move r3, 5
.Ltmp107:
	sw r22, -72, r5
	.loc	1 322 7                         // device.c:322:7
	jges r2, r1, .LBB0_42
.Ltmp108:
// %bb.41:                              //   in Loop: Header=BB0_8 Depth=2
	//DEBUG_VALUE: main:num_iter <- [DW_OP_constu 52, DW_OP_minus] [$r22+0]
	//DEBUG_VALUE: index <- $r19
	//DEBUG_VALUE: sign <- $r17
	//DEBUG_VALUE: j <- $r7
	//DEBUG_VALUE: mask <- [DW_OP_constu 7, DW_OP_shra, DW_OP_stack_value] $r6
	//DEBUG_VALUE: main:min1 <- $r1
	//DEBUG_VALUE: main:max_iter <- 5
	//DEBUG_VALUE: main:true_codeword <- 0
	move r4, r1
	move r19, r3
.Ltmp109:
	//DEBUG_VALUE: main:min1 <- $r2
	//DEBUG_VALUE: main:min2 <- $r4
	//DEBUG_VALUE: index <- $r19
	.loc	1 332 10 is_stmt 1              // device.c:332:10
	lbs r5, r20, -1
.Ltmp110:
	//DEBUG_VALUE: main:abs_Rcv <- undef
	//DEBUG_VALUE: mask <- [DW_OP_constu 7, DW_OP_shra, DW_OP_stack_value] $r5
	.loc	1 0 10 is_stmt 0                // device.c:0:10
	extsb r1, r5
	jges r1, 0, .LBB0_45
	jump .LBB0_44
.Ltmp111:
.LBB0_42:                               //   in Loop: Header=BB0_8 Depth=2
	//DEBUG_VALUE: main:num_iter <- [DW_OP_constu 52, DW_OP_minus] [$r22+0]
	//DEBUG_VALUE: index <- $r19
	//DEBUG_VALUE: sign <- $r17
	//DEBUG_VALUE: j <- $r7
	//DEBUG_VALUE: mask <- [DW_OP_constu 7, DW_OP_shra, DW_OP_stack_value] $r6
	//DEBUG_VALUE: main:min1 <- $r1
	//DEBUG_VALUE: main:max_iter <- 5
	//DEBUG_VALUE: main:true_codeword <- 0
	.loc	1 322 7 is_stmt 1               // device.c:322:7
	move r2, r1
.Ltmp112:
	//DEBUG_VALUE: main:min1 <- $r2
	//DEBUG_VALUE: main:min2 <- $r4
	//DEBUG_VALUE: index <- $r19
	.loc	1 332 10                        // device.c:332:10
	lbs r5, r20, -1
.Ltmp113:
	//DEBUG_VALUE: main:abs_Rcv <- undef
	//DEBUG_VALUE: mask <- [DW_OP_constu 7, DW_OP_shra, DW_OP_stack_value] $r5
	.loc	1 0 10 is_stmt 0                // device.c:0:10
	extsb r1, r5
	.loc	1 334 7 is_stmt 1               // device.c:334:7
	jges r1, 0, .LBB0_45
.Ltmp114:
.LBB0_44:                               //   in Loop: Header=BB0_8 Depth=2
	//DEBUG_VALUE: main:num_iter <- [DW_OP_constu 52, DW_OP_minus] [$r22+0]
	//DEBUG_VALUE: index <- $r19
	//DEBUG_VALUE: sign <- $r17
	//DEBUG_VALUE: j <- $r7
	//DEBUG_VALUE: mask <- [DW_OP_constu 7, DW_OP_shra, DW_OP_stack_value] $r5
	//DEBUG_VALUE: main:min2 <- $r4
	//DEBUG_VALUE: main:min1 <- $r2
	//DEBUG_VALUE: main:max_iter <- 5
	//DEBUG_VALUE: main:true_codeword <- 0
	.loc	1 0 7 is_stmt 0                 // device.c:0:7
	neg r17, r17
.Ltmp115:
.LBB0_45:                               //   in Loop: Header=BB0_8 Depth=2
	//DEBUG_VALUE: main:num_iter <- [DW_OP_constu 52, DW_OP_minus] [$r22+0]
	//DEBUG_VALUE: index <- $r19
	//DEBUG_VALUE: j <- $r7
	//DEBUG_VALUE: mask <- [DW_OP_constu 7, DW_OP_shra, DW_OP_stack_value] $r5
	//DEBUG_VALUE: main:min2 <- $r4
	//DEBUG_VALUE: main:min1 <- $r2
	//DEBUG_VALUE: main:max_iter <- 5
	//DEBUG_VALUE: main:true_codeword <- 0
	asr r1, r5, 31
	add r3, r5, r1
	xor r1, r3, r1
.Ltmp116:
	//DEBUG_VALUE: main:abs_Rcv <- $r1
	extsb r1, r1
.Ltmp117:
	//DEBUG_VALUE: sign <- $r17
	.loc	1 338 7 is_stmt 1               // device.c:338:7
	move r3, r1
	jlts r1, r4, .LBB0_47
.Ltmp118:
// %bb.46:                              //   in Loop: Header=BB0_8 Depth=2
	//DEBUG_VALUE: main:num_iter <- [DW_OP_constu 52, DW_OP_minus] [$r22+0]
	//DEBUG_VALUE: index <- $r19
	//DEBUG_VALUE: sign <- $r17
	//DEBUG_VALUE: j <- $r7
	//DEBUG_VALUE: mask <- [DW_OP_constu 7, DW_OP_shra, DW_OP_stack_value] $r5
	//DEBUG_VALUE: main:min2 <- $r4
	//DEBUG_VALUE: main:min1 <- $r2
	//DEBUG_VALUE: main:max_iter <- 5
	//DEBUG_VALUE: main:true_codeword <- 0
	move r3, r4
.Ltmp119:
.LBB0_47:                               //   in Loop: Header=BB0_8 Depth=2
	//DEBUG_VALUE: main:num_iter <- [DW_OP_constu 52, DW_OP_minus] [$r22+0]
	//DEBUG_VALUE: index <- $r19
	//DEBUG_VALUE: sign <- $r17
	//DEBUG_VALUE: j <- $r7
	//DEBUG_VALUE: mask <- [DW_OP_constu 7, DW_OP_shra, DW_OP_stack_value] $r5
	//DEBUG_VALUE: main:min2 <- $r4
	//DEBUG_VALUE: main:min1 <- $r2
	//DEBUG_VALUE: main:max_iter <- 5
	//DEBUG_VALUE: main:true_codeword <- 0
	.loc	1 0 7 is_stmt 0                 // device.c:0:7
	move r4, 6
.Ltmp120:
	sw r22, -84, r5
	sw r22, -80, r6
	sw r22, -76, r8
	.loc	1 338 7                         // device.c:338:7
	jges r1, r2, .LBB0_49
.Ltmp121:
// %bb.48:                              //   in Loop: Header=BB0_8 Depth=2
	//DEBUG_VALUE: main:num_iter <- [DW_OP_constu 52, DW_OP_minus] [$r22+0]
	//DEBUG_VALUE: index <- $r19
	//DEBUG_VALUE: sign <- $r17
	//DEBUG_VALUE: j <- $r7
	//DEBUG_VALUE: mask <- [DW_OP_constu 7, DW_OP_shra, DW_OP_stack_value] $r5
	//DEBUG_VALUE: main:min1 <- $r2
	//DEBUG_VALUE: main:max_iter <- 5
	//DEBUG_VALUE: main:true_codeword <- 0
	move r3, r2
	move r19, r4
.Ltmp122:
	//DEBUG_VALUE: main:min1 <- $r1
	//DEBUG_VALUE: main:min2 <- $r3
	//DEBUG_VALUE: index <- $r19
	.loc	1 348 10 is_stmt 1              // device.c:348:10
	lbs r14, r20, 0
.Ltmp123:
	//DEBUG_VALUE: main:abs_Rcv <- undef
	//DEBUG_VALUE: mask <- [DW_OP_constu 7, DW_OP_shra, DW_OP_stack_value] $r14
	.loc	1 0 10 is_stmt 0                // device.c:0:10
	extsb r2, r14
	sw r22, -64, r7
	jges r2, 0, .LBB0_52
	jump .LBB0_51
.Ltmp124:
.LBB0_49:                               //   in Loop: Header=BB0_8 Depth=2
	//DEBUG_VALUE: main:num_iter <- [DW_OP_constu 52, DW_OP_minus] [$r22+0]
	//DEBUG_VALUE: index <- $r19
	//DEBUG_VALUE: sign <- $r17
	//DEBUG_VALUE: j <- $r7
	//DEBUG_VALUE: mask <- [DW_OP_constu 7, DW_OP_shra, DW_OP_stack_value] $r5
	//DEBUG_VALUE: main:min1 <- $r2
	//DEBUG_VALUE: main:max_iter <- 5
	//DEBUG_VALUE: main:true_codeword <- 0
	.loc	1 338 7 is_stmt 1               // device.c:338:7
	move r1, r2
.Ltmp125:
	//DEBUG_VALUE: main:min1 <- $r1
	//DEBUG_VALUE: main:min2 <- $r3
	//DEBUG_VALUE: index <- $r19
	.loc	1 348 10                        // device.c:348:10
	lbs r14, r20, 0
.Ltmp126:
	//DEBUG_VALUE: main:abs_Rcv <- undef
	//DEBUG_VALUE: mask <- [DW_OP_constu 7, DW_OP_shra, DW_OP_stack_value] $r14
	.loc	1 0 10 is_stmt 0                // device.c:0:10
	extsb r2, r14
	sw r22, -64, r7
	.loc	1 350 7 is_stmt 1               // device.c:350:7
	jges r2, 0, .LBB0_52
.Ltmp127:
.LBB0_51:                               //   in Loop: Header=BB0_8 Depth=2
	//DEBUG_VALUE: main:num_iter <- [DW_OP_constu 52, DW_OP_minus] [$r22+0]
	//DEBUG_VALUE: index <- $r19
	//DEBUG_VALUE: sign <- $r17
	//DEBUG_VALUE: mask <- [DW_OP_constu 7, DW_OP_shra, DW_OP_stack_value] $r14
	//DEBUG_VALUE: j <- $r7
	//DEBUG_VALUE: main:min2 <- $r3
	//DEBUG_VALUE: main:min1 <- $r1
	//DEBUG_VALUE: main:max_iter <- 5
	//DEBUG_VALUE: main:true_codeword <- 0
	.loc	1 0 7 is_stmt 0                 // device.c:0:7
	neg r17, r17
.Ltmp128:
.LBB0_52:                               //   in Loop: Header=BB0_8 Depth=2
	//DEBUG_VALUE: main:num_iter <- [DW_OP_constu 52, DW_OP_minus] [$r22+0]
	//DEBUG_VALUE: index <- $r19
	//DEBUG_VALUE: mask <- [DW_OP_constu 7, DW_OP_shra, DW_OP_stack_value] $r14
	//DEBUG_VALUE: j <- $r7
	//DEBUG_VALUE: main:min2 <- $r3
	//DEBUG_VALUE: main:min1 <- $r1
	//DEBUG_VALUE: main:max_iter <- 5
	//DEBUG_VALUE: main:true_codeword <- 0
	asr r2, r14, 31
	add r4, r14, r2
	xor r2, r4, r2
.Ltmp129:
	//DEBUG_VALUE: main:abs_Rcv <- $r2
	extsb r15, r2
.Ltmp130:
	//DEBUG_VALUE: sign <- $r17
	.loc	1 354 7 is_stmt 1               // device.c:354:7
	move r18, r15
	jlts r15, r3, .LBB0_54
.Ltmp131:
// %bb.53:                              //   in Loop: Header=BB0_8 Depth=2
	//DEBUG_VALUE: main:num_iter <- [DW_OP_constu 52, DW_OP_minus] [$r22+0]
	//DEBUG_VALUE: index <- $r19
	//DEBUG_VALUE: sign <- $r17
	//DEBUG_VALUE: mask <- [DW_OP_constu 7, DW_OP_shra, DW_OP_stack_value] $r14
	//DEBUG_VALUE: j <- $r7
	//DEBUG_VALUE: main:min2 <- $r3
	//DEBUG_VALUE: main:abs_Rcv <- $r2
	//DEBUG_VALUE: main:min1 <- $r1
	//DEBUG_VALUE: main:max_iter <- 5
	//DEBUG_VALUE: main:true_codeword <- 0
	move r18, r3
.Ltmp132:
.LBB0_54:                               //   in Loop: Header=BB0_8 Depth=2
	//DEBUG_VALUE: main:num_iter <- [DW_OP_constu 52, DW_OP_minus] [$r22+0]
	//DEBUG_VALUE: index <- $r19
	//DEBUG_VALUE: sign <- $r17
	//DEBUG_VALUE: mask <- [DW_OP_constu 7, DW_OP_shra, DW_OP_stack_value] $r14
	//DEBUG_VALUE: j <- $r7
	//DEBUG_VALUE: main:min2 <- $r3
	//DEBUG_VALUE: main:abs_Rcv <- $r2
	//DEBUG_VALUE: main:min1 <- $r1
	//DEBUG_VALUE: main:max_iter <- 5
	//DEBUG_VALUE: main:true_codeword <- 0
	.loc	1 0 7 is_stmt 0                 // device.c:0:7
	move r2, 7
.Ltmp133:
	.loc	1 354 7                         // device.c:354:7
	jges r15, r1, .LBB0_56
.Ltmp134:
// %bb.55:                              //   in Loop: Header=BB0_8 Depth=2
	//DEBUG_VALUE: main:num_iter <- [DW_OP_constu 52, DW_OP_minus] [$r22+0]
	//DEBUG_VALUE: index <- $r19
	//DEBUG_VALUE: sign <- $r17
	//DEBUG_VALUE: mask <- [DW_OP_constu 7, DW_OP_shra, DW_OP_stack_value] $r14
	//DEBUG_VALUE: j <- $r7
	//DEBUG_VALUE: main:min2 <- $r3
	//DEBUG_VALUE: main:min1 <- $r1
	//DEBUG_VALUE: main:max_iter <- 5
	//DEBUG_VALUE: main:true_codeword <- 0
	move r18, r1
	move r19, r2
.Ltmp135:
	//DEBUG_VALUE: main:min1 <- $r15
	//DEBUG_VALUE: main:min2 <- $r18
	//DEBUG_VALUE: index <- $r19
	.loc	1 364 9 is_stmt 1               // device.c:364:9
	and r1, r19, 255
.Ltmp136:
	sw r22, -88, r17
	.loc	1 364 7 is_stmt 0               // device.c:364:7
	jeq r1, 0, .LBB0_58
.Ltmp137:
.LBB0_65:                               //   in Loop: Header=BB0_8 Depth=2
	//DEBUG_VALUE: main:num_iter <- [DW_OP_constu 52, DW_OP_minus] [$r22+0]
	//DEBUG_VALUE: index <- $r19
	//DEBUG_VALUE: main:min2 <- $r18
	//DEBUG_VALUE: sign <- $r17
	//DEBUG_VALUE: main:min1 <- $r15
	//DEBUG_VALUE: mask <- [DW_OP_constu 7, DW_OP_shra, DW_OP_stack_value] $r14
	//DEBUG_VALUE: j <- $r7
	//DEBUG_VALUE: main:max_iter <- 5
	//DEBUG_VALUE: main:true_codeword <- 0
	sw r22, -60, r14
	extsb r14, r0
.Ltmp138:
	.loc	1 372 8 is_stmt 1               // device.c:372:8
	move r0, r15
	move r1, r17
	call r23, __mulsi3
.Ltmp139:
	move r17, r0
.Ltmp140:
	neg r16, r17
	move r0, r16
	jlts r14, 0, .LBB0_67
.Ltmp141:
// %bb.66:                              //   in Loop: Header=BB0_8 Depth=2
	//DEBUG_VALUE: main:num_iter <- [DW_OP_constu 52, DW_OP_minus] [$r22+0]
	//DEBUG_VALUE: index <- $r19
	//DEBUG_VALUE: main:min2 <- $r18
	//DEBUG_VALUE: main:min1 <- $r15
	//DEBUG_VALUE: j <- $r7
	//DEBUG_VALUE: main:max_iter <- 5
	//DEBUG_VALUE: main:true_codeword <- 0
	move r0, r17
.Ltmp142:
.LBB0_67:                               //   in Loop: Header=BB0_8 Depth=2
	//DEBUG_VALUE: main:num_iter <- [DW_OP_constu 52, DW_OP_minus] [$r22+0]
	//DEBUG_VALUE: index <- $r19
	//DEBUG_VALUE: main:min2 <- $r18
	//DEBUG_VALUE: main:min1 <- $r15
	//DEBUG_VALUE: j <- $r7
	//DEBUG_VALUE: main:max_iter <- 5
	//DEBUG_VALUE: main:true_codeword <- 0
	.loc	1 0 0 is_stmt 0                 // device.c:0:0
	sb r20, -7, r0
	extsb r14, r21
.Ltmp143:
	.loc	1 382 9 is_stmt 1               // device.c:382:9
	and r0, r19, 255
.Ltmp144:
	.loc	1 382 7 is_stmt 0               // device.c:382:7
	jneq r0, 1, .LBB0_71
.Ltmp145:
// %bb.68:                              //   in Loop: Header=BB0_8 Depth=2
	//DEBUG_VALUE: main:num_iter <- [DW_OP_constu 52, DW_OP_minus] [$r22+0]
	//DEBUG_VALUE: index <- $r19
	//DEBUG_VALUE: main:min2 <- $r18
	//DEBUG_VALUE: main:min1 <- $r15
	//DEBUG_VALUE: j <- $r7
	//DEBUG_VALUE: main:max_iter <- 5
	//DEBUG_VALUE: main:true_codeword <- 0
	.loc	1 0 0                           // device.c:0:0
	move r0, r18
	lw r1, r22, -88
	call r23, __mulsi3
.Ltmp146:
	.loc	1 383 8 is_stmt 1               // device.c:383:8
	jges r14, 0, .LBB0_70
.Ltmp147:
// %bb.69:                              //   in Loop: Header=BB0_8 Depth=2
	//DEBUG_VALUE: main:num_iter <- [DW_OP_constu 52, DW_OP_minus] [$r22+0]
	//DEBUG_VALUE: index <- $r19
	//DEBUG_VALUE: main:min2 <- $r18
	//DEBUG_VALUE: main:min1 <- $r15
	//DEBUG_VALUE: j <- $r7
	//DEBUG_VALUE: main:max_iter <- 5
	//DEBUG_VALUE: main:true_codeword <- 0
	.loc	1 0 8 is_stmt 0                 // device.c:0:8
	neg r0, r0
.Ltmp148:
.LBB0_70:                               //   in Loop: Header=BB0_8 Depth=2
	//DEBUG_VALUE: main:num_iter <- [DW_OP_constu 52, DW_OP_minus] [$r22+0]
	//DEBUG_VALUE: index <- $r19
	//DEBUG_VALUE: main:min2 <- $r18
	//DEBUG_VALUE: main:min1 <- $r15
	//DEBUG_VALUE: j <- $r7
	//DEBUG_VALUE: main:max_iter <- 5
	//DEBUG_VALUE: main:true_codeword <- 0
	lw r18, r22, -64
.Ltmp149:
	lw r14, r22, -60
	lw r2, r22, -72
	lw r19, r22, -68
.Ltmp150:
	extsb r1, r19
	sb r20, -6, r0
.Ltmp151:
	.loc	1 407 8 is_stmt 1               // device.c:407:8
	move r0, r16
	jges r1, 0, .LBB0_64
	jump .LBB0_77
.Ltmp152:
.LBB0_56:                               //   in Loop: Header=BB0_8 Depth=2
	//DEBUG_VALUE: main:num_iter <- [DW_OP_constu 52, DW_OP_minus] [$r22+0]
	//DEBUG_VALUE: index <- $r19
	//DEBUG_VALUE: sign <- $r17
	//DEBUG_VALUE: mask <- [DW_OP_constu 7, DW_OP_shra, DW_OP_stack_value] $r14
	//DEBUG_VALUE: j <- $r7
	//DEBUG_VALUE: main:min2 <- $r3
	//DEBUG_VALUE: main:min1 <- $r1
	//DEBUG_VALUE: main:max_iter <- 5
	//DEBUG_VALUE: main:true_codeword <- 0
	.loc	1 354 7                         // device.c:354:7
	move r15, r1
.Ltmp153:
	//DEBUG_VALUE: main:min1 <- $r15
	//DEBUG_VALUE: main:min2 <- $r18
	//DEBUG_VALUE: index <- $r19
	.loc	1 364 9                         // device.c:364:9
	and r1, r19, 255
.Ltmp154:
	sw r22, -88, r17
	.loc	1 364 7 is_stmt 0               // device.c:364:7
	jneq r1, 0, .LBB0_65
.Ltmp155:
.LBB0_58:                               //   in Loop: Header=BB0_8 Depth=2
	//DEBUG_VALUE: main:num_iter <- [DW_OP_constu 52, DW_OP_minus] [$r22+0]
	//DEBUG_VALUE: index <- $r19
	//DEBUG_VALUE: main:min2 <- $r18
	//DEBUG_VALUE: sign <- $r17
	//DEBUG_VALUE: main:min1 <- $r15
	//DEBUG_VALUE: mask <- [DW_OP_constu 7, DW_OP_shra, DW_OP_stack_value] $r14
	//DEBUG_VALUE: j <- $r7
	//DEBUG_VALUE: main:max_iter <- 5
	//DEBUG_VALUE: main:true_codeword <- 0
	.loc	1 0 7                           // device.c:0:7
	extsb r16, r0
.Ltmp156:
	move r0, r18
	move r1, r17
	call r23, __mulsi3
.Ltmp157:
	.loc	1 365 8 is_stmt 1               // device.c:365:8
	jges r16, 0, .LBB0_60
.Ltmp158:
// %bb.59:                              //   in Loop: Header=BB0_8 Depth=2
	//DEBUG_VALUE: main:num_iter <- [DW_OP_constu 52, DW_OP_minus] [$r22+0]
	//DEBUG_VALUE: index <- $r19
	//DEBUG_VALUE: main:min2 <- $r18
	//DEBUG_VALUE: sign <- $r17
	//DEBUG_VALUE: main:min1 <- $r15
	//DEBUG_VALUE: mask <- [DW_OP_constu 7, DW_OP_shra, DW_OP_stack_value] $r14
	//DEBUG_VALUE: j <- $r7
	//DEBUG_VALUE: main:max_iter <- 5
	//DEBUG_VALUE: main:true_codeword <- 0
	.loc	1 0 8 is_stmt 0                 // device.c:0:8
	neg r0, r0
.Ltmp159:
.LBB0_60:                               //   in Loop: Header=BB0_8 Depth=2
	//DEBUG_VALUE: main:num_iter <- [DW_OP_constu 52, DW_OP_minus] [$r22+0]
	//DEBUG_VALUE: index <- $r19
	//DEBUG_VALUE: main:min2 <- $r18
	//DEBUG_VALUE: sign <- $r17
	//DEBUG_VALUE: main:min1 <- $r15
	//DEBUG_VALUE: mask <- [DW_OP_constu 7, DW_OP_shra, DW_OP_stack_value] $r14
	//DEBUG_VALUE: j <- $r7
	//DEBUG_VALUE: main:max_iter <- 5
	//DEBUG_VALUE: main:true_codeword <- 0
	lw r19, r22, -68
.Ltmp160:
	extsb r18, r21
.Ltmp161:
	sb r20, -7, r0
.Ltmp162:
	.loc	1 390 8 is_stmt 1               // device.c:390:8
	move r0, r15
	move r1, r17
	call r23, __mulsi3
.Ltmp163:
	move r17, r0
.Ltmp164:
	neg r16, r17
	move r0, r16
	jlts r18, 0, .LBB0_62
.Ltmp165:
// %bb.61:                              //   in Loop: Header=BB0_8 Depth=2
	//DEBUG_VALUE: main:num_iter <- [DW_OP_constu 52, DW_OP_minus] [$r22+0]
	//DEBUG_VALUE: main:min1 <- $r15
	//DEBUG_VALUE: mask <- [DW_OP_constu 7, DW_OP_shra, DW_OP_stack_value] $r14
	//DEBUG_VALUE: j <- $r7
	//DEBUG_VALUE: main:max_iter <- 5
	//DEBUG_VALUE: main:true_codeword <- 0
	move r0, r17
.Ltmp166:
.LBB0_62:                               //   in Loop: Header=BB0_8 Depth=2
	//DEBUG_VALUE: main:num_iter <- [DW_OP_constu 52, DW_OP_minus] [$r22+0]
	//DEBUG_VALUE: main:min1 <- $r15
	//DEBUG_VALUE: mask <- [DW_OP_constu 7, DW_OP_shra, DW_OP_stack_value] $r14
	//DEBUG_VALUE: j <- $r7
	//DEBUG_VALUE: main:max_iter <- 5
	//DEBUG_VALUE: main:true_codeword <- 0
	.loc	1 0 8 is_stmt 0                 // device.c:0:8
	lw r18, r22, -64
	lw r2, r22, -72
	extsb r1, r19
	sb r20, -6, r0
.Ltmp167:
	.loc	1 407 8 is_stmt 1               // device.c:407:8
	move r0, r16
	jlts r1, 0, .LBB0_77
.Ltmp168:
.LBB0_64:                               //   in Loop: Header=BB0_8 Depth=2
	//DEBUG_VALUE: main:num_iter <- [DW_OP_constu 52, DW_OP_minus] [$r22+0]
	//DEBUG_VALUE: main:min1 <- $r15
	//DEBUG_VALUE: j <- $r7
	//DEBUG_VALUE: main:max_iter <- 5
	//DEBUG_VALUE: main:true_codeword <- 0
	move r0, r17
.Ltmp169:
.LBB0_77:                               //   in Loop: Header=BB0_8 Depth=2
	//DEBUG_VALUE: main:num_iter <- [DW_OP_constu 52, DW_OP_minus] [$r22+0]
	//DEBUG_VALUE: main:min1 <- $r15
	//DEBUG_VALUE: j <- $r7
	//DEBUG_VALUE: main:max_iter <- 5
	//DEBUG_VALUE: main:true_codeword <- 0
	.loc	1 0 8 is_stmt 0                 // device.c:0:8
	extsb r1, r2
	sb r20, -5, r0
.Ltmp170:
	.loc	1 425 8 is_stmt 1               // device.c:425:8
	move r0, r16
	jlts r1, 0, .LBB0_85
.Ltmp171:
.LBB0_78:                               //   in Loop: Header=BB0_8 Depth=2
	//DEBUG_VALUE: main:num_iter <- [DW_OP_constu 52, DW_OP_minus] [$r22+0]
	//DEBUG_VALUE: main:min1 <- $r15
	//DEBUG_VALUE: j <- $r7
	//DEBUG_VALUE: main:max_iter <- 5
	//DEBUG_VALUE: main:true_codeword <- 0
	move r0, r17
.Ltmp172:
.LBB0_85:                               //   in Loop: Header=BB0_8 Depth=2
	//DEBUG_VALUE: main:num_iter <- [DW_OP_constu 52, DW_OP_minus] [$r22+0]
	//DEBUG_VALUE: main:min1 <- $r15
	//DEBUG_VALUE: j <- $r7
	//DEBUG_VALUE: main:max_iter <- 5
	//DEBUG_VALUE: main:true_codeword <- 0
	.loc	1 0 8 is_stmt 0                 // device.c:0:8
	lw r1, r22, -76
	extsb r1, r1
	sb r20, -4, r0
.Ltmp173:
	.loc	1 443 8 is_stmt 1               // device.c:443:8
	move r0, r16
	jlts r1, 0, .LBB0_93
.Ltmp174:
// %bb.86:                              //   in Loop: Header=BB0_8 Depth=2
	//DEBUG_VALUE: main:num_iter <- [DW_OP_constu 52, DW_OP_minus] [$r22+0]
	//DEBUG_VALUE: main:min1 <- $r15
	//DEBUG_VALUE: j <- $r7
	//DEBUG_VALUE: main:max_iter <- 5
	//DEBUG_VALUE: main:true_codeword <- 0
	move r0, r17
.Ltmp175:
.LBB0_93:                               //   in Loop: Header=BB0_8 Depth=2
	//DEBUG_VALUE: main:num_iter <- [DW_OP_constu 52, DW_OP_minus] [$r22+0]
	//DEBUG_VALUE: main:min1 <- $r15
	//DEBUG_VALUE: j <- $r7
	//DEBUG_VALUE: main:max_iter <- 5
	//DEBUG_VALUE: main:true_codeword <- 0
	.loc	1 0 8 is_stmt 0                 // device.c:0:8
	lw r1, r22, -80
	extsb r1, r1
	sb r20, -3, r0
.Ltmp176:
	.loc	1 461 8 is_stmt 1               // device.c:461:8
	move r0, r16
	jlts r1, 0, .LBB0_101
.Ltmp177:
// %bb.94:                              //   in Loop: Header=BB0_8 Depth=2
	//DEBUG_VALUE: main:num_iter <- [DW_OP_constu 52, DW_OP_minus] [$r22+0]
	//DEBUG_VALUE: main:min1 <- $r15
	//DEBUG_VALUE: j <- $r7
	//DEBUG_VALUE: main:max_iter <- 5
	//DEBUG_VALUE: main:true_codeword <- 0
	move r0, r17
.Ltmp178:
.LBB0_101:                              //   in Loop: Header=BB0_8 Depth=2
	//DEBUG_VALUE: main:num_iter <- [DW_OP_constu 52, DW_OP_minus] [$r22+0]
	//DEBUG_VALUE: main:min1 <- $r15
	//DEBUG_VALUE: j <- $r7
	//DEBUG_VALUE: main:max_iter <- 5
	//DEBUG_VALUE: main:true_codeword <- 0
	.loc	1 0 8 is_stmt 0                 // device.c:0:8
	lw r1, r22, -84
	extsb r1, r1
	sb r20, -2, r0
	jlts r1, 0, .LBB0_112
.Ltmp179:
.LBB0_102:                              //   in Loop: Header=BB0_8 Depth=2
	//DEBUG_VALUE: main:num_iter <- [DW_OP_constu 52, DW_OP_minus] [$r22+0]
	//DEBUG_VALUE: main:min1 <- $r15
	//DEBUG_VALUE: j <- $r7
	//DEBUG_VALUE: main:max_iter <- 5
	//DEBUG_VALUE: main:true_codeword <- 0
	.loc	1 479 8 is_stmt 1               // device.c:479:8
	move r16, r17
.Ltmp180:
.LBB0_112:                              //   in Loop: Header=BB0_8 Depth=2
	//DEBUG_VALUE: main:num_iter <- [DW_OP_constu 52, DW_OP_minus] [$r22+0]
	//DEBUG_VALUE: j <- $r7
	//DEBUG_VALUE: main:max_iter <- 5
	//DEBUG_VALUE: main:true_codeword <- 0
	.loc	1 0 8 is_stmt 0                 // device.c:0:8
	lw r17, r22, -88
.Ltmp181:
.LBB0_113:                              //   in Loop: Header=BB0_8 Depth=2
	//DEBUG_VALUE: main:num_iter <- [DW_OP_constu 52, DW_OP_minus] [$r22+0]
	//DEBUG_VALUE: j <- $r7
	//DEBUG_VALUE: main:max_iter <- 5
	//DEBUG_VALUE: main:true_codeword <- 0
	extsb r14, r14
	sb r20, -1, r16
.Ltmp182:
	move r0, r15
	move r1, r17
	call r23, __mulsi3
.Ltmp183:
	jges r14, 0, .LBB0_115
.Ltmp184:
// %bb.114:                             //   in Loop: Header=BB0_8 Depth=2
	//DEBUG_VALUE: main:num_iter <- [DW_OP_constu 52, DW_OP_minus] [$r22+0]
	//DEBUG_VALUE: j <- $r7
	//DEBUG_VALUE: main:max_iter <- 5
	//DEBUG_VALUE: main:true_codeword <- 0
	neg r0, r0
	jump .LBB0_115
.Ltmp185:
.LBB0_9:                                //   in Loop: Header=BB0_8 Depth=2
	//DEBUG_VALUE: main:num_iter <- [DW_OP_constu 52, DW_OP_minus] [$r22+0]
	//DEBUG_VALUE: j <- $r7
	//DEBUG_VALUE: mask <- [DW_OP_constu 7, DW_OP_shra, DW_OP_stack_value] $r0
	//DEBUG_VALUE: sign <- 1
	//DEBUG_VALUE: index <- 0
	//DEBUG_VALUE: main:min2 <- 127
	//DEBUG_VALUE: main:min1 <- 127
	//DEBUG_VALUE: main:max_iter <- 5
	//DEBUG_VALUE: main:true_codeword <- 0
	move r17, 255
.Ltmp186:
	//DEBUG_VALUE: main:min1 <- undef
	//DEBUG_VALUE: sign <- $r17
	//DEBUG_VALUE: main:abs_Rcv <- undef
	.loc	1 249 10 is_stmt 1              // device.c:249:10
	lbs r21, r20, -6
	//DEBUG_VALUE: main:abs_Rcv <- undef
.Ltmp187:
	//DEBUG_VALUE: mask <- [DW_OP_constu 7, DW_OP_shra, DW_OP_stack_value] $r21
	.loc	1 0 10 is_stmt 0                // device.c:0:10
	extsb r1, r21
	jges r1, 0, .LBB0_13
	jump .LBB0_12
.Ltmp188:
.LBB0_71:                               //   in Loop: Header=BB0_8 Depth=2
	//DEBUG_VALUE: main:num_iter <- [DW_OP_constu 52, DW_OP_minus] [$r22+0]
	//DEBUG_VALUE: index <- $r19
	//DEBUG_VALUE: main:min2 <- $r18
	//DEBUG_VALUE: main:min1 <- $r15
	//DEBUG_VALUE: j <- $r7
	//DEBUG_VALUE: main:max_iter <- 5
	//DEBUG_VALUE: main:true_codeword <- 0
	.loc	1 390 8 is_stmt 1               // device.c:390:8
	move r0, r15
	lw r1, r22, -88
	call r23, __mulsi3
.Ltmp189:
	move r17, r0
	neg r16, r17
	move r0, r16
	jlts r14, 0, .LBB0_73
.Ltmp190:
// %bb.72:                              //   in Loop: Header=BB0_8 Depth=2
	//DEBUG_VALUE: main:num_iter <- [DW_OP_constu 52, DW_OP_minus] [$r22+0]
	//DEBUG_VALUE: index <- $r19
	//DEBUG_VALUE: main:min2 <- $r18
	//DEBUG_VALUE: main:min1 <- $r15
	//DEBUG_VALUE: j <- $r7
	//DEBUG_VALUE: main:max_iter <- 5
	//DEBUG_VALUE: main:true_codeword <- 0
	move r0, r17
.Ltmp191:
.LBB0_73:                               //   in Loop: Header=BB0_8 Depth=2
	//DEBUG_VALUE: main:num_iter <- [DW_OP_constu 52, DW_OP_minus] [$r22+0]
	//DEBUG_VALUE: index <- $r19
	//DEBUG_VALUE: main:min2 <- $r18
	//DEBUG_VALUE: main:min1 <- $r15
	//DEBUG_VALUE: j <- $r7
	//DEBUG_VALUE: main:max_iter <- 5
	//DEBUG_VALUE: main:true_codeword <- 0
	.loc	1 0 0 is_stmt 0                 // device.c:0:0
	sb r20, -6, r0
.Ltmp192:
	.loc	1 399 9 is_stmt 1               // device.c:399:9
	and r0, r19, 255
.Ltmp193:
	.loc	1 399 7 is_stmt 0               // device.c:399:7
	jneq r0, 2, .LBB0_79
.Ltmp194:
// %bb.74:                              //   in Loop: Header=BB0_8 Depth=2
	//DEBUG_VALUE: main:num_iter <- [DW_OP_constu 52, DW_OP_minus] [$r22+0]
	//DEBUG_VALUE: index <- $r19
	//DEBUG_VALUE: main:min2 <- $r18
	//DEBUG_VALUE: main:min1 <- $r15
	//DEBUG_VALUE: j <- $r7
	//DEBUG_VALUE: main:max_iter <- 5
	//DEBUG_VALUE: main:true_codeword <- 0
	.loc	1 0 7                           // device.c:0:7
	lw r0, r22, -68
	extsb r14, r0
.Ltmp195:
	move r0, r18
	lw r1, r22, -88
	call r23, __mulsi3
.Ltmp196:
	.loc	1 400 8 is_stmt 1               // device.c:400:8
	jges r14, 0, .LBB0_76
.Ltmp197:
// %bb.75:                              //   in Loop: Header=BB0_8 Depth=2
	//DEBUG_VALUE: main:num_iter <- [DW_OP_constu 52, DW_OP_minus] [$r22+0]
	//DEBUG_VALUE: index <- $r19
	//DEBUG_VALUE: main:min2 <- $r18
	//DEBUG_VALUE: main:min1 <- $r15
	//DEBUG_VALUE: j <- $r7
	//DEBUG_VALUE: main:max_iter <- 5
	//DEBUG_VALUE: main:true_codeword <- 0
	.loc	1 0 8 is_stmt 0                 // device.c:0:8
	neg r0, r0
.Ltmp198:
.LBB0_76:                               //   in Loop: Header=BB0_8 Depth=2
	//DEBUG_VALUE: main:num_iter <- [DW_OP_constu 52, DW_OP_minus] [$r22+0]
	//DEBUG_VALUE: index <- $r19
	//DEBUG_VALUE: main:min2 <- $r18
	//DEBUG_VALUE: main:min1 <- $r15
	//DEBUG_VALUE: j <- $r7
	//DEBUG_VALUE: main:max_iter <- 5
	//DEBUG_VALUE: main:true_codeword <- 0
	lw r18, r22, -64
.Ltmp199:
	lw r14, r22, -60
	lw r2, r22, -72
	extsb r1, r2
	sb r20, -5, r0
.Ltmp200:
	.loc	1 425 8 is_stmt 1               // device.c:425:8
	move r0, r16
	jges r1, 0, .LBB0_78
	jump .LBB0_85
.Ltmp201:
.LBB0_79:                               //   in Loop: Header=BB0_8 Depth=2
	//DEBUG_VALUE: main:num_iter <- [DW_OP_constu 52, DW_OP_minus] [$r22+0]
	//DEBUG_VALUE: index <- $r19
	//DEBUG_VALUE: main:min2 <- $r18
	//DEBUG_VALUE: main:min1 <- $r15
	//DEBUG_VALUE: j <- $r7
	//DEBUG_VALUE: main:max_iter <- 5
	//DEBUG_VALUE: main:true_codeword <- 0
	.loc	1 0 8 is_stmt 0                 // device.c:0:8
	lw r0, r22, -68
	extsb r1, r0
.Ltmp202:
	.loc	1 407 8 is_stmt 1               // device.c:407:8
	move r0, r16
	lw r2, r22, -72
	jlts r1, 0, .LBB0_81
.Ltmp203:
// %bb.80:                              //   in Loop: Header=BB0_8 Depth=2
	//DEBUG_VALUE: main:num_iter <- [DW_OP_constu 52, DW_OP_minus] [$r22+0]
	//DEBUG_VALUE: index <- $r19
	//DEBUG_VALUE: main:min2 <- $r18
	//DEBUG_VALUE: main:min1 <- $r15
	//DEBUG_VALUE: j <- $r7
	//DEBUG_VALUE: main:max_iter <- 5
	//DEBUG_VALUE: main:true_codeword <- 0
	move r0, r17
.Ltmp204:
.LBB0_81:                               //   in Loop: Header=BB0_8 Depth=2
	//DEBUG_VALUE: main:num_iter <- [DW_OP_constu 52, DW_OP_minus] [$r22+0]
	//DEBUG_VALUE: index <- $r19
	//DEBUG_VALUE: main:min2 <- $r18
	//DEBUG_VALUE: main:min1 <- $r15
	//DEBUG_VALUE: j <- $r7
	//DEBUG_VALUE: main:max_iter <- 5
	//DEBUG_VALUE: main:true_codeword <- 0
	.loc	1 0 0 is_stmt 0                 // device.c:0:0
	sb r20, -5, r0
.Ltmp205:
	.loc	1 417 9 is_stmt 1               // device.c:417:9
	and r0, r19, 255
.Ltmp206:
	.loc	1 417 7 is_stmt 0               // device.c:417:7
	jneq r0, 3, .LBB0_87
.Ltmp207:
// %bb.82:                              //   in Loop: Header=BB0_8 Depth=2
	//DEBUG_VALUE: main:num_iter <- [DW_OP_constu 52, DW_OP_minus] [$r22+0]
	//DEBUG_VALUE: index <- $r19
	//DEBUG_VALUE: main:min2 <- $r18
	//DEBUG_VALUE: main:min1 <- $r15
	//DEBUG_VALUE: j <- $r7
	//DEBUG_VALUE: main:max_iter <- 5
	//DEBUG_VALUE: main:true_codeword <- 0
	.loc	1 0 7                           // device.c:0:7
	extsb r14, r2
.Ltmp208:
	move r0, r18
	lw r1, r22, -88
	call r23, __mulsi3
.Ltmp209:
	.loc	1 418 8 is_stmt 1               // device.c:418:8
	jges r14, 0, .LBB0_84
.Ltmp210:
// %bb.83:                              //   in Loop: Header=BB0_8 Depth=2
	//DEBUG_VALUE: main:num_iter <- [DW_OP_constu 52, DW_OP_minus] [$r22+0]
	//DEBUG_VALUE: index <- $r19
	//DEBUG_VALUE: main:min2 <- $r18
	//DEBUG_VALUE: main:min1 <- $r15
	//DEBUG_VALUE: j <- $r7
	//DEBUG_VALUE: main:max_iter <- 5
	//DEBUG_VALUE: main:true_codeword <- 0
	.loc	1 0 8 is_stmt 0                 // device.c:0:8
	neg r0, r0
.Ltmp211:
.LBB0_84:                               //   in Loop: Header=BB0_8 Depth=2
	//DEBUG_VALUE: main:num_iter <- [DW_OP_constu 52, DW_OP_minus] [$r22+0]
	//DEBUG_VALUE: index <- $r19
	//DEBUG_VALUE: main:min2 <- $r18
	//DEBUG_VALUE: main:min1 <- $r15
	//DEBUG_VALUE: j <- $r7
	//DEBUG_VALUE: main:max_iter <- 5
	//DEBUG_VALUE: main:true_codeword <- 0
	lw r18, r22, -64
.Ltmp212:
	lw r14, r22, -60
	jump .LBB0_85
.Ltmp213:
.LBB0_87:                               //   in Loop: Header=BB0_8 Depth=2
	//DEBUG_VALUE: main:num_iter <- [DW_OP_constu 52, DW_OP_minus] [$r22+0]
	//DEBUG_VALUE: index <- $r19
	//DEBUG_VALUE: main:min2 <- $r18
	//DEBUG_VALUE: main:min1 <- $r15
	//DEBUG_VALUE: j <- $r7
	//DEBUG_VALUE: main:max_iter <- 5
	//DEBUG_VALUE: main:true_codeword <- 0
	extsb r1, r2
.Ltmp214:
	.loc	1 425 8 is_stmt 1               // device.c:425:8
	move r0, r16
	lw r14, r22, -60
	jlts r1, 0, .LBB0_89
.Ltmp215:
// %bb.88:                              //   in Loop: Header=BB0_8 Depth=2
	//DEBUG_VALUE: main:num_iter <- [DW_OP_constu 52, DW_OP_minus] [$r22+0]
	//DEBUG_VALUE: index <- $r19
	//DEBUG_VALUE: main:min2 <- $r18
	//DEBUG_VALUE: main:min1 <- $r15
	//DEBUG_VALUE: j <- $r7
	//DEBUG_VALUE: main:max_iter <- 5
	//DEBUG_VALUE: main:true_codeword <- 0
	move r0, r17
.Ltmp216:
.LBB0_89:                               //   in Loop: Header=BB0_8 Depth=2
	//DEBUG_VALUE: main:num_iter <- [DW_OP_constu 52, DW_OP_minus] [$r22+0]
	//DEBUG_VALUE: index <- $r19
	//DEBUG_VALUE: main:min2 <- $r18
	//DEBUG_VALUE: main:min1 <- $r15
	//DEBUG_VALUE: j <- $r7
	//DEBUG_VALUE: main:max_iter <- 5
	//DEBUG_VALUE: main:true_codeword <- 0
	.loc	1 0 0 is_stmt 0                 // device.c:0:0
	sb r20, -4, r0
.Ltmp217:
	.loc	1 435 9 is_stmt 1               // device.c:435:9
	and r0, r19, 255
.Ltmp218:
	.loc	1 435 7 is_stmt 0               // device.c:435:7
	jneq r0, 4, .LBB0_95
.Ltmp219:
// %bb.90:                              //   in Loop: Header=BB0_8 Depth=2
	//DEBUG_VALUE: main:num_iter <- [DW_OP_constu 52, DW_OP_minus] [$r22+0]
	//DEBUG_VALUE: index <- $r19
	//DEBUG_VALUE: main:min2 <- $r18
	//DEBUG_VALUE: main:min1 <- $r15
	//DEBUG_VALUE: j <- $r7
	//DEBUG_VALUE: main:max_iter <- 5
	//DEBUG_VALUE: main:true_codeword <- 0
	.loc	1 0 7                           // device.c:0:7
	lw r0, r22, -76
	extsb r14, r0
.Ltmp220:
	move r0, r18
	lw r1, r22, -88
	call r23, __mulsi3
.Ltmp221:
	.loc	1 436 8 is_stmt 1               // device.c:436:8
	jges r14, 0, .LBB0_92
.Ltmp222:
// %bb.91:                              //   in Loop: Header=BB0_8 Depth=2
	//DEBUG_VALUE: main:num_iter <- [DW_OP_constu 52, DW_OP_minus] [$r22+0]
	//DEBUG_VALUE: index <- $r19
	//DEBUG_VALUE: main:min2 <- $r18
	//DEBUG_VALUE: main:min1 <- $r15
	//DEBUG_VALUE: j <- $r7
	//DEBUG_VALUE: main:max_iter <- 5
	//DEBUG_VALUE: main:true_codeword <- 0
	.loc	1 0 8 is_stmt 0                 // device.c:0:8
	neg r0, r0
.Ltmp223:
.LBB0_92:                               //   in Loop: Header=BB0_8 Depth=2
	//DEBUG_VALUE: main:num_iter <- [DW_OP_constu 52, DW_OP_minus] [$r22+0]
	//DEBUG_VALUE: index <- $r19
	//DEBUG_VALUE: main:min2 <- $r18
	//DEBUG_VALUE: main:min1 <- $r15
	//DEBUG_VALUE: j <- $r7
	//DEBUG_VALUE: main:max_iter <- 5
	//DEBUG_VALUE: main:true_codeword <- 0
	lw r18, r22, -64
.Ltmp224:
	lw r14, r22, -60
	jump .LBB0_93
.Ltmp225:
.LBB0_95:                               //   in Loop: Header=BB0_8 Depth=2
	//DEBUG_VALUE: main:num_iter <- [DW_OP_constu 52, DW_OP_minus] [$r22+0]
	//DEBUG_VALUE: index <- $r19
	//DEBUG_VALUE: main:min2 <- $r18
	//DEBUG_VALUE: main:min1 <- $r15
	//DEBUG_VALUE: j <- $r7
	//DEBUG_VALUE: main:max_iter <- 5
	//DEBUG_VALUE: main:true_codeword <- 0
	lw r0, r22, -76
	extsb r1, r0
.Ltmp226:
	.loc	1 443 8 is_stmt 1               // device.c:443:8
	move r0, r16
	jlts r1, 0, .LBB0_97
.Ltmp227:
// %bb.96:                              //   in Loop: Header=BB0_8 Depth=2
	//DEBUG_VALUE: main:num_iter <- [DW_OP_constu 52, DW_OP_minus] [$r22+0]
	//DEBUG_VALUE: index <- $r19
	//DEBUG_VALUE: main:min2 <- $r18
	//DEBUG_VALUE: main:min1 <- $r15
	//DEBUG_VALUE: j <- $r7
	//DEBUG_VALUE: main:max_iter <- 5
	//DEBUG_VALUE: main:true_codeword <- 0
	move r0, r17
.Ltmp228:
.LBB0_97:                               //   in Loop: Header=BB0_8 Depth=2
	//DEBUG_VALUE: main:num_iter <- [DW_OP_constu 52, DW_OP_minus] [$r22+0]
	//DEBUG_VALUE: index <- $r19
	//DEBUG_VALUE: main:min2 <- $r18
	//DEBUG_VALUE: main:min1 <- $r15
	//DEBUG_VALUE: j <- $r7
	//DEBUG_VALUE: main:max_iter <- 5
	//DEBUG_VALUE: main:true_codeword <- 0
	.loc	1 0 0 is_stmt 0                 // device.c:0:0
	sb r20, -3, r0
.Ltmp229:
	.loc	1 453 9 is_stmt 1               // device.c:453:9
	and r0, r19, 255
.Ltmp230:
	.loc	1 453 7 is_stmt 0               // device.c:453:7
	jneq r0, 5, .LBB0_103
.Ltmp231:
// %bb.98:                              //   in Loop: Header=BB0_8 Depth=2
	//DEBUG_VALUE: main:num_iter <- [DW_OP_constu 52, DW_OP_minus] [$r22+0]
	//DEBUG_VALUE: index <- $r19
	//DEBUG_VALUE: main:min2 <- $r18
	//DEBUG_VALUE: main:min1 <- $r15
	//DEBUG_VALUE: j <- $r7
	//DEBUG_VALUE: main:max_iter <- 5
	//DEBUG_VALUE: main:true_codeword <- 0
	.loc	1 0 7                           // device.c:0:7
	lw r0, r22, -80
	extsb r14, r0
.Ltmp232:
	move r0, r18
	lw r1, r22, -88
	call r23, __mulsi3
.Ltmp233:
	lw r18, r22, -64
.Ltmp234:
	.loc	1 454 8 is_stmt 1               // device.c:454:8
	jges r14, 0, .LBB0_100
.Ltmp235:
// %bb.99:                              //   in Loop: Header=BB0_8 Depth=2
	//DEBUG_VALUE: main:num_iter <- [DW_OP_constu 52, DW_OP_minus] [$r22+0]
	//DEBUG_VALUE: index <- $r19
	//DEBUG_VALUE: main:min1 <- $r15
	//DEBUG_VALUE: j <- $r7
	//DEBUG_VALUE: main:max_iter <- 5
	//DEBUG_VALUE: main:true_codeword <- 0
	.loc	1 0 8 is_stmt 0                 // device.c:0:8
	neg r0, r0
.Ltmp236:
.LBB0_100:                              //   in Loop: Header=BB0_8 Depth=2
	//DEBUG_VALUE: main:num_iter <- [DW_OP_constu 52, DW_OP_minus] [$r22+0]
	//DEBUG_VALUE: index <- $r19
	//DEBUG_VALUE: main:min1 <- $r15
	//DEBUG_VALUE: j <- $r7
	//DEBUG_VALUE: main:max_iter <- 5
	//DEBUG_VALUE: main:true_codeword <- 0
	lw r14, r22, -60
	lw r1, r22, -84
	extsb r1, r1
	sb r20, -2, r0
	jges r1, 0, .LBB0_102
	jump .LBB0_112
.Ltmp237:
.LBB0_103:                              //   in Loop: Header=BB0_8 Depth=2
	//DEBUG_VALUE: main:num_iter <- [DW_OP_constu 52, DW_OP_minus] [$r22+0]
	//DEBUG_VALUE: index <- $r19
	//DEBUG_VALUE: main:min2 <- $r18
	//DEBUG_VALUE: main:min1 <- $r15
	//DEBUG_VALUE: j <- $r7
	//DEBUG_VALUE: main:max_iter <- 5
	//DEBUG_VALUE: main:true_codeword <- 0
	lw r0, r22, -80
	extsb r1, r0
.Ltmp238:
	.loc	1 461 8 is_stmt 1               // device.c:461:8
	move r0, r16
	jlts r1, 0, .LBB0_105
.Ltmp239:
// %bb.104:                             //   in Loop: Header=BB0_8 Depth=2
	//DEBUG_VALUE: main:num_iter <- [DW_OP_constu 52, DW_OP_minus] [$r22+0]
	//DEBUG_VALUE: index <- $r19
	//DEBUG_VALUE: main:min2 <- $r18
	//DEBUG_VALUE: main:min1 <- $r15
	//DEBUG_VALUE: j <- $r7
	//DEBUG_VALUE: main:max_iter <- 5
	//DEBUG_VALUE: main:true_codeword <- 0
	move r0, r17
.Ltmp240:
.LBB0_105:                              //   in Loop: Header=BB0_8 Depth=2
	//DEBUG_VALUE: main:num_iter <- [DW_OP_constu 52, DW_OP_minus] [$r22+0]
	//DEBUG_VALUE: index <- $r19
	//DEBUG_VALUE: main:min2 <- $r18
	//DEBUG_VALUE: main:min1 <- $r15
	//DEBUG_VALUE: j <- $r7
	//DEBUG_VALUE: main:max_iter <- 5
	//DEBUG_VALUE: main:true_codeword <- 0
	.loc	1 0 0 is_stmt 0                 // device.c:0:0
	sb r20, -2, r0
.Ltmp241:
	.loc	1 471 9 is_stmt 1               // device.c:471:9
	and r0, r19, 255
.Ltmp242:
	.loc	1 471 7 is_stmt 0               // device.c:471:7
	jneq r0, 6, .LBB0_109
.Ltmp243:
// %bb.106:                             //   in Loop: Header=BB0_8 Depth=2
	//DEBUG_VALUE: main:num_iter <- [DW_OP_constu 52, DW_OP_minus] [$r22+0]
	//DEBUG_VALUE: index <- $r19
	//DEBUG_VALUE: main:min2 <- $r18
	//DEBUG_VALUE: main:min1 <- $r15
	//DEBUG_VALUE: j <- $r7
	//DEBUG_VALUE: main:max_iter <- 5
	//DEBUG_VALUE: main:true_codeword <- 0
	.loc	1 0 7                           // device.c:0:7
	lw r0, r22, -84
	extsb r14, r0
.Ltmp244:
	move r0, r18
	lw r17, r22, -88
	move r1, r17
	call r23, __mulsi3
.Ltmp245:
	move r16, r0
.Ltmp246:
	.loc	1 472 8 is_stmt 1               // device.c:472:8
	jges r14, 0, .LBB0_108
.Ltmp247:
// %bb.107:                             //   in Loop: Header=BB0_8 Depth=2
	//DEBUG_VALUE: main:num_iter <- [DW_OP_constu 52, DW_OP_minus] [$r22+0]
	//DEBUG_VALUE: index <- $r19
	//DEBUG_VALUE: main:min2 <- $r18
	//DEBUG_VALUE: main:min1 <- $r15
	//DEBUG_VALUE: j <- $r7
	//DEBUG_VALUE: main:max_iter <- 5
	//DEBUG_VALUE: main:true_codeword <- 0
	.loc	1 0 8 is_stmt 0                 // device.c:0:8
	neg r16, r16
.Ltmp248:
.LBB0_108:                              //   in Loop: Header=BB0_8 Depth=2
	//DEBUG_VALUE: main:num_iter <- [DW_OP_constu 52, DW_OP_minus] [$r22+0]
	//DEBUG_VALUE: index <- $r19
	//DEBUG_VALUE: main:min2 <- $r18
	//DEBUG_VALUE: main:min1 <- $r15
	//DEBUG_VALUE: j <- $r7
	//DEBUG_VALUE: main:max_iter <- 5
	//DEBUG_VALUE: main:true_codeword <- 0
	lw r18, r22, -64
.Ltmp249:
	lw r14, r22, -60
	jump .LBB0_113
.Ltmp250:
.LBB0_109:                              //   in Loop: Header=BB0_8 Depth=2
	//DEBUG_VALUE: main:num_iter <- [DW_OP_constu 52, DW_OP_minus] [$r22+0]
	//DEBUG_VALUE: index <- $r19
	//DEBUG_VALUE: main:min2 <- $r18
	//DEBUG_VALUE: main:min1 <- $r15
	//DEBUG_VALUE: j <- $r7
	//DEBUG_VALUE: main:max_iter <- 5
	//DEBUG_VALUE: main:true_codeword <- 0
	lw r0, r22, -84
	extsb r0, r0
.Ltmp251:
	.loc	1 479 8 is_stmt 1               // device.c:479:8
	jlts r0, 0, .LBB0_111
.Ltmp252:
// %bb.110:                             //   in Loop: Header=BB0_8 Depth=2
	//DEBUG_VALUE: main:num_iter <- [DW_OP_constu 52, DW_OP_minus] [$r22+0]
	//DEBUG_VALUE: index <- $r19
	//DEBUG_VALUE: main:min2 <- $r18
	//DEBUG_VALUE: main:min1 <- $r15
	//DEBUG_VALUE: j <- $r7
	//DEBUG_VALUE: main:max_iter <- 5
	//DEBUG_VALUE: main:true_codeword <- 0
	move r16, r17
.Ltmp253:
.LBB0_111:                              //   in Loop: Header=BB0_8 Depth=2
	//DEBUG_VALUE: main:num_iter <- [DW_OP_constu 52, DW_OP_minus] [$r22+0]
	//DEBUG_VALUE: index <- $r19
	//DEBUG_VALUE: main:min2 <- $r18
	//DEBUG_VALUE: main:min1 <- $r15
	//DEBUG_VALUE: j <- $r7
	//DEBUG_VALUE: main:max_iter <- 5
	//DEBUG_VALUE: main:true_codeword <- 0
	.loc	1 0 8 is_stmt 0                 // device.c:0:8
	move r15, r18
.Ltmp254:
	lw r18, r22, -64
.Ltmp255:
	jump .LBB0_112
.Ltmp256:
.LBB0_116:                              //   in Loop: Header=BB0_7 Depth=1
	//DEBUG_VALUE: main:num_iter <- [DW_OP_constu 52, DW_OP_minus] [$r22+0]
	//DEBUG_VALUE: main:max_iter <- 5
	//DEBUG_VALUE: main:true_codeword <- 0
	.loc	1 516 3 is_stmt 1               // device.c:516:3
	move r0, my_barrier
	call r23, barrier_wait
.Ltmp257:
	//DEBUG_VALUE: main:k <- [DW_OP_constu 36, DW_OP_minus] [$r22+0]
	.loc	1 0 3 is_stmt 0                 // device.c:0:3
	lw r15, r22, -44
	move r1, r15
	lw r17, r22, -36
	move r0, r17
	lw r14, r22, -48
	move r2, r14
	lw r16, r22, -40
.Ltmp258:
	//DEBUG_VALUE: i <- [DW_OP_constu 48, DW_OP_minus] [$r22+0]
	.loc	1 524 3 is_stmt 1               // device.c:524:3
	jleu r16, r15, .LBB0_117
.Ltmp259:
.LBB0_125:                              //   Parent Loop BB0_7 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	//DEBUG_VALUE: main:num_iter <- [DW_OP_constu 52, DW_OP_minus] [$r22+0]
	//DEBUG_VALUE: main:max_iter <- 5
	//DEBUG_VALUE: main:true_codeword <- 0
	//DEBUG_VALUE: main:k <- $r0
	//DEBUG_VALUE: i <- $r2
	//DEBUG_VALUE: sum <- 0
	.loc	1 526 21                        // device.c:526:21
	add r3, r0, 1
.Ltmp260:
	//DEBUG_VALUE: main:k <- $r3
	.loc	1 526 13 is_stmt 0              // device.c:526:13
	extsh r4, r0
	lsl r4, r4, 1
	lhs r4, r4, LUT_VN
	.loc	1 527 13 is_stmt 1              // device.c:527:13
	extsh r3, r3
.Ltmp261:
	lsl r3, r3, 1
	lhs r3, r3, LUT_VN
	.loc	1 526 9                         // device.c:526:9
	lbs r4, r4, Rcv
.Ltmp262:
	//DEBUG_VALUE: sum <- [DW_OP_LLVM_convert 8 5, DW_OP_LLVM_convert 16 5, DW_OP_stack_value] $r4
	.loc	1 527 21                        // device.c:527:21
	add r5, r0, 2
.Ltmp263:
	//DEBUG_VALUE: main:k <- $r5
	.loc	1 527 9 is_stmt 0               // device.c:527:9
	lbs r3, r3, Rcv
	.loc	1 528 21 is_stmt 1              // device.c:528:21
	add r6, r0, 3
.Ltmp264:
	//DEBUG_VALUE: main:k <- $r6
	.loc	1 528 13 is_stmt 0              // device.c:528:13
	extsh r5, r5
	lsl r5, r5, 1
	lhs r5, r5, LUT_VN
	.loc	1 529 21 is_stmt 1              // device.c:529:21
	add r7, r0, 4
.Ltmp265:
	//DEBUG_VALUE: main:k <- $r7
	.loc	1 529 13 is_stmt 0              // device.c:529:13
	extsh r6, r6
	lsl r6, r6, 1
	lhs r6, r6, LUT_VN
	.loc	1 530 13 is_stmt 1              // device.c:530:13
	extsh r7, r7
.Ltmp266:
	lsl r7, r7, 1
	lhs r7, r7, LUT_VN
	.loc	1 527 7                         // device.c:527:7
	add r3, r3, r4
.Ltmp267:
	//DEBUG_VALUE: sum <- undef
	.loc	1 528 9                         // device.c:528:9
	lbs r4, r5, Rcv
	.loc	1 529 9                         // device.c:529:9
	lbs r5, r6, Rcv
	.loc	1 530 9                         // device.c:530:9
	lbs r6, r7, Rcv
	.loc	1 531 9                         // device.c:531:9
	lbs r7, r1, L
	.loc	1 528 7                         // device.c:528:7
	add r3, r3, r4
	.loc	1 529 7                         // device.c:529:7
	add r3, r3, r5
	.loc	1 530 7                         // device.c:530:7
	add r3, r3, r6
	.loc	1 531 13                        // device.c:531:13
	add r3, r3, r7
	.loc	1 531 8 is_stmt 0               // device.c:531:8
	sb r1, L, r3
.Ltmp268:
	.loc	1 524 85 is_stmt 1              // device.c:524:85
	add r2, r2, 1
.Ltmp269:
	//DEBUG_VALUE: i <- $r2
	.loc	1 524 46 is_stmt 0              // device.c:524:46
	extsh r1, r2
.Ltmp270:
	.loc	1 530 21 is_stmt 1              // device.c:530:21
	add r0, r0, 5
.Ltmp271:
	//DEBUG_VALUE: main:k <- $r0
	.loc	1 524 3                         // device.c:524:3
	jgtu r16, r1, .LBB0_125
.Ltmp272:
.LBB0_117:                              //   in Loop: Header=BB0_7 Depth=1
	//DEBUG_VALUE: main:num_iter <- [DW_OP_constu 52, DW_OP_minus] [$r22+0]
	//DEBUG_VALUE: main:max_iter <- 5
	//DEBUG_VALUE: main:true_codeword <- 0
	//DEBUG_VALUE: main:k <- [DW_OP_constu 56, DW_OP_minus] [$r22+0]
	.loc	1 0 3 is_stmt 0                 // device.c:0:3
	lw r19, r22, -28
	move r1, r19
	lw r18, r22, -32
	move r0, r18
	lw r2, r22, -56
	lw r20, r22, -24
.Ltmp273:
	//DEBUG_VALUE: i <- $r18
	.loc	1 535 3 is_stmt 1               // device.c:535:3
	jleu r20, r19, .LBB0_118
.Ltmp274:
.LBB0_126:                              //   Parent Loop BB0_7 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	//DEBUG_VALUE: main:num_iter <- [DW_OP_constu 52, DW_OP_minus] [$r22+0]
	//DEBUG_VALUE: main:max_iter <- 5
	//DEBUG_VALUE: main:true_codeword <- 0
	//DEBUG_VALUE: main:k <- $r2
	//DEBUG_VALUE: i <- $r0
	//DEBUG_VALUE: sum <- 0
	.loc	1 537 21                        // device.c:537:21
	add r3, r2, 1
.Ltmp275:
	//DEBUG_VALUE: main:k <- $r3
	.loc	1 537 13 is_stmt 0              // device.c:537:13
	extsh r4, r2
	lsl r4, r4, 1
	lhs r4, r4, LUT_VN
	.loc	1 538 21 is_stmt 1              // device.c:538:21
	add r5, r2, 2
.Ltmp276:
	//DEBUG_VALUE: main:k <- $r5
	.loc	1 538 13 is_stmt 0              // device.c:538:13
	extsh r3, r3
	lsl r3, r3, 1
	lhs r3, r3, LUT_VN
	.loc	1 539 13 is_stmt 1              // device.c:539:13
	extsh r5, r5
.Ltmp277:
	lsl r5, r5, 1
	lhs r5, r5, LUT_VN
	.loc	1 537 9                         // device.c:537:9
	lbs r4, r4, Rcv
.Ltmp278:
	//DEBUG_VALUE: sum <- [DW_OP_LLVM_convert 8 5, DW_OP_LLVM_convert 16 5, DW_OP_stack_value] $r4
	.loc	1 538 9                         // device.c:538:9
	lbs r3, r3, Rcv
	.loc	1 539 9                         // device.c:539:9
	lbs r5, r5, Rcv
	.loc	1 540 9                         // device.c:540:9
	lbs r6, r1, L
	.loc	1 538 7                         // device.c:538:7
	add r3, r3, r4
.Ltmp279:
	//DEBUG_VALUE: sum <- undef
	.loc	1 539 7                         // device.c:539:7
	add r3, r3, r5
	.loc	1 540 13                        // device.c:540:13
	add r3, r3, r6
	.loc	1 540 8 is_stmt 0               // device.c:540:8
	sb r1, L, r3
.Ltmp280:
	.loc	1 535 89 is_stmt 1              // device.c:535:89
	add r0, r0, 1
.Ltmp281:
	//DEBUG_VALUE: i <- $r0
	.loc	1 535 48 is_stmt 0              // device.c:535:48
	extsh r1, r0
.Ltmp282:
	.loc	1 539 21 is_stmt 1              // device.c:539:21
	add r2, r2, 3
.Ltmp283:
	//DEBUG_VALUE: main:k <- $r2
	.loc	1 535 3                         // device.c:535:3
	jgtu r20, r1, .LBB0_126
.Ltmp284:
.LBB0_118:                              //   in Loop: Header=BB0_7 Depth=1
	//DEBUG_VALUE: main:num_iter <- [DW_OP_constu 52, DW_OP_minus] [$r22+0]
	//DEBUG_VALUE: main:max_iter <- 5
	//DEBUG_VALUE: main:true_codeword <- 0
	.loc	1 543 3                         // device.c:543:3
	move r0, my_barrier
	call r23, barrier_wait
.Ltmp285:
	//DEBUG_VALUE: main:k <- [DW_OP_constu 36, DW_OP_minus] [$r22+0]
	.loc	1 0 3 is_stmt 0                 // device.c:0:3
	move r2, r15
	move r0, r14
	move r1, r17
.Ltmp286:
	//DEBUG_VALUE: i <- [DW_OP_constu 48, DW_OP_minus] [$r22+0]
	.loc	1 546 3 is_stmt 1               // device.c:546:3
	jleu r16, r15, .LBB0_119
.Ltmp287:
.LBB0_127:                              //   Parent Loop BB0_7 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	//DEBUG_VALUE: main:num_iter <- [DW_OP_constu 52, DW_OP_minus] [$r22+0]
	//DEBUG_VALUE: main:max_iter <- 5
	//DEBUG_VALUE: main:true_codeword <- 0
	//DEBUG_VALUE: main:k <- $r1
	//DEBUG_VALUE: i <- $r0
	.loc	1 549 32                        // device.c:549:32
	extsh r3, r1
	lsl r3, r3, 1
	lhs r3, r3, LUT_VN
	.loc	1 549 21 is_stmt 0              // device.c:549:21
	lbs r2, r2, L
	.loc	1 549 28                        // device.c:549:28
	lbs r4, r3, Rcv
	.loc	1 549 16                        // device.c:549:16
	add r5, r1, 1
.Ltmp288:
	//DEBUG_VALUE: main:k <- $r5
	.loc	1 550 32 is_stmt 1              // device.c:550:32
	extsh r5, r5
.Ltmp289:
	lsl r5, r5, 1
	lhs r5, r5, LUT_VN
	.loc	1 549 26                        // device.c:549:26
	sub r4, r2, r4
	.loc	1 549 20 is_stmt 0              // device.c:549:20
	sb r3, Rcv, r4
	.loc	1 550 28 is_stmt 1              // device.c:550:28
	lbs r3, r5, Rcv
	.loc	1 550 16 is_stmt 0              // device.c:550:16
	add r4, r1, 2
.Ltmp290:
	//DEBUG_VALUE: main:k <- $r4
	.loc	1 551 32 is_stmt 1              // device.c:551:32
	extsh r4, r4
.Ltmp291:
	lsl r4, r4, 1
	lhs r4, r4, LUT_VN
	.loc	1 550 26                        // device.c:550:26
	sub r3, r2, r3
	.loc	1 550 20 is_stmt 0              // device.c:550:20
	sb r5, Rcv, r3
	.loc	1 551 28 is_stmt 1              // device.c:551:28
	lbs r3, r4, Rcv
	.loc	1 551 16 is_stmt 0              // device.c:551:16
	add r5, r1, 3
.Ltmp292:
	//DEBUG_VALUE: main:k <- $r5
	.loc	1 552 32 is_stmt 1              // device.c:552:32
	extsh r5, r5
.Ltmp293:
	lsl r5, r5, 1
	lhs r5, r5, LUT_VN
	.loc	1 551 26                        // device.c:551:26
	sub r3, r2, r3
	.loc	1 551 20 is_stmt 0              // device.c:551:20
	sb r4, Rcv, r3
	.loc	1 552 28 is_stmt 1              // device.c:552:28
	lbs r3, r5, Rcv
	.loc	1 552 16 is_stmt 0              // device.c:552:16
	add r4, r1, 4
.Ltmp294:
	//DEBUG_VALUE: main:k <- $r4
	.loc	1 553 32 is_stmt 1              // device.c:553:32
	extsh r4, r4
.Ltmp295:
	lsl r4, r4, 1
	lhs r4, r4, LUT_VN
	.loc	1 552 26                        // device.c:552:26
	sub r3, r2, r3
	.loc	1 552 20 is_stmt 0              // device.c:552:20
	sb r5, Rcv, r3
	.loc	1 553 28 is_stmt 1              // device.c:553:28
	lbs r3, r4, Rcv
	.loc	1 553 26 is_stmt 0              // device.c:553:26
	sub r3, r2, r3
	.loc	1 553 16                        // device.c:553:16
	add r1, r1, 5
.Ltmp296:
	//DEBUG_VALUE: main:k <- $r1
	.loc	1 546 85 is_stmt 1              // device.c:546:85
	add r0, r0, 1
.Ltmp297:
	//DEBUG_VALUE: i <- $r0
	.loc	1 546 46 is_stmt 0              // device.c:546:46
	extsh r2, r0
.Ltmp298:
	.loc	1 553 20 is_stmt 1              // device.c:553:20
	sb r4, Rcv, r3
.Ltmp299:
	.loc	1 546 3                         // device.c:546:3
	jgtu r16, r2, .LBB0_127
.Ltmp300:
.LBB0_119:                              //   in Loop: Header=BB0_7 Depth=1
	//DEBUG_VALUE: main:num_iter <- [DW_OP_constu 52, DW_OP_minus] [$r22+0]
	//DEBUG_VALUE: main:max_iter <- 5
	//DEBUG_VALUE: main:true_codeword <- 0
	//DEBUG_VALUE: main:k <- [DW_OP_constu 56, DW_OP_minus] [$r22+0]
	.loc	1 0 3 is_stmt 0                 // device.c:0:3
	move r2, r19
	move r0, r18
	lw r1, r22, -56
.Ltmp301:
	//DEBUG_VALUE: i <- $r18
	.loc	1 559 3 is_stmt 1               // device.c:559:3
	jleu r20, r19, .LBB0_120
.Ltmp302:
.LBB0_128:                              //   Parent Loop BB0_7 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	//DEBUG_VALUE: main:num_iter <- [DW_OP_constu 52, DW_OP_minus] [$r22+0]
	//DEBUG_VALUE: main:max_iter <- 5
	//DEBUG_VALUE: main:true_codeword <- 0
	//DEBUG_VALUE: main:k <- $r1
	//DEBUG_VALUE: i <- $r0
	.loc	1 561 32                        // device.c:561:32
	extsh r3, r1
	lsl r3, r3, 1
	lhs r3, r3, LUT_VN
	.loc	1 561 21 is_stmt 0              // device.c:561:21
	lbs r2, r2, L
	.loc	1 561 28                        // device.c:561:28
	lbs r4, r3, Rcv
	.loc	1 561 16                        // device.c:561:16
	add r5, r1, 1
.Ltmp303:
	//DEBUG_VALUE: main:k <- $r5
	.loc	1 562 32 is_stmt 1              // device.c:562:32
	extsh r5, r5
.Ltmp304:
	lsl r5, r5, 1
	lhs r5, r5, LUT_VN
	.loc	1 561 26                        // device.c:561:26
	sub r4, r2, r4
	.loc	1 561 20 is_stmt 0              // device.c:561:20
	sb r3, Rcv, r4
	.loc	1 562 28 is_stmt 1              // device.c:562:28
	lbs r3, r5, Rcv
	.loc	1 562 16 is_stmt 0              // device.c:562:16
	add r4, r1, 2
.Ltmp305:
	//DEBUG_VALUE: main:k <- $r4
	.loc	1 563 32 is_stmt 1              // device.c:563:32
	extsh r4, r4
.Ltmp306:
	lsl r4, r4, 1
	lhs r4, r4, LUT_VN
	.loc	1 562 26                        // device.c:562:26
	sub r3, r2, r3
	.loc	1 562 20 is_stmt 0              // device.c:562:20
	sb r5, Rcv, r3
	.loc	1 563 28 is_stmt 1              // device.c:563:28
	lbs r3, r4, Rcv
	.loc	1 563 26 is_stmt 0              // device.c:563:26
	sub r3, r2, r3
	.loc	1 563 16                        // device.c:563:16
	add r1, r1, 3
.Ltmp307:
	//DEBUG_VALUE: main:k <- $r1
	.loc	1 559 89 is_stmt 1              // device.c:559:89
	add r0, r0, 1
.Ltmp308:
	//DEBUG_VALUE: i <- $r0
	.loc	1 559 48 is_stmt 0              // device.c:559:48
	extsh r2, r0
.Ltmp309:
	.loc	1 563 20 is_stmt 1              // device.c:563:20
	sb r4, Rcv, r3
.Ltmp310:
	.loc	1 559 3                         // device.c:559:3
	jgtu r20, r2, .LBB0_128
	jump .LBB0_120
.Ltmp311:
.LBB0_121:
	//DEBUG_VALUE: main:num_iter <- $r0
	//DEBUG_VALUE: main:max_iter <- 5
	//DEBUG_VALUE: main:true_codeword <- 0
	.loc	1 599 36                        // device.c:599:36
	lw r0, r22, -12
.Ltmp312:
	lsl r0, r0, 3
.Ltmp313:
	//DEBUG_VALUE: i <- $r0
	.loc	1 599 2 is_stmt 0               // device.c:599:2
	jeq r0, -8, .LBB0_124
.Ltmp314:
// %bb.122:
	//DEBUG_VALUE: i <- $r0
	//DEBUG_VALUE: main:max_iter <- 5
	//DEBUG_VALUE: main:true_codeword <- 0
	.loc	1 600 7 is_stmt 1               // device.c:600:7
	lbu r1, r0, L
.Ltmp315:
	.loc	1 599 59                        // device.c:599:59
	add r2, r0, 8
	//DEBUG_VALUE: i <- $r0
.Ltmp316:
	.loc	1 600 7                         // device.c:600:7
	lsr r3, r1, 7
.Ltmp317:
	.loc	1 599 82                        // device.c:599:82
	or r1, r0, 1
.Ltmp318:
	//DEBUG_VALUE: i <- $r1
	.loc	1 601 19                        // device.c:601:19
	sb r0, decoded_word, r3
.Ltmp319:
	.loc	1 599 2                         // device.c:599:2
	jgeu r1, r2, .LBB0_124
.Ltmp320:
// %bb.123:
	//DEBUG_VALUE: i <- $r1
	//DEBUG_VALUE: main:max_iter <- 5
	//DEBUG_VALUE: main:true_codeword <- 0
	//DEBUG_VALUE: i <- $r1
	.loc	1 600 7                         // device.c:600:7
	lbu r2, r1, L
.Ltmp321:
	.loc	1 600 7 is_stmt 0               // device.c:600:7
	lsr r2, r2, 7
.Ltmp322:
	.loc	1 599 82 is_stmt 1              // device.c:599:82
	add r3, r1, 1
.Ltmp323:
	//DEBUG_VALUE: i <- $r3
	.loc	1 600 7                         // device.c:600:7
	lbu r4, r3, L
.Ltmp324:
	.loc	1 599 82                        // device.c:599:82
	or r5, r0, 3
.Ltmp325:
	//DEBUG_VALUE: i <- $r5
	.loc	1 600 7                         // device.c:600:7
	lbu r6, r5, L
	.loc	1 601 19                        // device.c:601:19
	sb r1, decoded_word, r2
.Ltmp326:
	.loc	1 600 7                         // device.c:600:7
	lsr r1, r4, 7
.Ltmp327:
	.loc	1 601 19                        // device.c:601:19
	sb r3, decoded_word, r1
.Ltmp328:
	.loc	1 600 7                         // device.c:600:7
	lsr r1, r6, 7
.Ltmp329:
	.loc	1 599 82                        // device.c:599:82
	add r2, r5, 1
.Ltmp330:
	//DEBUG_VALUE: i <- $r2
	.loc	1 600 7                         // device.c:600:7
	lbu r3, r2, L
.Ltmp331:
	.loc	1 599 82                        // device.c:599:82
	add r4, r5, 2
.Ltmp332:
	//DEBUG_VALUE: i <- $r4
	.loc	1 600 7                         // device.c:600:7
	lbu r6, r4, L
	.loc	1 601 19                        // device.c:601:19
	sb r5, decoded_word, r1
.Ltmp333:
	.loc	1 600 7                         // device.c:600:7
	lsr r1, r3, 7
.Ltmp334:
	.loc	1 601 19                        // device.c:601:19
	sb r2, decoded_word, r1
.Ltmp335:
	.loc	1 600 7                         // device.c:600:7
	lsr r1, r6, 7
.Ltmp336:
	.loc	1 599 82                        // device.c:599:82
	add r2, r5, 3
.Ltmp337:
	//DEBUG_VALUE: i <- $r2
	.loc	1 600 7                         // device.c:600:7
	lbu r3, r2, L
.Ltmp338:
	.loc	1 599 82                        // device.c:599:82
	or r0, r0, 7
.Ltmp339:
	//DEBUG_VALUE: i <- $r0
	.loc	1 600 7                         // device.c:600:7
	lbu r5, r0, L
	.loc	1 601 19                        // device.c:601:19
	sb r4, decoded_word, r1
.Ltmp340:
	.loc	1 600 7                         // device.c:600:7
	lsr r1, r3, 7
.Ltmp341:
	.loc	1 601 19                        // device.c:601:19
	sb r2, decoded_word, r1
.Ltmp342:
	.loc	1 600 7                         // device.c:600:7
	lsr r1, r5, 7
.Ltmp343:
	.loc	1 601 19                        // device.c:601:19
	sb r0, decoded_word, r1
.Ltmp344:
	//DEBUG_VALUE: i <- [DW_OP_plus_uconst 1, DW_OP_stack_value] undef
.LBB0_124:
	//DEBUG_VALUE: main:max_iter <- 5
	//DEBUG_VALUE: main:true_codeword <- 0
	.loc	1 616 14                        // device.c:616:14
	call r23, perfcounter_get
.Ltmp345:
	.loc	1 0 14 is_stmt 0                // device.c:0:14
	move r2, 1
	.loc	1 616 12                        // device.c:616:12
	sw zero, nb_cycles, r1
	.loc	1 619 1 is_stmt 1               // device.c:619:1
	move r0, r2
	ld d20, r22, -120
	ld d18, r22, -112
	ld d16, r22, -104
	ld d14, r22, -96
	ld d22, r22, -8
	jump r23
.Ltmp346:
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
	.file	5 "/usr/bin/../share/upmem/include/syslib" "sysdef.h"
	.section	.stack_sizes,"o",@progbits,.text.main
	.long	.Lfunc_begin0
	.byte	120
	.section	.text.main,"ax",@progbits
                                        // -- End function
	.type	LUT_VN,@object                  // @LUT_VN
	.section	.data.LUT_VN,"aw",@progbits
	.globl	LUT_VN
	.p2align	3
LUT_VN:
	.short	0                               // 0x0
	.short	72                              // 0x48
	.short	208                             // 0xd0
	.short	352                             // 0x160
	.short	384                             // 0x180
	.short	8                               // 0x8
	.short	80                              // 0x50
	.short	216                             // 0xd8
	.short	360                             // 0x168
	.short	392                             // 0x188
	.short	16                              // 0x10
	.short	88                              // 0x58
	.short	224                             // 0xe0
	.short	368                             // 0x170
	.short	400                             // 0x190
	.short	24                              // 0x18
	.short	96                              // 0x60
	.short	232                             // 0xe8
	.short	376                             // 0x178
	.short	408                             // 0x198
	.short	32                              // 0x20
	.short	104                             // 0x68
	.short	240                             // 0xf0
	.short	256                             // 0x100
	.short	416                             // 0x1a0
	.short	40                              // 0x28
	.short	112                             // 0x70
	.short	248                             // 0xf8
	.short	264                             // 0x108
	.short	424                             // 0x1a8
	.short	48                              // 0x30
	.short	120                             // 0x78
	.short	128                             // 0x80
	.short	272                             // 0x110
	.short	432                             // 0x1b0
	.short	1                               // 0x1
	.short	56                              // 0x38
	.short	136                             // 0x88
	.short	280                             // 0x118
	.short	440                             // 0x1b8
	.short	9                               // 0x9
	.short	64                              // 0x40
	.short	144                             // 0x90
	.short	288                             // 0x120
	.short	448                             // 0x1c0
	.short	17                              // 0x11
	.short	73                              // 0x49
	.short	152                             // 0x98
	.short	296                             // 0x128
	.short	456                             // 0x1c8
	.short	25                              // 0x19
	.short	81                              // 0x51
	.short	160                             // 0xa0
	.short	304                             // 0x130
	.short	464                             // 0x1d0
	.short	33                              // 0x21
	.short	89                              // 0x59
	.short	168                             // 0xa8
	.short	312                             // 0x138
	.short	472                             // 0x1d8
	.short	41                              // 0x29
	.short	97                              // 0x61
	.short	176                             // 0xb0
	.short	320                             // 0x140
	.short	480                             // 0x1e0
	.short	49                              // 0x31
	.short	105                             // 0x69
	.short	184                             // 0xb8
	.short	328                             // 0x148
	.short	488                             // 0x1e8
	.short	57                              // 0x39
	.short	113                             // 0x71
	.short	192                             // 0xc0
	.short	336                             // 0x150
	.short	496                             // 0x1f0
	.short	65                              // 0x41
	.short	121                             // 0x79
	.short	200                             // 0xc8
	.short	344                             // 0x158
	.short	504                             // 0x1f8
	.short	114                             // 0x72
	.short	129                             // 0x81
	.short	137                             // 0x89
	.short	377                             // 0x179
	.short	505                             // 0x1f9
	.short	122                             // 0x7a
	.short	138                             // 0x8a
	.short	145                             // 0x91
	.short	257                             // 0x101
	.short	385                             // 0x181
	.short	2                               // 0x2
	.short	146                             // 0x92
	.short	153                             // 0x99
	.short	265                             // 0x109
	.short	393                             // 0x189
	.short	10                              // 0xa
	.short	154                             // 0x9a
	.short	161                             // 0xa1
	.short	273                             // 0x111
	.short	401                             // 0x191
	.short	18                              // 0x12
	.short	162                             // 0xa2
	.short	169                             // 0xa9
	.short	281                             // 0x119
	.short	409                             // 0x199
	.short	26                              // 0x1a
	.short	170                             // 0xaa
	.short	177                             // 0xb1
	.short	289                             // 0x121
	.short	417                             // 0x1a1
	.short	34                              // 0x22
	.short	178                             // 0xb2
	.short	185                             // 0xb9
	.short	297                             // 0x129
	.short	425                             // 0x1a9
	.short	42                              // 0x2a
	.short	186                             // 0xba
	.short	193                             // 0xc1
	.short	305                             // 0x131
	.short	433                             // 0x1b1
	.short	50                              // 0x32
	.short	194                             // 0xc2
	.short	201                             // 0xc9
	.short	313                             // 0x139
	.short	441                             // 0x1b9
	.short	58                              // 0x3a
	.short	202                             // 0xca
	.short	209                             // 0xd1
	.short	321                             // 0x141
	.short	449                             // 0x1c1
	.short	66                              // 0x42
	.short	210                             // 0xd2
	.short	217                             // 0xd9
	.short	329                             // 0x149
	.short	457                             // 0x1c9
	.short	74                              // 0x4a
	.short	218                             // 0xda
	.short	225                             // 0xe1
	.short	337                             // 0x151
	.short	465                             // 0x1d1
	.short	82                              // 0x52
	.short	226                             // 0xe2
	.short	233                             // 0xe9
	.short	345                             // 0x159
	.short	473                             // 0x1d9
	.short	90                              // 0x5a
	.short	234                             // 0xea
	.short	241                             // 0xf1
	.short	353                             // 0x161
	.short	481                             // 0x1e1
	.short	98                              // 0x62
	.short	242                             // 0xf2
	.short	249                             // 0xf9
	.short	361                             // 0x169
	.short	489                             // 0x1e9
	.short	106                             // 0x6a
	.short	130                             // 0x82
	.short	250                             // 0xfa
	.short	369                             // 0x171
	.short	497                             // 0x1f1
	.short	19                              // 0x13
	.short	131                             // 0x83
	.short	258                             // 0x102
	.short	266                             // 0x10a
	.short	442                             // 0x1ba
	.short	27                              // 0x1b
	.short	139                             // 0x8b
	.short	267                             // 0x10b
	.short	274                             // 0x112
	.short	450                             // 0x1c2
	.short	35                              // 0x23
	.short	147                             // 0x93
	.short	275                             // 0x113
	.short	282                             // 0x11a
	.short	458                             // 0x1ca
	.short	43                              // 0x2b
	.short	155                             // 0x9b
	.short	283                             // 0x11b
	.short	290                             // 0x122
	.short	466                             // 0x1d2
	.short	51                              // 0x33
	.short	163                             // 0xa3
	.short	291                             // 0x123
	.short	298                             // 0x12a
	.short	474                             // 0x1da
	.short	59                              // 0x3b
	.short	171                             // 0xab
	.short	299                             // 0x12b
	.short	306                             // 0x132
	.short	482                             // 0x1e2
	.short	67                              // 0x43
	.short	179                             // 0xb3
	.short	307                             // 0x133
	.short	314                             // 0x13a
	.short	490                             // 0x1ea
	.short	75                              // 0x4b
	.short	187                             // 0xbb
	.short	315                             // 0x13b
	.short	322                             // 0x142
	.short	498                             // 0x1f2
	.short	83                              // 0x53
	.short	195                             // 0xc3
	.short	323                             // 0x143
	.short	330                             // 0x14a
	.short	506                             // 0x1fa
	.short	91                              // 0x5b
	.short	203                             // 0xcb
	.short	331                             // 0x14b
	.short	338                             // 0x152
	.short	386                             // 0x182
	.short	99                              // 0x63
	.short	211                             // 0xd3
	.short	339                             // 0x153
	.short	346                             // 0x15a
	.short	394                             // 0x18a
	.short	107                             // 0x6b
	.short	219                             // 0xdb
	.short	347                             // 0x15b
	.short	354                             // 0x162
	.short	402                             // 0x192
	.short	115                             // 0x73
	.short	227                             // 0xe3
	.short	355                             // 0x163
	.short	362                             // 0x16a
	.short	410                             // 0x19a
	.short	123                             // 0x7b
	.short	235                             // 0xeb
	.short	363                             // 0x16b
	.short	370                             // 0x172
	.short	418                             // 0x1a2
	.short	3                               // 0x3
	.short	243                             // 0xf3
	.short	371                             // 0x173
	.short	378                             // 0x17a
	.short	426                             // 0x1aa
	.short	11                              // 0xb
	.short	251                             // 0xfb
	.short	259                             // 0x103
	.short	379                             // 0x17b
	.short	434                             // 0x1b2
	.short	84                              // 0x54
	.short	252                             // 0xfc
	.short	276                             // 0x114
	.short	387                             // 0x183
	.short	411                             // 0x19b
	.short	92                              // 0x5c
	.short	132                             // 0x84
	.short	284                             // 0x11c
	.short	395                             // 0x18b
	.short	419                             // 0x1a3
	.short	100                             // 0x64
	.short	140                             // 0x8c
	.short	292                             // 0x124
	.short	403                             // 0x193
	.short	427                             // 0x1ab
	.short	108                             // 0x6c
	.short	148                             // 0x94
	.short	300                             // 0x12c
	.short	412                             // 0x19c
	.short	435                             // 0x1b3
	.short	116                             // 0x74
	.short	156                             // 0x9c
	.short	308                             // 0x134
	.short	420                             // 0x1a4
	.short	443                             // 0x1bb
	.short	124                             // 0x7c
	.short	164                             // 0xa4
	.short	316                             // 0x13c
	.short	428                             // 0x1ac
	.short	451                             // 0x1c3
	.short	4                               // 0x4
	.short	172                             // 0xac
	.short	324                             // 0x144
	.short	436                             // 0x1b4
	.short	459                             // 0x1cb
	.short	12                              // 0xc
	.short	180                             // 0xb4
	.short	332                             // 0x14c
	.short	444                             // 0x1bc
	.short	467                             // 0x1d3
	.short	20                              // 0x14
	.short	188                             // 0xbc
	.short	340                             // 0x154
	.short	452                             // 0x1c4
	.short	475                             // 0x1db
	.short	28                              // 0x1c
	.short	196                             // 0xc4
	.short	348                             // 0x15c
	.short	460                             // 0x1cc
	.short	483                             // 0x1e3
	.short	36                              // 0x24
	.short	204                             // 0xcc
	.short	356                             // 0x164
	.short	468                             // 0x1d4
	.short	491                             // 0x1eb
	.short	44                              // 0x2c
	.short	212                             // 0xd4
	.short	364                             // 0x16c
	.short	476                             // 0x1dc
	.short	499                             // 0x1f3
	.short	52                              // 0x34
	.short	220                             // 0xdc
	.short	372                             // 0x174
	.short	484                             // 0x1e4
	.short	507                             // 0x1fb
	.short	60                              // 0x3c
	.short	228                             // 0xe4
	.short	380                             // 0x17c
	.short	388                             // 0x184
	.short	492                             // 0x1ec
	.short	68                              // 0x44
	.short	236                             // 0xec
	.short	260                             // 0x104
	.short	396                             // 0x18c
	.short	500                             // 0x1f4
	.short	76                              // 0x4c
	.short	244                             // 0xf4
	.short	268                             // 0x10c
	.short	404                             // 0x194
	.short	508                             // 0x1fc
	.short	133                             // 0x85
	.short	301                             // 0x12d
	.short	405                             // 0x195
	.short	141                             // 0x8d
	.short	309                             // 0x135
	.short	413                             // 0x19d
	.short	149                             // 0x95
	.short	317                             // 0x13d
	.short	421                             // 0x1a5
	.short	157                             // 0x9d
	.short	325                             // 0x145
	.short	429                             // 0x1ad
	.short	165                             // 0xa5
	.short	333                             // 0x14d
	.short	437                             // 0x1b5
	.short	173                             // 0xad
	.short	341                             // 0x155
	.short	445                             // 0x1bd
	.short	181                             // 0xb5
	.short	349                             // 0x15d
	.short	453                             // 0x1c5
	.short	189                             // 0xbd
	.short	357                             // 0x165
	.short	461                             // 0x1cd
	.short	197                             // 0xc5
	.short	365                             // 0x16d
	.short	469                             // 0x1d5
	.short	205                             // 0xcd
	.short	373                             // 0x175
	.short	477                             // 0x1dd
	.short	213                             // 0xd5
	.short	381                             // 0x17d
	.short	485                             // 0x1e5
	.short	221                             // 0xdd
	.short	261                             // 0x105
	.short	493                             // 0x1ed
	.short	229                             // 0xe5
	.short	269                             // 0x10d
	.short	501                             // 0x1f5
	.short	237                             // 0xed
	.short	277                             // 0x115
	.short	509                             // 0x1fd
	.short	245                             // 0xf5
	.short	285                             // 0x11d
	.short	389                             // 0x185
	.short	253                             // 0xfd
	.short	293                             // 0x125
	.short	397                             // 0x18d
	.short	5                               // 0x5
	.short	262                             // 0x106
	.short	510                             // 0x1fe
	.short	13                              // 0xd
	.short	270                             // 0x10e
	.short	390                             // 0x186
	.short	21                              // 0x15
	.short	278                             // 0x116
	.short	398                             // 0x18e
	.short	29                              // 0x1d
	.short	286                             // 0x11e
	.short	406                             // 0x196
	.short	37                              // 0x25
	.short	294                             // 0x126
	.short	414                             // 0x19e
	.short	45                              // 0x2d
	.short	302                             // 0x12e
	.short	422                             // 0x1a6
	.short	53                              // 0x35
	.short	310                             // 0x136
	.short	430                             // 0x1ae
	.short	61                              // 0x3d
	.short	318                             // 0x13e
	.short	438                             // 0x1b6
	.short	69                              // 0x45
	.short	326                             // 0x146
	.short	446                             // 0x1be
	.short	77                              // 0x4d
	.short	334                             // 0x14e
	.short	454                             // 0x1c6
	.short	85                              // 0x55
	.short	342                             // 0x156
	.short	462                             // 0x1ce
	.short	93                              // 0x5d
	.short	350                             // 0x15e
	.short	470                             // 0x1d6
	.short	101                             // 0x65
	.short	358                             // 0x166
	.short	478                             // 0x1de
	.short	109                             // 0x6d
	.short	366                             // 0x16e
	.short	486                             // 0x1e6
	.short	117                             // 0x75
	.short	374                             // 0x176
	.short	494                             // 0x1ee
	.short	125                             // 0x7d
	.short	382                             // 0x17e
	.short	502                             // 0x1f6
	.short	30                              // 0x1e
	.short	134                             // 0x86
	.short	391                             // 0x187
	.short	38                              // 0x26
	.short	142                             // 0x8e
	.short	399                             // 0x18f
	.short	46                              // 0x2e
	.short	150                             // 0x96
	.short	407                             // 0x197
	.short	54                              // 0x36
	.short	158                             // 0x9e
	.short	415                             // 0x19f
	.short	62                              // 0x3e
	.short	166                             // 0xa6
	.short	423                             // 0x1a7
	.short	70                              // 0x46
	.short	174                             // 0xae
	.short	431                             // 0x1af
	.short	78                              // 0x4e
	.short	182                             // 0xb6
	.short	439                             // 0x1b7
	.short	86                              // 0x56
	.short	190                             // 0xbe
	.short	447                             // 0x1bf
	.short	94                              // 0x5e
	.short	198                             // 0xc6
	.short	455                             // 0x1c7
	.short	102                             // 0x66
	.short	206                             // 0xce
	.short	463                             // 0x1cf
	.short	110                             // 0x6e
	.short	214                             // 0xd6
	.short	471                             // 0x1d7
	.short	118                             // 0x76
	.short	222                             // 0xde
	.short	479                             // 0x1df
	.short	126                             // 0x7e
	.short	230                             // 0xe6
	.short	487                             // 0x1e7
	.short	6                               // 0x6
	.short	238                             // 0xee
	.short	495                             // 0x1ef
	.short	14                              // 0xe
	.short	246                             // 0xf6
	.short	503                             // 0x1f7
	.short	22                              // 0x16
	.short	254                             // 0xfe
	.short	511                             // 0x1ff
	.short	7                               // 0x7
	.short	207                             // 0xcf
	.short	367                             // 0x16f
	.short	15                              // 0xf
	.short	215                             // 0xd7
	.short	375                             // 0x177
	.short	23                              // 0x17
	.short	223                             // 0xdf
	.short	383                             // 0x17f
	.short	31                              // 0x1f
	.short	231                             // 0xe7
	.short	263                             // 0x107
	.short	39                              // 0x27
	.short	239                             // 0xef
	.short	271                             // 0x10f
	.short	47                              // 0x2f
	.short	247                             // 0xf7
	.short	279                             // 0x117
	.short	55                              // 0x37
	.short	255                             // 0xff
	.short	287                             // 0x11f
	.short	63                              // 0x3f
	.short	135                             // 0x87
	.short	295                             // 0x127
	.short	71                              // 0x47
	.short	143                             // 0x8f
	.short	303                             // 0x12f
	.short	79                              // 0x4f
	.short	151                             // 0x97
	.short	311                             // 0x137
	.short	87                              // 0x57
	.short	159                             // 0x9f
	.short	319                             // 0x13f
	.short	95                              // 0x5f
	.short	167                             // 0xa7
	.short	327                             // 0x147
	.short	103                             // 0x67
	.short	175                             // 0xaf
	.short	335                             // 0x14f
	.short	111                             // 0x6f
	.short	183                             // 0xb7
	.short	343                             // 0x157
	.short	119                             // 0x77
	.short	191                             // 0xbf
	.short	351                             // 0x15f
	.short	127                             // 0x7f
	.short	199                             // 0xc7
	.short	359                             // 0x167
	.size	LUT_VN, 1024

	.type	L,@object                       // @L
	.section	.dpu_host,"aw",@progbits
	.globl	L
	.p2align	3
L:
	.zero	128
	.size	L, 128

	.type	Rcv,@object                     // @Rcv
	.section	.bss.Rcv,"aw",@nobits
	.globl	Rcv
	.p2align	3
Rcv:
	.zero	512
	.size	Rcv, 512

	.type	decoded_word,@object            // @decoded_word
	.section	.dpu_host,"aw",@progbits
	.globl	decoded_word
	.p2align	3
decoded_word:
	.zero	128
	.size	decoded_word, 128

	.type	nb_cycles,@object               // @nb_cycles
	.globl	nb_cycles
	.p2align	3
nb_cycles:
	.long	0                               // 0x0
	.size	nb_cycles, 4

	.type	__atomic_bit_barrier_my_barrier,@object // @__atomic_bit_barrier_my_barrier
	.section	.atomic,"aw",@progbits
	.globl	__atomic_bit_barrier_my_barrier
__atomic_bit_barrier_my_barrier:
	.byte	0                               // 0x0
	.size	__atomic_bit_barrier_my_barrier, 1

	.type	valid_decoded_word,@object      // @valid_decoded_word
	.section	.dpu_host,"aw",@progbits
	.globl	valid_decoded_word
	.p2align	3
valid_decoded_word:
	.zero	8
	.size	valid_decoded_word, 8

	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
	.long	.Ltmp3-.Lfunc_begin0
	.long	.Lfunc_end0-.Lfunc_begin0
	.short	3                               // Loc expr size
	.byte	17                              // DW_OP_consts
	.byte	0                               // 0
	.byte	159                             // DW_OP_stack_value
	.long	0
	.long	0
.Ldebug_loc1:
	.long	.Ltmp3-.Lfunc_begin0
	.long	.Lfunc_end0-.Lfunc_begin0
	.short	3                               // Loc expr size
	.byte	17                              // DW_OP_consts
	.byte	5                               // 5
	.byte	159                             // DW_OP_stack_value
	.long	0
	.long	0
.Ldebug_loc2:
	.long	.Ltmp3-.Lfunc_begin0
	.long	.Ltmp7-.Lfunc_begin0
	.short	1                               // Loc expr size
	.byte	86                              // DW_OP_reg6
	.long	.Ltmp7-.Lfunc_begin0
	.long	.Ltmp18-.Lfunc_begin0
	.short	1                               // Loc expr size
	.byte	81                              // DW_OP_reg1
	.long	0
	.long	0
.Ldebug_loc3:
	.long	.Ltmp5-.Lfunc_begin0
	.long	.Ltmp7-.Lfunc_begin0
	.short	1                               // Loc expr size
	.byte	89                              // DW_OP_reg9
	.long	.Ltmp7-.Lfunc_begin0
	.long	.Ltmp8-.Lfunc_begin0
	.short	1                               // Loc expr size
	.byte	80                              // DW_OP_reg0
	.long	.Ltmp8-.Lfunc_begin0
	.long	.Ltmp9-.Lfunc_begin0
	.short	1                               // Loc expr size
	.byte	84                              // DW_OP_reg4
	.long	.Ltmp9-.Lfunc_begin0
	.long	.Ltmp10-.Lfunc_begin0
	.short	1                               // Loc expr size
	.byte	82                              // DW_OP_reg2
	.long	.Ltmp10-.Lfunc_begin0
	.long	.Ltmp11-.Lfunc_begin0
	.short	1                               // Loc expr size
	.byte	85                              // DW_OP_reg5
	.long	.Ltmp12-.Lfunc_begin0
	.long	.Ltmp13-.Lfunc_begin0
	.short	1                               // Loc expr size
	.byte	82                              // DW_OP_reg2
	.long	.Ltmp14-.Lfunc_begin0
	.long	.Ltmp18-.Lfunc_begin0
	.short	1                               // Loc expr size
	.byte	80                              // DW_OP_reg0
	.long	.Ltmp22-.Lfunc_begin0
	.long	.Ltmp23-.Lfunc_begin0
	.short	1                               // Loc expr size
	.byte	80                              // DW_OP_reg0
	.long	.Ltmp23-.Lfunc_begin0
	.long	.Ltmp25-.Lfunc_begin0
	.short	2                               // Loc expr size
	.byte	134                             // DW_OP_breg22
	.byte	72                              // -56
	.long	.Ltmp25-.Lfunc_begin0
	.long	.Ltmp26-.Lfunc_begin0
	.short	1                               // Loc expr size
	.byte	80                              // DW_OP_reg0
	.long	.Ltmp26-.Lfunc_begin0
	.long	.Ltmp27-.Lfunc_begin0
	.short	1                               // Loc expr size
	.byte	82                              // DW_OP_reg2
	.long	.Ltmp28-.Lfunc_begin0
	.long	.Ltmp29-.Lfunc_begin0
	.short	1                               // Loc expr size
	.byte	84                              // DW_OP_reg4
	.long	.Ltmp30-.Lfunc_begin0
	.long	.Ltmp34-.Lfunc_begin0
	.short	1                               // Loc expr size
	.byte	80                              // DW_OP_reg0
	.long	.Ltmp42-.Lfunc_begin0
	.long	.Ltmp44-.Lfunc_begin0
	.short	7                               // Loc expr size
	.byte	134                             // DW_OP_breg22
	.byte	116                             // -12
	.byte	148                             // DW_OP_deref_size
	.byte	4                               // 
	.byte	53                              // DW_OP_lit5
	.byte	36                              // DW_OP_shl
	.byte	159                             // DW_OP_stack_value
	.long	.Ltmp257-.Lfunc_begin0
	.long	.Ltmp259-.Lfunc_begin0
	.short	2                               // Loc expr size
	.byte	134                             // DW_OP_breg22
	.byte	92                              // -36
	.long	.Ltmp259-.Lfunc_begin0
	.long	.Ltmp260-.Lfunc_begin0
	.short	1                               // Loc expr size
	.byte	80                              // DW_OP_reg0
	.long	.Ltmp260-.Lfunc_begin0
	.long	.Ltmp261-.Lfunc_begin0
	.short	1                               // Loc expr size
	.byte	83                              // DW_OP_reg3
	.long	.Ltmp263-.Lfunc_begin0
	.long	.Ltmp264-.Lfunc_begin0
	.short	1                               // Loc expr size
	.byte	85                              // DW_OP_reg5
	.long	.Ltmp264-.Lfunc_begin0
	.long	.Ltmp265-.Lfunc_begin0
	.short	1                               // Loc expr size
	.byte	86                              // DW_OP_reg6
	.long	.Ltmp265-.Lfunc_begin0
	.long	.Ltmp266-.Lfunc_begin0
	.short	1                               // Loc expr size
	.byte	87                              // DW_OP_reg7
	.long	.Ltmp271-.Lfunc_begin0
	.long	.Ltmp272-.Lfunc_begin0
	.short	1                               // Loc expr size
	.byte	80                              // DW_OP_reg0
	.long	.Ltmp272-.Lfunc_begin0
	.long	.Ltmp274-.Lfunc_begin0
	.short	2                               // Loc expr size
	.byte	134                             // DW_OP_breg22
	.byte	72                              // -56
	.long	.Ltmp274-.Lfunc_begin0
	.long	.Ltmp275-.Lfunc_begin0
	.short	1                               // Loc expr size
	.byte	82                              // DW_OP_reg2
	.long	.Ltmp275-.Lfunc_begin0
	.long	.Ltmp276-.Lfunc_begin0
	.short	1                               // Loc expr size
	.byte	83                              // DW_OP_reg3
	.long	.Ltmp276-.Lfunc_begin0
	.long	.Ltmp277-.Lfunc_begin0
	.short	1                               // Loc expr size
	.byte	85                              // DW_OP_reg5
	.long	.Ltmp283-.Lfunc_begin0
	.long	.Ltmp284-.Lfunc_begin0
	.short	1                               // Loc expr size
	.byte	82                              // DW_OP_reg2
	.long	.Ltmp285-.Lfunc_begin0
	.long	.Ltmp287-.Lfunc_begin0
	.short	2                               // Loc expr size
	.byte	134                             // DW_OP_breg22
	.byte	92                              // -36
	.long	.Ltmp287-.Lfunc_begin0
	.long	.Ltmp288-.Lfunc_begin0
	.short	1                               // Loc expr size
	.byte	81                              // DW_OP_reg1
	.long	.Ltmp288-.Lfunc_begin0
	.long	.Ltmp289-.Lfunc_begin0
	.short	1                               // Loc expr size
	.byte	85                              // DW_OP_reg5
	.long	.Ltmp290-.Lfunc_begin0
	.long	.Ltmp291-.Lfunc_begin0
	.short	1                               // Loc expr size
	.byte	84                              // DW_OP_reg4
	.long	.Ltmp292-.Lfunc_begin0
	.long	.Ltmp293-.Lfunc_begin0
	.short	1                               // Loc expr size
	.byte	85                              // DW_OP_reg5
	.long	.Ltmp294-.Lfunc_begin0
	.long	.Ltmp295-.Lfunc_begin0
	.short	1                               // Loc expr size
	.byte	84                              // DW_OP_reg4
	.long	.Ltmp296-.Lfunc_begin0
	.long	.Ltmp300-.Lfunc_begin0
	.short	1                               // Loc expr size
	.byte	81                              // DW_OP_reg1
	.long	.Ltmp300-.Lfunc_begin0
	.long	.Ltmp302-.Lfunc_begin0
	.short	2                               // Loc expr size
	.byte	134                             // DW_OP_breg22
	.byte	72                              // -56
	.long	.Ltmp302-.Lfunc_begin0
	.long	.Ltmp303-.Lfunc_begin0
	.short	1                               // Loc expr size
	.byte	81                              // DW_OP_reg1
	.long	.Ltmp303-.Lfunc_begin0
	.long	.Ltmp304-.Lfunc_begin0
	.short	1                               // Loc expr size
	.byte	85                              // DW_OP_reg5
	.long	.Ltmp305-.Lfunc_begin0
	.long	.Ltmp306-.Lfunc_begin0
	.short	1                               // Loc expr size
	.byte	84                              // DW_OP_reg4
	.long	.Ltmp307-.Lfunc_begin0
	.long	.Ltmp311-.Lfunc_begin0
	.short	1                               // Loc expr size
	.byte	81                              // DW_OP_reg1
	.long	0
	.long	0
.Ldebug_loc4:
	.long	.Ltmp20-.Lfunc_begin0
	.long	.Ltmp25-.Lfunc_begin0
	.short	1                               // Loc expr size
	.byte	98                              // DW_OP_reg18
	.long	.Ltmp25-.Lfunc_begin0
	.long	.Ltmp34-.Lfunc_begin0
	.short	1                               // Loc expr size
	.byte	81                              // DW_OP_reg1
	.long	0
	.long	0
.Ldebug_loc5:
	.long	.Ltmp35-.Lfunc_begin0
	.long	.Ltmp37-.Lfunc_begin0
	.short	3                               // Loc expr size
	.byte	17                              // DW_OP_consts
	.byte	0                               // 0
	.byte	159                             // DW_OP_stack_value
	.long	.Ltmp37-.Lfunc_begin0
	.long	.Ltmp40-.Lfunc_begin0
	.short	2                               // Loc expr size
	.byte	134                             // DW_OP_breg22
	.byte	76                              // -52
	.long	.Ltmp40-.Lfunc_begin0
	.long	.Ltmp43-.Lfunc_begin0
	.short	1                               // Loc expr size
	.byte	80                              // DW_OP_reg0
	.long	.Ltmp43-.Lfunc_begin0
	.long	.Ltmp311-.Lfunc_begin0
	.short	2                               // Loc expr size
	.byte	134                             // DW_OP_breg22
	.byte	76                              // -52
	.long	.Ltmp311-.Lfunc_begin0
	.long	.Ltmp312-.Lfunc_begin0
	.short	1                               // Loc expr size
	.byte	80                              // DW_OP_reg0
	.long	0
	.long	0
.Ldebug_loc6:
	.long	.Ltmp44-.Lfunc_begin0
	.long	.Ltmp46-.Lfunc_begin0
	.short	1                               // Loc expr size
	.byte	87                              // DW_OP_reg7
	.long	.Ltmp46-.Lfunc_begin0
	.long	.Ltmp48-.Lfunc_begin0
	.short	1                               // Loc expr size
	.byte	80                              // DW_OP_reg0
	.long	.Ltmp48-.Lfunc_begin0
	.long	.Ltmp253-.Lfunc_begin0
	.short	1                               // Loc expr size
	.byte	87                              // DW_OP_reg7
	.long	0
	.long	0
.Ldebug_loc7:
	.long	.Ltmp49-.Lfunc_begin0
	.long	.Ltmp52-.Lfunc_begin0
	.short	4                               // Loc expr size
	.byte	17                              // DW_OP_consts
	.byte	255                             // 127
	.byte	0                               // 
	.byte	159                             // DW_OP_stack_value
	.long	.Ltmp56-.Lfunc_begin0
	.long	.Ltmp60-.Lfunc_begin0
	.short	1                               // Loc expr size
	.byte	82                              // DW_OP_reg2
	.long	.Ltmp60-.Lfunc_begin0
	.long	.Ltmp70-.Lfunc_begin0
	.short	1                               // Loc expr size
	.byte	84                              // DW_OP_reg4
	.long	.Ltmp70-.Lfunc_begin0
	.long	.Ltmp72-.Lfunc_begin0
	.short	1                               // Loc expr size
	.byte	81                              // DW_OP_reg1
	.long	.Ltmp72-.Lfunc_begin0
	.long	.Ltmp73-.Lfunc_begin0
	.short	1                               // Loc expr size
	.byte	84                              // DW_OP_reg4
	.long	.Ltmp73-.Lfunc_begin0
	.long	.Ltmp83-.Lfunc_begin0
	.short	1                               // Loc expr size
	.byte	81                              // DW_OP_reg1
	.long	.Ltmp83-.Lfunc_begin0
	.long	.Ltmp85-.Lfunc_begin0
	.short	1                               // Loc expr size
	.byte	82                              // DW_OP_reg2
	.long	.Ltmp85-.Lfunc_begin0
	.long	.Ltmp86-.Lfunc_begin0
	.short	1                               // Loc expr size
	.byte	81                              // DW_OP_reg1
	.long	.Ltmp86-.Lfunc_begin0
	.long	.Ltmp96-.Lfunc_begin0
	.short	1                               // Loc expr size
	.byte	82                              // DW_OP_reg2
	.long	.Ltmp96-.Lfunc_begin0
	.long	.Ltmp98-.Lfunc_begin0
	.short	1                               // Loc expr size
	.byte	81                              // DW_OP_reg1
	.long	.Ltmp98-.Lfunc_begin0
	.long	.Ltmp99-.Lfunc_begin0
	.short	1                               // Loc expr size
	.byte	82                              // DW_OP_reg2
	.long	.Ltmp99-.Lfunc_begin0
	.long	.Ltmp109-.Lfunc_begin0
	.short	1                               // Loc expr size
	.byte	81                              // DW_OP_reg1
	.long	.Ltmp109-.Lfunc_begin0
	.long	.Ltmp111-.Lfunc_begin0
	.short	1                               // Loc expr size
	.byte	82                              // DW_OP_reg2
	.long	.Ltmp111-.Lfunc_begin0
	.long	.Ltmp112-.Lfunc_begin0
	.short	1                               // Loc expr size
	.byte	81                              // DW_OP_reg1
	.long	.Ltmp112-.Lfunc_begin0
	.long	.Ltmp122-.Lfunc_begin0
	.short	1                               // Loc expr size
	.byte	82                              // DW_OP_reg2
	.long	.Ltmp122-.Lfunc_begin0
	.long	.Ltmp124-.Lfunc_begin0
	.short	1                               // Loc expr size
	.byte	81                              // DW_OP_reg1
	.long	.Ltmp124-.Lfunc_begin0
	.long	.Ltmp125-.Lfunc_begin0
	.short	1                               // Loc expr size
	.byte	82                              // DW_OP_reg2
	.long	.Ltmp125-.Lfunc_begin0
	.long	.Ltmp135-.Lfunc_begin0
	.short	1                               // Loc expr size
	.byte	81                              // DW_OP_reg1
	.long	.Ltmp135-.Lfunc_begin0
	.long	.Ltmp152-.Lfunc_begin0
	.short	1                               // Loc expr size
	.byte	95                              // DW_OP_reg15
	.long	.Ltmp152-.Lfunc_begin0
	.long	.Ltmp153-.Lfunc_begin0
	.short	1                               // Loc expr size
	.byte	81                              // DW_OP_reg1
	.long	.Ltmp153-.Lfunc_begin0
	.long	.Ltmp180-.Lfunc_begin0
	.short	1                               // Loc expr size
	.byte	95                              // DW_OP_reg15
	.long	.Ltmp185-.Lfunc_begin0
	.long	.Ltmp186-.Lfunc_begin0
	.short	4                               // Loc expr size
	.byte	17                              // DW_OP_consts
	.byte	255                             // 127
	.byte	0                               // 
	.byte	159                             // DW_OP_stack_value
	.long	.Ltmp188-.Lfunc_begin0
	.long	.Ltmp254-.Lfunc_begin0
	.short	1                               // Loc expr size
	.byte	95                              // DW_OP_reg15
	.long	0
	.long	0
.Ldebug_loc8:
	.long	.Ltmp49-.Lfunc_begin0
	.long	.Ltmp60-.Lfunc_begin0
	.short	4                               // Loc expr size
	.byte	17                              // DW_OP_consts
	.byte	255                             // 127
	.byte	0                               // 
	.byte	159                             // DW_OP_stack_value
	.long	.Ltmp60-.Lfunc_begin0
	.long	.Ltmp70-.Lfunc_begin0
	.short	1                               // Loc expr size
	.byte	86                              // DW_OP_reg6
	.long	.Ltmp70-.Lfunc_begin0
	.long	.Ltmp72-.Lfunc_begin0
	.short	1                               // Loc expr size
	.byte	83                              // DW_OP_reg3
	.long	.Ltmp72-.Lfunc_begin0
	.long	.Ltmp73-.Lfunc_begin0
	.short	1                               // Loc expr size
	.byte	86                              // DW_OP_reg6
	.long	.Ltmp73-.Lfunc_begin0
	.long	.Ltmp81-.Lfunc_begin0
	.short	1                               // Loc expr size
	.byte	83                              // DW_OP_reg3
	.long	.Ltmp83-.Lfunc_begin0
	.long	.Ltmp85-.Lfunc_begin0
	.short	1                               // Loc expr size
	.byte	84                              // DW_OP_reg4
	.long	.Ltmp86-.Lfunc_begin0
	.long	.Ltmp94-.Lfunc_begin0
	.short	1                               // Loc expr size
	.byte	84                              // DW_OP_reg4
	.long	.Ltmp96-.Lfunc_begin0
	.long	.Ltmp98-.Lfunc_begin0
	.short	1                               // Loc expr size
	.byte	83                              // DW_OP_reg3
	.long	.Ltmp99-.Lfunc_begin0
	.long	.Ltmp107-.Lfunc_begin0
	.short	1                               // Loc expr size
	.byte	83                              // DW_OP_reg3
	.long	.Ltmp109-.Lfunc_begin0
	.long	.Ltmp111-.Lfunc_begin0
	.short	1                               // Loc expr size
	.byte	84                              // DW_OP_reg4
	.long	.Ltmp112-.Lfunc_begin0
	.long	.Ltmp120-.Lfunc_begin0
	.short	1                               // Loc expr size
	.byte	84                              // DW_OP_reg4
	.long	.Ltmp122-.Lfunc_begin0
	.long	.Ltmp124-.Lfunc_begin0
	.short	1                               // Loc expr size
	.byte	83                              // DW_OP_reg3
	.long	.Ltmp125-.Lfunc_begin0
	.long	.Ltmp135-.Lfunc_begin0
	.short	1                               // Loc expr size
	.byte	83                              // DW_OP_reg3
	.long	.Ltmp135-.Lfunc_begin0
	.long	.Ltmp149-.Lfunc_begin0
	.short	1                               // Loc expr size
	.byte	98                              // DW_OP_reg18
	.long	.Ltmp152-.Lfunc_begin0
	.long	.Ltmp153-.Lfunc_begin0
	.short	1                               // Loc expr size
	.byte	83                              // DW_OP_reg3
	.long	.Ltmp153-.Lfunc_begin0
	.long	.Ltmp161-.Lfunc_begin0
	.short	1                               // Loc expr size
	.byte	98                              // DW_OP_reg18
	.long	.Ltmp185-.Lfunc_begin0
	.long	.Ltmp188-.Lfunc_begin0
	.short	4                               // Loc expr size
	.byte	17                              // DW_OP_consts
	.byte	255                             // 127
	.byte	0                               // 
	.byte	159                             // DW_OP_stack_value
	.long	.Ltmp188-.Lfunc_begin0
	.long	.Ltmp199-.Lfunc_begin0
	.short	1                               // Loc expr size
	.byte	98                              // DW_OP_reg18
	.long	.Ltmp201-.Lfunc_begin0
	.long	.Ltmp212-.Lfunc_begin0
	.short	1                               // Loc expr size
	.byte	98                              // DW_OP_reg18
	.long	.Ltmp213-.Lfunc_begin0
	.long	.Ltmp224-.Lfunc_begin0
	.short	1                               // Loc expr size
	.byte	98                              // DW_OP_reg18
	.long	.Ltmp225-.Lfunc_begin0
	.long	.Ltmp234-.Lfunc_begin0
	.short	1                               // Loc expr size
	.byte	98                              // DW_OP_reg18
	.long	.Ltmp237-.Lfunc_begin0
	.long	.Ltmp249-.Lfunc_begin0
	.short	1                               // Loc expr size
	.byte	98                              // DW_OP_reg18
	.long	.Ltmp250-.Lfunc_begin0
	.long	.Ltmp255-.Lfunc_begin0
	.short	1                               // Loc expr size
	.byte	98                              // DW_OP_reg18
	.long	0
	.long	0
.Ldebug_loc9:
	.long	.Ltmp49-.Lfunc_begin0
	.long	.Ltmp60-.Lfunc_begin0
	.short	3                               // Loc expr size
	.byte	17                              // DW_OP_consts
	.byte	0                               // 0
	.byte	159                             // DW_OP_stack_value
	.long	.Ltmp70-.Lfunc_begin0
	.long	.Ltmp72-.Lfunc_begin0
	.short	1                               // Loc expr size
	.byte	99                              // DW_OP_reg19
	.long	.Ltmp73-.Lfunc_begin0
	.long	.Ltmp150-.Lfunc_begin0
	.short	1                               // Loc expr size
	.byte	99                              // DW_OP_reg19
	.long	.Ltmp152-.Lfunc_begin0
	.long	.Ltmp160-.Lfunc_begin0
	.short	1                               // Loc expr size
	.byte	99                              // DW_OP_reg19
	.long	.Ltmp185-.Lfunc_begin0
	.long	.Ltmp188-.Lfunc_begin0
	.short	3                               // Loc expr size
	.byte	17                              // DW_OP_consts
	.byte	0                               // 0
	.byte	159                             // DW_OP_stack_value
	.long	.Ltmp188-.Lfunc_begin0
	.long	.Ltmp253-.Lfunc_begin0
	.short	1                               // Loc expr size
	.byte	99                              // DW_OP_reg19
	.long	0
	.long	0
.Ldebug_loc10:
	.long	.Ltmp49-.Lfunc_begin0
	.long	.Ltmp52-.Lfunc_begin0
	.short	3                               // Loc expr size
	.byte	17                              // DW_OP_consts
	.byte	1                               // 1
	.byte	159                             // DW_OP_stack_value
	.long	.Ltmp52-.Lfunc_begin0
	.long	.Ltmp55-.Lfunc_begin0
	.short	1                               // Loc expr size
	.byte	97                              // DW_OP_reg17
	.long	.Ltmp58-.Lfunc_begin0
	.long	.Ltmp63-.Lfunc_begin0
	.short	1                               // Loc expr size
	.byte	97                              // DW_OP_reg17
	.long	.Ltmp66-.Lfunc_begin0
	.long	.Ltmp76-.Lfunc_begin0
	.short	1                               // Loc expr size
	.byte	97                              // DW_OP_reg17
	.long	.Ltmp78-.Lfunc_begin0
	.long	.Ltmp89-.Lfunc_begin0
	.short	1                               // Loc expr size
	.byte	97                              // DW_OP_reg17
	.long	.Ltmp91-.Lfunc_begin0
	.long	.Ltmp102-.Lfunc_begin0
	.short	1                               // Loc expr size
	.byte	97                              // DW_OP_reg17
	.long	.Ltmp104-.Lfunc_begin0
	.long	.Ltmp115-.Lfunc_begin0
	.short	1                               // Loc expr size
	.byte	97                              // DW_OP_reg17
	.long	.Ltmp117-.Lfunc_begin0
	.long	.Ltmp128-.Lfunc_begin0
	.short	1                               // Loc expr size
	.byte	97                              // DW_OP_reg17
	.long	.Ltmp130-.Lfunc_begin0
	.long	.Ltmp140-.Lfunc_begin0
	.short	1                               // Loc expr size
	.byte	97                              // DW_OP_reg17
	.long	.Ltmp152-.Lfunc_begin0
	.long	.Ltmp164-.Lfunc_begin0
	.short	1                               // Loc expr size
	.byte	97                              // DW_OP_reg17
	.long	.Ltmp185-.Lfunc_begin0
	.long	.Ltmp186-.Lfunc_begin0
	.short	3                               // Loc expr size
	.byte	17                              // DW_OP_consts
	.byte	1                               // 1
	.byte	159                             // DW_OP_stack_value
	.long	.Ltmp186-.Lfunc_begin0
	.long	.Ltmp188-.Lfunc_begin0
	.short	1                               // Loc expr size
	.byte	97                              // DW_OP_reg17
	.long	0
	.long	0
.Ldebug_loc11:
	.long	.Ltmp57-.Lfunc_begin0
	.long	.Ltmp61-.Lfunc_begin0
	.short	1                               // Loc expr size
	.byte	81                              // DW_OP_reg1
	.long	.Ltmp65-.Lfunc_begin0
	.long	.Ltmp66-.Lfunc_begin0
	.short	1                               // Loc expr size
	.byte	81                              // DW_OP_reg1
	.long	.Ltmp77-.Lfunc_begin0
	.long	.Ltmp78-.Lfunc_begin0
	.short	1                               // Loc expr size
	.byte	82                              // DW_OP_reg2
	.long	.Ltmp90-.Lfunc_begin0
	.long	.Ltmp91-.Lfunc_begin0
	.short	1                               // Loc expr size
	.byte	81                              // DW_OP_reg1
	.long	.Ltmp103-.Lfunc_begin0
	.long	.Ltmp104-.Lfunc_begin0
	.short	1                               // Loc expr size
	.byte	82                              // DW_OP_reg2
	.long	.Ltmp116-.Lfunc_begin0
	.long	.Ltmp117-.Lfunc_begin0
	.short	1                               // Loc expr size
	.byte	81                              // DW_OP_reg1
	.long	.Ltmp129-.Lfunc_begin0
	.long	.Ltmp133-.Lfunc_begin0
	.short	1                               // Loc expr size
	.byte	82                              // DW_OP_reg2
	.long	0
	.long	0
.Ldebug_loc12:
	.long	.Ltmp50-.Lfunc_begin0
	.long	.Ltmp53-.Lfunc_begin0
	.short	5                               // Loc expr size
	.byte	112                             // DW_OP_breg0
	.byte	0                               // 0
	.byte	55                              // DW_OP_lit7
	.byte	38                              // DW_OP_shra
	.byte	159                             // DW_OP_stack_value
	.long	.Ltmp53-.Lfunc_begin0
	.long	.Ltmp61-.Lfunc_begin0
	.short	5                               // Loc expr size
	.byte	133                             // DW_OP_breg21
	.byte	0                               // 0
	.byte	55                              // DW_OP_lit7
	.byte	38                              // DW_OP_shra
	.byte	159                             // DW_OP_stack_value
	.long	.Ltmp61-.Lfunc_begin0
	.long	.Ltmp64-.Lfunc_begin0
	.short	5                               // Loc expr size
	.byte	115                             // DW_OP_breg3
	.byte	0                               // 0
	.byte	55                              // DW_OP_lit7
	.byte	38                              // DW_OP_shra
	.byte	159                             // DW_OP_stack_value
	.long	.Ltmp71-.Lfunc_begin0
	.long	.Ltmp72-.Lfunc_begin0
	.short	5                               // Loc expr size
	.byte	117                             // DW_OP_breg5
	.byte	0                               // 0
	.byte	55                              // DW_OP_lit7
	.byte	38                              // DW_OP_shra
	.byte	159                             // DW_OP_stack_value
	.long	.Ltmp74-.Lfunc_begin0
	.long	.Ltmp84-.Lfunc_begin0
	.short	5                               // Loc expr size
	.byte	117                             // DW_OP_breg5
	.byte	0                               // 0
	.byte	55                              // DW_OP_lit7
	.byte	38                              // DW_OP_shra
	.byte	159                             // DW_OP_stack_value
	.long	.Ltmp84-.Lfunc_begin0
	.long	.Ltmp85-.Lfunc_begin0
	.short	5                               // Loc expr size
	.byte	120                             // DW_OP_breg8
	.byte	0                               // 0
	.byte	55                              // DW_OP_lit7
	.byte	38                              // DW_OP_shra
	.byte	159                             // DW_OP_stack_value
	.long	.Ltmp85-.Lfunc_begin0
	.long	.Ltmp87-.Lfunc_begin0
	.short	5                               // Loc expr size
	.byte	117                             // DW_OP_breg5
	.byte	0                               // 0
	.byte	55                              // DW_OP_lit7
	.byte	38                              // DW_OP_shra
	.byte	159                             // DW_OP_stack_value
	.long	.Ltmp87-.Lfunc_begin0
	.long	.Ltmp97-.Lfunc_begin0
	.short	5                               // Loc expr size
	.byte	120                             // DW_OP_breg8
	.byte	0                               // 0
	.byte	55                              // DW_OP_lit7
	.byte	38                              // DW_OP_shra
	.byte	159                             // DW_OP_stack_value
	.long	.Ltmp97-.Lfunc_begin0
	.long	.Ltmp98-.Lfunc_begin0
	.short	5                               // Loc expr size
	.byte	118                             // DW_OP_breg6
	.byte	0                               // 0
	.byte	55                              // DW_OP_lit7
	.byte	38                              // DW_OP_shra
	.byte	159                             // DW_OP_stack_value
	.long	.Ltmp98-.Lfunc_begin0
	.long	.Ltmp100-.Lfunc_begin0
	.short	5                               // Loc expr size
	.byte	120                             // DW_OP_breg8
	.byte	0                               // 0
	.byte	55                              // DW_OP_lit7
	.byte	38                              // DW_OP_shra
	.byte	159                             // DW_OP_stack_value
	.long	.Ltmp100-.Lfunc_begin0
	.long	.Ltmp110-.Lfunc_begin0
	.short	5                               // Loc expr size
	.byte	118                             // DW_OP_breg6
	.byte	0                               // 0
	.byte	55                              // DW_OP_lit7
	.byte	38                              // DW_OP_shra
	.byte	159                             // DW_OP_stack_value
	.long	.Ltmp110-.Lfunc_begin0
	.long	.Ltmp111-.Lfunc_begin0
	.short	5                               // Loc expr size
	.byte	117                             // DW_OP_breg5
	.byte	0                               // 0
	.byte	55                              // DW_OP_lit7
	.byte	38                              // DW_OP_shra
	.byte	159                             // DW_OP_stack_value
	.long	.Ltmp111-.Lfunc_begin0
	.long	.Ltmp113-.Lfunc_begin0
	.short	5                               // Loc expr size
	.byte	118                             // DW_OP_breg6
	.byte	0                               // 0
	.byte	55                              // DW_OP_lit7
	.byte	38                              // DW_OP_shra
	.byte	159                             // DW_OP_stack_value
	.long	.Ltmp113-.Lfunc_begin0
	.long	.Ltmp123-.Lfunc_begin0
	.short	5                               // Loc expr size
	.byte	117                             // DW_OP_breg5
	.byte	0                               // 0
	.byte	55                              // DW_OP_lit7
	.byte	38                              // DW_OP_shra
	.byte	159                             // DW_OP_stack_value
	.long	.Ltmp123-.Lfunc_begin0
	.long	.Ltmp124-.Lfunc_begin0
	.short	5                               // Loc expr size
	.byte	126                             // DW_OP_breg14
	.byte	0                               // 0
	.byte	55                              // DW_OP_lit7
	.byte	38                              // DW_OP_shra
	.byte	159                             // DW_OP_stack_value
	.long	.Ltmp124-.Lfunc_begin0
	.long	.Ltmp126-.Lfunc_begin0
	.short	5                               // Loc expr size
	.byte	117                             // DW_OP_breg5
	.byte	0                               // 0
	.byte	55                              // DW_OP_lit7
	.byte	38                              // DW_OP_shra
	.byte	159                             // DW_OP_stack_value
	.long	.Ltmp126-.Lfunc_begin0
	.long	.Ltmp138-.Lfunc_begin0
	.short	5                               // Loc expr size
	.byte	126                             // DW_OP_breg14
	.byte	0                               // 0
	.byte	55                              // DW_OP_lit7
	.byte	38                              // DW_OP_shra
	.byte	159                             // DW_OP_stack_value
	.long	.Ltmp152-.Lfunc_begin0
	.long	.Ltmp168-.Lfunc_begin0
	.short	5                               // Loc expr size
	.byte	126                             // DW_OP_breg14
	.byte	0                               // 0
	.byte	55                              // DW_OP_lit7
	.byte	38                              // DW_OP_shra
	.byte	159                             // DW_OP_stack_value
	.long	.Ltmp185-.Lfunc_begin0
	.long	.Ltmp187-.Lfunc_begin0
	.short	5                               // Loc expr size
	.byte	112                             // DW_OP_breg0
	.byte	0                               // 0
	.byte	55                              // DW_OP_lit7
	.byte	38                              // DW_OP_shra
	.byte	159                             // DW_OP_stack_value
	.long	.Ltmp187-.Lfunc_begin0
	.long	.Ltmp188-.Lfunc_begin0
	.short	5                               // Loc expr size
	.byte	133                             // DW_OP_breg21
	.byte	0                               // 0
	.byte	55                              // DW_OP_lit7
	.byte	38                              // DW_OP_shra
	.byte	159                             // DW_OP_stack_value
	.long	0
	.long	0
.Ldebug_loc13:
	.long	.Ltmp258-.Lfunc_begin0
	.long	.Ltmp259-.Lfunc_begin0
	.short	2                               // Loc expr size
	.byte	134                             // DW_OP_breg22
	.byte	80                              // -48
	.long	.Ltmp259-.Lfunc_begin0
	.long	.Ltmp272-.Lfunc_begin0
	.short	1                               // Loc expr size
	.byte	82                              // DW_OP_reg2
	.long	0
	.long	0
.Ldebug_loc14:
	.long	.Ltmp259-.Lfunc_begin0
	.long	.Ltmp262-.Lfunc_begin0
	.short	3                               // Loc expr size
	.byte	17                              // DW_OP_consts
	.byte	0                               // 0
	.byte	159                             // DW_OP_stack_value
	.long	.Ltmp262-.Lfunc_begin0
	.long	.Ltmp267-.Lfunc_begin0
	.short	14                              // Loc expr size
	.byte	116                             // DW_OP_breg4
	.byte	0                               // 0
	.byte	18                              // DW_OP_dup
	.byte	16                              // DW_OP_constu
	.byte	7                               // 7
	.byte	37                              // DW_OP_shr
	.byte	48                              // DW_OP_lit0
	.byte	32                              // DW_OP_not
	.byte	30                              // DW_OP_mul
	.byte	16                              // DW_OP_constu
	.byte	8                               // 8
	.byte	36                              // DW_OP_shl
	.byte	33                              // DW_OP_or
	.byte	159                             // DW_OP_stack_value
	.long	0
	.long	0
.Ldebug_loc15:
	.long	.Ltmp273-.Lfunc_begin0
	.long	.Ltmp274-.Lfunc_begin0
	.short	1                               // Loc expr size
	.byte	98                              // DW_OP_reg18
	.long	.Ltmp274-.Lfunc_begin0
	.long	.Ltmp284-.Lfunc_begin0
	.short	1                               // Loc expr size
	.byte	80                              // DW_OP_reg0
	.long	0
	.long	0
.Ldebug_loc16:
	.long	.Ltmp274-.Lfunc_begin0
	.long	.Ltmp278-.Lfunc_begin0
	.short	3                               // Loc expr size
	.byte	17                              // DW_OP_consts
	.byte	0                               // 0
	.byte	159                             // DW_OP_stack_value
	.long	.Ltmp278-.Lfunc_begin0
	.long	.Ltmp279-.Lfunc_begin0
	.short	14                              // Loc expr size
	.byte	116                             // DW_OP_breg4
	.byte	0                               // 0
	.byte	18                              // DW_OP_dup
	.byte	16                              // DW_OP_constu
	.byte	7                               // 7
	.byte	37                              // DW_OP_shr
	.byte	48                              // DW_OP_lit0
	.byte	32                              // DW_OP_not
	.byte	30                              // DW_OP_mul
	.byte	16                              // DW_OP_constu
	.byte	8                               // 8
	.byte	36                              // DW_OP_shl
	.byte	33                              // DW_OP_or
	.byte	159                             // DW_OP_stack_value
	.long	0
	.long	0
.Ldebug_loc17:
	.long	.Ltmp286-.Lfunc_begin0
	.long	.Ltmp287-.Lfunc_begin0
	.short	2                               // Loc expr size
	.byte	134                             // DW_OP_breg22
	.byte	80                              // -48
	.long	.Ltmp287-.Lfunc_begin0
	.long	.Ltmp300-.Lfunc_begin0
	.short	1                               // Loc expr size
	.byte	80                              // DW_OP_reg0
	.long	0
	.long	0
.Ldebug_loc18:
	.long	.Ltmp301-.Lfunc_begin0
	.long	.Ltmp302-.Lfunc_begin0
	.short	1                               // Loc expr size
	.byte	98                              // DW_OP_reg18
	.long	.Ltmp302-.Lfunc_begin0
	.long	.Ltmp311-.Lfunc_begin0
	.short	1                               // Loc expr size
	.byte	80                              // DW_OP_reg0
	.long	0
	.long	0
.Ldebug_loc19:
	.long	.Ltmp313-.Lfunc_begin0
	.long	.Ltmp318-.Lfunc_begin0
	.short	1                               // Loc expr size
	.byte	80                              // DW_OP_reg0
	.long	.Ltmp318-.Lfunc_begin0
	.long	.Ltmp323-.Lfunc_begin0
	.short	1                               // Loc expr size
	.byte	81                              // DW_OP_reg1
	.long	.Ltmp323-.Lfunc_begin0
	.long	.Ltmp325-.Lfunc_begin0
	.short	1                               // Loc expr size
	.byte	83                              // DW_OP_reg3
	.long	.Ltmp325-.Lfunc_begin0
	.long	.Ltmp330-.Lfunc_begin0
	.short	1                               // Loc expr size
	.byte	85                              // DW_OP_reg5
	.long	.Ltmp330-.Lfunc_begin0
	.long	.Ltmp332-.Lfunc_begin0
	.short	1                               // Loc expr size
	.byte	82                              // DW_OP_reg2
	.long	.Ltmp332-.Lfunc_begin0
	.long	.Ltmp337-.Lfunc_begin0
	.short	1                               // Loc expr size
	.byte	84                              // DW_OP_reg4
	.long	.Ltmp337-.Lfunc_begin0
	.long	.Ltmp339-.Lfunc_begin0
	.short	1                               // Loc expr size
	.byte	82                              // DW_OP_reg2
	.long	.Ltmp339-.Lfunc_begin0
	.long	.Ltmp344-.Lfunc_begin0
	.short	1                               // Loc expr size
	.byte	80                              // DW_OP_reg0
	.long	0
	.long	0
	.section	.debug_abbrev,"",@progbits
	.byte	1                               // Abbreviation Code
	.byte	17                              // DW_TAG_compile_unit
	.byte	1                               // DW_CHILDREN_yes
	.byte	37                              // DW_AT_producer
	.byte	14                              // DW_FORM_strp
	.byte	19                              // DW_AT_language
	.byte	5                               // DW_FORM_data2
	.byte	3                               // DW_AT_name
	.byte	14                              // DW_FORM_strp
	.byte	16                              // DW_AT_stmt_list
	.byte	23                              // DW_FORM_sec_offset
	.byte	27                              // DW_AT_comp_dir
	.byte	14                              // DW_FORM_strp
	.byte	17                              // DW_AT_low_pc
	.byte	1                               // DW_FORM_addr
	.byte	18                              // DW_AT_high_pc
	.byte	6                               // DW_FORM_data4
	.byte	0                               // EOM(1)
	.byte	0                               // EOM(2)
	.byte	2                               // Abbreviation Code
	.byte	52                              // DW_TAG_variable
	.byte	0                               // DW_CHILDREN_no
	.byte	3                               // DW_AT_name
	.byte	14                              // DW_FORM_strp
	.byte	73                              // DW_AT_type
	.byte	19                              // DW_FORM_ref4
	.byte	63                              // DW_AT_external
	.byte	25                              // DW_FORM_flag_present
	.byte	58                              // DW_AT_decl_file
	.byte	11                              // DW_FORM_data1
	.byte	59                              // DW_AT_decl_line
	.byte	11                              // DW_FORM_data1
	.ascii	"\210\001"                      // DW_AT_alignment
	.byte	15                              // DW_FORM_udata
	.byte	2                               // DW_AT_location
	.byte	24                              // DW_FORM_exprloc
	.byte	0                               // EOM(1)
	.byte	0                               // EOM(2)
	.byte	3                               // Abbreviation Code
	.byte	1                               // DW_TAG_array_type
	.byte	1                               // DW_CHILDREN_yes
	.byte	73                              // DW_AT_type
	.byte	19                              // DW_FORM_ref4
	.byte	0                               // EOM(1)
	.byte	0                               // EOM(2)
	.byte	4                               // Abbreviation Code
	.byte	33                              // DW_TAG_subrange_type
	.byte	0                               // DW_CHILDREN_no
	.byte	73                              // DW_AT_type
	.byte	19                              // DW_FORM_ref4
	.byte	55                              // DW_AT_count
	.byte	5                               // DW_FORM_data2
	.byte	0                               // EOM(1)
	.byte	0                               // EOM(2)
	.byte	5                               // Abbreviation Code
	.byte	36                              // DW_TAG_base_type
	.byte	0                               // DW_CHILDREN_no
	.byte	3                               // DW_AT_name
	.byte	14                              // DW_FORM_strp
	.byte	62                              // DW_AT_encoding
	.byte	11                              // DW_FORM_data1
	.byte	11                              // DW_AT_byte_size
	.byte	11                              // DW_FORM_data1
	.byte	0                               // EOM(1)
	.byte	0                               // EOM(2)
	.byte	6                               // Abbreviation Code
	.byte	36                              // DW_TAG_base_type
	.byte	0                               // DW_CHILDREN_no
	.byte	3                               // DW_AT_name
	.byte	14                              // DW_FORM_strp
	.byte	11                              // DW_AT_byte_size
	.byte	11                              // DW_FORM_data1
	.byte	62                              // DW_AT_encoding
	.byte	11                              // DW_FORM_data1
	.byte	0                               // EOM(1)
	.byte	0                               // EOM(2)
	.byte	7                               // Abbreviation Code
	.byte	52                              // DW_TAG_variable
	.byte	0                               // DW_CHILDREN_no
	.byte	3                               // DW_AT_name
	.byte	14                              // DW_FORM_strp
	.byte	73                              // DW_AT_type
	.byte	19                              // DW_FORM_ref4
	.byte	63                              // DW_AT_external
	.byte	25                              // DW_FORM_flag_present
	.byte	58                              // DW_AT_decl_file
	.byte	11                              // DW_FORM_data1
	.byte	59                              // DW_AT_decl_line
	.byte	11                              // DW_FORM_data1
	.byte	2                               // DW_AT_location
	.byte	24                              // DW_FORM_exprloc
	.byte	0                               // EOM(1)
	.byte	0                               // EOM(2)
	.byte	8                               // Abbreviation Code
	.byte	22                              // DW_TAG_typedef
	.byte	0                               // DW_CHILDREN_no
	.byte	73                              // DW_AT_type
	.byte	19                              // DW_FORM_ref4
	.byte	3                               // DW_AT_name
	.byte	14                              // DW_FORM_strp
	.byte	58                              // DW_AT_decl_file
	.byte	11                              // DW_FORM_data1
	.byte	59                              // DW_AT_decl_line
	.byte	11                              // DW_FORM_data1
	.byte	0                               // EOM(1)
	.byte	0                               // EOM(2)
	.byte	9                               // Abbreviation Code
	.byte	33                              // DW_TAG_subrange_type
	.byte	0                               // DW_CHILDREN_no
	.byte	73                              // DW_AT_type
	.byte	19                              // DW_FORM_ref4
	.byte	55                              // DW_AT_count
	.byte	11                              // DW_FORM_data1
	.byte	0                               // EOM(1)
	.byte	0                               // EOM(2)
	.byte	10                              // Abbreviation Code
	.byte	4                               // DW_TAG_enumeration_type
	.byte	1                               // DW_CHILDREN_yes
	.byte	73                              // DW_AT_type
	.byte	19                              // DW_FORM_ref4
	.byte	3                               // DW_AT_name
	.byte	14                              // DW_FORM_strp
	.byte	11                              // DW_AT_byte_size
	.byte	11                              // DW_FORM_data1
	.byte	58                              // DW_AT_decl_file
	.byte	11                              // DW_FORM_data1
	.byte	59                              // DW_AT_decl_line
	.byte	11                              // DW_FORM_data1
	.byte	0                               // EOM(1)
	.byte	0                               // EOM(2)
	.byte	11                              // Abbreviation Code
	.byte	40                              // DW_TAG_enumerator
	.byte	0                               // DW_CHILDREN_no
	.byte	3                               // DW_AT_name
	.byte	14                              // DW_FORM_strp
	.byte	28                              // DW_AT_const_value
	.byte	15                              // DW_FORM_udata
	.byte	0                               // EOM(1)
	.byte	0                               // EOM(2)
	.byte	12                              // Abbreviation Code
	.byte	46                              // DW_TAG_subprogram
	.byte	0                               // DW_CHILDREN_no
	.byte	3                               // DW_AT_name
	.byte	14                              // DW_FORM_strp
	.byte	58                              // DW_AT_decl_file
	.byte	11                              // DW_FORM_data1
	.byte	59                              // DW_AT_decl_line
	.byte	11                              // DW_FORM_data1
	.byte	73                              // DW_AT_type
	.byte	19                              // DW_FORM_ref4
	.byte	32                              // DW_AT_inline
	.byte	11                              // DW_FORM_data1
	.byte	0                               // EOM(1)
	.byte	0                               // EOM(2)
	.byte	13                              // Abbreviation Code
	.byte	46                              // DW_TAG_subprogram
	.byte	1                               // DW_CHILDREN_yes
	.byte	17                              // DW_AT_low_pc
	.byte	1                               // DW_FORM_addr
	.byte	18                              // DW_AT_high_pc
	.byte	6                               // DW_FORM_data4
	.byte	64                              // DW_AT_frame_base
	.byte	24                              // DW_FORM_exprloc
	.ascii	"\227B"                         // DW_AT_GNU_all_call_sites
	.byte	25                              // DW_FORM_flag_present
	.byte	3                               // DW_AT_name
	.byte	14                              // DW_FORM_strp
	.byte	58                              // DW_AT_decl_file
	.byte	11                              // DW_FORM_data1
	.byte	59                              // DW_AT_decl_line
	.byte	11                              // DW_FORM_data1
	.byte	73                              // DW_AT_type
	.byte	19                              // DW_FORM_ref4
	.byte	63                              // DW_AT_external
	.byte	25                              // DW_FORM_flag_present
	.byte	0                               // EOM(1)
	.byte	0                               // EOM(2)
	.byte	14                              // Abbreviation Code
	.byte	52                              // DW_TAG_variable
	.byte	0                               // DW_CHILDREN_no
	.byte	2                               // DW_AT_location
	.byte	23                              // DW_FORM_sec_offset
	.byte	3                               // DW_AT_name
	.byte	14                              // DW_FORM_strp
	.byte	58                              // DW_AT_decl_file
	.byte	11                              // DW_FORM_data1
	.byte	59                              // DW_AT_decl_line
	.byte	11                              // DW_FORM_data1
	.byte	73                              // DW_AT_type
	.byte	19                              // DW_FORM_ref4
	.byte	0                               // EOM(1)
	.byte	0                               // EOM(2)
	.byte	15                              // Abbreviation Code
	.byte	29                              // DW_TAG_inlined_subroutine
	.byte	0                               // DW_CHILDREN_no
	.byte	49                              // DW_AT_abstract_origin
	.byte	19                              // DW_FORM_ref4
	.byte	17                              // DW_AT_low_pc
	.byte	1                               // DW_FORM_addr
	.byte	18                              // DW_AT_high_pc
	.byte	6                               // DW_FORM_data4
	.byte	88                              // DW_AT_call_file
	.byte	11                              // DW_FORM_data1
	.byte	89                              // DW_AT_call_line
	.byte	11                              // DW_FORM_data1
	.byte	87                              // DW_AT_call_column
	.byte	11                              // DW_FORM_data1
	.byte	0                               // EOM(1)
	.byte	0                               // EOM(2)
	.byte	16                              // Abbreviation Code
	.byte	11                              // DW_TAG_lexical_block
	.byte	1                               // DW_CHILDREN_yes
	.byte	85                              // DW_AT_ranges
	.byte	23                              // DW_FORM_sec_offset
	.byte	0                               // EOM(1)
	.byte	0                               // EOM(2)
	.byte	17                              // Abbreviation Code
	.byte	11                              // DW_TAG_lexical_block
	.byte	1                               // DW_CHILDREN_yes
	.byte	17                              // DW_AT_low_pc
	.byte	1                               // DW_FORM_addr
	.byte	18                              // DW_AT_high_pc
	.byte	6                               // DW_FORM_data4
	.byte	0                               // EOM(1)
	.byte	0                               // EOM(2)
	.byte	18                              // Abbreviation Code
	.byte	52                              // DW_TAG_variable
	.byte	0                               // DW_CHILDREN_no
	.byte	2                               // DW_AT_location
	.byte	23                              // DW_FORM_sec_offset
	.byte	3                               // DW_AT_name
	.byte	14                              // DW_FORM_strp
	.byte	58                              // DW_AT_decl_file
	.byte	11                              // DW_FORM_data1
	.byte	59                              // DW_AT_decl_line
	.byte	5                               // DW_FORM_data2
	.byte	73                              // DW_AT_type
	.byte	19                              // DW_FORM_ref4
	.byte	0                               // EOM(1)
	.byte	0                               // EOM(2)
	.byte	19                              // Abbreviation Code
	.ascii	"\211\202\001"                  // DW_TAG_GNU_call_site
	.byte	0                               // DW_CHILDREN_no
	.ascii	"\223B"                         // DW_AT_GNU_call_site_target
	.byte	24                              // DW_FORM_exprloc
	.byte	17                              // DW_AT_low_pc
	.byte	1                               // DW_FORM_addr
	.byte	0                               // EOM(1)
	.byte	0                               // EOM(2)
	.byte	0                               // EOM(3)
	.section	.debug_info,"",@progbits
.Lcu_begin0:
	.long	.Ldebug_info_end0-.Ldebug_info_start0 // Length of Unit
.Ldebug_info_start0:
	.short	4                               // DWARF version number
	.long	.debug_abbrev                   // Offset Into Abbrev. Section
	.byte	4                               // Address Size (in bytes)
	.byte	1                               // Abbrev [1] 0xb:0x371 DW_TAG_compile_unit
	.long	.Linfo_string0                  // DW_AT_producer
	.short	12                              // DW_AT_language
	.long	.Linfo_string1                  // DW_AT_name
	.long	.Lline_table_start0             // DW_AT_stmt_list
	.long	.Linfo_string2                  // DW_AT_comp_dir
	.long	.Lfunc_begin0                   // DW_AT_low_pc
	.long	.Lfunc_end0-.Lfunc_begin0       // DW_AT_high_pc
	.byte	2                               // Abbrev [2] 0x26:0x12 DW_TAG_variable
	.long	.Linfo_string3                  // DW_AT_name
	.long	56                              // DW_AT_type
                                        // DW_AT_external
	.byte	1                               // DW_AT_decl_file
	.byte	21                              // DW_AT_decl_line
	.byte	8                               // DW_AT_alignment
	.byte	5                               // DW_AT_location
	.byte	3
	.long	LUT_VN
	.byte	3                               // Abbrev [3] 0x38:0xd DW_TAG_array_type
	.long	69                              // DW_AT_type
	.byte	4                               // Abbrev [4] 0x3d:0x7 DW_TAG_subrange_type
	.long	76                              // DW_AT_type
	.short	512                             // DW_AT_count
	.byte	0                               // End Of Children Mark
	.byte	5                               // Abbrev [5] 0x45:0x7 DW_TAG_base_type
	.long	.Linfo_string4                  // DW_AT_name
	.byte	5                               // DW_AT_encoding
	.byte	2                               // DW_AT_byte_size
	.byte	6                               // Abbrev [6] 0x4c:0x7 DW_TAG_base_type
	.long	.Linfo_string5                  // DW_AT_name
	.byte	8                               // DW_AT_byte_size
	.byte	7                               // DW_AT_encoding
	.byte	7                               // Abbrev [7] 0x53:0x11 DW_TAG_variable
	.long	.Linfo_string6                  // DW_AT_name
	.long	100                             // DW_AT_type
                                        // DW_AT_external
	.byte	1                               // DW_AT_decl_file
	.byte	19                              // DW_AT_decl_line
	.byte	5                               // DW_AT_location
	.byte	3
	.long	__atomic_bit_barrier_my_barrier
	.byte	8                               // Abbrev [8] 0x64:0xb DW_TAG_typedef
	.long	111                             // DW_AT_type
	.long	.Linfo_string8                  // DW_AT_name
	.byte	2                               // DW_AT_decl_file
	.byte	40                              // DW_AT_decl_line
	.byte	5                               // Abbrev [5] 0x6f:0x7 DW_TAG_base_type
	.long	.Linfo_string7                  // DW_AT_name
	.byte	8                               // DW_AT_encoding
	.byte	1                               // DW_AT_byte_size
	.byte	2                               // Abbrev [2] 0x76:0x12 DW_TAG_variable
	.long	.Linfo_string9                  // DW_AT_name
	.long	136                             // DW_AT_type
                                        // DW_AT_external
	.byte	1                               // DW_AT_decl_file
	.byte	24                              // DW_AT_decl_line
	.byte	8                               // DW_AT_alignment
	.byte	5                               // DW_AT_location
	.byte	3
	.long	L
	.byte	3                               // Abbrev [3] 0x88:0xc DW_TAG_array_type
	.long	148                             // DW_AT_type
	.byte	9                               // Abbrev [9] 0x8d:0x6 DW_TAG_subrange_type
	.long	76                              // DW_AT_type
	.byte	128                             // DW_AT_count
	.byte	0                               // End Of Children Mark
	.byte	5                               // Abbrev [5] 0x94:0x7 DW_TAG_base_type
	.long	.Linfo_string10                 // DW_AT_name
	.byte	6                               // DW_AT_encoding
	.byte	1                               // DW_AT_byte_size
	.byte	2                               // Abbrev [2] 0x9b:0x12 DW_TAG_variable
	.long	.Linfo_string11                 // DW_AT_name
	.long	173                             // DW_AT_type
                                        // DW_AT_external
	.byte	1                               // DW_AT_decl_file
	.byte	25                              // DW_AT_decl_line
	.byte	8                               // DW_AT_alignment
	.byte	5                               // DW_AT_location
	.byte	3
	.long	Rcv
	.byte	3                               // Abbrev [3] 0xad:0xd DW_TAG_array_type
	.long	148                             // DW_AT_type
	.byte	4                               // Abbrev [4] 0xb2:0x7 DW_TAG_subrange_type
	.long	76                              // DW_AT_type
	.short	512                             // DW_AT_count
	.byte	0                               // End Of Children Mark
	.byte	2                               // Abbrev [2] 0xba:0x12 DW_TAG_variable
	.long	.Linfo_string12                 // DW_AT_name
	.long	204                             // DW_AT_type
                                        // DW_AT_external
	.byte	1                               // DW_AT_decl_file
	.byte	26                              // DW_AT_decl_line
	.byte	8                               // DW_AT_alignment
	.byte	5                               // DW_AT_location
	.byte	3
	.long	nb_cycles
	.byte	8                               // Abbrev [8] 0xcc:0xb DW_TAG_typedef
	.long	215                             // DW_AT_type
	.long	.Linfo_string14                 // DW_AT_name
	.byte	2                               // DW_AT_decl_file
	.byte	48                              // DW_AT_decl_line
	.byte	5                               // Abbrev [5] 0xd7:0x7 DW_TAG_base_type
	.long	.Linfo_string13                 // DW_AT_name
	.byte	7                               // DW_AT_encoding
	.byte	4                               // DW_AT_byte_size
	.byte	2                               // Abbrev [2] 0xde:0x12 DW_TAG_variable
	.long	.Linfo_string15                 // DW_AT_name
	.long	136                             // DW_AT_type
                                        // DW_AT_external
	.byte	1                               // DW_AT_decl_file
	.byte	27                              // DW_AT_decl_line
	.byte	8                               // DW_AT_alignment
	.byte	5                               // DW_AT_location
	.byte	3
	.long	decoded_word
	.byte	2                               // Abbrev [2] 0xf0:0x12 DW_TAG_variable
	.long	.Linfo_string16                 // DW_AT_name
	.long	258                             // DW_AT_type
                                        // DW_AT_external
	.byte	1                               // DW_AT_decl_file
	.byte	28                              // DW_AT_decl_line
	.byte	8                               // DW_AT_alignment
	.byte	5                               // DW_AT_location
	.byte	3
	.long	valid_decoded_word
	.byte	3                               // Abbrev [3] 0x102:0xc DW_TAG_array_type
	.long	148                             // DW_AT_type
	.byte	9                               // Abbrev [9] 0x107:0x6 DW_TAG_subrange_type
	.long	76                              // DW_AT_type
	.byte	8                               // DW_AT_count
	.byte	0                               // End Of Children Mark
	.byte	10                              // Abbrev [10] 0x10e:0x25 DW_TAG_enumeration_type
	.long	215                             // DW_AT_type
	.long	.Linfo_string21                 // DW_AT_name
	.byte	4                               // DW_AT_byte_size
	.byte	3                               // DW_AT_decl_file
	.byte	33                              // DW_AT_decl_line
	.byte	11                              // Abbrev [11] 0x11a:0x6 DW_TAG_enumerator
	.long	.Linfo_string17                 // DW_AT_name
	.byte	0                               // DW_AT_const_value
	.byte	11                              // Abbrev [11] 0x120:0x6 DW_TAG_enumerator
	.long	.Linfo_string18                 // DW_AT_name
	.byte	1                               // DW_AT_const_value
	.byte	11                              // Abbrev [11] 0x126:0x6 DW_TAG_enumerator
	.long	.Linfo_string19                 // DW_AT_name
	.byte	2                               // DW_AT_const_value
	.byte	11                              // Abbrev [11] 0x12c:0x6 DW_TAG_enumerator
	.long	.Linfo_string20                 // DW_AT_name
	.byte	3                               // DW_AT_const_value
	.byte	0                               // End Of Children Mark
	.byte	12                              // Abbrev [12] 0x133:0xc DW_TAG_subprogram
	.long	.Linfo_string22                 // DW_AT_name
	.byte	4                               // DW_AT_decl_file
	.byte	33                              // DW_AT_decl_line
	.long	319                             // DW_AT_type
	.byte	1                               // DW_AT_inline
	.byte	8                               // Abbrev [8] 0x13f:0xb DW_TAG_typedef
	.long	215                             // DW_AT_type
	.long	.Linfo_string23                 // DW_AT_name
	.byte	5                               // DW_AT_decl_file
	.byte	27                              // DW_AT_decl_line
	.byte	13                              // Abbrev [13] 0x14a:0x22a DW_TAG_subprogram
	.long	.Lfunc_begin0                   // DW_AT_low_pc
	.long	.Lfunc_end0-.Lfunc_begin0       // DW_AT_high_pc
	.byte	1                               // DW_AT_frame_base
	.byte	102
                                        // DW_AT_GNU_all_call_sites
	.long	.Linfo_string24                 // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.byte	34                              // DW_AT_decl_line
	.long	884                             // DW_AT_type
                                        // DW_AT_external
	.byte	14                              // Abbrev [14] 0x15f:0xf DW_TAG_variable
	.long	.Ldebug_loc0                    // DW_AT_location
	.long	.Linfo_string26                 // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.byte	40                              // DW_AT_decl_line
	.long	148                             // DW_AT_type
	.byte	14                              // Abbrev [14] 0x16e:0xf DW_TAG_variable
	.long	.Ldebug_loc1                    // DW_AT_location
	.long	.Linfo_string27                 // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.byte	39                              // DW_AT_decl_line
	.long	148                             // DW_AT_type
	.byte	14                              // Abbrev [14] 0x17d:0xf DW_TAG_variable
	.long	.Ldebug_loc3                    // DW_AT_location
	.long	.Linfo_string29                 // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.byte	37                              // DW_AT_decl_line
	.long	69                              // DW_AT_type
	.byte	14                              // Abbrev [14] 0x18c:0xf DW_TAG_variable
	.long	.Ldebug_loc5                    // DW_AT_location
	.long	.Linfo_string30                 // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.byte	38                              // DW_AT_decl_line
	.long	148                             // DW_AT_type
	.byte	14                              // Abbrev [14] 0x19b:0xf DW_TAG_variable
	.long	.Ldebug_loc7                    // DW_AT_location
	.long	.Linfo_string32                 // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.byte	41                              // DW_AT_decl_line
	.long	148                             // DW_AT_type
	.byte	14                              // Abbrev [14] 0x1aa:0xf DW_TAG_variable
	.long	.Ldebug_loc8                    // DW_AT_location
	.long	.Linfo_string33                 // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.byte	42                              // DW_AT_decl_line
	.long	148                             // DW_AT_type
	.byte	14                              // Abbrev [14] 0x1b9:0xf DW_TAG_variable
	.long	.Ldebug_loc11                   // DW_AT_location
	.long	.Linfo_string36                 // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.byte	43                              // DW_AT_decl_line
	.long	148                             // DW_AT_type
	.byte	15                              // Abbrev [15] 0x1c8:0x10 DW_TAG_inlined_subroutine
	.long	307                             // DW_AT_abstract_origin
	.long	.Ltmp1                          // DW_AT_low_pc
	.long	.Ltmp2-.Ltmp1                   // DW_AT_high_pc
	.byte	1                               // DW_AT_call_file
	.byte	183                             // DW_AT_call_line
	.byte	21                              // DW_AT_call_column
	.byte	16                              // Abbrev [16] 0x1d8:0x15 DW_TAG_lexical_block
	.long	.Ldebug_ranges0                 // DW_AT_ranges
	.byte	14                              // Abbrev [14] 0x1dd:0xf DW_TAG_variable
	.long	.Ldebug_loc2                    // DW_AT_location
	.long	.Linfo_string28                 // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.byte	184                             // DW_AT_decl_line
	.long	69                              // DW_AT_type
	.byte	0                               // End Of Children Mark
	.byte	16                              // Abbrev [16] 0x1ed:0x15 DW_TAG_lexical_block
	.long	.Ldebug_ranges1                 // DW_AT_ranges
	.byte	14                              // Abbrev [14] 0x1f2:0xf DW_TAG_variable
	.long	.Ldebug_loc4                    // DW_AT_location
	.long	.Linfo_string28                 // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.byte	194                             // DW_AT_decl_line
	.long	69                              // DW_AT_type
	.byte	0                               // End Of Children Mark
	.byte	17                              // Abbrev [17] 0x202:0x4c DW_TAG_lexical_block
	.long	.Ltmp44                         // DW_AT_low_pc
	.long	.Ltmp253-.Ltmp44                // DW_AT_high_pc
	.byte	14                              // Abbrev [14] 0x20b:0xf DW_TAG_variable
	.long	.Ldebug_loc6                    // DW_AT_location
	.long	.Linfo_string31                 // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.byte	219                             // DW_AT_decl_line
	.long	148                             // DW_AT_type
	.byte	16                              // Abbrev [16] 0x21a:0x33 DW_TAG_lexical_block
	.long	.Ldebug_ranges2                 // DW_AT_ranges
	.byte	14                              // Abbrev [14] 0x21f:0xf DW_TAG_variable
	.long	.Ldebug_loc9                    // DW_AT_location
	.long	.Linfo_string34                 // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.byte	223                             // DW_AT_decl_line
	.long	148                             // DW_AT_type
	.byte	14                              // Abbrev [14] 0x22e:0xf DW_TAG_variable
	.long	.Ldebug_loc10                   // DW_AT_location
	.long	.Linfo_string35                 // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.byte	224                             // DW_AT_decl_line
	.long	148                             // DW_AT_type
	.byte	14                              // Abbrev [14] 0x23d:0xf DW_TAG_variable
	.long	.Ldebug_loc12                   // DW_AT_location
	.long	.Linfo_string37                 // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.byte	229                             // DW_AT_decl_line
	.long	148                             // DW_AT_type
	.byte	0                               // End Of Children Mark
	.byte	0                               // End Of Children Mark
	.byte	17                              // Abbrev [17] 0x24e:0x30 DW_TAG_lexical_block
	.long	.Ltmp258                        // DW_AT_low_pc
	.long	.Ltmp272-.Ltmp258               // DW_AT_high_pc
	.byte	18                              // Abbrev [18] 0x257:0x10 DW_TAG_variable
	.long	.Ldebug_loc13                   // DW_AT_location
	.long	.Linfo_string28                 // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.short	524                             // DW_AT_decl_line
	.long	69                              // DW_AT_type
	.byte	16                              // Abbrev [16] 0x267:0x16 DW_TAG_lexical_block
	.long	.Ldebug_ranges3                 // DW_AT_ranges
	.byte	18                              // Abbrev [18] 0x26c:0x10 DW_TAG_variable
	.long	.Ldebug_loc14                   // DW_AT_location
	.long	.Linfo_string38                 // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.short	525                             // DW_AT_decl_line
	.long	69                              // DW_AT_type
	.byte	0                               // End Of Children Mark
	.byte	0                               // End Of Children Mark
	.byte	17                              // Abbrev [17] 0x27e:0x30 DW_TAG_lexical_block
	.long	.Ltmp273                        // DW_AT_low_pc
	.long	.Ltmp284-.Ltmp273               // DW_AT_high_pc
	.byte	18                              // Abbrev [18] 0x287:0x10 DW_TAG_variable
	.long	.Ldebug_loc15                   // DW_AT_location
	.long	.Linfo_string28                 // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.short	535                             // DW_AT_decl_line
	.long	69                              // DW_AT_type
	.byte	16                              // Abbrev [16] 0x297:0x16 DW_TAG_lexical_block
	.long	.Ldebug_ranges4                 // DW_AT_ranges
	.byte	18                              // Abbrev [18] 0x29c:0x10 DW_TAG_variable
	.long	.Ldebug_loc16                   // DW_AT_location
	.long	.Linfo_string38                 // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.short	536                             // DW_AT_decl_line
	.long	69                              // DW_AT_type
	.byte	0                               // End Of Children Mark
	.byte	0                               // End Of Children Mark
	.byte	17                              // Abbrev [17] 0x2ae:0x1a DW_TAG_lexical_block
	.long	.Ltmp286                        // DW_AT_low_pc
	.long	.Ltmp300-.Ltmp286               // DW_AT_high_pc
	.byte	18                              // Abbrev [18] 0x2b7:0x10 DW_TAG_variable
	.long	.Ldebug_loc17                   // DW_AT_location
	.long	.Linfo_string28                 // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.short	546                             // DW_AT_decl_line
	.long	69                              // DW_AT_type
	.byte	0                               // End Of Children Mark
	.byte	17                              // Abbrev [17] 0x2c8:0x1a DW_TAG_lexical_block
	.long	.Ltmp301                        // DW_AT_low_pc
	.long	.Ltmp311-.Ltmp301               // DW_AT_high_pc
	.byte	18                              // Abbrev [18] 0x2d1:0x10 DW_TAG_variable
	.long	.Ldebug_loc18                   // DW_AT_location
	.long	.Linfo_string28                 // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.short	559                             // DW_AT_decl_line
	.long	69                              // DW_AT_type
	.byte	0                               // End Of Children Mark
	.byte	17                              // Abbrev [17] 0x2e2:0x1a DW_TAG_lexical_block
	.long	.Ltmp311                        // DW_AT_low_pc
	.long	.Ltmp344-.Ltmp311               // DW_AT_high_pc
	.byte	18                              // Abbrev [18] 0x2eb:0x10 DW_TAG_variable
	.long	.Ldebug_loc19                   // DW_AT_location
	.long	.Linfo_string28                 // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.short	599                             // DW_AT_decl_line
	.long	884                             // DW_AT_type
	.byte	0                               // End Of Children Mark
	.byte	19                              // Abbrev [19] 0x2fc:0x7 DW_TAG_GNU_call_site
	.byte	1                               // DW_AT_GNU_call_site_target
	.byte	103
	.long	.Ltmp1                          // DW_AT_low_pc
	.byte	19                              // Abbrev [19] 0x303:0x7 DW_TAG_GNU_call_site
	.byte	1                               // DW_AT_GNU_call_site_target
	.byte	103
	.long	.Ltmp35                         // DW_AT_low_pc
	.byte	19                              // Abbrev [19] 0x30a:0x7 DW_TAG_GNU_call_site
	.byte	1                               // DW_AT_GNU_call_site_target
	.byte	103
	.long	.Ltmp38                         // DW_AT_low_pc
	.byte	19                              // Abbrev [19] 0x311:0x7 DW_TAG_GNU_call_site
	.byte	1                               // DW_AT_GNU_call_site_target
	.byte	103
	.long	.Ltmp139                        // DW_AT_low_pc
	.byte	19                              // Abbrev [19] 0x318:0x7 DW_TAG_GNU_call_site
	.byte	1                               // DW_AT_GNU_call_site_target
	.byte	103
	.long	.Ltmp146                        // DW_AT_low_pc
	.byte	19                              // Abbrev [19] 0x31f:0x7 DW_TAG_GNU_call_site
	.byte	1                               // DW_AT_GNU_call_site_target
	.byte	103
	.long	.Ltmp157                        // DW_AT_low_pc
	.byte	19                              // Abbrev [19] 0x326:0x7 DW_TAG_GNU_call_site
	.byte	1                               // DW_AT_GNU_call_site_target
	.byte	103
	.long	.Ltmp163                        // DW_AT_low_pc
	.byte	19                              // Abbrev [19] 0x32d:0x7 DW_TAG_GNU_call_site
	.byte	1                               // DW_AT_GNU_call_site_target
	.byte	103
	.long	.Ltmp183                        // DW_AT_low_pc
	.byte	19                              // Abbrev [19] 0x334:0x7 DW_TAG_GNU_call_site
	.byte	1                               // DW_AT_GNU_call_site_target
	.byte	103
	.long	.Ltmp189                        // DW_AT_low_pc
	.byte	19                              // Abbrev [19] 0x33b:0x7 DW_TAG_GNU_call_site
	.byte	1                               // DW_AT_GNU_call_site_target
	.byte	103
	.long	.Ltmp196                        // DW_AT_low_pc
	.byte	19                              // Abbrev [19] 0x342:0x7 DW_TAG_GNU_call_site
	.byte	1                               // DW_AT_GNU_call_site_target
	.byte	103
	.long	.Ltmp209                        // DW_AT_low_pc
	.byte	19                              // Abbrev [19] 0x349:0x7 DW_TAG_GNU_call_site
	.byte	1                               // DW_AT_GNU_call_site_target
	.byte	103
	.long	.Ltmp221                        // DW_AT_low_pc
	.byte	19                              // Abbrev [19] 0x350:0x7 DW_TAG_GNU_call_site
	.byte	1                               // DW_AT_GNU_call_site_target
	.byte	103
	.long	.Ltmp233                        // DW_AT_low_pc
	.byte	19                              // Abbrev [19] 0x357:0x7 DW_TAG_GNU_call_site
	.byte	1                               // DW_AT_GNU_call_site_target
	.byte	103
	.long	.Ltmp245                        // DW_AT_low_pc
	.byte	19                              // Abbrev [19] 0x35e:0x7 DW_TAG_GNU_call_site
	.byte	1                               // DW_AT_GNU_call_site_target
	.byte	103
	.long	.Ltmp257                        // DW_AT_low_pc
	.byte	19                              // Abbrev [19] 0x365:0x7 DW_TAG_GNU_call_site
	.byte	1                               // DW_AT_GNU_call_site_target
	.byte	103
	.long	.Ltmp285                        // DW_AT_low_pc
	.byte	19                              // Abbrev [19] 0x36c:0x7 DW_TAG_GNU_call_site
	.byte	1                               // DW_AT_GNU_call_site_target
	.byte	103
	.long	.Ltmp345                        // DW_AT_low_pc
	.byte	0                               // End Of Children Mark
	.byte	5                               // Abbrev [5] 0x374:0x7 DW_TAG_base_type
	.long	.Linfo_string25                 // DW_AT_name
	.byte	5                               // DW_AT_encoding
	.byte	4                               // DW_AT_byte_size
	.byte	0                               // End Of Children Mark
.Ldebug_info_end0:
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.long	.Ltmp3-.Lfunc_begin0
	.long	.Ltmp4-.Lfunc_begin0
	.long	.Ltmp5-.Lfunc_begin0
	.long	.Ltmp18-.Lfunc_begin0
	.long	0
	.long	0
.Ldebug_ranges1:
	.long	.Ltmp19-.Lfunc_begin0
	.long	.Ltmp21-.Lfunc_begin0
	.long	.Ltmp22-.Lfunc_begin0
	.long	.Ltmp34-.Lfunc_begin0
	.long	0
	.long	0
.Ldebug_ranges2:
	.long	.Ltmp44-.Lfunc_begin0
	.long	.Ltmp45-.Lfunc_begin0
	.long	.Ltmp49-.Lfunc_begin0
	.long	.Ltmp253-.Lfunc_begin0
	.long	0
	.long	0
.Ldebug_ranges3:
	.long	.Ltmp259-.Lfunc_begin0
	.long	.Ltmp268-.Lfunc_begin0
	.long	.Ltmp270-.Lfunc_begin0
	.long	.Ltmp271-.Lfunc_begin0
	.long	0
	.long	0
.Ldebug_ranges4:
	.long	.Ltmp274-.Lfunc_begin0
	.long	.Ltmp280-.Lfunc_begin0
	.long	.Ltmp282-.Lfunc_begin0
	.long	.Ltmp283-.Lfunc_begin0
	.long	0
	.long	0
	.section	.debug_str,"MS",@progbits,1
.Linfo_string0:
	.asciz	"clang version 12.0.0 (https://github.com/upmem/llvm-project.git d36425841d9a4d1420b7aa155675f6ae8bcf9f08)" // string offset=0
.Linfo_string1:
	.asciz	"device.c"                      // string offset=106
.Linfo_string2:
	.asciz	"/home/oferraz/upmem/upmem/64_code/upmem/8-bit_multiple_threads" // string offset=115
.Linfo_string3:
	.asciz	"LUT_VN"                        // string offset=178
.Linfo_string4:
	.asciz	"short"                         // string offset=185
.Linfo_string5:
	.asciz	"__ARRAY_SIZE_TYPE__"           // string offset=191
.Linfo_string6:
	.asciz	"__atomic_bit_barrier_my_barrier" // string offset=211
.Linfo_string7:
	.asciz	"unsigned char"                 // string offset=243
.Linfo_string8:
	.asciz	"uint8_t"                       // string offset=257
.Linfo_string9:
	.asciz	"L"                             // string offset=265
.Linfo_string10:
	.asciz	"char"                          // string offset=267
.Linfo_string11:
	.asciz	"Rcv"                           // string offset=272
.Linfo_string12:
	.asciz	"nb_cycles"                     // string offset=276
.Linfo_string13:
	.asciz	"unsigned int"                  // string offset=286
.Linfo_string14:
	.asciz	"uint32_t"                      // string offset=299
.Linfo_string15:
	.asciz	"decoded_word"                  // string offset=308
.Linfo_string16:
	.asciz	"valid_decoded_word"            // string offset=321
.Linfo_string17:
	.asciz	"COUNT_SAME"                    // string offset=340
.Linfo_string18:
	.asciz	"COUNT_CYCLES"                  // string offset=351
.Linfo_string19:
	.asciz	"COUNT_INSTRUCTIONS"            // string offset=364
.Linfo_string20:
	.asciz	"COUNT_NOTHING"                 // string offset=383
.Linfo_string21:
	.asciz	"_perfcounter_config_t"         // string offset=397
.Linfo_string22:
	.asciz	"me"                            // string offset=419
.Linfo_string23:
	.asciz	"sysname_t"                     // string offset=422
.Linfo_string24:
	.asciz	"main"                          // string offset=432
.Linfo_string25:
	.asciz	"int"                           // string offset=437
.Linfo_string26:
	.asciz	"true_codeword"                 // string offset=441
.Linfo_string27:
	.asciz	"max_iter"                      // string offset=455
.Linfo_string28:
	.asciz	"i"                             // string offset=464
.Linfo_string29:
	.asciz	"k"                             // string offset=466
.Linfo_string30:
	.asciz	"num_iter"                      // string offset=468
.Linfo_string31:
	.asciz	"j"                             // string offset=477
.Linfo_string32:
	.asciz	"min1"                          // string offset=479
.Linfo_string33:
	.asciz	"min2"                          // string offset=484
.Linfo_string34:
	.asciz	"index"                         // string offset=489
.Linfo_string35:
	.asciz	"sign"                          // string offset=495
.Linfo_string36:
	.asciz	"abs_Rcv"                       // string offset=500
.Linfo_string37:
	.asciz	"mask"                          // string offset=508
.Linfo_string38:
	.asciz	"sum"                           // string offset=513
	.addrsig
	.addrsig_sym L
	.addrsig_sym my_barrier
	.addrsig_sym decoded_word
	.addrsig_sym nb_cycles
	.addrsig_sym valid_decoded_word
	.section	.debug_line,"",@progbits
.Lline_table_start0:
