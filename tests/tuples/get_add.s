	.align 16
mainconclusion:
    addq $32, %rsp
    popq %rbx
    popq %r13
    popq %r12
    popq %r14
    popq %rbp
    retq 

	.align 16
block310:
    movq $0, %rcx
    movq %rcx, %rax
    jmp mainconclusion

	.align 16
block311:
    movq -8(%r15), %r11
    movq 8(%r11), %rdx
    movq -48(%r15), %r11
    movq 16(%r11), %rcx
    addq %rcx, %rdx
    movq %rdx, %rdi
    callq print_int
    jmp block310

	.align 16
block312:
    movq $0, %rdi
    callq print_int
    jmp block310

	.align 16
block313:
    movq free_ptr(%rip), %r11
    addq $24, free_ptr(%rip)
    movq $5, 0(%r11)
    movq %r11, -40(%r15)
    movq -40(%r15), %r11
    movq %rbx, 8(%r11)
    movq -40(%r15), %r11
    movq %r12, 16(%r11)
    movq -40(%r15), %rax
    movq %rax, -48(%r15)
    movq -8(%r15), %r11
    movq 56(%r11), %rax
    movq %rax, -56(%r15)
    movq -56(%r15), %r11
    movq 16(%r11), %rdx
    movq -48(%r15), %r11
    movq 8(%r11), %rsi
    cmpq %rsi, %rdx
    je block311
    jmp block312

	.align 16
block314:
    jmp block313

	.align 16
block315:
    movq %r15, %rdi
    movq $24, %rsi
    callq collect
    jmp block313

	.align 16
block316:
    movq free_ptr(%rip), %r11
    addq $64, free_ptr(%rip)
    movq $8207, 0(%r11)
    movq %r11, -32(%r15)
    movq -32(%r15), %r11
    movq %r12, 8(%r11)
    movq -32(%r15), %r11
    movq %rbx, 16(%r11)
    movq -32(%r15), %r11
    movq -48(%rbp), %rax
    movq %rax, 24(%r11)
    movq -32(%r15), %r11
    movq -40(%rbp), %rax
    movq %rax, 32(%r11)
    movq -32(%r15), %r11
    movq %r13, 40(%r11)
    movq -32(%r15), %r11
    movq %r14, 48(%r11)
    movq -32(%r15), %r11
    movq -16(%r15), %rax
    movq %rax, 56(%r11)
    movq -32(%r15), %rax
    movq %rax, -8(%r15)
    callq read_int
    movq %rax, %rcx
    movq %rcx, %rbx
    movq $13, %r12
    movq free_ptr(%rip), %rcx
    addq $24, %rcx
    movq fromspace_end(%rip), %rdx
    cmpq %rdx, %rcx
    jl block314
    jmp block315

	.align 16
block317:
    jmp block316

	.align 16
block318:
    movq %r15, %rdi
    movq $64, %rsi
    callq collect
    jmp block316

	.align 16
block319:
    movq free_ptr(%rip), %r11
    addq $24, free_ptr(%rip)
    movq $5, 0(%r11)
    movq %r11, -24(%r15)
    movq -24(%r15), %r11
    movq -56(%rbp), %rax
    movq %rax, 8(%r11)
    movq -24(%r15), %r11
    movq -64(%rbp), %rax
    movq %rax, 16(%r11)
    movq -24(%r15), %rax
    movq %rax, -16(%r15)
    movq free_ptr(%rip), %rcx
    addq $64, %rcx
    movq fromspace_end(%rip), %rdx
    cmpq %rdx, %rcx
    jl block317
    jmp block318

	.align 16
block320:
    jmp block319

	.align 16
block321:
    movq %r15, %rdi
    movq $24, %rsi
    callq collect
    jmp block319

	.align 16
mainstart:
    movq $42, %r12
    movq $42, %rbx
    movq $42, -48(%rbp)
    movq $42, -40(%rbp)
    movq $42, %r13
    movq $42, %r14
    movq $0, -56(%rbp)
    movq $42, -64(%rbp)
    movq free_ptr(%rip), %rcx
    addq $24, %rcx
    movq fromspace_end(%rip), %rdx
    cmpq %rdx, %rcx
    jl block320
    jmp block321

	.globl main
	.align 16
main:
    pushq %rbp
    movq %rsp, %rbp
    pushq %r14
    pushq %r12
    pushq %r13
    pushq %rbx
    subq $32, %rsp
    movq $16384, %rdi
    movq $16384, %rsi
    callq initialize
    movq rootstack_begin(%rip), %r15
    movq $0, 0(%r15)
    addq $8, %r15
    movq $0, 0(%r15)
    addq $8, %r15
    movq $0, 0(%r15)
    addq $8, %r15
    movq $0, 0(%r15)
    addq $8, %r15
    movq $0, 0(%r15)
    addq $8, %r15
    movq $0, 0(%r15)
    addq $8, %r15
    movq $0, 0(%r15)
    addq $8, %r15
    jmp mainstart


