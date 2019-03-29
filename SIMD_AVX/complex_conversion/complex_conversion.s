	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 10, 14	sdk_version 10, 14
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3               ## -- Begin function _Z20complex_conversion_cPKdPdi
LCPI0_0:
	.quad	9223372036854775807     ## double NaN
LCPI0_1:
	.quad	-9223372036854775808    ## double -0
	.section	__TEXT,__literal16,16byte_literals
	.p2align	4
LCPI0_2:
	.quad	9223372036854775807     ## double NaN
	.quad	9223372036854775807     ## double NaN
LCPI0_3:
	.quad	-9223372036854775808    ## double -0
	.quad	-9223372036854775808    ## double -0
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__Z20complex_conversion_cPKdPdi
	.p2align	4, 0x90
__Z20complex_conversion_cPKdPdi:        ## @_Z20complex_conversion_cPKdPdi
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	testl	%edx, %edx
	jle	LBB0_10
## %bb.1:
	movl	%edx, %eax
	cmpl	$3, %edx
	jbe	LBB0_2
## %bb.5:
	movq	%rax, %rcx
	shlq	$4, %rcx
	leaq	(%rdi,%rcx), %rdx
	cmpq	%rsi, %rdx
	jbe	LBB0_7
## %bb.6:
	addq	%rsi, %rcx
	cmpq	%rdi, %rcx
	jbe	LBB0_7
LBB0_2:
	xorl	%ecx, %ecx
LBB0_3:
	subq	%rcx, %rax
	shlq	$4, %rcx
	orq	$8, %rcx
	vmovapd	LCPI0_2(%rip), %xmm0    ## xmm0 = [nan,nan]
	vmovapd	LCPI0_3(%rip), %xmm1    ## xmm1 = [-0.000000e+00,-0.000000e+00]
	.p2align	4, 0x90
LBB0_4:                                 ## =>This Inner Loop Header: Depth=1
	vmovsd	-8(%rdi,%rcx), %xmm2    ## xmm2 = mem[0],zero
	vmovsd	(%rdi,%rcx), %xmm3      ## xmm3 = mem[0],zero
	vdivsd	%xmm3, %xmm2, %xmm4
	vmulsd	%xmm2, %xmm2, %xmm5
	vmulsd	%xmm3, %xmm3, %xmm3
	vaddsd	%xmm3, %xmm5, %xmm3
	vandpd	%xmm0, %xmm3, %xmm3
	vandpd	%xmm1, %xmm2, %xmm2
	vorpd	%xmm2, %xmm3, %xmm2
	vmovsd	%xmm4, -8(%rsi,%rcx)
	vmovlpd	%xmm2, (%rsi,%rcx)
	addq	$16, %rcx
	decq	%rax
	jne	LBB0_4
LBB0_10:
	popq	%rbp
	vzeroupper
	retq
LBB0_7:
	movl	%eax, %ecx
	andl	$-4, %ecx
	xorl	%edx, %edx
	vbroadcastsd	LCPI0_0(%rip), %ymm0 ## ymm0 = [NaN,NaN,NaN,NaN]
	vbroadcastsd	LCPI0_1(%rip), %ymm1 ## ymm1 = [-0,-0,-0,-0]
	movq	%rcx, %r8
	.p2align	4, 0x90
LBB0_8:                                 ## =>This Inner Loop Header: Depth=1
	vmovupd	(%rdi,%rdx), %ymm2
	vmovupd	32(%rdi,%rdx), %ymm3
	vunpcklpd	%ymm3, %ymm2, %ymm4 ## ymm4 = ymm2[0],ymm3[0],ymm2[2],ymm3[2]
	vpermpd	$216, %ymm4, %ymm4      ## ymm4 = ymm4[0,2,1,3]
	vunpckhpd	%ymm3, %ymm2, %ymm5 ## ymm5 = ymm2[1],ymm3[1],ymm2[3],ymm3[3]
	vpermpd	$216, %ymm5, %ymm5      ## ymm5 = ymm5[0,2,1,3]
	vdivpd	%ymm5, %ymm4, %ymm5
	vmulpd	%ymm3, %ymm3, %ymm3
	vmulpd	%ymm2, %ymm2, %ymm2
	vunpcklpd	%ymm3, %ymm2, %ymm6 ## ymm6 = ymm2[0],ymm3[0],ymm2[2],ymm3[2]
	vpermpd	$216, %ymm6, %ymm6      ## ymm6 = ymm6[0,2,1,3]
	vunpckhpd	%ymm3, %ymm2, %ymm2 ## ymm2 = ymm2[1],ymm3[1],ymm2[3],ymm3[3]
	vpermpd	$216, %ymm2, %ymm2      ## ymm2 = ymm2[0,2,1,3]
	vaddpd	%ymm2, %ymm6, %ymm2
	vandpd	%ymm0, %ymm2, %ymm2
	vandpd	%ymm1, %ymm4, %ymm3
	vorpd	%ymm3, %ymm2, %ymm2
	vpermpd	$96, %ymm2, %ymm3       ## ymm3 = ymm2[0,0,2,1]
	vpermpd	$212, %ymm5, %ymm4      ## ymm4 = ymm5[0,1,1,3]
	vblendpd	$10, %ymm3, %ymm4, %ymm3 ## ymm3 = ymm4[0],ymm3[1],ymm4[2],ymm3[3]
	vpermpd	$232, %ymm2, %ymm2      ## ymm2 = ymm2[0,2,2,3]
	vpermpd	$246, %ymm5, %ymm4      ## ymm4 = ymm5[2,1,3,3]
	vblendpd	$10, %ymm2, %ymm4, %ymm2 ## ymm2 = ymm4[0],ymm2[1],ymm4[2],ymm2[3]
	vmovupd	%ymm2, 32(%rsi,%rdx)
	vmovupd	%ymm3, (%rsi,%rdx)
	addq	$64, %rdx
	addq	$-4, %r8
	jne	LBB0_8
## %bb.9:
	cmpq	%rax, %rcx
	jne	LBB0_3
	jmp	LBB0_10
	.cfi_endproc
                                        ## -- End function
	.globl	__Z22complex_conversion_avxPKdPdi ## -- Begin function _Z22complex_conversion_avxPKdPdi
	.p2align	4, 0x90
__Z22complex_conversion_avxPKdPdi:      ## @_Z22complex_conversion_avxPKdPdi
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	cmpl	$8, %edx
	jl	LBB1_5
## %bb.1:
	movl	%edx, %ecx
	sarl	$31, %ecx
	shrl	$29, %ecx
	addl	%edx, %ecx
	sarl	$3, %ecx
	movl	%ecx, %eax
	andl	$1, %eax
	andl	$-8, %edx
	cmpl	$8, %edx
	jne	LBB1_6
## %bb.2:
	xorl	%ecx, %ecx
	testq	%rax, %rax
	jne	LBB1_4
	jmp	LBB1_5
LBB1_6:
	movq	%rax, %rdx
	subq	%rcx, %rdx
	xorl	%ecx, %ecx
	vxorpd	%xmm0, %xmm0, %xmm0
	.p2align	4, 0x90
LBB1_7:                                 ## =>This Inner Loop Header: Depth=1
	vpermpd	$116, (%rdi,%rcx,8), %ymm1 ## ymm1 = mem[0,1,3,1]
	vblendpd	$12, %ymm1, %ymm0, %ymm1 ## ymm1 = ymm0[0,1],ymm1[2,3]
	vdivpd	%ymm1, %ymm1, %ymm1
	vpermpd	$197, %ymm1, %ymm1      ## ymm1 = ymm1[1,1,0,3]
	vblendpd	$10, %ymm0, %ymm1, %ymm1 ## ymm1 = ymm1[0],ymm0[1],ymm1[2],ymm0[3]
	vmovupd	%ymm1, (%rsi,%rcx,8)
	vmovupd	%ymm1, 32(%rsi,%rcx,8)
	vpermpd	$116, 32(%rdi,%rcx,8), %ymm1 ## ymm1 = mem[0,1,3,1]
	vblendpd	$12, %ymm1, %ymm0, %ymm1 ## ymm1 = ymm0[0,1],ymm1[2,3]
	vdivpd	%ymm1, %ymm1, %ymm1
	vpermpd	$197, %ymm1, %ymm1      ## ymm1 = ymm1[1,1,0,3]
	vblendpd	$10, %ymm0, %ymm1, %ymm1 ## ymm1 = ymm1[0],ymm0[1],ymm1[2],ymm0[3]
	vmovupd	%ymm1, 32(%rsi,%rcx,8)
	vmovupd	%ymm1, 64(%rsi,%rcx,8)
	addq	$8, %rcx
	addq	$2, %rdx
	jne	LBB1_7
## %bb.3:
	testq	%rax, %rax
	je	LBB1_5
LBB1_4:
	vpermpd	$116, (%rdi,%rcx,8), %ymm0 ## ymm0 = mem[0,1,3,1]
	vxorpd	%xmm1, %xmm1, %xmm1
	vblendpd	$12, %ymm0, %ymm1, %ymm0 ## ymm0 = ymm1[0,1],ymm0[2,3]
	vdivpd	%ymm0, %ymm0, %ymm0
	vpermpd	$197, %ymm0, %ymm0      ## ymm0 = ymm0[1,1,0,3]
	vblendpd	$10, %ymm1, %ymm0, %ymm0 ## ymm0 = ymm0[0],ymm1[1],ymm0[2],ymm1[3]
	vmovupd	%ymm0, (%rsi,%rcx,8)
	vmovupd	%ymm0, 32(%rsi,%rcx,8)
LBB1_5:
	popq	%rbp
	vzeroupper
	retq
	.cfi_endproc
                                        ## -- End function

.subsections_via_symbols
