	.align 16
mainconclusion:
    popq %rbp
    retq 

	.align 16
block167:
    movq $0, %rcx
    movq %rcx, %rax
    jmp mainconclusion

	.align 16
block168:
    jmp block167

	.align 16
block169:
    jmp block168

	.align 16
block170:
    jmp block169

	.align 16
block171:
    movq $42, %rdi
    callq print_int
    jmp block170

	.align 16
block172:
    movq $0, %rdi
    callq print_int
    jmp block170

	.align 16
block173:
    cmpq $4, %rcx
    jg block171
    jmp block172

	.align 16
block174:
    movq $0, %rdi
    callq print_int
    jmp block169

	.align 16
block175:
    cmpq $3, %rcx
    jg block173
    jmp block174

	.align 16
block176:
    movq $0, %rdi
    callq print_int
    jmp block168

	.align 16
block177:
    cmpq $2, %rcx
    jg block175
    jmp block176

	.align 16
block178:
    movq $0, %rdi
    callq print_int
    jmp block167

	.align 16
mainstart:
    callq read_int
    movq %rax, %rcx
    cmpq $1, %rcx
    jg block177
    jmp block178

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


