	.align 16
mainconclusion:
    addq $8, %rsp
    popq %rbx
    popq %rbp
    retq 

	.align 16
block186:
    movq %rbx, %rdi
    callq print_int
    movq $0, %rcx
    movq %rcx, %rax
    jmp mainconclusion

	.align 16
block187:
    movq %rcx, %rdi
    callq print_int
    jmp block186

	.align 16
block188:
    movq %rdx, %rdi
    callq print_int
    jmp block186

	.align 16
mainstart:
    callq read_int
    movq %rax, %rcx
    movq %rcx, %rdx
    addq $1, %rdx
    movq %rdx, %rbx
    addq $1, %rbx
    cmpq $0, %rcx
    je block187
    jmp block188

	.globl main
	.align 16
main:
    pushq %rbp
    movq %rsp, %rbp
    pushq %rbx
    subq $8, %rsp
    movq $16384, %rdi
    movq $16384, %rsi
    callq initialize
    movq rootstack_begin(%rip), %r15
    jmp mainstart


