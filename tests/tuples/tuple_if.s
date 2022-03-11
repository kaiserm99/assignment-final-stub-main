	.align 16
mainconclusion:
    addq $8, %rsp
    popq %rbx
    popq %r13
    popq %r12
    popq %rbp
    retq 

	.align 16
block292:
    movq $0, %rcx
    movq %rcx, %rax
    jmp mainconclusion

	.align 16
block293:
    movq $0, %rdi
    callq print_int
    jmp block292

	.align 16
block294:
    movq $42, %rdi
    callq print_int
    jmp block292

	.align 16
block295:
    movq free_ptr(%rip), %r11
    addq $32, free_ptr(%rip)
    movq $7, 0(%r11)
    movq %r11, -8(%r15)
    movq -8(%r15), %r11
    movq %rbx, 8(%r11)
    movq -8(%r15), %r11
    movq %r12, 16(%r11)
    movq -8(%r15), %r11
    movq %r13, 24(%r11)
    movq -8(%r15), %rax
    movq %rax, -16(%r15)
    movq -16(%r15), %r11
    movq 24(%r11), %rcx
    cmpq $0, %rcx
    je block293
    jmp block294

	.align 16
block296:
    jmp block295

	.align 16
block297:
    movq %r15, %rdi
    movq $32, %rsi
    callq collect
    jmp block295

	.align 16
mainstart:
    movq $3, %rbx
    movq $4, %r12
    movq $1, %r13
    movq free_ptr(%rip), %rcx
    addq $32, %rcx
    movq fromspace_end(%rip), %rdx
    cmpq %rdx, %rcx
    jl block296
    jmp block297

	.globl main
	.align 16
main:
    pushq %rbp
    movq %rsp, %rbp
    pushq %r12
    pushq %r13
    pushq %rbx
    subq $8, %rsp
    movq $16384, %rdi
    movq $16384, %rsi
    callq initialize
    movq rootstack_begin(%rip), %r15
    movq $0, 0(%r15)
    addq $8, %r15
    movq $0, 0(%r15)
    addq $8, %r15
    jmp mainstart


