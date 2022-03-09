	.align 16
truthconclusion:
    popq %rbp
    retq 

	.align 16
block325:

	.align 16
block326:
    movq $1, %rcx
    movq %rcx, %rax
    jmp truthconclusion

	.align 16
block327:
    movq $0, %rcx
    movq %rcx, %rax
    jmp truthconclusion

	.align 16
truthstart:
    movq %rdi, %rcx
    cmpq $42, %rcx
    je block326
    jmp block327

	.align 16
truth:
    pushq %rbp
    movq %rsp, %rbp
    jmp truthstart

	.align 16
mainconclusion:
    addq $8, %rsp
    popq %rbx
    popq %rbp
    retq 

	.align 16
block328:
    movq $0, %rcx
    movq %rcx, %rax
    jmp mainconclusion

	.align 16
block329:
    movq $0, %rdi
    callq print_int
    jmp block328

	.align 16
block330:
    movq $42, %rdi
    callq print_int
    jmp block328

	.align 16
mainstart:
    leaq truth(%rip), %rbx
    callq read_int
    movq %rax, %rcx
    movq %rcx, %rdi
    callq *%rbx
    movq %rax, %rcx
    cmpq $0, %rcx
    je block329
    jmp block330

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


