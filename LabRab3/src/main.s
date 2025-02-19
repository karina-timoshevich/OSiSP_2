	.file	"main.c"
	.text
	.section	.rodata
.LC0:
	.string	"r"
	.align 8
.LC1:
	.string	"\320\236\321\210\320\270\320\261\320\272\320\260 \320\276\321\202\320\272\321\200\321\213\321\202\320\270\321\217 \320\262\321\205\320\276\320\264\320\275\320\276\320\263\320\276 \321\204\320\260\320\271\320\273\320\260"
.LC2:
	.string	"w"
	.align 8
.LC3:
	.string	"\320\236\321\210\320\270\320\261\320\272\320\260 \320\276\321\202\320\272\321\200\321\213\321\202\320\270\321\217 \320\262\321\213\321\205\320\276\320\264\320\275\320\276\320\263\320\276 \321\204\320\260\320\271\320\273\320\260"
.LC4:
	.string	"%s\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB6:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$1088, %rsp
	movl	%edi, -1076(%rbp)
	movq	%rsi, -1088(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	stdin(%rip), %rax
	movq	%rax, -1064(%rbp)
	movq	stdout(%rip), %rax
	movq	%rax, -1056(%rbp)
	cmpl	$1, -1076(%rbp)
	jle	.L2
	movq	-1088(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	leaq	.LC0(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	fopen@PLT
	movq	%rax, -1064(%rbp)
	cmpq	$0, -1064(%rbp)
	jne	.L2
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	call	perror@PLT
	movl	$1, %eax
	jmp	.L10
.L2:
	cmpl	$2, -1076(%rbp)
	jle	.L5
	movq	-1088(%rbp), %rax
	addq	$16, %rax
	movq	(%rax), %rax
	leaq	.LC2(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	fopen@PLT
	movq	%rax, -1056(%rbp)
	cmpq	$0, -1056(%rbp)
	jne	.L5
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	call	perror@PLT
	movq	-1064(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
	movl	$1, %eax
	jmp	.L10
.L7:
	leaq	-1040(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, -1048(%rbp)
	movq	-1048(%rbp), %rax
	subq	$1, %rax
	movzbl	-1040(%rbp,%rax), %eax
	cmpb	$10, %al
	jne	.L6
	movq	-1048(%rbp), %rax
	subq	$1, %rax
	movb	$0, -1040(%rbp,%rax)
	subq	$1, -1048(%rbp)
.L6:
	movq	-1048(%rbp), %rax
	movl	%eax, %edx
	leaq	-1040(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	reverse_line@PLT
	leaq	-1040(%rbp), %rdx
	movq	-1056(%rbp), %rax
	leaq	.LC4(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
.L5:
	movq	-1064(%rbp), %rdx
	leaq	-1040(%rbp), %rax
	movl	$1024, %esi
	movq	%rax, %rdi
	call	fgets@PLT
	testq	%rax, %rax
	jne	.L7
	movq	stdin(%rip), %rax
	cmpq	%rax, -1064(%rbp)
	je	.L8
	movq	-1064(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
.L8:
	movq	stdout(%rip), %rax
	cmpq	%rax, -1056(%rbp)
	je	.L9
	movq	-1056(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
.L9:
	movl	$0, %eax
.L10:
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L11
	call	__stack_chk_fail@PLT
.L11:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 13.2.0-23ubuntu4) 13.2.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
