	.align 16
mainconclusion:
    addq $48, %rsp
    popq %rbx
    popq %r13
    popq %r12
    popq %r14
    popq %rbp
    retq 

	.align 16
mainstart:
    movq $10, %rcx
    movq $10, %r10
    movq $10, -72(%rbp)
    movq $10, %rbx
    movq $10, %r12
    movq $10, -40(%rbp)
    movq $10, %r8
    movq $10, %rsi
    movq $10, %rdx
    movq $10, %r9
    movq $10, -48(%rbp)
    movq $10, -56(%rbp)
    movq $10, %rdi
    movq $10, %r14
    movq $10, -64(%rbp)
    movq $10, %r13
    addq %r10, %rcx
    addq -72(%rbp), %rcx
    addq %rbx, %rcx
    addq %r12, %rcx
    addq -40(%rbp), %rcx
    addq %r8, %rcx
    addq %rsi, %rcx
    addq %rdx, %rcx
    addq %r9, %rcx
    addq -48(%rbp), %rcx
    addq -56(%rbp), %rcx
    addq %rdi, %rcx
    addq %r14, %rcx
    addq -64(%rbp), %rcx
    addq %r13, %rcx
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
    pushq %r14
    pushq %r12
    pushq %r13
    pushq %rbx
    subq $48, %rsp
    movq $16384, %rdi
    movq $16384, %rsi
    callq initialize
    movq rootstack_begin(%rip), %r15
    jmp mainstart


