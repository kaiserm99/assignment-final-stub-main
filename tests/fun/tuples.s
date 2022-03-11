	.align 16
funcconclusion:
    popq %rbp
    retq 

	.align 16
funcstart:
    movq %rdi, -8(%r15)
    movq -8(%r15), %r11
    movq 8(%r11), %rcx
    movq %rcx, %rax
    jmp funcconclusion

	.align 16
func:
    pushq %rbp
    movq %rsp, %rbp
    movq $0, 0(%r15)
    addq $8, %r15
    jmp funcstart

	.align 16
mainconclusion:
    addq $8, %rsp
    popq %rbx
    popq %r13
    popq %r12
    popq %rbp
    retq 

	.align 16
block322:
    movq free_ptr(%rip), %r11
    addq $24, free_ptr(%rip)
    movq $5, 0(%r11)
    movq %r11, -8(%r15)
    movq -8(%r15), %r11
    movq %r13, 8(%r11)
    movq -8(%r15), %r11
    movq %rbx, 16(%r11)
    movq -8(%r15), %rax
    movq %rax, -16(%r15)
    movq -16(%r15), %rdi
    callq *%r12
    movq %rax, %rcx
    movq %rcx, %rdi
    callq print_int
    movq $0, %rcx
    movq %rcx, %rax
    jmp mainconclusion

	.align 16
block323:
    jmp block322

	.align 16
block324:
    movq %r15, %rdi
    movq $24, %rsi
    callq collect
    jmp block322

	.align 16
mainstart:
    leaq func(%rip), %r12
    movq $42, %r13
    movq $0, %rbx
    movq free_ptr(%rip), %rcx
    addq $24, %rcx
    movq fromspace_end(%rip), %rdx
    cmpq %rdx, %rcx
    jl block323
    jmp block324

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


