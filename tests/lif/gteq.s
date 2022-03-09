	.align 16
mainconclusion:
    popq %rbp
    retq 

	.align 16
block3:
    movq %rcx, %rdi
    callq print_int
    movq $0, %rcx
    movq %rcx, %rax
    jmp mainconclusion

	.align 16
block4:
    movq $42, %rcx
    jmp block3

	.align 16
block5:
    movq $0, %rcx
    jmp block3

	.align 16
mainstart:
    movq $2, %rax
    cmpq $1, %rax
    jge block4
    jmp block5

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


