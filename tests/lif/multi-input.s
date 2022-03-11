	.align 16
mainconclusion:
    addq $8, %rsp
    popq %rbx
    popq %rbp
    retq 

	.align 16
block211:
    movq $0, %rcx
    movq %rcx, %rax
    jmp mainconclusion

	.align 16
block212:
    movq %rcx, %rdi
    callq print_int
    jmp block211

	.align 16
block213:
    movq $0, %rcx
    jmp block212

	.align 16
block214:
    movq $1, %rcx
    jmp block212

	.align 16
block215:
    callq read_int
    movq %rax, %rcx
    movq $42, %rdx
    addq %rcx, %rdx
    movq %rdx, %rdi
    callq print_int
    jmp block211

	.align 16
block216:
    callq read_int
    movq %rax, %rcx
    cmpq $0, %rcx
    je block213
    jmp block214

	.align 16
block217:
    jmp block215

	.align 16
block218:
    jmp block216

	.align 16
block219:
    callq read_int
    movq %rax, %rbx
    callq read_int
    movq %rax, %rcx
    cmpq %rcx, %rbx
    jg block217
    jmp block218

	.align 16
block220:
    jmp block216

	.align 16
mainstart:
    callq read_int
    movq %rax, %rbx
    callq read_int
    movq %rax, %rcx
    cmpq %rcx, %rbx
    jl block219
    jmp block220

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


