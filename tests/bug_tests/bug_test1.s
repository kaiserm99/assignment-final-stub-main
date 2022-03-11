	.align 16
mainconclusion:
    popq %r12
    popq %rbx
    popq %rbp
    retq 

	.align 16
block0:
    cmpq %r12, %rbx
    jl block1
    jmp block2

	.align 16
block1:
    movq %rbx, %rdi
    callq print_int
    addq $1, %rbx
    jmp block0

	.align 16
block2:
    movq $0, %rcx
    movq %rcx, %rax
    jmp mainconclusion

	.align 16
mainstart:
    movq $10, %rbx
    movq $20, %r12
    jmp block0

	.globl main
	.align 16
main:
    pushq %rbp
    movq %rsp, %rbp
    pushq %rbx
    pushq %r12
    movq $16384, %rdi
    movq $16384, %rsi
    callq initialize
    movq rootstack_begin(%rip), %r15
    jmp mainstart


