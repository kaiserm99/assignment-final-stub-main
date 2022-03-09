	.align 16
mainconclusion:
    popq %rbx
    popq %r12
    popq %rbp
    retq 

	.align 16
block237:
    movq free_ptr(%rip), %r11
    addq $24, free_ptr(%rip)
    movq $5, 0(%r11)
    movq %r11, -8(%r15)
    movq -8(%r15), %r11
    movq %r12, 8(%r11)
    movq -8(%r15), %r11
    movq %rbx, 16(%r11)
    movq -8(%r15), %rax
    movq %rax, -16(%r15)
    movq -16(%r15), %r11
    movq 16(%r11), %rcx
    movq %rcx, %rdi
    callq print_int
    movq $0, %rcx
    movq %rcx, %rax
    jmp mainconclusion

	.align 16
block238:
    jmp block237

	.align 16
block239:
    movq %r15, %rdi
    movq $24, %rsi
    callq collect
    jmp block237

	.align 16
block240:
    movq $32, %rbx
    movq free_ptr(%rip), %rcx
    addq $24, %rcx
    movq fromspace_end(%rip), %rdx
    cmpq %rdx, %rcx
    jl block238
    jmp block239

	.align 16
mainstart:
    movq $1, %r12
    jmp block240

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
    jmp mainstart


