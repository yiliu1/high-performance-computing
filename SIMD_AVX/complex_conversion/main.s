	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 10, 14	sdk_version 10, 14
	.globl	__Z8init_tscv           ## -- Begin function _Z8init_tscv
	.p2align	4, 0x90
__Z8init_tscv:                          ## @_Z8init_tscv
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__Z9start_tscv          ## -- Begin function _Z9start_tscv
	.p2align	4, 0x90
__Z9start_tscv:                         ## @_Z9start_tscv
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%rbx
	.cfi_offset %rbx, -24
	xorl	%eax, %eax
	## InlineAsm Start
	cpuid
	## InlineAsm End
	## InlineAsm Start
	rdtsc
	## InlineAsm End
                                        ## kill: def $edx killed $edx def $rdx
	shlq	$32, %rdx
	movl	%eax, %eax
	orq	%rdx, %rax
	popq	%rbx
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__Z8stop_tscy           ## -- Begin function _Z8stop_tscy
	.p2align	4, 0x90
__Z8stop_tscy:                          ## @_Z8stop_tscy
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%rbx
	.cfi_offset %rbx, -24
	## InlineAsm Start
	rdtsc
	## InlineAsm End
	movl	%edx, %esi
	movl	%eax, %r8d
	xorl	%eax, %eax
	## InlineAsm Start
	cpuid
	## InlineAsm End
	shlq	$32, %rsi
	movl	%r8d, %eax
	orq	%rsi, %rax
	subq	%rdi, %rax
	popq	%rbx
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__ZNSt3__16vectorIPFvPKdPdiENS_9allocatorIS5_EEED1Ev ## -- Begin function _ZNSt3__16vectorIPFvPKdPdiENS_9allocatorIS5_EEED1Ev
	.weak_def_can_be_hidden	__ZNSt3__16vectorIPFvPKdPdiENS_9allocatorIS5_EEED1Ev
	.p2align	4, 0x90
__ZNSt3__16vectorIPFvPKdPdiENS_9allocatorIS5_EEED1Ev: ## @_ZNSt3__16vectorIPFvPKdPdiENS_9allocatorIS5_EEED1Ev
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	%rdi, %rax
	movq	(%rdi), %rdi
	testq	%rdi, %rdi
	je	LBB3_1
## %bb.2:
	movq	%rdi, 8(%rax)
	popq	%rbp
	jmp	__ZdlPv                 ## TAILCALL
LBB3_1:
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEED1Ev ## -- Begin function _ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEED1Ev
	.weak_def_can_be_hidden	__ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEED1Ev
	.p2align	4, 0x90
__ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEED1Ev: ## @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEED1Ev
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%rbx
	pushq	%rax
	.cfi_offset %rbx, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	(%rdi), %r15
	testq	%r15, %r15
	je	LBB4_8
## %bb.1:
	movq	%rdi, %r14
	movq	8(%rdi), %rax
	cmpq	%r15, %rax
	je	LBB4_2
	.p2align	4, 0x90
LBB4_3:                                 ## =>This Inner Loop Header: Depth=1
	leaq	-24(%rax), %rbx
	testb	$1, -24(%rax)
	je	LBB4_5
## %bb.4:                               ##   in Loop: Header=BB4_3 Depth=1
	movq	-8(%rax), %rdi
	callq	__ZdlPv
LBB4_5:                                 ##   in Loop: Header=BB4_3 Depth=1
	movq	%rbx, %rax
	cmpq	%rbx, %r15
	jne	LBB4_3
## %bb.6:
	movq	(%r14), %rdi
	jmp	LBB4_7
LBB4_8:
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB4_2:
	movq	%r15, %rdi
LBB4_7:
	movq	%r15, 8(%r14)
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	jmp	__ZdlPv                 ## TAILCALL
	.cfi_endproc
                                        ## -- End function
	.globl	__ZNSt3__16vectorIiNS_9allocatorIiEEED1Ev ## -- Begin function _ZNSt3__16vectorIiNS_9allocatorIiEEED1Ev
	.weak_def_can_be_hidden	__ZNSt3__16vectorIiNS_9allocatorIiEEED1Ev
	.p2align	4, 0x90
__ZNSt3__16vectorIiNS_9allocatorIiEEED1Ev: ## @_ZNSt3__16vectorIiNS_9allocatorIiEEED1Ev
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	%rdi, %rax
	movq	(%rdi), %rdi
	testq	%rdi, %rdi
	je	LBB5_1
## %bb.2:
	movq	%rdi, 8(%rax)
	popq	%rbp
	jmp	__ZdlPv                 ## TAILCALL
LBB5_1:
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3               ## -- Begin function _Z5randsPdmm
LCPI6_0:
	.quad	4751297606875873280     ## double 4294967296
LCPI6_1:
	.quad	4318952042648305664     ## double 5.4210108624275222E-20
LCPI6_2:
	.quad	-4616189618054758400    ## double -1
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__Z5randsPdmm
	.p2align	4, 0x90
__Z5randsPdmm:                          ## @_Z5randsPdmm
Lfunc_begin0:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception0
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$2520, %rsp             ## imm = 0x9D8
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rdx, %r14
	movq	%rsi, %r15
	movq	%rdi, %r12
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, -2560(%rbp)
	movq	$0, -2544(%rbp)
	movb	$24, -2560(%rbp)
	movabsq	$7021803615734293551, %rax ## imm = 0x6172752F7665642F
	movq	%rax, -2559(%rbp)
	movl	$1836016750, -2551(%rbp) ## imm = 0x6D6F646E
	movb	$0, -2547(%rbp)
Ltmp0:
	leaq	-48(%rbp), %rdi
	leaq	-2560(%rbp), %rsi
	callq	__ZNSt3__113random_deviceC1ERKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE
Ltmp1:
## %bb.1:
	testb	$1, -2560(%rbp)
	je	LBB6_3
## %bb.2:
	movq	-2544(%rbp), %rdi
	callq	__ZdlPv
LBB6_3:
Ltmp3:
	leaq	-48(%rbp), %rdi
	callq	__ZNSt3__113random_deviceclEv
                                        ## kill: def $eax killed $eax def $rax
Ltmp4:
## %bb.4:
	movl	%eax, -2560(%rbp)
	movl	$1, %ecx
	movl	$2, %edx
	jmp	LBB6_5
	.p2align	4, 0x90
LBB6_15:                                ##   in Loop: Header=BB6_5 Depth=1
	leaq	1(%rcx), %rax
	movl	%esi, %edi
	shrl	$30, %edi
	xorl	%esi, %edi
	imull	$1812433253, %edi, %esi ## imm = 0x6C078965
	addl	%esi, %eax
	addl	%edx, %esi
	movl	%esi, -2560(%rbp,%rdx,4)
	addq	$2, %rcx
	addq	$2, %rdx
LBB6_5:                                 ## =>This Inner Loop Header: Depth=1
	movl	%eax, %esi
	shrl	$30, %esi
	xorl	%eax, %esi
	imull	$1812433253, %esi, %esi ## imm = 0x6C078965
	addl	%ecx, %esi
	movl	%esi, -2564(%rbp,%rdx,4)
	cmpq	$624, %rdx              ## imm = 0x270
	jne	LBB6_15
## %bb.6:
	movq	$0, -64(%rbp)
	imulq	%r15, %r14
	testq	%r14, %r14
	je	LBB6_10
## %bb.7:
	xorl	%r11d, %r11d
	movabsq	$945986875574848801, %r9 ## imm = 0xD20D20D20D20D21
	movq	%r14, %r8
	vmovsd	LCPI6_0(%rip), %xmm0    ## xmm0 = mem[0],zero
	vmovsd	LCPI6_1(%rip), %xmm1    ## xmm1 = mem[0],zero
	vmovsd	LCPI6_2(%rip), %xmm2    ## xmm2 = mem[0],zero
	xorl	%r10d, %r10d
	.p2align	4, 0x90
LBB6_8:                                 ## =>This Inner Loop Header: Depth=1
	leaq	1(%r11), %r15
	movq	%r15, %rax
	shrq	$4, %rax
	mulq	%r9
	shrq	%rdx
	imulq	$624, %rdx, %rcx        ## imm = 0x270
	movl	-2560(%rbp,%r11,4), %edi
	movl	$-2147483648, %esi      ## imm = 0x80000000
	andl	%esi, %edi
	leaq	397(%r11), %rax
	subq	%rcx, %r15
	shrq	$4, %rax
	mulq	%r9
	movl	-2560(%rbp,%r15,4), %eax
	movl	%eax, %ecx
	andl	$2147483646, %ecx       ## imm = 0x7FFFFFFE
	shrq	%rdx
	imulq	$624, %rdx, %rdx        ## imm = 0x270
	orl	%edi, %ecx
	negq	%rdx
	leaq	397(%r11,%rdx), %rdx
	andl	$1, %eax
	shrl	%ecx
	imull	$-1727483681, %eax, %eax ## imm = 0x9908B0DF
	xorl	-2560(%rbp,%rdx,4), %eax
	xorl	%ecx, %eax
	movl	%eax, -2560(%rbp,%r11,4)
	movl	%eax, %ecx
	shrl	$11, %ecx
	xorl	%eax, %ecx
	movl	%ecx, %edi
	shll	$7, %edi
	andl	$-1658038656, %edi      ## imm = 0x9D2C5680
	leaq	1(%r15), %rax
	shrq	$4, %rax
	xorl	%ecx, %edi
	movl	%edi, %ecx
	mulq	%r9
	shrq	%rdx
	shll	$15, %ecx
	imulq	$624, %rdx, %rax        ## imm = 0x270
	negq	%rax
	leaq	1(%r15,%rax), %r11
	andl	$-272236544, %ecx       ## imm = 0xEFC60000
	movl	-2560(%rbp,%r15,4), %r13d
	movl	-2560(%rbp,%r11,4), %r14d
	leaq	397(%r15), %rbx
	movq	%rbx, %rax
	andl	%esi, %r13d
	movl	%r14d, %esi
	shrq	$4, %rax
	mulq	%r9
	xorl	%edi, %ecx
	andl	$2147483646, %esi       ## imm = 0x7FFFFFFE
	shrq	%rdx
	imulq	$624, %rdx, %rax        ## imm = 0x270
	orl	%r13d, %esi
	subq	%rax, %rbx
	movl	%ecx, %eax
	shrl	$18, %eax
	andl	$1, %r14d
	shrl	%esi
	imull	$-1727483681, %r14d, %edx ## imm = 0x9908B0DF
	xorl	-2560(%rbp,%rbx,4), %edx
	xorl	%ecx, %eax
	xorl	%esi, %edx
	movl	%edx, -2560(%rbp,%r15,4)
	movl	%edx, %ecx
	shrl	$11, %ecx
	xorl	%edx, %ecx
	movl	%ecx, %edx
	shll	$7, %edx
	andl	$-1658038656, %edx      ## imm = 0x9D2C5680
	xorl	%ecx, %edx
	movl	%edx, %ecx
	shll	$15, %ecx
	andl	$-272236544, %ecx       ## imm = 0xEFC60000
	xorl	%edx, %ecx
	movl	%ecx, %edx
	shrl	$18, %edx
	xorl	%ecx, %edx
	vcvtsi2sdq	%rdx, %xmm5, %xmm3
	vcvtsi2sdq	%rax, %xmm5, %xmm4
	vmulsd	%xmm0, %xmm3, %xmm3
	vaddsd	%xmm4, %xmm3, %xmm3
	vmulsd	%xmm1, %xmm3, %xmm3
	vaddsd	%xmm3, %xmm3, %xmm3
	vaddsd	%xmm2, %xmm3, %xmm3
	vmovsd	%xmm3, (%r12,%r10,8)
	incq	%r10
	cmpq	%r10, %r8
	jne	LBB6_8
## %bb.9:
	movq	%r11, -64(%rbp)
LBB6_10:
	leaq	-48(%rbp), %rdi
	callq	__ZNSt3__113random_deviceD1Ev
	addq	$2520, %rsp             ## imm = 0x9D8
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB6_13:
Ltmp5:
	movq	%rax, %rbx
	leaq	-48(%rbp), %rdi
	callq	__ZNSt3__113random_deviceD1Ev
	movq	%rbx, %rdi
	callq	__Unwind_Resume
	ud2
LBB6_11:
Ltmp2:
	movq	%rax, %rbx
	testb	$1, -2560(%rbp)
	je	LBB6_14
## %bb.12:
	movq	-2544(%rbp), %rdi
	callq	__ZdlPv
LBB6_14:
	movq	%rbx, %rdi
	callq	__Unwind_Resume
	ud2
Lfunc_end0:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table6:
Lexception0:
	.byte	255                     ## @LPStart Encoding = omit
	.byte	255                     ## @TType Encoding = omit
	.byte	1                       ## Call site Encoding = uleb128
	.uleb128 Lcst_end0-Lcst_begin0
Lcst_begin0:
	.uleb128 Ltmp0-Lfunc_begin0     ## >> Call Site 1 <<
	.uleb128 Ltmp1-Ltmp0            ##   Call between Ltmp0 and Ltmp1
	.uleb128 Ltmp2-Lfunc_begin0     ##     jumps to Ltmp2
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp3-Lfunc_begin0     ## >> Call Site 2 <<
	.uleb128 Ltmp4-Ltmp3            ##   Call between Ltmp3 and Ltmp4
	.uleb128 Ltmp5-Lfunc_begin0     ##     jumps to Ltmp5
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp4-Lfunc_begin0     ## >> Call Site 3 <<
	.uleb128 Lfunc_end0-Ltmp4       ##   Call between Ltmp4 and Lfunc_end0
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
Lcst_end0:
	.p2align	2
                                        ## -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__Z5buildPPdii          ## -- Begin function _Z5buildPPdii
	.p2align	4, 0x90
__Z5buildPPdii:                         ## @_Z5buildPPdii
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%rbx
	pushq	%rax
	.cfi_offset %rbx, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movl	%edx, %r14d
	movl	%esi, %ebx
	movq	%rdi, %r15
	movl	%edx, %eax
	imull	%esi, %eax
	movslq	%eax, %rdi
	shlq	$3, %rdi
	callq	_malloc
	movq	%rax, (%r15)
	movslq	%ebx, %rsi
	movslq	%r14d, %rdx
	movq	%rax, %rdi
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	jmp	__Z5randsPdmm           ## TAILCALL
	.cfi_endproc
                                        ## -- End function
	.globl	__Z7destroyPd           ## -- Begin function _Z7destroyPd
	.p2align	4, 0x90
__Z7destroyPd:                          ## @_Z7destroyPd
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	popq	%rbp
	jmp	_free                   ## TAILCALL
	.cfi_endproc
                                        ## -- End function
	.globl	__Z18register_functionsv ## -- Begin function _Z18register_functionsv
	.p2align	4, 0x90
__Z18register_functionsv:               ## @_Z18register_functionsv
Lfunc_begin1:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception1
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%rbx
	subq	$56, %rsp
	.cfi_offset %rbx, -24
	vxorps	%xmm0, %xmm0, %xmm0
	vmovaps	%xmm0, -64(%rbp)
	movq	$0, -48(%rbp)
	movb	$18, -64(%rbp)
	movabsq	$8028074745928228931, %rax ## imm = 0x6F69737265562043
	movq	%rax, -63(%rbp)
	movw	$110, -55(%rbp)
Ltmp6:
	movq	__Z20complex_conversion_cPKdPdi@GOTPCREL(%rip), %rdi
	leaq	-64(%rbp), %rsi
	movl	$5, %edx
	callq	__Z12add_functionPFvPKdPdiENSt3__112basic_stringIcNS4_11char_traitsIcEENS4_9allocatorIcEEEEi
Ltmp7:
## %bb.1:
	testb	$1, -64(%rbp)
	je	LBB9_3
## %bb.2:
	movq	-48(%rbp), %rdi
	callq	__ZdlPv
LBB9_3:
	vxorps	%xmm0, %xmm0, %xmm0
	vmovaps	%xmm0, -32(%rbp)
	movq	$0, -16(%rbp)
	movb	$22, -32(%rbp)
	movabsq	$8318822882290980417, %rax ## imm = 0x7372655620585641
	movq	%rax, -31(%rbp)
	movl	$7237481, -23(%rbp)     ## imm = 0x6E6F69
Ltmp9:
	movq	__Z22complex_conversion_avxPKdPdi@GOTPCREL(%rip), %rdi
	leaq	-32(%rbp), %rsi
	movl	$5, %edx
	callq	__Z12add_functionPFvPKdPdiENSt3__112basic_stringIcNS4_11char_traitsIcEENS4_9allocatorIcEEEEi
Ltmp10:
## %bb.4:
	testb	$1, -32(%rbp)
	je	LBB9_6
## %bb.5:
	movq	-16(%rbp), %rdi
	callq	__ZdlPv
LBB9_6:
	addq	$56, %rsp
	popq	%rbx
	popq	%rbp
	retq
LBB9_9:
Ltmp11:
	movq	%rax, %rbx
	testb	$1, -32(%rbp)
	je	LBB9_12
## %bb.10:
	movq	-16(%rbp), %rdi
	jmp	LBB9_11
LBB9_7:
Ltmp8:
	movq	%rax, %rbx
	testb	$1, -64(%rbp)
	je	LBB9_12
## %bb.8:
	movq	-48(%rbp), %rdi
LBB9_11:
	callq	__ZdlPv
LBB9_12:
	movq	%rbx, %rdi
	callq	__Unwind_Resume
	ud2
Lfunc_end1:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table9:
Lexception1:
	.byte	255                     ## @LPStart Encoding = omit
	.byte	255                     ## @TType Encoding = omit
	.byte	1                       ## Call site Encoding = uleb128
	.uleb128 Lcst_end1-Lcst_begin1
Lcst_begin1:
	.uleb128 Ltmp6-Lfunc_begin1     ## >> Call Site 1 <<
	.uleb128 Ltmp7-Ltmp6            ##   Call between Ltmp6 and Ltmp7
	.uleb128 Ltmp8-Lfunc_begin1     ##     jumps to Ltmp8
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp9-Lfunc_begin1     ## >> Call Site 2 <<
	.uleb128 Ltmp10-Ltmp9           ##   Call between Ltmp9 and Ltmp10
	.uleb128 Ltmp11-Lfunc_begin1    ##     jumps to Ltmp11
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp10-Lfunc_begin1    ## >> Call Site 3 <<
	.uleb128 Lfunc_end1-Ltmp10      ##   Call between Ltmp10 and Lfunc_end1
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
Lcst_end1:
	.p2align	2
                                        ## -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__Z12add_functionPFvPKdPdiENSt3__112basic_stringIcNS4_11char_traitsIcEENS4_9allocatorIcEEEEi ## -- Begin function _Z12add_functionPFvPKdPdiENSt3__112basic_stringIcNS4_11char_traitsIcEENS4_9allocatorIcEEEEi
	.p2align	4, 0x90
__Z12add_functionPFvPKdPdiENSt3__112basic_stringIcNS4_11char_traitsIcEENS4_9allocatorIcEEEEi: ## @_Z12add_functionPFvPKdPdiENSt3__112basic_stringIcNS4_11char_traitsIcEENS4_9allocatorIcEEEEi
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$24, %rsp
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movl	%edx, %r14d
	movq	%rsi, %rbx
	movq	_userFuncs+8(%rip), %r13
	movq	_userFuncs+16(%rip), %r15
	cmpq	%r15, %r13
	je	LBB10_2
## %bb.1:
	movq	%rdi, (%r13)
	addq	$8, _userFuncs+8(%rip)
	movq	_funcNames+8(%rip), %rdi
	cmpq	_funcNames+16(%rip), %rdi
	jb	LBB10_14
	jmp	LBB10_15
LBB10_2:
	movq	%rbx, -64(%rbp)         ## 8-byte Spill
	movq	_userFuncs(%rip), %rsi
	subq	%rsi, %r13
	movq	%r13, %r12
	sarq	$3, %r12
	leaq	1(%r12), %rax
	movq	%rax, %rcx
	shrq	$61, %rcx
	jne	LBB10_30
## %bb.3:
	movabsq	$2305843009213693951, %rcx ## imm = 0x1FFFFFFFFFFFFFFF
	subq	%rsi, %r15
	movq	%r15, %rdx
	sarq	$3, %rdx
	movabsq	$1152921504606846974, %rbx ## imm = 0xFFFFFFFFFFFFFFE
	cmpq	%rbx, %rdx
	movl	%r14d, -44(%rbp)        ## 4-byte Spill
	ja	LBB10_4
## %bb.5:
	sarq	$2, %r15
	cmpq	%rax, %r15
	cmovbq	%rax, %r15
	testq	%r15, %r15
	je	LBB10_6
## %bb.7:
	movq	%rdi, %rbx
	movq	%rsi, -56(%rbp)         ## 8-byte Spill
	cmpq	%rcx, %r15
	jbe	LBB10_8
	jmp	LBB10_31
LBB10_4:
	movq	%rdi, %rbx
	movq	%rsi, -56(%rbp)         ## 8-byte Spill
	movq	%rcx, %r15
LBB10_8:
	leaq	(,%r15,8), %rdi
	callq	__Znwm
	movq	%rax, %r14
	movq	-56(%rbp), %rsi         ## 8-byte Reload
	movq	%rbx, %rdi
LBB10_9:
	leaq	(%r14,%r15,8), %r15
	movq	%rdi, (%r14,%r12,8)
	leaq	8(%r14,%r12,8), %r12
	testq	%r13, %r13
	jle	LBB10_11
## %bb.10:
	movq	%r14, %rdi
	movq	%r13, %rdx
	movq	%rsi, %rbx
	callq	_memcpy
	movq	%rbx, %rsi
LBB10_11:
	movq	%r14, _userFuncs(%rip)
	movq	%r12, _userFuncs+8(%rip)
	movq	%r15, _userFuncs+16(%rip)
	testq	%rsi, %rsi
	movl	-44(%rbp), %r14d        ## 4-byte Reload
	movq	-64(%rbp), %rbx         ## 8-byte Reload
	je	LBB10_13
## %bb.12:
	movq	%rsi, %rdi
	callq	__ZdlPv
LBB10_13:
	movq	_funcNames+8(%rip), %rdi
	cmpq	_funcNames+16(%rip), %rdi
	jae	LBB10_15
LBB10_14:
	movq	%rbx, %rsi
	callq	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1ERKS5_
	addq	$24, _funcNames+8(%rip)
	movq	_funcFlops+8(%rip), %r12
	movq	_funcFlops+16(%rip), %rbx
	cmpq	%rbx, %r12
	je	LBB10_18
LBB10_17:
	movl	%r14d, (%r12)
	addq	$4, %r12
	movq	%r12, _funcFlops+8(%rip)
	jmp	LBB10_29
LBB10_15:
	leaq	_funcNames(%rip), %rdi
	movq	%rbx, %rsi
	callq	__ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE24__emplace_back_slow_pathIJRS6_EEEvDpOT_
	movq	_funcFlops+8(%rip), %r12
	movq	_funcFlops+16(%rip), %rbx
	cmpq	%rbx, %r12
	jne	LBB10_17
LBB10_18:
	movq	_funcFlops(%rip), %r15
	subq	%r15, %r12
	movq	%r12, %r13
	sarq	$2, %r13
	leaq	1(%r13), %rax
	movq	%rax, %rcx
	shrq	$62, %rcx
	jne	LBB10_32
## %bb.19:
	movabsq	$4611686018427387903, %rcx ## imm = 0x3FFFFFFFFFFFFFFF
	subq	%r15, %rbx
	movq	%rbx, %rdx
	sarq	$2, %rdx
	movabsq	$2305843009213693951, %rsi ## imm = 0x1FFFFFFFFFFFFFFF
	cmpq	%rsi, %rdx
	movl	%r14d, -44(%rbp)        ## 4-byte Spill
	jae	LBB10_20
## %bb.21:
	sarq	%rbx
	cmpq	%rax, %rbx
	cmovbq	%rax, %rbx
	testq	%rbx, %rbx
	je	LBB10_22
## %bb.23:
	cmpq	%rcx, %rbx
	jbe	LBB10_24
LBB10_31:
	callq	__ZNSt3__1L20__throw_length_errorEPKc
LBB10_20:
	movq	%rcx, %rbx
LBB10_24:
	leaq	(,%rbx,4), %rdi
	callq	__Znwm
	movq	%rax, %r14
LBB10_25:
	leaq	(%r14,%rbx,4), %rcx
	movl	-44(%rbp), %eax         ## 4-byte Reload
	movl	%eax, (%r14,%r13,4)
	leaq	4(%r14,%r13,4), %rbx
	testq	%r12, %r12
	jle	LBB10_27
## %bb.26:
	movq	%r14, %rdi
	movq	%r15, %rsi
	movq	%r12, %rdx
	movq	%rcx, %r12
	callq	_memcpy
	movq	%r12, %rcx
LBB10_27:
	movq	%r14, _funcFlops(%rip)
	movq	%rbx, _funcFlops+8(%rip)
	movq	%rcx, _funcFlops+16(%rip)
	testq	%r15, %r15
	je	LBB10_29
## %bb.28:
	movq	%r15, %rdi
	callq	__ZdlPv
LBB10_29:
	incl	_numFuncs(%rip)
	addq	$24, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB10_6:
	xorl	%r15d, %r15d
	xorl	%r14d, %r14d
	jmp	LBB10_9
LBB10_22:
	xorl	%ebx, %ebx
	xorl	%r14d, %r14d
	jmp	LBB10_25
LBB10_30:
	leaq	_userFuncs(%rip), %rdi
	callq	__ZNKSt3__120__vector_base_commonILb1EE20__throw_length_errorEv
LBB10_32:
	leaq	_funcFlops(%rip), %rdi
	callq	__ZNKSt3__120__vector_base_commonILb1EE20__throw_length_errorEv
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3               ## -- Begin function _Z8checksumPKdS0_i
LCPI11_0:
	.quad	4607182418800017408     ## double 1
	.section	__TEXT,__literal16,16byte_literals
	.p2align	4
LCPI11_1:
	.quad	9223372036854775807     ## double NaN
	.quad	9223372036854775807     ## double NaN
LCPI11_2:
	.quad	-9223372036854775808    ## double -0
	.quad	-9223372036854775808    ## double -0
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__Z8checksumPKdS0_i
	.p2align	4, 0x90
__Z8checksumPKdS0_i:                    ## @_Z8checksumPKdS0_i
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	testl	%edx, %edx
	jle	LBB11_1
## %bb.3:
	movl	%edx, %eax
	vxorpd	%xmm0, %xmm0, %xmm0
	movl	$8, %ecx
	vmovsd	LCPI11_0(%rip), %xmm1   ## xmm1 = mem[0],zero
	vmovapd	LCPI11_1(%rip), %xmm2   ## xmm2 = [nan,nan]
	vmovapd	LCPI11_2(%rip), %xmm3   ## xmm3 = [-0.000000e+00,-0.000000e+00]
	.p2align	4, 0x90
LBB11_4:                                ## =>This Inner Loop Header: Depth=1
	vmovsd	-8(%rsi,%rcx), %xmm4    ## xmm4 = mem[0],zero
	vmovsd	(%rsi,%rcx), %xmm5      ## xmm5 = mem[0],zero
	vmulsd	%xmm4, %xmm4, %xmm6
	vaddsd	%xmm1, %xmm6, %xmm6
	vdivsd	%xmm6, %xmm5, %xmm6
	vandpd	%xmm2, %xmm6, %xmm6
	vsqrtsd	%xmm6, %xmm6, %xmm6
	vmulsd	%xmm6, %xmm4, %xmm7
	vandpd	%xmm2, %xmm7, %xmm7
	vandpd	%xmm3, %xmm5, %xmm5
	vorpd	%xmm5, %xmm7, %xmm5
	vmulsd	%xmm5, %xmm4, %xmm4
	vandpd	%xmm2, %xmm6, %xmm6
	vandpd	%xmm3, %xmm4, %xmm4
	vorpd	%xmm4, %xmm6, %xmm4
	vsubsd	-8(%rdi,%rcx), %xmm5, %xmm5
	vmulsd	%xmm5, %xmm5, %xmm5
	vaddsd	%xmm5, %xmm0, %xmm0
	vsubsd	(%rdi,%rcx), %xmm4, %xmm4
	vmulsd	%xmm4, %xmm4, %xmm4
	vaddsd	%xmm4, %xmm0, %xmm0
	addq	$16, %rcx
	decq	%rax
	jne	LBB11_4
## %bb.2:
	popq	%rbp
	retq
LBB11_1:
	vxorps	%xmm0, %xmm0, %xmm0
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3               ## -- Begin function main
LCPI12_0:
	.quad	4607182418800017408     ## double 1
LCPI12_3:
	.quad	4562254508917369340     ## double 0.001
	.section	__TEXT,__literal16,16byte_literals
	.p2align	4
LCPI12_1:
	.quad	9223372036854775807     ## double NaN
	.quad	9223372036854775807     ## double NaN
LCPI12_2:
	.quad	-9223372036854775808    ## double -0
	.quad	-9223372036854775808    ## double -0
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main
	.p2align	4, 0x90
_main:                                  ## @main
Lfunc_begin2:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception2
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$56, %rsp
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	__ZNSt3__14coutE@GOTPCREL(%rip), %rbx
	leaq	L_.str.5(%rip), %rsi
	movl	$18, %edx
	movq	%rbx, %rdi
	callq	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
	callq	__Z18register_functionsv
	movl	_numFuncs(%rip), %esi
	testl	%esi, %esi
	je	LBB12_1
## %bb.15:
	movq	__ZNSt3__14coutE@GOTPCREL(%rip), %r15
	movq	%r15, %rdi
	callq	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEi
	leaq	L_.str.9(%rip), %rsi
	movl	$22, %edx
	movq	%rax, %rdi
	callq	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
	movq	%rax, %rbx
	movq	(%rax), %rax
	movq	-24(%rax), %rsi
	addq	%rbx, %rsi
	leaq	-48(%rbp), %r14
	movq	%r14, %rdi
	callq	__ZNKSt3__18ios_base6getlocEv
Ltmp12:
	movq	__ZNSt3__15ctypeIcE2idE@GOTPCREL(%rip), %rsi
	movq	%r14, %rdi
	callq	__ZNKSt3__16locale9use_facetERNS0_2idE
Ltmp13:
## %bb.16:
	movq	(%rax), %rcx
Ltmp14:
	movl	$10, %esi
	movq	%rax, %rdi
	callq	*56(%rcx)
Ltmp15:
## %bb.17:
	movl	%eax, %r14d
	leaq	-48(%rbp), %rdi
	callq	__ZNSt3__16localeD1Ev
	movsbl	%r14b, %esi
	movq	%rbx, %rdi
	callq	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE3putEc
	movq	%rbx, %rdi
	callq	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE5flushEv
	movl	$32768, %edi            ## imm = 0x8000
	callq	_malloc
	movq	%rax, %r14
	movl	$4096, %esi             ## imm = 0x1000
	movl	$1, %edx
	movq	%rax, %rdi
	callq	__Z5randsPdmm
	movl	$32768, %edi            ## imm = 0x8000
	callq	_malloc
	movq	%rax, %rbx
	movl	$4096, %esi             ## imm = 0x1000
	movl	$1, %edx
	movq	%rax, %rdi
	callq	__Z5randsPdmm
	cmpl	$0, _numFuncs(%rip)
	jle	LBB12_26
## %bb.18:
	xorl	%r12d, %r12d
	.p2align	4, 0x90
LBB12_19:                               ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB12_20 Depth 2
	movl	$4096, %esi             ## imm = 0x1000
	movl	$1, %edx
	movq	%rbx, %rdi
	callq	__Z5randsPdmm
	movq	_userFuncs(%rip), %rax
	movl	$2048, %edx             ## imm = 0x800
	movq	%r14, %rdi
	movq	%rbx, %rsi
	callq	*(%rax,%r12,8)
	vmovapd	LCPI12_2(%rip), %xmm7   ## xmm7 = [-0.000000e+00,-0.000000e+00]
	vmovapd	LCPI12_1(%rip), %xmm6   ## xmm6 = [nan,nan]
	vmovsd	LCPI12_0(%rip), %xmm5   ## xmm5 = mem[0],zero
	vxorpd	%xmm0, %xmm0, %xmm0
	xorl	%eax, %eax
	.p2align	4, 0x90
LBB12_20:                               ##   Parent Loop BB12_19 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	vmovsd	(%rbx,%rax), %xmm1      ## xmm1 = mem[0],zero
	vmovsd	8(%rbx,%rax), %xmm2     ## xmm2 = mem[0],zero
	vmulsd	%xmm1, %xmm1, %xmm3
	vaddsd	%xmm5, %xmm3, %xmm3
	vdivsd	%xmm3, %xmm2, %xmm3
	vandpd	%xmm6, %xmm3, %xmm3
	vsqrtsd	%xmm3, %xmm3, %xmm3
	vmulsd	%xmm3, %xmm1, %xmm4
	vandpd	%xmm6, %xmm4, %xmm4
	vandpd	%xmm7, %xmm2, %xmm2
	vorpd	%xmm2, %xmm4, %xmm2
	vmulsd	%xmm2, %xmm1, %xmm1
	vandpd	%xmm6, %xmm3, %xmm3
	vandpd	%xmm7, %xmm1, %xmm1
	vorpd	%xmm1, %xmm3, %xmm1
	vsubsd	(%r14,%rax), %xmm2, %xmm2
	vmulsd	%xmm2, %xmm2, %xmm2
	vaddsd	%xmm2, %xmm0, %xmm0
	vsubsd	8(%r14,%rax), %xmm1, %xmm1
	vmulsd	%xmm1, %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	addq	$16, %rax
	cmpq	$32768, %rax            ## imm = 0x8000
	jne	LBB12_20
## %bb.21:                              ##   in Loop: Header=BB12_19 Depth=1
	vucomisd	LCPI12_3(%rip), %xmm0
	jbe	LBB12_25
## %bb.22:                              ##   in Loop: Header=BB12_19 Depth=1
	movl	$32, %edx
	movq	__ZNSt3__14coutE@GOTPCREL(%rip), %rdi
	leaq	L_.str.10(%rip), %rsi
	callq	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
	movq	%rax, %rdi
	movl	%r12d, %esi
	callq	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEi
	movl	$15, %edx
	movq	%rax, %rdi
	leaq	L_.str.11(%rip), %rsi
	callq	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
	movq	%rax, %r13
	movq	(%rax), %rax
	movq	-24(%rax), %rsi
	addq	%r13, %rsi
	leaq	-48(%rbp), %r15
	movq	%r15, %rdi
	callq	__ZNKSt3__18ios_base6getlocEv
Ltmp17:
	movq	%r15, %rdi
	movq	__ZNSt3__15ctypeIcE2idE@GOTPCREL(%rip), %rsi
	callq	__ZNKSt3__16locale9use_facetERNS0_2idE
Ltmp18:
## %bb.23:                              ##   in Loop: Header=BB12_19 Depth=1
	movq	(%rax), %rcx
Ltmp19:
	movl	$10, %esi
	movq	%rax, %rdi
	callq	*56(%rcx)
Ltmp20:
## %bb.24:                              ##   in Loop: Header=BB12_19 Depth=1
	movl	%eax, %r15d
	leaq	-48(%rbp), %rdi
	callq	__ZNSt3__16localeD1Ev
	movsbl	%r15b, %esi
	movq	%r13, %rdi
	callq	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE3putEc
	movq	%r13, %rdi
	callq	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE5flushEv
	movq	__ZNSt3__14coutE@GOTPCREL(%rip), %r15
LBB12_25:                               ##   in Loop: Header=BB12_19 Depth=1
	incq	%r12
	movslq	_numFuncs(%rip), %rax
	cmpq	%rax, %r12
	jl	LBB12_19
LBB12_26:
	movq	%r14, %rdi
	callq	_free
	movq	%rbx, %rdi
	callq	_free
	cmpl	$0, _numFuncs(%rip)
	jle	LBB12_41
## %bb.27:
	xorl	%r12d, %r12d
	leaq	-48(%rbp), %r13
	xorl	%r14d, %r14d
	.p2align	4, 0x90
LBB12_28:                               ## =>This Inner Loop Header: Depth=1
	movq	_userFuncs(%rip), %rax
	movq	(%rax,%r14,8), %rbx
	movq	_funcNames(%rip), %rsi
	addq	%r12, %rsi
	leaq	-88(%rbp), %rdi
	callq	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1ERKS5_
	movq	_funcFlops(%rip), %rax
	movl	(%rax,%r14,4), %edx
Ltmp22:
	movq	%rbx, %rdi
	callq	__Z9perf_testPFvPKdPdiENSt3__112basic_stringIcNS4_11char_traitsIcEENS4_9allocatorIcEEEEi
	vmovsd	%xmm0, -64(%rbp)        ## 8-byte Spill
Ltmp23:
## %bb.29:                              ##   in Loop: Header=BB12_28 Depth=1
	testb	$1, -88(%rbp)
	je	LBB12_31
## %bb.30:                              ##   in Loop: Header=BB12_28 Depth=1
	movq	-72(%rbp), %rdi
	callq	__ZdlPv
LBB12_31:                               ##   in Loop: Header=BB12_28 Depth=1
	movq	(%r15), %rax
	movq	-24(%rax), %rsi
	addq	%r15, %rsi
	movq	%r13, %rdi
	callq	__ZNKSt3__18ios_base6getlocEv
Ltmp25:
	movq	%r13, %rdi
	movq	__ZNSt3__15ctypeIcE2idE@GOTPCREL(%rip), %rsi
	callq	__ZNKSt3__16locale9use_facetERNS0_2idE
Ltmp26:
## %bb.32:                              ##   in Loop: Header=BB12_28 Depth=1
	movq	(%rax), %rcx
Ltmp27:
	movl	$10, %esi
	movq	%rax, %rdi
	callq	*56(%rcx)
Ltmp28:
## %bb.33:                              ##   in Loop: Header=BB12_28 Depth=1
	movl	%eax, %ebx
	movq	%r13, %rdi
	callq	__ZNSt3__16localeD1Ev
	movsbl	%bl, %esi
	movq	%r15, %rdi
	callq	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE3putEc
	movq	%r15, %rdi
	callq	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE5flushEv
	movl	$9, %edx
	movq	%r15, %rdi
	leaq	L_.str.12(%rip), %rsi
	callq	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
	movq	_funcNames(%rip), %rcx
	movzbl	(%rcx,%r12), %edx
	testb	$1, %dl
	movq	%r14, -56(%rbp)         ## 8-byte Spill
	je	LBB12_34
## %bb.35:                              ##   in Loop: Header=BB12_28 Depth=1
	movq	16(%rcx,%r12), %rsi
	movq	8(%rcx,%r12), %rdx
	jmp	LBB12_36
	.p2align	4, 0x90
LBB12_34:                               ##   in Loop: Header=BB12_28 Depth=1
	shrq	%rdx
	leaq	1(%rcx,%r12), %rsi
LBB12_36:                               ##   in Loop: Header=BB12_28 Depth=1
	movq	%r15, %r14
	movq	%rax, %rdi
	callq	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
	movq	%rax, %r13
	movq	(%rax), %rax
	movq	-24(%rax), %rsi
	addq	%r13, %rsi
	leaq	-48(%rbp), %rbx
	movq	%rbx, %rdi
	callq	__ZNKSt3__18ios_base6getlocEv
Ltmp30:
	movq	%rbx, %rdi
	movq	__ZNSt3__15ctypeIcE2idE@GOTPCREL(%rip), %rsi
	callq	__ZNKSt3__16locale9use_facetERNS0_2idE
Ltmp31:
## %bb.37:                              ##   in Loop: Header=BB12_28 Depth=1
	movq	(%rax), %rcx
Ltmp32:
	movl	$10, %esi
	movq	%rax, %rdi
	callq	*56(%rcx)
Ltmp33:
## %bb.38:                              ##   in Loop: Header=BB12_28 Depth=1
	movl	%eax, %ebx
	leaq	-48(%rbp), %r15
	movq	%r15, %rdi
	callq	__ZNSt3__16localeD1Ev
	movsbl	%bl, %esi
	movq	%r13, %rdi
	callq	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE3putEc
	movq	%r13, %rdi
	movq	%r15, %r13
	callq	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE5flushEv
	movq	%r14, %rdi
	vmovsd	-64(%rbp), %xmm0        ## 8-byte Reload
                                        ## xmm0 = mem[0],zero
	callq	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEd
	movl	$16, %edx
	movq	%rax, %rdi
	leaq	L_.str.13(%rip), %rsi
	callq	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
	movq	%rax, %r15
	movq	(%rax), %rax
	movq	-24(%rax), %rsi
	addq	%r15, %rsi
	movq	%r13, %rdi
	callq	__ZNKSt3__18ios_base6getlocEv
Ltmp35:
	movq	%r13, %rdi
	movq	__ZNSt3__15ctypeIcE2idE@GOTPCREL(%rip), %rsi
	callq	__ZNKSt3__16locale9use_facetERNS0_2idE
Ltmp36:
## %bb.39:                              ##   in Loop: Header=BB12_28 Depth=1
	movq	(%rax), %rcx
Ltmp37:
	movl	$10, %esi
	movq	%rax, %rdi
	callq	*56(%rcx)
Ltmp38:
## %bb.40:                              ##   in Loop: Header=BB12_28 Depth=1
	movl	%eax, %ebx
	movq	%r13, %rdi
	callq	__ZNSt3__16localeD1Ev
	movsbl	%bl, %esi
	movq	%r15, %rdi
	callq	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE3putEc
	movq	%r15, %rdi
	callq	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE5flushEv
	movq	-56(%rbp), %r14         ## 8-byte Reload
	incq	%r14
	movslq	_numFuncs(%rip), %rax
	addq	$24, %r12
	cmpq	%rax, %r14
	movq	__ZNSt3__14coutE@GOTPCREL(%rip), %r15
	jl	LBB12_28
	jmp	LBB12_41
LBB12_1:
	movq	(%rbx), %rax
	addq	-24(%rax), %rbx
	leaq	-48(%rbp), %r14
	movq	%r14, %rdi
	movq	%rbx, %rsi
	callq	__ZNKSt3__18ios_base6getlocEv
Ltmp40:
	movq	__ZNSt3__15ctypeIcE2idE@GOTPCREL(%rip), %rsi
	movq	%r14, %rdi
	callq	__ZNKSt3__16locale9use_facetERNS0_2idE
Ltmp41:
## %bb.2:
	movq	(%rax), %rcx
Ltmp42:
	movl	$10, %esi
	movq	%rax, %rdi
	callq	*56(%rcx)
Ltmp43:
## %bb.3:
	movl	%eax, %ebx
	leaq	-48(%rbp), %rdi
	callq	__ZNSt3__16localeD1Ev
	movsbl	%bl, %esi
	movq	__ZNSt3__14coutE@GOTPCREL(%rip), %rbx
	movq	%rbx, %rdi
	callq	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE3putEc
	movq	%rbx, %rdi
	callq	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE5flushEv
	leaq	L_.str.6(%rip), %rsi
	movl	$50, %edx
	movq	%rbx, %rdi
	callq	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
	movq	%rax, %rbx
	movq	(%rax), %rax
	movq	-24(%rax), %rsi
	addq	%rbx, %rsi
	leaq	-48(%rbp), %r14
	movq	%r14, %rdi
	callq	__ZNKSt3__18ios_base6getlocEv
Ltmp45:
	movq	__ZNSt3__15ctypeIcE2idE@GOTPCREL(%rip), %rsi
	movq	%r14, %rdi
	callq	__ZNKSt3__16locale9use_facetERNS0_2idE
Ltmp46:
## %bb.4:
	movq	(%rax), %rcx
Ltmp47:
	movl	$10, %esi
	movq	%rax, %rdi
	callq	*56(%rcx)
Ltmp48:
## %bb.5:
	movl	%eax, %r14d
	leaq	-48(%rbp), %rdi
	callq	__ZNSt3__16localeD1Ev
	movsbl	%r14b, %esi
	movq	%rbx, %rdi
	callq	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE3putEc
	movq	%rbx, %rdi
	callq	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE5flushEv
	movq	__ZNSt3__14coutE@GOTPCREL(%rip), %rdi
	leaq	L_.str.7(%rip), %rsi
	movl	$52, %edx
	callq	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
	movq	%rax, %rbx
	movq	(%rax), %rax
	movq	-24(%rax), %rsi
	addq	%rbx, %rsi
	leaq	-48(%rbp), %r14
	movq	%r14, %rdi
	callq	__ZNKSt3__18ios_base6getlocEv
Ltmp50:
	movq	__ZNSt3__15ctypeIcE2idE@GOTPCREL(%rip), %rsi
	movq	%r14, %rdi
	callq	__ZNKSt3__16locale9use_facetERNS0_2idE
Ltmp51:
## %bb.6:
	movq	(%rax), %rcx
Ltmp52:
	movl	$10, %esi
	movq	%rax, %rdi
	callq	*56(%rcx)
Ltmp53:
## %bb.7:
	movl	%eax, %r14d
	leaq	-48(%rbp), %rdi
	callq	__ZNSt3__16localeD1Ev
	movsbl	%r14b, %esi
	movq	%rbx, %rdi
	callq	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE3putEc
	movq	%rbx, %rdi
	callq	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE5flushEv
	movq	__ZNSt3__14coutE@GOTPCREL(%rip), %rdi
	leaq	L_.str.8(%rip), %rsi
	movl	$19, %edx
	callq	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
	movq	%rax, %rbx
	movq	(%rax), %rax
	movq	-24(%rax), %rsi
	addq	%rbx, %rsi
	leaq	-48(%rbp), %r14
	movq	%r14, %rdi
	callq	__ZNKSt3__18ios_base6getlocEv
Ltmp55:
	movq	__ZNSt3__15ctypeIcE2idE@GOTPCREL(%rip), %rsi
	movq	%r14, %rdi
	callq	__ZNKSt3__16locale9use_facetERNS0_2idE
Ltmp56:
## %bb.8:
	movq	(%rax), %rcx
Ltmp57:
	movl	$10, %esi
	movq	%rax, %rdi
	callq	*56(%rcx)
Ltmp58:
## %bb.9:
	movl	%eax, %r14d
	leaq	-48(%rbp), %rdi
	callq	__ZNSt3__16localeD1Ev
	movsbl	%r14b, %esi
	movq	%rbx, %rdi
	callq	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE3putEc
	movq	%rbx, %rdi
	callq	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE5flushEv
LBB12_41:
	xorl	%eax, %eax
	addq	$56, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB12_14:
Ltmp59:
	jmp	LBB12_11
LBB12_13:
Ltmp54:
	jmp	LBB12_11
LBB12_12:
Ltmp49:
	jmp	LBB12_11
LBB12_10:
Ltmp44:
	jmp	LBB12_11
LBB12_45:
Ltmp16:
	jmp	LBB12_11
LBB12_42:
Ltmp24:
	movq	%rax, %rbx
	testb	$1, -88(%rbp)
	je	LBB12_44
## %bb.43:
	movq	-72(%rbp), %rdi
	callq	__ZdlPv
	movq	%rbx, %rdi
	callq	__Unwind_Resume
	ud2
LBB12_46:
Ltmp21:
	jmp	LBB12_11
LBB12_49:
Ltmp39:
	jmp	LBB12_11
LBB12_48:
Ltmp34:
	jmp	LBB12_11
LBB12_47:
Ltmp29:
LBB12_11:
	movq	%rax, %rbx
	leaq	-48(%rbp), %rdi
	callq	__ZNSt3__16localeD1Ev
LBB12_44:
	movq	%rbx, %rdi
	callq	__Unwind_Resume
	ud2
Lfunc_end2:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table12:
Lexception2:
	.byte	255                     ## @LPStart Encoding = omit
	.byte	255                     ## @TType Encoding = omit
	.byte	1                       ## Call site Encoding = uleb128
	.uleb128 Lcst_end2-Lcst_begin2
Lcst_begin2:
	.uleb128 Lfunc_begin2-Lfunc_begin2 ## >> Call Site 1 <<
	.uleb128 Ltmp12-Lfunc_begin2    ##   Call between Lfunc_begin2 and Ltmp12
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp12-Lfunc_begin2    ## >> Call Site 2 <<
	.uleb128 Ltmp15-Ltmp12          ##   Call between Ltmp12 and Ltmp15
	.uleb128 Ltmp16-Lfunc_begin2    ##     jumps to Ltmp16
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp15-Lfunc_begin2    ## >> Call Site 3 <<
	.uleb128 Ltmp17-Ltmp15          ##   Call between Ltmp15 and Ltmp17
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp17-Lfunc_begin2    ## >> Call Site 4 <<
	.uleb128 Ltmp20-Ltmp17          ##   Call between Ltmp17 and Ltmp20
	.uleb128 Ltmp21-Lfunc_begin2    ##     jumps to Ltmp21
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp20-Lfunc_begin2    ## >> Call Site 5 <<
	.uleb128 Ltmp22-Ltmp20          ##   Call between Ltmp20 and Ltmp22
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp22-Lfunc_begin2    ## >> Call Site 6 <<
	.uleb128 Ltmp23-Ltmp22          ##   Call between Ltmp22 and Ltmp23
	.uleb128 Ltmp24-Lfunc_begin2    ##     jumps to Ltmp24
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp23-Lfunc_begin2    ## >> Call Site 7 <<
	.uleb128 Ltmp25-Ltmp23          ##   Call between Ltmp23 and Ltmp25
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp25-Lfunc_begin2    ## >> Call Site 8 <<
	.uleb128 Ltmp28-Ltmp25          ##   Call between Ltmp25 and Ltmp28
	.uleb128 Ltmp29-Lfunc_begin2    ##     jumps to Ltmp29
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp28-Lfunc_begin2    ## >> Call Site 9 <<
	.uleb128 Ltmp30-Ltmp28          ##   Call between Ltmp28 and Ltmp30
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp30-Lfunc_begin2    ## >> Call Site 10 <<
	.uleb128 Ltmp33-Ltmp30          ##   Call between Ltmp30 and Ltmp33
	.uleb128 Ltmp34-Lfunc_begin2    ##     jumps to Ltmp34
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp33-Lfunc_begin2    ## >> Call Site 11 <<
	.uleb128 Ltmp35-Ltmp33          ##   Call between Ltmp33 and Ltmp35
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp35-Lfunc_begin2    ## >> Call Site 12 <<
	.uleb128 Ltmp38-Ltmp35          ##   Call between Ltmp35 and Ltmp38
	.uleb128 Ltmp39-Lfunc_begin2    ##     jumps to Ltmp39
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp38-Lfunc_begin2    ## >> Call Site 13 <<
	.uleb128 Ltmp40-Ltmp38          ##   Call between Ltmp38 and Ltmp40
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp40-Lfunc_begin2    ## >> Call Site 14 <<
	.uleb128 Ltmp43-Ltmp40          ##   Call between Ltmp40 and Ltmp43
	.uleb128 Ltmp44-Lfunc_begin2    ##     jumps to Ltmp44
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp43-Lfunc_begin2    ## >> Call Site 15 <<
	.uleb128 Ltmp45-Ltmp43          ##   Call between Ltmp43 and Ltmp45
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp45-Lfunc_begin2    ## >> Call Site 16 <<
	.uleb128 Ltmp48-Ltmp45          ##   Call between Ltmp45 and Ltmp48
	.uleb128 Ltmp49-Lfunc_begin2    ##     jumps to Ltmp49
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp48-Lfunc_begin2    ## >> Call Site 17 <<
	.uleb128 Ltmp50-Ltmp48          ##   Call between Ltmp48 and Ltmp50
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp50-Lfunc_begin2    ## >> Call Site 18 <<
	.uleb128 Ltmp53-Ltmp50          ##   Call between Ltmp50 and Ltmp53
	.uleb128 Ltmp54-Lfunc_begin2    ##     jumps to Ltmp54
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp53-Lfunc_begin2    ## >> Call Site 19 <<
	.uleb128 Ltmp55-Ltmp53          ##   Call between Ltmp53 and Ltmp55
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp55-Lfunc_begin2    ## >> Call Site 20 <<
	.uleb128 Ltmp58-Ltmp55          ##   Call between Ltmp55 and Ltmp58
	.uleb128 Ltmp59-Lfunc_begin2    ##     jumps to Ltmp59
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp58-Lfunc_begin2    ## >> Call Site 21 <<
	.uleb128 Lfunc_end2-Ltmp58      ##   Call between Ltmp58 and Lfunc_end2
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
Lcst_end2:
	.p2align	2
                                        ## -- End function
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3               ## -- Begin function _Z9perf_testPFvPKdPdiENSt3__112basic_stringIcNS4_11char_traitsIcEENS4_9allocatorIcEEEEi
LCPI13_0:
	.quad	4607182418800017408     ## double 1
LCPI13_3:
	.quad	4711630319722168320     ## double 1.0E+7
LCPI13_4:
	.quad	4611686018427387904     ## double 2
LCPI13_5:
	.quad	4656722014701092864     ## double 2048
	.section	__TEXT,__literal16,16byte_literals
	.p2align	4
LCPI13_1:
	.long	1127219200              ## 0x43300000
	.long	1160773632              ## 0x45300000
	.long	0                       ## 0x0
	.long	0                       ## 0x0
LCPI13_2:
	.quad	4841369599423283200     ## double 4503599627370496
	.quad	4985484787499139072     ## double 1.9342813113834067E+25
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__Z9perf_testPFvPKdPdiENSt3__112basic_stringIcNS4_11char_traitsIcEENS4_9allocatorIcEEEEi
	.p2align	4, 0x90
__Z9perf_testPFvPKdPdiENSt3__112basic_stringIcNS4_11char_traitsIcEENS4_9allocatorIcEEEEi: ## @_Z9perf_testPFvPKdPdiENSt3__112basic_stringIcNS4_11char_traitsIcEENS4_9allocatorIcEEEEi
Lfunc_begin3:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception3
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$88, %rsp
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movl	%edx, -108(%rbp)        ## 4-byte Spill
	movq	%rdi, %r13
	movl	$32768, %edi            ## imm = 0x8000
	callq	_malloc
	movq	%rax, %r15
	movl	$4096, %esi             ## imm = 0x1000
	movl	$1, %edx
	movq	%rax, %rdi
	callq	__Z5randsPdmm
	movl	$32768, %edi            ## imm = 0x8000
	callq	_malloc
	movq	%rax, %r12
	movl	$4096, %esi             ## imm = 0x1000
	movl	$1, %edx
	movq	%rax, %rdi
	callq	__Z5randsPdmm
	vmovsd	LCPI13_0(%rip), %xmm0   ## xmm0 = mem[0],zero
	movl	$100, %eax
	movq	%rax, -48(%rbp)         ## 8-byte Spill
	.p2align	4, 0x90
LBB13_1:                                ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB13_25 Depth 2
	movq	-48(%rbp), %rax         ## 8-byte Reload
	vcvtsi2sdq	%rax, %xmm2, %xmm1
	vmulsd	%xmm1, %xmm0, %xmm0
	vcvttsd2si	%xmm0, %rsi
	xorl	%eax, %eax
	## InlineAsm Start
	cpuid
	## InlineAsm End
	## InlineAsm Start
	rdtsc
	## InlineAsm End
                                        ## kill: def $edx killed $edx def $rdx
	shlq	$32, %rdx
	movl	%eax, %r14d
	orq	%rdx, %r14
	movq	%rsi, %rbx
	movq	%rsi, %rax
	movq	%rsi, -48(%rbp)         ## 8-byte Spill
	testq	%rsi, %rsi
	je	LBB13_2
	.p2align	4, 0x90
LBB13_25:                               ##   Parent Loop BB13_1 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movl	$2048, %edx             ## imm = 0x800
	movq	%r15, %rdi
	movq	%r12, %rsi
	callq	*%r13
	decq	%rbx
	jne	LBB13_25
LBB13_2:                                ##   in Loop: Header=BB13_1 Depth=1
	## InlineAsm Start
	rdtsc
	## InlineAsm End
                                        ## kill: def $edx killed $edx def $rdx
	movl	%eax, %ecx
	xorl	%eax, %eax
	shlq	$32, %rdx
	movl	%ecx, %ecx
	orq	%rdx, %rcx
	subq	%r14, %rcx
	vmovq	%rcx, %xmm0
	vpunpckldq	LCPI13_1(%rip), %xmm0, %xmm0 ## xmm0 = xmm0[0],mem[0],xmm0[1],mem[1]
	vsubpd	LCPI13_2(%rip), %xmm0, %xmm0
	vhaddpd	%xmm0, %xmm0, %xmm0
	## InlineAsm Start
	cpuid
	## InlineAsm End
	vmovsd	LCPI13_3(%rip), %xmm1   ## xmm1 = mem[0],zero
	vdivsd	%xmm0, %xmm1, %xmm0
	vucomisd	LCPI13_4(%rip), %xmm0
	ja	LBB13_1
## %bb.3:
	leaq	-80(%rbp), %r14
	movq	%r14, -80(%rbp)
	movq	%r14, -72(%rbp)
	movq	$0, -64(%rbp)
	movq	-48(%rbp), %rax         ## 8-byte Reload
	vcvtsi2sdq	%rax, %xmm2, %xmm0
	vmovsd	%xmm0, -120(%rbp)       ## 8-byte Spill
	testq	%rax, %rax
	je	LBB13_12
## %bb.4:
	xorl	%eax, %eax
	.p2align	4, 0x90
LBB13_5:                                ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB13_6 Depth 2
	movq	%rax, -104(%rbp)        ## 8-byte Spill
	xorl	%eax, %eax
	## InlineAsm Start
	cpuid
	## InlineAsm End
	## InlineAsm Start
	rdtsc
	## InlineAsm End
                                        ## kill: def $edx killed $edx def $rdx
	shlq	$32, %rdx
	movl	%eax, %eax
	orq	%rdx, %rax
	movq	%rax, -96(%rbp)         ## 8-byte Spill
	xorl	%ebx, %ebx
	.p2align	4, 0x90
LBB13_6:                                ##   Parent Loop BB13_5 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
Ltmp60:
	movl	$2048, %edx             ## imm = 0x800
	movq	%r15, %rdi
	movq	%r12, %rsi
	callq	*%r13
Ltmp61:
## %bb.7:                               ##   in Loop: Header=BB13_6 Depth=2
	incq	%rbx
	cmpq	-48(%rbp), %rbx         ## 8-byte Folded Reload
	jb	LBB13_6
## %bb.8:                               ##   in Loop: Header=BB13_5 Depth=1
	## InlineAsm Start
	rdtsc
	## InlineAsm End
                                        ## kill: def $edx killed $edx def $rdx
	movq	%rdx, -88(%rbp)         ## 8-byte Spill
	movl	%eax, -112(%rbp)        ## 4-byte Spill
	xorl	%eax, %eax
	## InlineAsm Start
	cpuid
	## InlineAsm End
Ltmp63:
	movl	$24, %edi
	callq	__Znwm
Ltmp64:
## %bb.9:                               ##   in Loop: Header=BB13_5 Depth=1
	movq	-88(%rbp), %rdx         ## 8-byte Reload
	shlq	$32, %rdx
	movl	-112(%rbp), %ecx        ## 4-byte Reload
	orq	%rdx, %rcx
	subq	-96(%rbp), %rcx         ## 8-byte Folded Reload
	vmovq	%rcx, %xmm0
	vpunpckldq	LCPI13_1(%rip), %xmm0, %xmm0 ## xmm0 = xmm0[0],mem[0],xmm0[1],mem[1]
	vsubpd	LCPI13_2(%rip), %xmm0, %xmm0
	vhaddpd	%xmm0, %xmm0, %xmm0
	vdivsd	-120(%rbp), %xmm0, %xmm0 ## 8-byte Folded Reload
	vmovsd	%xmm0, 16(%rax)
	movq	%r14, 8(%rax)
	movq	-80(%rbp), %rcx
	movq	%rcx, (%rax)
	movq	%rax, 8(%rcx)
	movq	%rax, -80(%rbp)
	incq	-64(%rbp)
	movq	-104(%rbp), %rax        ## 8-byte Reload
	incq	%rax
	cmpq	$100, %rax
	jb	LBB13_5
	jmp	LBB13_15
LBB13_12:
	xorl	%eax, %eax
	.p2align	4, 0x90
LBB13_13:                               ## =>This Inner Loop Header: Depth=1
	movq	%rax, -48(%rbp)         ## 8-byte Spill
	xorl	%eax, %eax
	## InlineAsm Start
	cpuid
	## InlineAsm End
	## InlineAsm Start
	rdtsc
	## InlineAsm End
	movl	%edx, %r13d
	movl	%eax, -88(%rbp)         ## 4-byte Spill
	## InlineAsm Start
	rdtsc
	## InlineAsm End
                                        ## kill: def $edx killed $edx def $rdx
	movq	%rdx, -104(%rbp)        ## 8-byte Spill
	movl	%eax, -96(%rbp)         ## 4-byte Spill
	xorl	%eax, %eax
	## InlineAsm Start
	cpuid
	## InlineAsm End
Ltmp66:
	movl	$24, %edi
	callq	__Znwm
Ltmp67:
## %bb.14:                              ##   in Loop: Header=BB13_13 Depth=1
	shlq	$32, %r13
	movl	-88(%rbp), %ecx         ## 4-byte Reload
	orq	%r13, %rcx
	movq	-104(%rbp), %rsi        ## 8-byte Reload
	shlq	$32, %rsi
	movl	-96(%rbp), %edx         ## 4-byte Reload
	orq	%rsi, %rdx
	subq	%rcx, %rdx
	vmovq	%rdx, %xmm0
	vpunpckldq	LCPI13_1(%rip), %xmm0, %xmm0 ## xmm0 = xmm0[0],mem[0],xmm0[1],mem[1]
	vsubpd	LCPI13_2(%rip), %xmm0, %xmm0
	vhaddpd	%xmm0, %xmm0, %xmm0
	vdivsd	-120(%rbp), %xmm0, %xmm0 ## 8-byte Folded Reload
	vmovsd	%xmm0, 16(%rax)
	movq	%r14, 8(%rax)
	movq	-80(%rbp), %rcx
	movq	%rcx, (%rax)
	movq	%rax, 8(%rcx)
	movq	%rax, -80(%rbp)
	incq	-64(%rbp)
	movq	-48(%rbp), %rax         ## 8-byte Reload
	incq	%rax
	cmpq	$100, %rax
	jb	LBB13_13
LBB13_15:
	movq	%r15, %rdi
	callq	_free
	movq	%r12, %rdi
	callq	_free
	movq	-72(%rbp), %rdi
	movq	-64(%rbp), %rdx
Ltmp69:
	leaq	-80(%rbp), %r15
	leaq	-56(%rbp), %rcx
	movq	%r15, %rsi
	callq	__ZNSt3__14listIdNS_9allocatorIdEEE6__sortINS_6__lessIddEEEENS_15__list_iteratorIdPvEES9_S9_mRT_
Ltmp70:
## %bb.16:
	movq	-72(%rbp), %rdi
	movl	-108(%rbp), %eax        ## 4-byte Reload
	vcvtsi2sdl	%eax, %xmm2, %xmm0
	vmulsd	LCPI13_5(%rip), %xmm0, %xmm0
	vdivsd	16(%rdi), %xmm0, %xmm0
	vmovsd	%xmm0, -48(%rbp)        ## 8-byte Spill
	cmpq	$0, -64(%rbp)
	je	LBB13_19
## %bb.17:
	movq	-80(%rbp), %rax
	movq	8(%rax), %rcx
	movq	(%rdi), %rdx
	movq	%rcx, 8(%rdx)
	movq	8(%rax), %rax
	movq	%rdx, (%rax)
	movq	$0, -64(%rbp)
	cmpq	%r15, %rdi
	je	LBB13_19
	.p2align	4, 0x90
LBB13_18:                               ## =>This Inner Loop Header: Depth=1
	movq	8(%rdi), %rbx
	callq	__ZdlPv
	movq	%rbx, %rdi
	cmpq	%r15, %rbx
	jne	LBB13_18
LBB13_19:
	vmovsd	-48(%rbp), %xmm0        ## 8-byte Reload
                                        ## xmm0 = mem[0],zero
	addq	$88, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB13_20:
Ltmp71:
	movq	%rax, %r15
	cmpq	$0, -64(%rbp)
	jne	LBB13_22
	jmp	LBB13_24
LBB13_26:
Ltmp68:
	movq	%rax, %r15
	cmpq	$0, -64(%rbp)
	jne	LBB13_22
	jmp	LBB13_24
LBB13_10:
Ltmp65:
	movq	%rax, %r15
	cmpq	$0, -64(%rbp)
	jne	LBB13_22
	jmp	LBB13_24
LBB13_11:
Ltmp62:
	movq	%rax, %r15
	cmpq	$0, -64(%rbp)
	je	LBB13_24
LBB13_22:
	movq	-80(%rbp), %rax
	movq	-72(%rbp), %rdi
	movq	8(%rax), %rcx
	movq	(%rdi), %rdx
	movq	%rcx, 8(%rdx)
	movq	8(%rax), %rax
	movq	%rdx, (%rax)
	movq	$0, -64(%rbp)
	cmpq	%r14, %rdi
	je	LBB13_24
	.p2align	4, 0x90
LBB13_23:                               ## =>This Inner Loop Header: Depth=1
	movq	8(%rdi), %rbx
	callq	__ZdlPv
	movq	%rbx, %rdi
	cmpq	%r14, %rbx
	jne	LBB13_23
LBB13_24:
	movq	%r15, %rdi
	callq	__Unwind_Resume
	ud2
Lfunc_end3:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table13:
Lexception3:
	.byte	255                     ## @LPStart Encoding = omit
	.byte	255                     ## @TType Encoding = omit
	.byte	1                       ## Call site Encoding = uleb128
	.uleb128 Lcst_end3-Lcst_begin3
Lcst_begin3:
	.uleb128 Lfunc_begin3-Lfunc_begin3 ## >> Call Site 1 <<
	.uleb128 Ltmp60-Lfunc_begin3    ##   Call between Lfunc_begin3 and Ltmp60
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp60-Lfunc_begin3    ## >> Call Site 2 <<
	.uleb128 Ltmp61-Ltmp60          ##   Call between Ltmp60 and Ltmp61
	.uleb128 Ltmp62-Lfunc_begin3    ##     jumps to Ltmp62
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp63-Lfunc_begin3    ## >> Call Site 3 <<
	.uleb128 Ltmp64-Ltmp63          ##   Call between Ltmp63 and Ltmp64
	.uleb128 Ltmp65-Lfunc_begin3    ##     jumps to Ltmp65
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp66-Lfunc_begin3    ## >> Call Site 4 <<
	.uleb128 Ltmp67-Ltmp66          ##   Call between Ltmp66 and Ltmp67
	.uleb128 Ltmp68-Lfunc_begin3    ##     jumps to Ltmp68
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp69-Lfunc_begin3    ## >> Call Site 5 <<
	.uleb128 Ltmp70-Ltmp69          ##   Call between Ltmp69 and Ltmp70
	.uleb128 Ltmp71-Lfunc_begin3    ##     jumps to Ltmp71
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp70-Lfunc_begin3    ## >> Call Site 6 <<
	.uleb128 Lfunc_end3-Ltmp70      ##   Call between Ltmp70 and Lfunc_end3
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
Lcst_end3:
	.p2align	2
                                        ## -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.private_extern	___clang_call_terminate ## -- Begin function __clang_call_terminate
	.globl	___clang_call_terminate
	.weak_def_can_be_hidden	___clang_call_terminate
	.p2align	4, 0x90
___clang_call_terminate:                ## @__clang_call_terminate
## %bb.0:
	pushq	%rax
	callq	___cxa_begin_catch
	callq	__ZSt9terminatev
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNSt3__1L20__throw_length_errorEPKc
__ZNSt3__1L20__throw_length_errorEPKc:  ## @_ZNSt3__1L20__throw_length_errorEPKc
Lfunc_begin4:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception4
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r14
	pushq	%rbx
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	movl	$16, %edi
	callq	___cxa_allocate_exception
	movq	%rax, %rbx
Ltmp72:
	movq	%rax, %rdi
	callq	__ZNSt12length_errorC1EPKc
Ltmp73:
## %bb.1:
	movq	__ZTISt12length_error@GOTPCREL(%rip), %rsi
	movq	__ZNSt12length_errorD1Ev@GOTPCREL(%rip), %rdx
	movq	%rbx, %rdi
	callq	___cxa_throw
LBB15_2:
Ltmp74:
	movq	%rax, %r14
	movq	%rbx, %rdi
	callq	___cxa_free_exception
	movq	%r14, %rdi
	callq	__Unwind_Resume
	ud2
Lfunc_end4:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table15:
Lexception4:
	.byte	255                     ## @LPStart Encoding = omit
	.byte	255                     ## @TType Encoding = omit
	.byte	1                       ## Call site Encoding = uleb128
	.uleb128 Lcst_end4-Lcst_begin4
Lcst_begin4:
	.uleb128 Lfunc_begin4-Lfunc_begin4 ## >> Call Site 1 <<
	.uleb128 Ltmp72-Lfunc_begin4    ##   Call between Lfunc_begin4 and Ltmp72
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp72-Lfunc_begin4    ## >> Call Site 2 <<
	.uleb128 Ltmp73-Ltmp72          ##   Call between Ltmp72 and Ltmp73
	.uleb128 Ltmp74-Lfunc_begin4    ##     jumps to Ltmp74
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp73-Lfunc_begin4    ## >> Call Site 3 <<
	.uleb128 Lfunc_end4-Ltmp73      ##   Call between Ltmp73 and Lfunc_end4
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
Lcst_end4:
	.p2align	2
                                        ## -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.p2align	4, 0x90         ## -- Begin function _ZNSt12length_errorC1EPKc
__ZNSt12length_errorC1EPKc:             ## @_ZNSt12length_errorC1EPKc
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%rbx
	pushq	%rax
	.cfi_offset %rbx, -24
	movq	%rdi, %rbx
	leaq	L_.str.14(%rip), %rsi
	callq	__ZNSt11logic_errorC2EPKc
	movq	__ZTVSt12length_error@GOTPCREL(%rip), %rax
	addq	$16, %rax
	movq	%rax, (%rbx)
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m ## -- Begin function _ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
	.weak_def_can_be_hidden	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
	.p2align	4, 0x90
__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m: ## @_ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
Lfunc_begin5:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception5
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$40, %rsp
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rdx, %r14
	movq	%rsi, %r15
	movq	%rdi, %rbx
Ltmp75:
	leaq	-80(%rbp), %rdi
	movq	%rbx, %rsi
	callq	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE6sentryC1ERS3_
Ltmp76:
## %bb.1:
	cmpb	$0, -80(%rbp)
	je	LBB17_10
## %bb.2:
	movq	(%rbx), %rax
	movq	-24(%rax), %rax
	leaq	(%rbx,%rax), %r12
	movq	40(%rbx,%rax), %rdi
	movl	8(%rbx,%rax), %r13d
	movl	144(%rbx,%rax), %eax
	cmpl	$-1, %eax
	jne	LBB17_7
## %bb.3:
Ltmp78:
	movq	%rdi, -64(%rbp)         ## 8-byte Spill
	leaq	-56(%rbp), %rdi
	movq	%r12, %rsi
	callq	__ZNKSt3__18ios_base6getlocEv
Ltmp79:
## %bb.4:
Ltmp80:
	movq	__ZNSt3__15ctypeIcE2idE@GOTPCREL(%rip), %rsi
	leaq	-56(%rbp), %rdi
	callq	__ZNKSt3__16locale9use_facetERNS0_2idE
Ltmp81:
## %bb.5:
	movq	(%rax), %rcx
Ltmp82:
	movl	$32, %esi
	movq	%rax, %rdi
	callq	*56(%rcx)
	movb	%al, -41(%rbp)          ## 1-byte Spill
Ltmp83:
## %bb.6:
	leaq	-56(%rbp), %rdi
	callq	__ZNSt3__16localeD1Ev
	movsbl	-41(%rbp), %eax         ## 1-byte Folded Reload
	movl	%eax, 144(%r12)
	movq	-64(%rbp), %rdi         ## 8-byte Reload
LBB17_7:
	addq	%r15, %r14
	andl	$176, %r13d
	cmpl	$32, %r13d
	movq	%r15, %rdx
	cmoveq	%r14, %rdx
Ltmp85:
	movsbl	%al, %r9d
	movq	%r15, %rsi
	movq	%r14, %rcx
	movq	%r12, %r8
	callq	__ZNSt3__116__pad_and_outputIcNS_11char_traitsIcEEEENS_19ostreambuf_iteratorIT_T0_EES6_PKS4_S8_S8_RNS_8ios_baseES4_
Ltmp86:
## %bb.8:
	testq	%rax, %rax
	jne	LBB17_10
## %bb.9:
	movq	(%rbx), %rax
	movq	-24(%rax), %rax
	leaq	(%rbx,%rax), %rdi
	movl	32(%rbx,%rax), %esi
	orl	$5, %esi
Ltmp88:
	callq	__ZNSt3__18ios_base5clearEj
Ltmp89:
LBB17_10:
	leaq	-80(%rbp), %rdi
	callq	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE6sentryD1Ev
LBB17_11:
	movq	%rbx, %rax
	addq	$40, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB17_12:
Ltmp90:
	jmp	LBB17_15
LBB17_13:
Ltmp84:
	movq	%rax, %r14
	leaq	-56(%rbp), %rdi
	callq	__ZNSt3__16localeD1Ev
	jmp	LBB17_16
LBB17_14:
Ltmp87:
LBB17_15:
	movq	%rax, %r14
LBB17_16:
	leaq	-80(%rbp), %rdi
	callq	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE6sentryD1Ev
	jmp	LBB17_18
LBB17_17:
Ltmp77:
	movq	%rax, %r14
LBB17_18:
	movq	%r14, %rdi
	callq	___cxa_begin_catch
	movq	(%rbx), %rax
	movq	%rbx, %rdi
	addq	-24(%rax), %rdi
Ltmp91:
	callq	__ZNSt3__18ios_base33__set_badbit_and_consider_rethrowEv
Ltmp92:
## %bb.19:
	callq	___cxa_end_catch
	jmp	LBB17_11
LBB17_20:
Ltmp93:
	movq	%rax, %rbx
Ltmp94:
	callq	___cxa_end_catch
Ltmp95:
## %bb.21:
	movq	%rbx, %rdi
	callq	__Unwind_Resume
	ud2
LBB17_22:
Ltmp96:
	movq	%rax, %rdi
	callq	___clang_call_terminate
Lfunc_end5:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table17:
Lexception5:
	.byte	255                     ## @LPStart Encoding = omit
	.byte	155                     ## @TType Encoding = indirect pcrel sdata4
	.uleb128 Lttbase0-Lttbaseref0
Lttbaseref0:
	.byte	1                       ## Call site Encoding = uleb128
	.uleb128 Lcst_end5-Lcst_begin5
Lcst_begin5:
	.uleb128 Ltmp75-Lfunc_begin5    ## >> Call Site 1 <<
	.uleb128 Ltmp76-Ltmp75          ##   Call between Ltmp75 and Ltmp76
	.uleb128 Ltmp77-Lfunc_begin5    ##     jumps to Ltmp77
	.byte	1                       ##   On action: 1
	.uleb128 Ltmp78-Lfunc_begin5    ## >> Call Site 2 <<
	.uleb128 Ltmp79-Ltmp78          ##   Call between Ltmp78 and Ltmp79
	.uleb128 Ltmp87-Lfunc_begin5    ##     jumps to Ltmp87
	.byte	1                       ##   On action: 1
	.uleb128 Ltmp80-Lfunc_begin5    ## >> Call Site 3 <<
	.uleb128 Ltmp83-Ltmp80          ##   Call between Ltmp80 and Ltmp83
	.uleb128 Ltmp84-Lfunc_begin5    ##     jumps to Ltmp84
	.byte	1                       ##   On action: 1
	.uleb128 Ltmp85-Lfunc_begin5    ## >> Call Site 4 <<
	.uleb128 Ltmp86-Ltmp85          ##   Call between Ltmp85 and Ltmp86
	.uleb128 Ltmp87-Lfunc_begin5    ##     jumps to Ltmp87
	.byte	1                       ##   On action: 1
	.uleb128 Ltmp88-Lfunc_begin5    ## >> Call Site 5 <<
	.uleb128 Ltmp89-Ltmp88          ##   Call between Ltmp88 and Ltmp89
	.uleb128 Ltmp90-Lfunc_begin5    ##     jumps to Ltmp90
	.byte	1                       ##   On action: 1
	.uleb128 Ltmp89-Lfunc_begin5    ## >> Call Site 6 <<
	.uleb128 Ltmp91-Ltmp89          ##   Call between Ltmp89 and Ltmp91
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp91-Lfunc_begin5    ## >> Call Site 7 <<
	.uleb128 Ltmp92-Ltmp91          ##   Call between Ltmp91 and Ltmp92
	.uleb128 Ltmp93-Lfunc_begin5    ##     jumps to Ltmp93
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp92-Lfunc_begin5    ## >> Call Site 8 <<
	.uleb128 Ltmp94-Ltmp92          ##   Call between Ltmp92 and Ltmp94
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp94-Lfunc_begin5    ## >> Call Site 9 <<
	.uleb128 Ltmp95-Ltmp94          ##   Call between Ltmp94 and Ltmp95
	.uleb128 Ltmp96-Lfunc_begin5    ##     jumps to Ltmp96
	.byte	1                       ##   On action: 1
	.uleb128 Ltmp95-Lfunc_begin5    ## >> Call Site 10 <<
	.uleb128 Lfunc_end5-Ltmp95      ##   Call between Ltmp95 and Lfunc_end5
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
Lcst_end5:
	.byte	1                       ## >> Action Record 1 <<
                                        ##   Catch TypeInfo 1
	.byte	0                       ##   No further actions
	.p2align	2
                                        ## >> Catch TypeInfos <<
	.long	0                       ## TypeInfo 1
Lttbase0:
	.p2align	2
                                        ## -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.private_extern	__ZNSt3__116__pad_and_outputIcNS_11char_traitsIcEEEENS_19ostreambuf_iteratorIT_T0_EES6_PKS4_S8_S8_RNS_8ios_baseES4_ ## -- Begin function _ZNSt3__116__pad_and_outputIcNS_11char_traitsIcEEEENS_19ostreambuf_iteratorIT_T0_EES6_PKS4_S8_S8_RNS_8ios_baseES4_
	.globl	__ZNSt3__116__pad_and_outputIcNS_11char_traitsIcEEEENS_19ostreambuf_iteratorIT_T0_EES6_PKS4_S8_S8_RNS_8ios_baseES4_
	.weak_def_can_be_hidden	__ZNSt3__116__pad_and_outputIcNS_11char_traitsIcEEEENS_19ostreambuf_iteratorIT_T0_EES6_PKS4_S8_S8_RNS_8ios_baseES4_
	.p2align	4, 0x90
__ZNSt3__116__pad_and_outputIcNS_11char_traitsIcEEEENS_19ostreambuf_iteratorIT_T0_EES6_PKS4_S8_S8_RNS_8ios_baseES4_: ## @_ZNSt3__116__pad_and_outputIcNS_11char_traitsIcEEEENS_19ostreambuf_iteratorIT_T0_EES6_PKS4_S8_S8_RNS_8ios_baseES4_
Lfunc_begin6:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception6
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$56, %rsp
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	testq	%rdi, %rdi
	je	LBB18_19
## %bb.1:
	movq	%r8, %r12
	movq	%rcx, %r15
	movq	%rdi, %r13
	movl	%r9d, -68(%rbp)         ## 4-byte Spill
	movq	%rcx, %rax
	subq	%rsi, %rax
	movq	24(%r8), %rcx
	xorl	%r14d, %r14d
	subq	%rax, %rcx
	cmovgq	%rcx, %r14
	movq	%rdx, -88(%rbp)         ## 8-byte Spill
	movq	%rdx, %rbx
	subq	%rsi, %rbx
	testq	%rbx, %rbx
	jle	LBB18_3
## %bb.2:
	movq	(%r13), %rax
	movq	%r13, %rdi
	movq	%rbx, %rdx
	callq	*96(%rax)
	cmpq	%rbx, %rax
	jne	LBB18_19
LBB18_3:
	testq	%r14, %r14
	jle	LBB18_15
## %bb.4:
	movq	%r12, -80(%rbp)         ## 8-byte Spill
	vxorps	%xmm0, %xmm0, %xmm0
	vmovaps	%xmm0, -64(%rbp)
	movq	$0, -48(%rbp)
	cmpq	$23, %r14
	jae	LBB18_8
## %bb.5:
	movl	%r14d, %eax
	addb	%r14b, %al
	movb	%al, -64(%rbp)
	leaq	-63(%rbp), %rbx
	movq	%rbx, %r12
	jmp	LBB18_9
LBB18_8:
	leaq	16(%r14), %rbx
	andq	$-16, %rbx
	movq	%rbx, %rdi
	callq	__Znwm
	movq	%rax, %r12
	movq	%rax, -48(%rbp)
	orq	$1, %rbx
	movq	%rbx, -64(%rbp)
	movq	%r14, -56(%rbp)
	leaq	-63(%rbp), %rbx
LBB18_9:
	movzbl	-68(%rbp), %esi         ## 1-byte Folded Reload
	movq	%r12, %rdi
	movq	%r14, %rdx
	callq	_memset
	movb	$0, (%r12,%r14)
	testb	$1, -64(%rbp)
	je	LBB18_11
## %bb.10:
	movq	-48(%rbp), %rbx
LBB18_11:
	movq	(%r13), %rax
Ltmp97:
	movq	%r13, %rdi
	movq	%rbx, %rsi
	movq	%r14, %rdx
	callq	*96(%rax)
Ltmp98:
	movq	-80(%rbp), %r12         ## 8-byte Reload
## %bb.12:
	movq	%rax, %rbx
	testb	$1, -64(%rbp)
	je	LBB18_14
## %bb.13:
	movq	-48(%rbp), %rdi
	callq	__ZdlPv
LBB18_14:
	cmpq	%r14, %rbx
	jne	LBB18_19
LBB18_15:
	movq	-88(%rbp), %rsi         ## 8-byte Reload
	subq	%rsi, %r15
	testq	%r15, %r15
	jle	LBB18_17
## %bb.16:
	movq	(%r13), %rax
	movq	%r13, %rdi
	movq	%r15, %rdx
	callq	*96(%rax)
	cmpq	%r15, %rax
	jne	LBB18_19
LBB18_17:
	movq	$0, 24(%r12)
	jmp	LBB18_20
LBB18_19:
	xorl	%r13d, %r13d
LBB18_20:
	movq	%r13, %rax
	addq	$56, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB18_21:
Ltmp99:
	movq	%rax, %rbx
	testb	$1, -64(%rbp)
	je	LBB18_23
## %bb.22:
	movq	-48(%rbp), %rdi
	callq	__ZdlPv
LBB18_23:
	movq	%rbx, %rdi
	callq	__Unwind_Resume
	ud2
Lfunc_end6:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table18:
Lexception6:
	.byte	255                     ## @LPStart Encoding = omit
	.byte	255                     ## @TType Encoding = omit
	.byte	1                       ## Call site Encoding = uleb128
	.uleb128 Lcst_end6-Lcst_begin6
Lcst_begin6:
	.uleb128 Lfunc_begin6-Lfunc_begin6 ## >> Call Site 1 <<
	.uleb128 Ltmp97-Lfunc_begin6    ##   Call between Lfunc_begin6 and Ltmp97
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp97-Lfunc_begin6    ## >> Call Site 2 <<
	.uleb128 Ltmp98-Ltmp97          ##   Call between Ltmp97 and Ltmp98
	.uleb128 Ltmp99-Lfunc_begin6    ##     jumps to Ltmp99
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp98-Lfunc_begin6    ## >> Call Site 3 <<
	.uleb128 Lfunc_end6-Ltmp98      ##   Call between Ltmp98 and Lfunc_end6
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
Lcst_end6:
	.p2align	2
                                        ## -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE24__emplace_back_slow_pathIJRS6_EEEvDpOT_ ## -- Begin function _ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE24__emplace_back_slow_pathIJRS6_EEEvDpOT_
	.weak_def_can_be_hidden	__ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE24__emplace_back_slow_pathIJRS6_EEEvDpOT_
	.p2align	4, 0x90
__ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE24__emplace_back_slow_pathIJRS6_EEEvDpOT_: ## @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE24__emplace_back_slow_pathIJRS6_EEEvDpOT_
Lfunc_begin7:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception7
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	pushq	%rax
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rsi, %r14
	movq	%rdi, %r15
	movabsq	$768614336404564650, %r13 ## imm = 0xAAAAAAAAAAAAAAA
	movq	(%rdi), %rdx
	movq	8(%rdi), %rbx
	subq	%rdx, %rbx
	sarq	$3, %rbx
	movabsq	$-6148914691236517205, %rsi ## imm = 0xAAAAAAAAAAAAAAAB
	imulq	%rsi, %rbx
	leaq	1(%rbx), %rax
	cmpq	%r13, %rax
	ja	LBB19_19
## %bb.1:
	movq	16(%r15), %rcx
	subq	%rdx, %rcx
	sarq	$3, %rcx
	imulq	%rsi, %rcx
	movabsq	$384307168202282324, %rdx ## imm = 0x555555555555554
	cmpq	%rdx, %rcx
	ja	LBB19_4
## %bb.2:
	addq	%rcx, %rcx
	cmpq	%rax, %rcx
	cmovbq	%rax, %rcx
	movq	%rcx, %r13
	testq	%rcx, %rcx
	je	LBB19_3
LBB19_4:
	leaq	(,%r13,8), %rax
	leaq	(%rax,%rax,2), %rdi
	callq	__Znwm
	movq	%rax, %r12
LBB19_5:
	leaq	(%rbx,%rbx,2), %rax
	leaq	(%r12,%rax,8), %rbx
Ltmp100:
	movq	%rbx, %rdi
	movq	%r14, %rsi
	callq	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1ERKS5_
Ltmp101:
## %bb.6:
	leaq	(%r13,%r13,2), %rax
	leaq	(%r12,%rax,8), %rcx
	leaq	24(%rbx), %rdx
	movq	(%r15), %rax
	movq	8(%r15), %rsi
	cmpq	%rax, %rsi
	je	LBB19_20
## %bb.7:
	vxorps	%xmm0, %xmm0, %xmm0
	.p2align	4, 0x90
LBB19_8:                                ## =>This Inner Loop Header: Depth=1
	movq	-8(%rsi), %rdi
	movq	%rdi, -8(%rbx)
	vmovups	-24(%rsi), %xmm1
	vmovups	%xmm1, -24(%rbx)
	vmovups	%xmm0, -24(%rsi)
	movq	$0, -8(%rsi)
	leaq	-24(%rsi), %rsi
	addq	$-24, %rbx
	cmpq	%rsi, %rax
	jne	LBB19_8
## %bb.9:
	movq	(%r15), %r14
	movq	8(%r15), %rax
	jmp	LBB19_10
LBB19_20:
	movq	%rax, %r14
LBB19_10:
	movq	%rbx, (%r15)
	movq	%rdx, 8(%r15)
	movq	%rcx, 16(%r15)
	cmpq	%r14, %rax
	je	LBB19_14
	.p2align	4, 0x90
LBB19_11:                               ## =>This Inner Loop Header: Depth=1
	leaq	-24(%rax), %rbx
	testb	$1, -24(%rax)
	je	LBB19_13
## %bb.12:                              ##   in Loop: Header=BB19_11 Depth=1
	movq	-8(%rax), %rdi
	callq	__ZdlPv
LBB19_13:                               ##   in Loop: Header=BB19_11 Depth=1
	movq	%rbx, %rax
	cmpq	%rbx, %r14
	jne	LBB19_11
LBB19_14:
	testq	%r14, %r14
	je	LBB19_15
## %bb.21:
	movq	%r14, %rdi
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	jmp	__ZdlPv                 ## TAILCALL
LBB19_15:
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB19_3:
	xorl	%r13d, %r13d
	xorl	%r12d, %r12d
	jmp	LBB19_5
LBB19_19:
	movq	%r15, %rdi
	callq	__ZNKSt3__120__vector_base_commonILb1EE20__throw_length_errorEv
LBB19_16:
Ltmp102:
	movq	%rax, %rbx
	testq	%r12, %r12
	je	LBB19_18
## %bb.17:
	movq	%r12, %rdi
	callq	__ZdlPv
LBB19_18:
	movq	%rbx, %rdi
	callq	__Unwind_Resume
	ud2
Lfunc_end7:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table19:
Lexception7:
	.byte	255                     ## @LPStart Encoding = omit
	.byte	255                     ## @TType Encoding = omit
	.byte	1                       ## Call site Encoding = uleb128
	.uleb128 Lcst_end7-Lcst_begin7
Lcst_begin7:
	.uleb128 Lfunc_begin7-Lfunc_begin7 ## >> Call Site 1 <<
	.uleb128 Ltmp100-Lfunc_begin7   ##   Call between Lfunc_begin7 and Ltmp100
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp100-Lfunc_begin7   ## >> Call Site 2 <<
	.uleb128 Ltmp101-Ltmp100        ##   Call between Ltmp100 and Ltmp101
	.uleb128 Ltmp102-Lfunc_begin7   ##     jumps to Ltmp102
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp101-Lfunc_begin7   ## >> Call Site 3 <<
	.uleb128 Lfunc_end7-Ltmp101     ##   Call between Ltmp101 and Lfunc_end7
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
Lcst_end7:
	.p2align	2
                                        ## -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__ZNSt3__14listIdNS_9allocatorIdEEE6__sortINS_6__lessIddEEEENS_15__list_iteratorIdPvEES9_S9_mRT_ ## -- Begin function _ZNSt3__14listIdNS_9allocatorIdEEE6__sortINS_6__lessIddEEEENS_15__list_iteratorIdPvEES9_S9_mRT_
	.weak_def_can_be_hidden	__ZNSt3__14listIdNS_9allocatorIdEEE6__sortINS_6__lessIddEEEENS_15__list_iteratorIdPvEES9_S9_mRT_
	.p2align	4, 0x90
__ZNSt3__14listIdNS_9allocatorIdEEE6__sortINS_6__lessIddEEEENS_15__list_iteratorIdPvEES9_S9_mRT_: ## @_ZNSt3__14listIdNS_9allocatorIdEEE6__sortINS_6__lessIddEEEENS_15__list_iteratorIdPvEES9_S9_mRT_
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	pushq	%rax
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	cmpq	$2, %rdx
	jb	LBB20_1
## %bb.2:
	movq	%rsi, %r14
	jne	LBB20_5
## %bb.3:
	movq	(%r14), %rax
	vmovsd	16(%rdi), %xmm0         ## xmm0 = mem[0],zero
	vucomisd	16(%rax), %xmm0
	jbe	LBB20_1
## %bb.4:
	movq	(%rax), %rcx
	movq	8(%rax), %rdx
	movq	%rdx, 8(%rcx)
	movq	8(%rax), %rdx
	movq	%rcx, (%rdx)
	movq	(%rdi), %rcx
	movq	%rax, 8(%rcx)
	movq	%rcx, (%rax)
	movq	%rax, (%rdi)
	movq	%rdi, 8(%rax)
	jmp	LBB20_30
LBB20_1:
	movq	%rdi, %rax
LBB20_30:
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB20_5:
	movq	%rdx, %r15
	movq	%rdx, %r12
	shrq	%r12
	movq	%rdi, %r13
	je	LBB20_11
## %bb.6:
	leaq	-1(%r12), %rsi
	movq	%r12, %rax
	andq	$7, %rax
	je	LBB20_31
## %bb.7:
	xorl	%edx, %edx
	movq	%rdi, %r13
	.p2align	4, 0x90
LBB20_8:                                ## =>This Inner Loop Header: Depth=1
	movq	8(%r13), %r13
	incq	%rdx
	cmpq	%rdx, %rax
	jne	LBB20_8
## %bb.9:
	movq	%r12, %rax
	subq	%rdx, %rax
	cmpq	$7, %rsi
	jb	LBB20_11
	.p2align	4, 0x90
LBB20_10:                               ## =>This Inner Loop Header: Depth=1
	movq	8(%r13), %rdx
	movq	8(%rdx), %rdx
	movq	8(%rdx), %rdx
	movq	8(%rdx), %rdx
	movq	8(%rdx), %rdx
	movq	8(%rdx), %rdx
	movq	8(%rdx), %rdx
	movq	8(%rdx), %r13
	addq	$-8, %rax
	jg	LBB20_10
LBB20_11:
	movq	%r13, %rsi
	movq	%r12, %rdx
	movq	%rcx, -48(%rbp)         ## 8-byte Spill
	callq	__ZNSt3__14listIdNS_9allocatorIdEEE6__sortINS_6__lessIddEEEENS_15__list_iteratorIdPvEES9_S9_mRT_
	movq	%rax, %rbx
	subq	%r12, %r15
	movq	%r13, %rdi
	movq	%r14, %rsi
	movq	%r15, %rdx
	movq	-48(%rbp), %rcx         ## 8-byte Reload
	callq	__ZNSt3__14listIdNS_9allocatorIdEEE6__sortINS_6__lessIddEEEENS_15__list_iteratorIdPvEES9_S9_mRT_
	movq	%rbx, %rcx
	vmovsd	16(%rbx), %xmm0         ## xmm0 = mem[0],zero
	vucomisd	16(%rax), %xmm0
	jbe	LBB20_17
## %bb.12:
	movq	8(%rax), %r10
	cmpq	%r14, %r10
	je	LBB20_18
	.p2align	4, 0x90
LBB20_14:                               ## =>This Inner Loop Header: Depth=1
	vucomisd	16(%r10), %xmm0
	jbe	LBB20_15
## %bb.13:                              ##   in Loop: Header=BB20_14 Depth=1
	movq	8(%r10), %r10
	cmpq	%r14, %r10
	jne	LBB20_14
LBB20_18:
	movq	%r14, %rdx
	jmp	LBB20_19
LBB20_17:
	movq	8(%rcx), %rbx
	movq	%rax, %r10
	movq	%rcx, %rax
	cmpq	%r10, %rbx
	jne	LBB20_20
	jmp	LBB20_30
LBB20_31:
	movq	%rdi, %r13
	movq	%r12, %rax
	cmpq	$7, %rsi
	jae	LBB20_10
	jmp	LBB20_11
LBB20_15:
	movq	%r10, %rdx
LBB20_19:
	movq	(%rdx), %rdx
	movq	8(%rdx), %rsi
	movq	(%rax), %rdi
	movq	%rsi, 8(%rdi)
	movq	8(%rdx), %rsi
	movq	%rdi, (%rsi)
	movq	(%rcx), %rsi
	movq	8(%rcx), %rbx
	movq	%rax, 8(%rsi)
	movq	%rsi, (%rax)
	movq	%rdx, (%rcx)
	movq	%rcx, 8(%rdx)
	cmpq	%r10, %rbx
	je	LBB20_30
LBB20_20:
	movq	%r10, %r8
	.p2align	4, 0x90
LBB20_21:                               ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB20_25 Depth 2
	cmpq	%r14, %r10
	je	LBB20_30
## %bb.22:                              ##   in Loop: Header=BB20_21 Depth=1
	vmovsd	16(%rbx), %xmm0         ## xmm0 = mem[0],zero
	vucomisd	16(%r10), %xmm0
	jbe	LBB20_27
## %bb.23:                              ##   in Loop: Header=BB20_21 Depth=1
	movq	8(%r10), %rdi
	cmpq	%r14, %rdi
	je	LBB20_28
	.p2align	4, 0x90
LBB20_25:                               ##   Parent Loop BB20_21 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	vucomisd	16(%rdi), %xmm0
	jbe	LBB20_26
## %bb.24:                              ##   in Loop: Header=BB20_25 Depth=2
	movq	8(%rdi), %rdi
	cmpq	%r14, %rdi
	jne	LBB20_25
LBB20_28:                               ##   in Loop: Header=BB20_21 Depth=1
	movq	%r14, %rdx
	jmp	LBB20_29
	.p2align	4, 0x90
LBB20_27:                               ##   in Loop: Header=BB20_21 Depth=1
	movq	8(%rbx), %rdx
	movq	%rdx, %rbx
	cmpq	%r8, %rdx
	jne	LBB20_21
	jmp	LBB20_30
	.p2align	4, 0x90
LBB20_26:                               ##   in Loop: Header=BB20_21 Depth=1
	movq	%rdi, %rdx
LBB20_29:                               ##   in Loop: Header=BB20_21 Depth=1
	movq	(%rdx), %rsi
	cmpq	%r10, %r8
	movq	8(%rsi), %r9
	movq	(%r10), %rdx
	movq	%r9, 8(%rdx)
	movq	8(%rsi), %rcx
	movq	%rdx, (%rcx)
	movq	(%rbx), %rcx
	movq	8(%rbx), %rdx
	cmoveq	%rdi, %r8
	movq	%r10, 8(%rcx)
	movq	%rcx, (%r10)
	movq	%rsi, (%rbx)
	movq	%rbx, 8(%rsi)
	movq	%rdi, %r10
	movq	%rdx, %rbx
	cmpq	%r8, %rdx
	jne	LBB20_21
	jmp	LBB20_30
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__literal16,16byte_literals
	.p2align	4               ## -- Begin function _GLOBAL__sub_I_main.cpp
LCPI21_0:
	.space	16
	.section	__TEXT,__StaticInit,regular,pure_instructions
	.p2align	4, 0x90
__GLOBAL__sub_I_main.cpp:               ## @_GLOBAL__sub_I_main.cpp
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%rbx
	pushq	%rax
	.cfi_offset %rbx, -24
	vxorps	%xmm0, %xmm0, %xmm0
	vmovups	%xmm0, _userFuncs(%rip)
	movq	$0, _userFuncs+16(%rip)
	leaq	_userFuncs(%rip), %rsi
	movq	__ZNSt3__16vectorIPFvPKdPdiENS_9allocatorIS5_EEED1Ev@GOTPCREL(%rip), %rdi
	leaq	___dso_handle(%rip), %rbx
	movq	%rbx, %rdx
	callq	___cxa_atexit
	vxorps	%xmm0, %xmm0, %xmm0
	vmovups	%xmm0, _funcNames(%rip)
	movq	$0, _funcNames+16(%rip)
	leaq	_funcNames(%rip), %rsi
	movq	__ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEED1Ev@GOTPCREL(%rip), %rdi
	movq	%rbx, %rdx
	callq	___cxa_atexit
	vxorps	%xmm0, %xmm0, %xmm0
	vmovups	%xmm0, _funcFlops(%rip)
	movq	$0, _funcFlops+16(%rip)
	leaq	_funcFlops(%rip), %rsi
	movq	__ZNSt3__16vectorIiNS_9allocatorIiEEED1Ev@GOTPCREL(%rip), %rdi
	movq	%rbx, %rdx
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	jmp	___cxa_atexit           ## TAILCALL
	.cfi_endproc
                                        ## -- End function
	.globl	_userFuncs              ## @userFuncs
.zerofill __DATA,__common,_userFuncs,24,3
	.globl	_funcNames              ## @funcNames
.zerofill __DATA,__common,_funcNames,24,3
	.globl	_funcFlops              ## @funcFlops
.zerofill __DATA,__common,_funcFlops,24,3
	.globl	_numFuncs               ## @numFuncs
.zerofill __DATA,__common,_numFuncs,4,2
	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"/dev/urandom"

L_.str.3:                               ## @.str.3
	.asciz	"C Version"

L_.str.4:                               ## @.str.4
	.asciz	"AVX Version"

L_.str.5:                               ## @.str.5
	.asciz	"Starting program. "

L_.str.6:                               ## @.str.6
	.asciz	"No functions registered - nothing for driver to do"

L_.str.7:                               ## @.str.7
	.asciz	"Register functions by calling register_func(f, name)"

L_.str.8:                               ## @.str.8
	.asciz	"in register_funcs()"

L_.str.9:                               ## @.str.9
	.asciz	" functions registered."

L_.str.10:                              ## @.str.10
	.asciz	"ERROR: the results for function "

L_.str.11:                              ## @.str.11
	.asciz	" are incorrect."

L_.str.12:                              ## @.str.12
	.asciz	"Running: "

L_.str.13:                              ## @.str.13
	.asciz	" flops per cycle"

L_.str.14:                              ## @.str.14
	.asciz	"allocator<T>::allocate(size_t n) 'n' exceeds maximum supported size"

	.section	__DATA,__mod_init_func,mod_init_funcs
	.p2align	3
	.quad	__GLOBAL__sub_I_main.cpp

.subsections_via_symbols
