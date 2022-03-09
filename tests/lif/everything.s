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
    movq $42, %rdx
    subq $3, %rdx
    movq $3, %rcx
    negq %rcx
    addq %rcx, %rdx
    movq %rdx, %rcx
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
    movq $10, %r9
    addq %rsi, %rbx
    movq %rbx, %rsi
    addq %r12, %rsi
    addq %r14, %rsi
    addq %rdx, %rsi
    movq %rsi, %rdx
    addq %r13, %rdx
    addq %rcx, %rdx
    movq %rdx, %rcx
    addq %rdi, %rcx
    addq %r8, %rcx
    addq %r10, %rcx
    addq %r9, %rcx
    movq %rcx, %rdi
    callq print_int
    jmp block221

	.align 16
block226:
    movq $30, %r10
    negq %r10
    jmp block225

	.align 16
block227:
    movq $10, %r10
    jmp block225

	.align 16
block228:
    cmpq $1, %rsi
    je block223
    jmp block224

	.align 16
block229:
    movq $10, %rbx
    movq $20, %rsi
    movq $30, %r12
    movq $10, %r14
    movq $20, %rdx
    movq $30, %r13
    movq $40, %rcx
    movq $50, %rdi
    movq $60, %r8
    cmpq $10, %rbx
    je block226
    jmp block227

	.align 16
mainstart:
    callq read_int
    movq %rax, %rbx
    callq read_int
    movq %rax, %rsi
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


