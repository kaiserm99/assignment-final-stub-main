	.align 16
mainconclusion:
    popq %rbp
    retq 

	.align 16
block304:
    movq $0, %rcx
    movq %rcx, %rax
    jmp mainconclusion

	.align 16
block305:
    movq $2, %rcx
    addq $2, %rcx
    jmp block304

	.align 16
block306:
    jmp block304

	.align 16
mainstart:
    movq $1, %rax
    cmpq $0, %rax
    jg block305
    jmp block306

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


