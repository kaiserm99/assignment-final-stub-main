	.align 16
mainconclusion:
    popq %rbx
    popq %r12
    popq %rbp
    retq 

	.align 16
block271:
    movq $0, %rcx
    movq %rcx, %rax
    jmp mainconclusion

	.align 16
block272:
    movq $42, %rdi
    callq print_int
    jmp block271

	.align 16
block273:
    movq $0, %rdi
    callq print_int
    jmp block271

	.align 16
block274:
    movq free_ptr(%rip), %r11
    addq $24, free_ptr(%rip)
    movq $5, 0(%r11)
    movq %r11, -8(%r15)
    movq -8(%r15), %r11
    movq %r12, 8(%r11)
    movq -8(%r15), %r11
    movq %rbx, 16(%r11)
    movq -8(%r15), %rax
    movq %rax, -24(%r15)
    movq -24(%r15), %rax
    movq %rax, -16(%r15)
    movq -16(%r15), %rax
    cmpq %rax, -24(%r15)
    je block272
    jmp block273

	.align 16
block275:
    jmp block274

	.align 16
block276:
    movq %r15, %rdi
    movq $24, %rsi
    callq collect
    jmp block274

	.align 16
mainstart:
    movq $1, %r12
    callq read_int
    movq %rax, %rbx
    movq free_ptr(%rip), %rcx
    movq %rcx, %rdx
    addq $24, %rdx
    movq fromspace_end(%rip), %rcx
    cmpq %rcx, %rdx
    jl block275
    jmp block276

	.globl main
	.align 16
main:
    pushq %rbp
    movq %rsp, %rbp
    pushq %r12
    pushq %rbx
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
    jmp mainstart


