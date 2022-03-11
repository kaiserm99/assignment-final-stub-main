	.align 16
mainconclusion:
    addq $8, %rsp
    popq %r13
    popq %rbx
    popq %r12
    popq %rbp
    retq 

	.align 16
block0:
    cmpq $0, %rbx
    jg block1
    jmp block2

	.align 16
block1:
    callq read_int
    movq %rax, %r12
    callq read_int
    movq %rax, %rcx
    movq %r12, %rdx
    imulq %rcx, %rdx
    addq %rdx, %r13
    subq $1, %rbx
    jmp block0

	.align 16
block2:
    movq %r13, %rdi
    callq print_int
    movq $0, %rcx
    movq %rcx, %rax
    jmp mainconclusion

	.align 16
mainstart:
    callq read_int
    movq %rax, %rbx
    movq $0, %r13
    jmp block0

	.globl main
	.align 16
main:
    pushq %rbp
    movq %rsp, %rbp
    pushq %r12
    pushq %rbx
    pushq %r13
    subq $8, %rsp
    movq $16384, %rdi
    movq $16384, %rsi
    callq initialize
    movq rootstack_begin(%rip), %r15
    jmp mainstart


