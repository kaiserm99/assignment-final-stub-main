	.align 16
mainconclusion:
    addq $8, %rsp
    popq %rbx
    popq %rbp
    retq 

	.align 16
block24:
    movq %rcx, %rdi
    callq print_int
    movq $0, %rcx
    movq %rcx, %rax
    jmp mainconclusion

	.align 16
block25:
    movq $777, %rcx
    jmp block24

	.align 16
block26:
    movq $42, %rcx
    jmp block24

	.align 16
mainstart:
    movq $1, %rbx
    callq read_int
    movq %rax, %rcx
    cmpq %rcx, %rbx
    jne block25
    jmp block26

	.globl main
	.align 16
main:
    pushq %rbp
    movq %rsp, %rbp
    pushq %rbx
    subq $8, %rsp
    movq $16384, %rdi
    movq $16384, %rsi
    callq initialize
    movq rootstack_begin(%rip), %r15
    jmp mainstart


