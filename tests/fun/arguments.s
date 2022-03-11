	.align 16
funcconclusion:
    addq $48, %rsp
    popq %rbx
    popq %r13
    popq %r12
    popq %r14
    popq %rbp
    retq 

	.align 16
block331:

	.align 16
block332:
    movq free_ptr(%rip), %r11
    addq $32, free_ptr(%rip)
    movq $7, 0(%r11)
    movq %r11, -24(%r15)
    movq -24(%r15), %r11
    movq -56(%rbp), %rax
    movq %rax, 8(%r11)
    movq -24(%r15), %r11
    movq %r12, 16(%r11)
    movq -24(%r15), %r11
    movq -48(%rbp), %rax
    movq %rax, 24(%r11)
    movq -24(%r15), %rax
    movq %rax, -16(%r15)
    movq %rbx, %rdi
    movq -64(%rbp), %rsi
    movq %r13, %rdx
    movq %r14, %rcx
    movq -72(%rbp), %r8
    movq -16(%r15), %r9
    movq -40(%rbp), %rax
    addq $48, %rsp
    popq %rbx
    popq %r13
    popq %r12
    popq %r14
    popq %rbp
    jmp *%rax

	.align 16
block333:
    jmp block332

	.align 16
block334:
    movq %r15, %rdi
    movq $32, %rsi
    callq collect
    jmp block332

	.align 16
block335:
    movq $42, %rcx
    movq %rcx, %rax
    jmp funcconclusion

	.align 16
block336:
    movq func(%rip), %rax
    movq %rax, -40(%rbp)
    movq -8(%r15), %r11
    movq 8(%r11), %rax
    movq %rax, -56(%rbp)
    movq -8(%r15), %r11
    movq 16(%r11), %r12
    movq -8(%r15), %r11
    movq 24(%r11), %rax
    movq %rax, -48(%rbp)
    movq free_ptr(%rip), %rcx
    addq $32, %rcx
    movq fromspace_end(%rip), %rdx
    cmpq %rdx, %rcx
    jl block333
    jmp block334

	.align 16
funcstart:
    movq %r9, -8(%r15)
    movq %r8, -72(%rbp)
    movq %rcx, %r14
    movq %rdx, %r13
    movq %rsi, -64(%rbp)
    movq %rdi, %rbx
    movq -8(%r15), %r11
    movq 24(%r11), %rcx
    cmpq $0, %rcx
    je block335
    jmp block336

	.align 16
func:
    pushq %rbp
    movq %rsp, %rbp
    pushq %r14
    pushq %r12
    pushq %r13
    pushq %rbx
    subq $48, %rsp
    movq $0, 0(%r15)
    addq $8, %r15
    movq $0, 0(%r15)
    addq $8, %r15
    movq $0, 0(%r15)
    addq $8, %r15
    jmp funcstart

	.align 16
mainconclusion:
    popq %rbx
    popq %r13
    popq %r12
    popq %r14
    popq %rbp
    retq 

	.align 16
block337:
    movq free_ptr(%rip), %r11
    addq $32, free_ptr(%rip)
    movq $7, 0(%r11)
    movq %r11, -16(%r15)
    movq -16(%r15), %r11
    movq %rbx, 8(%r11)
    movq -16(%r15), %r11
    movq %r14, 16(%r11)
    movq -16(%r15), %r11
    movq %r12, 24(%r11)
    movq -16(%r15), %rax
    movq %rax, -8(%r15)
    movq $0, %rdi
    movq $0, %rsi
    movq $0, %rdx
    movq $0, %rcx
    movq $0, %r8
    movq -8(%r15), %r9
    callq *%r13
    movq %rax, %rcx
    movq %rcx, %rdi
    callq print_int
    movq $0, %rcx
    movq %rcx, %rax
    jmp mainconclusion

	.align 16
block338:
    jmp block337

	.align 16
block339:
    movq %r15, %rdi
    movq $32, %rsi
    callq collect
    jmp block337

	.align 16
mainstart:
    leaq func(%rip), %r13
    movq $0, %rbx
    movq $0, %r14
    movq $0, %r12
    movq free_ptr(%rip), %rcx
    movq %rcx, %rdx
    addq $32, %rdx
    movq fromspace_end(%rip), %rcx
    cmpq %rcx, %rdx
    jl block338
    jmp block339

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
    movq $0, 0(%r15)
    addq $8, %r15
    movq $0, 0(%r15)
    addq $8, %r15
    jmp mainstart


