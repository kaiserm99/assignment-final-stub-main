	.align 16
truthconclusion:
    popq %rbp
    retq 

	.align 16
truthstart:
    movq $42, %rcx
    movq %rcx, %rax
    jmp truthconclusion

	.align 16
truth:
    pushq %rbp
    movq %rsp, %rbp
    jmp truthstart

	.align 16
funcconclusion:
    addq $8, %rsp
    popq %rbx
    popq %rbp
    retq 

	.align 16
block340:
    movq $1, %rcx
    movq %rcx, %rax
    jmp funcconclusion

	.align 16
block341:
    movq $0, %rcx
    movq %rcx, %rax
    jmp funcconclusion

	.align 16
funcstart:
    movq %rdi, %rbx
    leaq truth(%rip), %rcx
    callq *%rcx
    movq %rax, %rcx
    cmpq %rcx, %rbx
    je block340
    jmp block341

	.align 16
func:
    pushq %rbp
    movq %rsp, %rbp
    pushq %rbx
    subq $8, %rsp
    jmp funcstart

	.align 16
mainconclusion:
    addq $8, %rsp
    popq %rbx
    popq %rbp
    retq 

	.align 16
block342:
    movq %rcx, %rdi
    callq print_int
    movq $0, %rcx
    movq %rcx, %rax
    jmp mainconclusion

	.align 16
block343:
    movq $0, %rcx
    jmp block342

	.align 16
block344:
    movq $42, %rcx
    jmp block342

	.align 16
mainstart:
    leaq func(%rip), %rbx
    callq read_int
    movq %rax, %rcx
    movq %rcx, %rdi
    callq *%rbx
    movq %rax, %rcx
    cmpq $0, %rcx
    je block343
    jmp block344

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


