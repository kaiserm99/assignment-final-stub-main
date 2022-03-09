	.align 16
mainconclusion:
    popq %rbp
    retq 

	.align 16
block33:
    movq %rcx, %rdi
    callq print_int
    movq $0, %rcx
    movq %rcx, %rax
    jmp mainconclusion

	.align 16
block34:
    movq $2, %rcx
    addq %rdx, %rcx
    jmp block33

	.align 16
block35:
    movq $40, %rdx
    jmp block34

	.align 16
block36:
    callq read_int
    movq %rax, %rdx
    jmp block34

	.align 16
block37:
    movq $777, %rcx
    jmp block33

	.align 16
block38:
    callq read_int
    movq %rax, %rcx
    cmpq $2, %rcx
    je block35
    jmp block36

	.align 16
mainstart:
    movq $1, %rax
    cmpq $0, %rax
    je block37
    jmp block38

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


