	.align 16
mainconclusion:
    popq %rbp
    retq 

	.align 16
block21:
    movq %rcx, %rdi
    callq print_int
    movq $0, %rcx
    movq %rcx, %rax
    jmp mainconclusion

	.align 16
block22:
    movq $5, %rdx
    negq %rdx
    movq $3, %rcx
    addq %rdx, %rcx
    addq $4, %rcx
    jmp block21

	.align 16
block23:
    movq $3, %rcx
    negq %rcx
    movq $5, %rdx
    negq %rdx
    addq %rdx, %rcx
    addq $3, %rcx
    addq $5, %rcx
    jmp block21

	.align 16
mainstart:
    movq $5, %rdx
    negq %rdx
    movq $3, %rcx
    addq %rdx, %rcx
    cmpq $0, %rcx
    jg block22
    jmp block23

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


