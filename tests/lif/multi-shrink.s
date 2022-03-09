	.align 16
mainconclusion:
    popq %rbx
    popq %r12
    popq %rbp
    retq 

	.align 16
block61:
    movq $0, %rcx
    movq %rcx, %rax
    jmp mainconclusion

	.align 16
block62:
    movq %rcx, %rdi
    callq print_int
    jmp block61

	.align 16
block63:
    movq $20, %rcx
    jmp block62

	.align 16
block64:
    movq %r12, %rcx
    subq %rbx, %rcx
    jmp block62

	.align 16
block65:
    movq %r12, %rdx
    addq $5, %rdx
    movq %rbx, %rcx
    addq %rbx, %rcx
    cmpq %rcx, %rdx
    jg block63
    jmp block64

	.align 16
block66:
    movq $0, %rdi
    callq print_int
    jmp block61

	.align 16
block67:
    jmp block65

	.align 16
block68:
    jmp block66

	.align 16
block69:
    jmp block67

	.align 16
block70:
    jmp block68

	.align 16
block71:
    jmp block67

	.align 16
block72:
    cmpq $20, %rbx
    jge block69
    jmp block70

	.align 16
block73:
    cmpq $10, %rbx
    jl block71
    jmp block72

	.align 16
block74:
    jmp block66

	.align 16
block75:
    cmpq $10, %r12
    jle block73
    jmp block74

	.align 16
block76:
    movq %rcx, %rdi
    callq print_int
    jmp block75

	.align 16
block77:
    movq $20, %rcx
    jmp block76

	.align 16
block78:
    movq %r12, %rcx
    subq %rbx, %rcx
    jmp block76

	.align 16
block79:
    movq %r12, %rcx
    addq $5, %rcx
    movq %rbx, %rdx
    addq %rbx, %rdx
    cmpq %rdx, %rcx
    jl block77
    jmp block78

	.align 16
block80:
    movq $0, %rdi
    callq print_int
    jmp block75

	.align 16
block81:
    jmp block79

	.align 16
block82:
    jmp block80

	.align 16
block83:
    jmp block81

	.align 16
block84:
    jmp block82

	.align 16
block85:
    jmp block81

	.align 16
block86:
    cmpq $20, %rbx
    jge block83
    jmp block84

	.align 16
block87:
    cmpq $10, %rbx
    jl block85
    jmp block86

	.align 16
block88:
    jmp block80

	.align 16
mainstart:
    callq read_int
    movq %rax, %r12
    callq read_int
    movq %rax, %rbx
    cmpq $1, %r12
    jg block87
    jmp block88

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
    jmp mainstart


