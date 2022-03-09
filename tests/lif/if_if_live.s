	.align 16
mainconclusion:
    popq %rbx
    popq %r12
    popq %rbp
    retq 

	.align 16
block48:
    movq %rcx, %rdi
    callq print_int
    movq $0, %rcx
    movq %rcx, %rax
    jmp mainconclusion

	.align 16
block49:
    jmp block48

	.align 16
block50:
    movq %rbx, %rcx
    addq $22, %rcx
    jmp block49

	.align 16
block51:
    movq %r12, %rcx
    addq $20, %rcx
    jmp block49

	.align 16
block52:
    movq %r12, %rcx
    addq $32, %rcx
    jmp block48

	.align 16
block53:
    callq read_int
    movq %rax, %rcx
    cmpq $0, %rcx
    je block50
    jmp block51

	.align 16
mainstart:
    callq read_int
    movq %rax, %r12
    movq %r12, %rbx
    addq $10, %rbx
    callq read_int
    movq %rax, %rcx
    cmpq $0, %rcx
    je block52
    jmp block53

	.globl main
	.align 16
main:
    pushq %rbp
    movq %rsp, %rbp
    pushq %r12
    pushq %rbx
    movq $16384, %rdi
    movq $16384, %rsi
    callq initialize
    movq rootstack_begin(%rip), %r15
    jmp mainstart


