	.align 16
mainconclusion:
    popq %rbp
    retq 

	.align 16
block230:
    movq %rcx, %rdi
    callq print_int
    movq $0, %rcx
    movq %rcx, %rax
    jmp mainconclusion

	.align 16
block231:
    callq read_int
    movq %rax, %rcx
    jmp block230

	.align 16
block232:
    movq $777, %rcx
    jmp block230

	.align 16
mainstart:
    callq read_int
    movq %rax, %rcx
    movq $0, %rax
    cmpq %rcx, %rax
    je block231
    jmp block232

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


