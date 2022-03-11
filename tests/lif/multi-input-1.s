	.align 16
mainconclusion:
    addq $8, %rsp
    popq %rbx
    popq %rbp
    retq 

	.align 16
block151:
    movq $0, %rcx
    movq %rcx, %rax
    jmp mainconclusion

	.align 16
block152:
    movq %rcx, %rdi
    callq print_int
    jmp block151

	.align 16
block153:
    movq $0, %rcx
    jmp block152

	.align 16
block154:
    movq $1, %rcx
    jmp block152

	.align 16
block155:
    callq read_int
    movq %rax, %rcx
    movq $42, %rdx
    addq %rcx, %rdx
    movq %rdx, %rdi
    callq print_int
    jmp block151

	.align 16
block156:
    callq read_int
    movq %rax, %rcx
    cmpq $0, %rcx
    je block153
    jmp block154

	.align 16
block157:
    jmp block155

	.align 16
block158:
    jmp block156

	.align 16
block159:
    callq read_int
    movq %rax, %rbx
    callq read_int
    movq %rax, %rcx
    cmpq %rcx, %rbx
    jg block157
    jmp block158

	.align 16
block160:
    jmp block156

	.align 16
mainstart:
    callq read_int
    movq %rax, %rbx
    callq read_int
    movq %rax, %rcx
    cmpq %rcx, %rbx
    jl block159
    jmp block160

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


