	.align 16
mainconclusion:
    popq %rbp
    retq 

	.align 16
block6:
    addq %rdx, %rcx
    movq %rcx, %rdi
    callq print_int
    movq $0, %rcx
    movq %rcx, %rax
    jmp mainconclusion

	.align 16
block7:
    movq $5, %rdx
    jmp block6

	.align 16
block8:
    movq $3, %rdx
    jmp block6

	.align 16
block9:
    jmp block8

	.align 16
block10:
    movq $3, %rcx
    jmp block9

	.align 16
block11:
    movq $1, %rdi
    callq print_int
    jmp block10

	.align 16
block12:
    movq $0, %rdi
    callq print_int
    jmp block10

	.align 16
block13:
    jmp block11

	.align 16
block14:
    jmp block12

	.align 16
block15:
    jmp block14

	.align 16
block16:
    movq $1, %rdi
    callq print_int
    jmp block15

	.align 16
block17:
    movq $0, %rdi
    callq print_int
    jmp block15

	.align 16
block18:
    jmp block16

	.align 16
block19:
    movq $1, %rdi
    callq print_int
    jmp block18

	.align 16
block20:
    movq $0, %rdi
    callq print_int
    jmp block18

	.align 16
mainstart:
    jmp block19

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


