	.align 16
mainconclusion:
    popq %rbp
    retq 

	.align 16
block116:
    movq %rcx, %rdi
    callq print_int
    movq $0, %rcx
    movq %rcx, %rax
    jmp mainconclusion

	.align 16
block117:
    movq $42, %rcx
    jmp block116

	.align 16
block118:
    movq $0, %rcx
    jmp block116

	.align 16
mainstart:
    callq read_int
    movq %rax, %rcx
    cmpq $0, %rcx
    je block117
    jmp block118

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


