	.align 16
mainconclusion:
    popq %rbp
    retq 

	.align 16
block122:
    movq %rcx, %rdi
    callq print_int
    movq $0, %rcx
    movq %rcx, %rax
    jmp mainconclusion

	.align 16
block123:
    movq $42, %rcx
    jmp block122

	.align 16
block124:
    movq $777, %rcx
    jmp block122

	.align 16
mainstart:
    jmp block123

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


