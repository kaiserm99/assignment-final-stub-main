	.align 16
mainconclusion:
    popq %rbp
    retq 

	.align 16
block42:
    movq %rcx, %rdi
    callq print_int
    movq $0, %rcx
    movq %rcx, %rax
    jmp mainconclusion

	.align 16
block43:
    movq $2, %rcx
    addq %rdx, %rcx
    jmp block42

	.align 16
block44:
    movq $40, %rdx
    jmp block43

	.align 16
block45:
    movq $775, %rdx
    jmp block43

	.align 16
block46:
    movq $777, %rcx
    jmp block42

	.align 16
block47:
    movq $1, %rcx
    addq $1, %rcx
    cmpq $2, %rcx
    je block44
    jmp block45

	.align 16
mainstart:
    movq $1, %rax
    cmpq $0, %rax
    je block46
    jmp block47

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


