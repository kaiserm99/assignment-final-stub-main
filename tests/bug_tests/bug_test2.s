	.align 16
mainconclusion:
    popq %rbp
    retq 

	.align 16
mainstart:
    movq $10, %rdx
    movq $5, %rcx
    movq %rdx, %rax
    cqto 
    idivq %rcx
    movq %rax, %rdx
    movq %rdx, %rdi
    callq print_int
    movq $5, %rcx
    movq $10, %rdx
    movq %rdx, %rax
    cqto 
    idivq %rcx
    movq %rax, %rdx
    movq %rdx, %rdi
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


