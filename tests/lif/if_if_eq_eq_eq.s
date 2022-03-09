	.align 16
mainconclusion:
    popq %rbp
    retq 

	.align 16
block89:
    movq %rcx, %rdi
    callq print_int
    movq $0, %rcx
    movq %rcx, %rax
    jmp mainconclusion

	.align 16
block90:
    movq $10, %rcx
    addq $32, %rcx
    jmp block89

	.align 16
block91:
    movq $700, %rcx
    addq $77, %rcx
    jmp block89

	.align 16
block92:
    jmp block90

	.align 16
block93:
    jmp block91

	.align 16
block94:
    jmp block90

	.align 16
block95:
    jmp block91

	.align 16
block96:
    callq read_int
    movq %rax, %rcx
    cmpq $0, %rcx
    je block92
    jmp block93

	.align 16
block97:
    callq read_int
    movq %rax, %rcx
    cmpq $2, %rcx
    je block94
    jmp block95

	.align 16
mainstart:
    callq read_int
    movq %rax, %rcx
    cmpq $1, %rcx
    je block96
    jmp block97

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


