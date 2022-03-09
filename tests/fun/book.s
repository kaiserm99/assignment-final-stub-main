	.align 16
addconclusion:
    popq %rbp
    retq 

	.align 16
addstart:
    movq %rsi, %rcx
    movq %rdi, %rdx
    addq %rcx, %rdx
    movq %rdx, %rax
    jmp addconclusion

	.align 16
add:
    pushq %rbp
    movq %rsp, %rbp
    jmp addstart

	.align 16
mainconclusion:
    popq %rbp
    retq 

	.align 16
mainstart:
    leaq add(%rip), %rcx
    movq $40, %rdi
    movq $2, %rsi
    callq *%rcx
    movq %rax, %rcx
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


