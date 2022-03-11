	.align 16
mainconclusion:
    popq %rbx
    popq %r12
    popq %rbp
    retq 

	.align 16
block202:
    addq $10, %rcx
    movq %rcx, %rdi
    callq print_int
    movq $0, %rcx
    movq %rcx, %rax
    jmp mainconclusion

	.align 16
block203:
    movq %rbx, %rcx
    negq %rcx
    jmp block202

	.align 16
block204:
    movq %r12, %rcx
    jmp block202

	.align 16
mainstart:
    movq $1, %rbx
    movq $2, %r12
    callq read_int
    movq %rax, %rcx
    cmpq $0, %rcx
    je block203
    jmp block204

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


