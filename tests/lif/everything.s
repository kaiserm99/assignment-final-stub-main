	.align 16
mainconclusion:
    popq %rbx
    popq %r13
    popq %r12
    popq %r14
    popq %rbp
    retq 

	.align 16
block221:
    movq $0, %rcx
    movq %rcx, %rax
    jmp mainconclusion

	.align 16
block222:
    jmp block221

	.align 16
block223:
    movq $42, %rcx
    subq $3, %rcx
    movq $3, %rdx
    negq %rdx
    addq %rdx, %rcx
    addq $6, %rcx
    movq %rcx, %rdi
    callq print_int
    jmp block222

	.align 16
block224:
    movq $41, %rcx
    subq $5, %rcx
    subq $6, %rcx
    subq $7, %rcx
    movq %rcx, %rdi
    callq print_int
    jmp block222

	.align 16
block225:
    movq $10, %r10
    addq %r12, %rbx
    addq %rcx, %rbx
    movq %rbx, %rcx
    addq %rdx, %rcx
    addq %r13, %rcx
    addq %r8, %rcx
    addq %r9, %rcx
    addq %r14, %rcx
    addq %rsi, %rcx
    addq %rdi, %rcx
    addq %r10, %rcx
    movq %rcx, %rdi
    callq print_int
    jmp block221

	.align 16
block226:
    movq $30, %rdi
    negq %rdi
    jmp block225

	.align 16
block227:
    movq $10, %rdi
    jmp block225

	.align 16
block228:
    cmpq $1, %r12
    je block223
    jmp block224

	.align 16
block229:
    movq $10, %rbx
    movq $20, %r12
    movq $30, %rcx
    movq $10, %rdx
    movq $20, %r13
    movq $30, %r8
    movq $40, %r9
    movq $50, %r14
    movq $60, %rsi
    cmpq $10, %rbx
    je block226
    jmp block227

	.align 16
mainstart:
    callq read_int
    movq %rax, %rbx
    callq read_int
    movq %rax, %r12
    cmpq $0, %rbx
    je block228
    jmp block229

	.globl main
	.align 16
main:
    pushq %rbp
    movq %rsp, %rbp
    pushq %r14
    pushq %r12
    pushq %r13
    pushq %rbx
    movq $16384, %rdi
    movq $16384, %rsi
    callq initialize
    movq rootstack_begin(%rip), %r15
    jmp mainstart


