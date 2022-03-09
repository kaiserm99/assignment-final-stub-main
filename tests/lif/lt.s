	.align 16
mainconclusion:
    popq %rbp
    retq 

	.align 16
block55:
    movq %rcx, %rdi
    callq print_int
    movq $0, %rcx
    movq %rcx, %rax
    jmp mainconclusion

	.align 16
block56:
    movq $42, %rcx
    jmp block55

	.align 16
block57:
    movq $0, %rcx
    jmp block55

	.align 16
mainstart:
    movq $1, %rax
    cmpq $2, %rax
    jl block56
    jmp block57

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


