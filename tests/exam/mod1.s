	.align 16
mainconclusion:
    popq %rbp
    retq 

	.align 16
mainstart:
    callq read_int
    movq %rax, %rcx
    movq %rcx, %rax
    cqto 
    movq $2345678, %rcx
    idivq %rcx
    movq %rdx, %rcx
    movq %rcx, %rdi
    callq print_int
    movq $0, %rcx
    movq %rcx, %rax
    jmp mainconclusion

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


