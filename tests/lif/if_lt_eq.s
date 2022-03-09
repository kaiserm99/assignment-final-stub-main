	.align 16
mainconclusion:
    addq $8, %rsp
    popq %rbx
    popq %rbp
    retq 

	.align 16
block98:
    movq %rcx, %rdi
    callq print_int
    movq $0, %rcx
    movq %rcx, %rax
    jmp mainconclusion

	.align 16
block99:
    addq $2, %rcx
    jmp block98

	.align 16
block100:
    addq $10, %rcx
    jmp block98

	.align 16
block101:
    jmp block99

	.align 16
block102:
    jmp block100

	.align 16
block103:
    jmp block99

	.align 16
block104:
    jmp block100

	.align 16
block105:
    cmpq $0, %rbx
    je block101
    jmp block102

	.align 16
block106:
    cmpq $2, %rbx
    je block103
    jmp block104

	.align 16
mainstart:
    callq read_int
    movq %rax, %rbx
    callq read_int
    movq %rax, %rcx
    cmpq $1, %rbx
    jl block105
    jmp block106

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


