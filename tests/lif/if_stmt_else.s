	.align 16
mainconclusion:
    popq %rbp
    retq 

	.align 16
block145:
    movq %rcx, %rdi
    callq print_int
    movq $0, %rcx
    movq %rcx, %rax
    jmp mainconclusion

	.align 16
block146:
    movq $0, %rcx
    jmp block145

	.align 16
block147:
    movq $42, %rcx
    jmp block145

	.align 16
mainstart:
    callq read_int
    movq %rax, %rcx
    cmpq $0, %rcx
    je block146
    jmp block147

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


