	.align 16
mainconclusion:
    popq %rbp
    retq 

	.align 16
block164:
    movq %rcx, %rdi
    callq print_int
    movq $0, %rcx
    movq %rcx, %rax
    jmp mainconclusion

	.align 16
block165:
    movq $42, %rcx
    jmp block164

	.align 16
block166:
    movq $777, %rcx
    jmp block164

	.align 16
mainstart:
    movq $0, %rax
    cmpq $0, %rax
    je block165
    jmp block166

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


