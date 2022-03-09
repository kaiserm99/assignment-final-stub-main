	.align 16
mainconclusion:
    popq %rbp
    retq 

	.align 16
block142:
    movq %rcx, %rdi
    callq print_int
    movq $0, %rcx
    movq %rcx, %rax
    jmp mainconclusion

	.align 16
block143:
    movq $0, %rcx
    jmp block142

	.align 16
block144:
    movq $42, %rcx
    jmp block142

	.align 16
mainstart:
    movq $1, %rcx
    cmpq $0, %rcx
    je block143
    jmp block144

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


