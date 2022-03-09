	.align 16
mainconclusion:
    addq $8, %rsp
    popq %rbx
    popq %rbp
    retq 

	.align 16
block307:
    movq free_ptr(%rip), %r11
    addq $16, free_ptr(%rip)
    movq $3, 0(%r11)
    movq %r11, -8(%r15)
    movq -8(%r15), %r11
    movq %rbx, 8(%r11)
    movq $0, %rcx
    movq %rcx, %rax
    jmp mainconclusion

	.align 16
block308:
    jmp block307

	.align 16
block309:
    movq %r15, %rdi
    movq $16, %rsi
    callq collect
    jmp block307

	.align 16
mainstart:
    callq read_int
    movq %rax, %rbx
    movq free_ptr(%rip), %rcx
    addq $16, %rcx
    movq fromspace_end(%rip), %rdx
    cmpq %rdx, %rcx
    jl block308
    jmp block309

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
    jmp mainstart


