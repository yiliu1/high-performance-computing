	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 10, 14	sdk_version 10, 14
	.globl	__Z13microkernel_cPdS_S_i ## -- Begin function _Z13microkernel_cPdS_S_i
	.p2align	4, 0x90
__Z13microkernel_cPdS_S_i:              ## @_Z13microkernel_cPdS_S_i
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%rbx
	.cfi_offset %rbx, -24
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovupd	%ymm0, 224(%rdx)
	vmovupd	%ymm0, 192(%rdx)
	vmovupd	%ymm0, 160(%rdx)
	vmovupd	%ymm0, 128(%rdx)
	vmovupd	%ymm0, 96(%rdx)
	vmovupd	%ymm0, 64(%rdx)
	vmovupd	%ymm0, 32(%rdx)
	vmovupd	%ymm0, (%rdx)
	testl	%ecx, %ecx
	jle	LBB0_4
## %bb.1:
	movl	%ecx, %r10d
	decq	%r10
	vxorpd	%xmm8, %xmm8, %xmm8
	xorl	%r11d, %r11d
	movabsq	$34359738336, %r8       ## imm = 0x7FFFFFFE0
	movabsq	$34359738304, %r9       ## imm = 0x7FFFFFFC0
	xorl	%eax, %eax
	vxorpd	%xmm9, %xmm9, %xmm9
	vxorpd	%xmm10, %xmm10, %xmm10
	vxorpd	%xmm11, %xmm11, %xmm11
	vxorpd	%xmm4, %xmm4, %xmm4
	vxorpd	%xmm5, %xmm5, %xmm5
	vxorpd	%xmm6, %xmm6, %xmm6
	vxorpd	%xmm7, %xmm7, %xmm7
	vxorpd	%xmm0, %xmm0, %xmm0
	vxorpd	%xmm1, %xmm1, %xmm1
	vxorpd	%xmm2, %xmm2, %xmm2
	jmp	LBB0_2
	.p2align	4, 0x90
LBB0_3:                                 ##   in Loop: Header=BB0_2 Depth=1
	vmovsd	(%rdx), %xmm2           ## xmm2 = mem[0],zero
	vmovsd	8(%rdx), %xmm1          ## xmm1 = mem[0],zero
	vmovsd	16(%rdx), %xmm0         ## xmm0 = mem[0],zero
	vmovsd	24(%rdx), %xmm7         ## xmm7 = mem[0],zero
	vmovsd	32(%rdx), %xmm6         ## xmm6 = mem[0],zero
	vmovsd	40(%rdx), %xmm5         ## xmm5 = mem[0],zero
	vmovsd	48(%rdx), %xmm4         ## xmm4 = mem[0],zero
	vmovsd	56(%rdx), %xmm11        ## xmm11 = mem[0],zero
	vmovsd	64(%rdx), %xmm10        ## xmm10 = mem[0],zero
	vmovsd	72(%rdx), %xmm9         ## xmm9 = mem[0],zero
	vmovsd	80(%rdx), %xmm8         ## xmm8 = mem[0],zero
	addq	$4, %rax
	addq	$8, %r11
	decq	%r10
LBB0_2:                                 ## =>This Inner Loop Header: Depth=1
	leaq	(,%r11,8), %rcx
	leaq	(,%rax,8), %rbx
	andq	%r8, %rbx
	vmovsd	(%rdi,%rbx), %xmm3      ## xmm3 = mem[0],zero
	andq	%r9, %rcx
	vmulsd	(%rsi,%rcx), %xmm3, %xmm3
	vaddsd	%xmm3, %xmm2, %xmm2
	vmovsd	%xmm2, (%rdx)
	vmovsd	(%rdi,%rbx), %xmm2      ## xmm2 = mem[0],zero
	vmulsd	8(%rsi,%rcx), %xmm2, %xmm2
	vaddsd	%xmm2, %xmm1, %xmm1
	vmovsd	%xmm1, 8(%rdx)
	vmovsd	(%rdi,%rbx), %xmm1      ## xmm1 = mem[0],zero
	vmulsd	16(%rsi,%rcx), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, 16(%rdx)
	vmovsd	(%rdi,%rbx), %xmm0      ## xmm0 = mem[0],zero
	vmulsd	24(%rsi,%rcx), %xmm0, %xmm0
	vaddsd	%xmm0, %xmm7, %xmm0
	vmovsd	%xmm0, 24(%rdx)
	vmovsd	(%rdi,%rbx), %xmm0      ## xmm0 = mem[0],zero
	vmulsd	32(%rsi,%rcx), %xmm0, %xmm0
	vaddsd	%xmm0, %xmm6, %xmm0
	vmovsd	%xmm0, 32(%rdx)
	vmovsd	(%rdi,%rbx), %xmm0      ## xmm0 = mem[0],zero
	vmulsd	40(%rsi,%rcx), %xmm0, %xmm0
	vaddsd	%xmm0, %xmm5, %xmm0
	vmovsd	%xmm0, 40(%rdx)
	vmovsd	(%rdi,%rbx), %xmm0      ## xmm0 = mem[0],zero
	vmulsd	48(%rsi,%rcx), %xmm0, %xmm0
	vaddsd	%xmm0, %xmm4, %xmm0
	vmovsd	%xmm0, 48(%rdx)
	vmovsd	(%rdi,%rbx), %xmm0      ## xmm0 = mem[0],zero
	vmulsd	56(%rsi,%rcx), %xmm0, %xmm0
	vaddsd	%xmm0, %xmm11, %xmm0
	vmovsd	%xmm0, 56(%rdx)
	vmovsd	8(%rdi,%rbx), %xmm0     ## xmm0 = mem[0],zero
	vmulsd	(%rsi,%rcx), %xmm0, %xmm0
	vaddsd	%xmm0, %xmm10, %xmm0
	vmovsd	%xmm0, 64(%rdx)
	vmovsd	8(%rdi,%rbx), %xmm0     ## xmm0 = mem[0],zero
	vmulsd	8(%rsi,%rcx), %xmm0, %xmm0
	vaddsd	%xmm0, %xmm9, %xmm0
	vmovsd	%xmm0, 72(%rdx)
	vmovsd	8(%rdi,%rbx), %xmm0     ## xmm0 = mem[0],zero
	vmulsd	16(%rsi,%rcx), %xmm0, %xmm0
	vaddsd	%xmm0, %xmm8, %xmm0
	vmovsd	%xmm0, 80(%rdx)
	vmovsd	8(%rdi,%rbx), %xmm0     ## xmm0 = mem[0],zero
	vmulsd	24(%rsi,%rcx), %xmm0, %xmm0
	vaddsd	88(%rdx), %xmm0, %xmm0
	vmovsd	%xmm0, 88(%rdx)
	vmovsd	8(%rdi,%rbx), %xmm0     ## xmm0 = mem[0],zero
	vmulsd	32(%rsi,%rcx), %xmm0, %xmm0
	vaddsd	96(%rdx), %xmm0, %xmm0
	vmovsd	%xmm0, 96(%rdx)
	vmovsd	8(%rdi,%rbx), %xmm0     ## xmm0 = mem[0],zero
	vmulsd	40(%rsi,%rcx), %xmm0, %xmm0
	vaddsd	104(%rdx), %xmm0, %xmm0
	vmovsd	%xmm0, 104(%rdx)
	vmovsd	8(%rdi,%rbx), %xmm0     ## xmm0 = mem[0],zero
	vmulsd	48(%rsi,%rcx), %xmm0, %xmm0
	vaddsd	112(%rdx), %xmm0, %xmm0
	vmovsd	%xmm0, 112(%rdx)
	vmovsd	8(%rdi,%rbx), %xmm0     ## xmm0 = mem[0],zero
	vmulsd	56(%rsi,%rcx), %xmm0, %xmm0
	vaddsd	120(%rdx), %xmm0, %xmm0
	vmovsd	%xmm0, 120(%rdx)
	vmovsd	16(%rdi,%rbx), %xmm0    ## xmm0 = mem[0],zero
	vmulsd	(%rsi,%rcx), %xmm0, %xmm0
	vaddsd	128(%rdx), %xmm0, %xmm0
	vmovsd	%xmm0, 128(%rdx)
	vmovsd	16(%rdi,%rbx), %xmm0    ## xmm0 = mem[0],zero
	vmulsd	8(%rsi,%rcx), %xmm0, %xmm0
	vaddsd	136(%rdx), %xmm0, %xmm0
	vmovsd	%xmm0, 136(%rdx)
	vmovsd	16(%rdi,%rbx), %xmm0    ## xmm0 = mem[0],zero
	vmulsd	16(%rsi,%rcx), %xmm0, %xmm0
	vaddsd	144(%rdx), %xmm0, %xmm0
	vmovsd	%xmm0, 144(%rdx)
	vmovsd	16(%rdi,%rbx), %xmm0    ## xmm0 = mem[0],zero
	vmulsd	24(%rsi,%rcx), %xmm0, %xmm0
	vaddsd	152(%rdx), %xmm0, %xmm0
	vmovsd	%xmm0, 152(%rdx)
	vmovsd	16(%rdi,%rbx), %xmm0    ## xmm0 = mem[0],zero
	vmulsd	32(%rsi,%rcx), %xmm0, %xmm0
	vaddsd	160(%rdx), %xmm0, %xmm0
	vmovsd	%xmm0, 160(%rdx)
	vmovsd	16(%rdi,%rbx), %xmm0    ## xmm0 = mem[0],zero
	vmulsd	40(%rsi,%rcx), %xmm0, %xmm0
	vaddsd	168(%rdx), %xmm0, %xmm0
	vmovsd	%xmm0, 168(%rdx)
	vmovsd	16(%rdi,%rbx), %xmm0    ## xmm0 = mem[0],zero
	vmulsd	48(%rsi,%rcx), %xmm0, %xmm0
	vaddsd	176(%rdx), %xmm0, %xmm0
	vmovsd	%xmm0, 176(%rdx)
	vmovsd	16(%rdi,%rbx), %xmm0    ## xmm0 = mem[0],zero
	vmulsd	56(%rsi,%rcx), %xmm0, %xmm0
	vaddsd	184(%rdx), %xmm0, %xmm0
	vmovsd	%xmm0, 184(%rdx)
	vmovsd	24(%rdi,%rbx), %xmm0    ## xmm0 = mem[0],zero
	vmulsd	(%rsi,%rcx), %xmm0, %xmm0
	vaddsd	192(%rdx), %xmm0, %xmm0
	vmovsd	%xmm0, 192(%rdx)
	vmovsd	24(%rdi,%rbx), %xmm0    ## xmm0 = mem[0],zero
	vmulsd	8(%rsi,%rcx), %xmm0, %xmm0
	vaddsd	200(%rdx), %xmm0, %xmm0
	vmovsd	%xmm0, 200(%rdx)
	vmovsd	24(%rdi,%rbx), %xmm0    ## xmm0 = mem[0],zero
	vmulsd	16(%rsi,%rcx), %xmm0, %xmm0
	vaddsd	208(%rdx), %xmm0, %xmm0
	vmovsd	%xmm0, 208(%rdx)
	vmovsd	24(%rdi,%rbx), %xmm0    ## xmm0 = mem[0],zero
	vmulsd	24(%rsi,%rcx), %xmm0, %xmm0
	vaddsd	216(%rdx), %xmm0, %xmm0
	vmovsd	%xmm0, 216(%rdx)
	vmovsd	24(%rdi,%rbx), %xmm0    ## xmm0 = mem[0],zero
	vmulsd	32(%rsi,%rcx), %xmm0, %xmm0
	vaddsd	224(%rdx), %xmm0, %xmm0
	vmovsd	%xmm0, 224(%rdx)
	vmovsd	24(%rdi,%rbx), %xmm0    ## xmm0 = mem[0],zero
	vmulsd	40(%rsi,%rcx), %xmm0, %xmm0
	vaddsd	232(%rdx), %xmm0, %xmm0
	vmovsd	%xmm0, 232(%rdx)
	vmovsd	24(%rdi,%rbx), %xmm0    ## xmm0 = mem[0],zero
	vmulsd	48(%rsi,%rcx), %xmm0, %xmm0
	vaddsd	240(%rdx), %xmm0, %xmm0
	vmovsd	%xmm0, 240(%rdx)
	vmovsd	24(%rdi,%rbx), %xmm0    ## xmm0 = mem[0],zero
	vmulsd	56(%rsi,%rcx), %xmm0, %xmm0
	vaddsd	248(%rdx), %xmm0, %xmm0
	vmovsd	%xmm0, 248(%rdx)
	testq	%r10, %r10
	jne	LBB0_3
LBB0_4:
	popq	%rbx
	popq	%rbp
	vzeroupper
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__Z15microkernel_avxPdS_S_i ## -- Begin function _Z15microkernel_avxPdS_S_i
	.p2align	4, 0x90
__Z15microkernel_avxPdS_S_i:            ## @_Z15microkernel_avxPdS_S_i
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovupd	%ymm0, 224(%rdx)
	vmovupd	%ymm0, 192(%rdx)
	vmovupd	%ymm0, 160(%rdx)
	vmovupd	%ymm0, 128(%rdx)
	vmovupd	%ymm0, 96(%rdx)
	vmovupd	%ymm0, 64(%rdx)
	vmovupd	%ymm0, 32(%rdx)
	vmovupd	%ymm0, (%rdx)
	vxorpd	%xmm5, %xmm5, %xmm5
	vxorpd	%xmm2, %xmm2, %xmm2
	vxorpd	%xmm1, %xmm1, %xmm1
	vxorpd	%xmm6, %xmm6, %xmm6
	vxorpd	%xmm4, %xmm4, %xmm4
	vxorpd	%xmm7, %xmm7, %xmm7
	vxorpd	%xmm3, %xmm3, %xmm3
	testl	%ecx, %ecx
	jle	LBB1_3
## %bb.1:
	movl	%ecx, %r8d
	vxorpd	%xmm3, %xmm3, %xmm3
	xorl	%r9d, %r9d
	xorl	%eax, %eax
	vxorpd	%xmm8, %xmm8, %xmm8
	vxorpd	%xmm4, %xmm4, %xmm4
	vxorpd	%xmm9, %xmm9, %xmm9
	vxorpd	%xmm1, %xmm1, %xmm1
	vxorpd	%xmm2, %xmm2, %xmm2
	vxorpd	%xmm10, %xmm10, %xmm10
	vxorpd	%xmm0, %xmm0, %xmm0
	.p2align	4, 0x90
LBB1_2:                                 ## =>This Inner Loop Header: Depth=1
	movl	%r9d, %ecx
	andl	$-4, %ecx
	vmovupd	(%rdi,%rcx,8), %ymm11
	movl	%eax, %ecx
	andl	$-8, %ecx
	vmovupd	(%rsi,%rcx,8), %ymm12
	vmovupd	32(%rsi,%rcx,8), %ymm13
	vbroadcastsd	%xmm11, %ymm7
	vpermpd	$85, %ymm11, %ymm6      ## ymm6 = ymm11[1,1,1,1]
	vpermpd	$170, %ymm11, %ymm5     ## ymm5 = ymm11[2,2,2,2]
	vpermpd	$255, %ymm11, %ymm11    ## ymm11 = ymm11[3,3,3,3]
	vfmadd231pd	%ymm12, %ymm7, %ymm3 ## ymm3 = (ymm7 * ymm12) + ymm3
	vfmadd213pd	%ymm8, %ymm13, %ymm7 ## ymm7 = (ymm13 * ymm7) + ymm8
	vfmadd231pd	%ymm12, %ymm6, %ymm4 ## ymm4 = (ymm6 * ymm12) + ymm4
	vfmadd213pd	%ymm9, %ymm13, %ymm6 ## ymm6 = (ymm13 * ymm6) + ymm9
	vfmadd231pd	%ymm12, %ymm5, %ymm0 ## ymm0 = (ymm5 * ymm12) + ymm0
	vfmadd213pd	%ymm10, %ymm13, %ymm5 ## ymm5 = (ymm13 * ymm5) + ymm10
	vfmadd231pd	%ymm12, %ymm11, %ymm2 ## ymm2 = (ymm11 * ymm12) + ymm2
	vfmadd231pd	%ymm13, %ymm11, %ymm1 ## ymm1 = (ymm11 * ymm13) + ymm1
	addq	$8, %rax
	addq	$4, %r9
	vmovapd	%ymm7, %ymm8
	vmovapd	%ymm6, %ymm9
	vmovapd	%ymm5, %ymm10
	decq	%r8
	jne	LBB1_2
LBB1_3:
	vmovupd	%ymm3, (%rdx)
	vmovupd	%ymm7, 32(%rdx)
	vmovupd	%ymm4, 64(%rdx)
	vmovupd	%ymm6, 96(%rdx)
	vmovupd	%ymm0, 128(%rdx)
	vmovupd	%ymm5, 160(%rdx)
	vmovupd	%ymm2, 192(%rdx)
	vmovupd	%ymm1, 224(%rdx)
	popq	%rbp
	vzeroupper
	retq
	.cfi_endproc
                                        ## -- End function

.subsections_via_symbols
