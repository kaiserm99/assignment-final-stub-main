	.align 16
mainconclusion:
    addq $8, %rsp
    popq %rbx
    popq %rbp
    retq 

	.align 16
block110:
    movq %rcx, %rdi
    callq print_int
    movq $0, %rcx
    movq %rcx, %rax
    jmp mainconclusion

	.align 16
block111:
    movq %rbx, %rcx
    subq %rsi, %rcx
    jmp block110

	.align 16
block112:
    movq $0, %rcx
    jmp block110

	.align 16
block113:
    cmpq $0, %rcx
    je block111
    jmp block112

	.align 16
block114:
    movq $0, %rcx
    jmp block113

	.align 16
block115:
    movq %rdx, %rcx
    jmp block113

	.align 16
mainstart:
    callq read_int
    movq %rax, %rbx
    callq read_int
    movq %rax, %rsi
    cmpq %rsi, %rbx
    sete %al
    movzbq %al, %rcx
    cmpq %rsi, %rbx
    setne %al
    movzbq %al, %rdx
    cmpq $0, %rcx
    je block114
    jmp block115

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


