	.align 16
mainconclusion:
    addq $8, %rsp
    popq %rbx
    popq %rbp
    retq 

	.align 16
block286:
    movq free_ptr(%rip), %r11
    addq $16, free_ptr(%rip)
    movq $131, 0(%r11)
    movq %r11, -24(%r15)
    movq -24(%r15), %r11
    movq -8(%r15), %rax
    movq %rax, 8(%r11)
    movq -24(%r15), %rax
    movq %rax, -40(%r15)
    movq -40(%r15), %r11
    movq 8(%r11), %rax
    movq %rax, -32(%r15)
    movq -32(%r15), %r11
    movq 8(%r11), %rcx
    movq %rcx, %rdi
    callq print_int
    movq $0, %rcx
    movq %rcx, %rax
    jmp mainconclusion

	.align 16
block287:
    jmp block286

	.align 16
block288:
    movq %r15, %rdi
    movq $16, %rsi
    callq collect
    jmp block286

	.align 16
block289:
    movq free_ptr(%rip), %r11
    addq $16, free_ptr(%rip)
    movq $3, 0(%r11)
    movq %r11, -16(%r15)
    movq -16(%r15), %r11
    movq %rbx, 8(%r11)
    movq -16(%r15), %rax
    movq %rax, -8(%r15)
    movq free_ptr(%rip), %rcx
    movq %rcx, %rdx
    addq $16, %rdx
    movq fromspace_end(%rip), %rcx
    cmpq %rcx, %rdx
    jl block287
    jmp block288

	.align 16
block290:
    jmp block289

	.align 16
block291:
    movq %r15, %rdi
    movq $16, %rsi
    callq collect
    jmp block289

	.align 16
mainstart:
    movq $42, %rbx
    movq free_ptr(%rip), %rcx
    addq $16, %rcx
    movq fromspace_end(%rip), %rdx
    cmpq %rdx, %rcx
    jl block290
    jmp block291

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


