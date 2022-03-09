	.align 16
mainconclusion:
    popq %rbp
    retq 

	.align 16
block179:
    movq %rcx, %rdi
    callq print_int
    movq $0, %rcx
    movq %rcx, %rax
    jmp mainconclusion

	.align 16
block180:
    movq $10, %rcx
    addq $32, %rcx
    jmp block179

	.align 16
block181:
    movq $700, %rcx
    addq $77, %rcx
    jmp block179

	.align 16
block182:
    jmp block180

	.align 16
block183:
    jmp block181

	.align 16
block184:
    callq read_int
    movq %rax, %rcx
    cmpq $0, %rcx
    je block182
    jmp block183

	.align 16
block185:
    jmp block181

	.align 16
mainstart:
    callq read_int
    movq %rax, %rcx
    cmpq $1, %rcx
    je block184
    jmp block185

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


