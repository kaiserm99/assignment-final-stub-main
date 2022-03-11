	.align 16
mainconclusion:
    addq $8, %rsp
    popq %rbx
    popq %rbp
    retq 

	.align 16
block131:
    movq $0, %rcx
    movq %rcx, %rax
    jmp mainconclusion

	.align 16
block132:
    movq %rcx, %rdi
    callq print_int
    jmp block131

	.align 16
block133:
    movq $0, %rcx
    jmp block132

	.align 16
block134:
    movq $1, %rcx
    jmp block132

	.align 16
block135:
    callq read_int
    movq %rax, %rcx
    movq $42, %rdx
    addq %rcx, %rdx
    movq %rdx, %rdi
    callq print_int
    jmp block131

	.align 16
block136:
    callq read_int
    movq %rax, %rcx
    cmpq $0, %rcx
    je block133
    jmp block134

	.align 16
block137:
    jmp block135

	.align 16
block138:
    jmp block136

	.align 16
block139:
    callq read_int
    movq %rax, %rbx
    callq read_int
    movq %rax, %rcx
    cmpq %rcx, %rbx
    jg block137
    jmp block138

	.align 16
block140:
    jmp block136

	.align 16
mainstart:
    callq read_int
    movq %rax, %rbx
    callq read_int
    movq %rax, %rcx
    cmpq %rcx, %rbx
    jl block139
    jmp block140

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
    jmp mainstart


