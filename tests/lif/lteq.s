	.align 16
mainconclusion:
    addq $8, %rsp
    popq %rbx
    popq %rbp
    retq 

	.align 16
block161:
    movq %rcx, %rdi
    callq print_int
    movq $0, %rcx
    movq %rcx, %rax
    jmp mainconclusion

	.align 16
block162:
    movq $42, %rcx
    jmp block161

	.align 16
block163:
    movq $0, %rcx
    jmp block161

	.align 16
mainstart:
    callq read_int
    movq %rax, %rcx
    movq %rcx, %rbx
    subq $2, %rbx
    callq read_int
    movq %rax, %rcx
    addq $2, %rcx
    cmpq %rcx, %rbx
    jle block162
    jmp block163

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


