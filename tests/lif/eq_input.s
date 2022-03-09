	.align 16
mainconclusion:
    popq %rbp
    retq 

	.align 16
block205:
    movq %rcx, %rdi
    callq print_int
    movq $0, %rcx
    movq %rcx, %rax
    jmp mainconclusion

	.align 16
block206:
    movq $42, %rcx
    jmp block205

	.align 16
block207:
    movq $0, %rcx
    jmp block205

	.align 16
mainstart:
    callq read_int
    movq %rax, %rcx
    cmpq $1, %rcx
    je block206
    jmp block207

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


