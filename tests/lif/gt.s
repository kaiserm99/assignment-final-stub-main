	.align 16
mainconclusion:
    popq %rbp
    retq 

	.align 16
block0:
    movq %rcx, %rdi
    callq print_int
    movq $0, %rcx
    movq %rcx, %rax
    jmp mainconclusion

	.align 16
block1:
    movq $42, %rcx
    jmp block0

	.align 16
block2:
    movq $0, %rcx
    jmp block0

	.align 16
mainstart:
    movq $2, %rax
    cmpq $1, %rax
    jg block1
    jmp block2

	.globl main
	.align 16
main:
    pushq %rbp
    movq %rsp, %rbp
    movq $16384, %rdi
    movq $16384, %rsi
    callq initialize
    movq rootstack_begin(%rip), %r15
    jmp mainstart


