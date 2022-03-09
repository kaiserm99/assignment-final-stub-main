	.align 16
mainconclusion:
    popq %rbp
    retq 

	.align 16
block193:
    movq %rcx, %rdi
    callq print_int
    movq $0, %rcx
    movq %rcx, %rax
    jmp mainconclusion

	.align 16
block194:
    jmp block193

	.align 16
block195:
    movq $42, %rcx
    jmp block194

	.align 16
block196:
    movq $777, %rcx
    jmp block194

	.align 16
block197:
    cmpq $0, %rdx
    je block195
    jmp block196

	.align 16
block198:
    movq $0, %rcx
    jmp block193

	.align 16
mainstart:
    callq read_int
    movq %rax, %rdx
    cmpq $1, %rdx
    sete %al
    movzbq %al, %rcx
    cmpq $0, %rcx
    je block197
    jmp block198

	.globl main
	.align 16
main:
    pushq %rbp
    movq %rsp, %rbp
    movq $16384, %rdi
    movq $16384, %rsi
    callq initialize
    movq rootstack_begin(%rip), %r15
    jmp mainstart


