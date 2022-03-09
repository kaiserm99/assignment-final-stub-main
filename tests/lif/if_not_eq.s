	.align 16
mainconclusion:
    addq $8, %rsp
    popq %rbx
    popq %rbp
    retq 

	.align 16
block119:
    movq %rcx, %rdi
    callq print_int
    movq $0, %rcx
    movq %rcx, %rax
    jmp mainconclusion

	.align 16
block120:
    movq $777, %rcx
    jmp block119

	.align 16
block121:
    movq $42, %rcx
    jmp block119

	.align 16
mainstart:
    movq $1, %rbx
    callq read_int
    movq %rax, %rcx
    cmpq %rcx, %rbx
    sete %al
    movzbq %al, %rcx
    cmpq $0, %rcx
    je block120
    jmp block121

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


