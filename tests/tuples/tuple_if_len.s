	.align 16
mainconclusion:
    popq %rbx
    popq %r12
    popq %rbp
    retq 

	.align 16
block277:
    movq $0, %rcx
    movq %rcx, %rax
    jmp mainconclusion

	.align 16
block278:
    movq $42, %rdi
    callq print_int
    jmp block277

	.align 16
block279:
    movq $0, %rdi
    callq print_int
    jmp block277

	.align 16
block280:
    movq free_ptr(%rip), %r11
    addq $32, free_ptr(%rip)
    movq $135, 0(%r11)
    movq %r11, -16(%r15)
    movq -16(%r15), %r11
    movq -8(%r15), %rax
    movq %rax, 8(%r11)
    movq -16(%r15), %r11
    movq %rbx, 16(%r11)
    movq -16(%r15), %r11
    movq %r12, 24(%r11)
    movq -16(%r15), %rax
    movq %rax, -40(%r15)
    movq -40(%r15), %rax
    movq 0(%rax), %rax
    sarq %rax
    andq $63, %rax
    movq %rax, %rcx
    cmpq $3, %rcx
    je block278
    jmp block279

	.align 16
block281:
    jmp block280

	.align 16
block282:
    movq %r15, %rdi
    movq $32, %rsi
    callq collect
    jmp block280

	.align 16
block283:
    movq free_ptr(%rip), %r11
    addq $24, free_ptr(%rip)
    movq $5, 0(%r11)
    movq %r11, -24(%r15)
    movq -24(%r15), %r11
    movq %r12, 8(%r11)
    movq -24(%r15), %r11
    movq %rbx, 16(%r11)
    movq -24(%r15), %rax
    movq %rax, -32(%r15)
    movq -32(%r15), %rax
    movq %rax, -8(%r15)
    movq $5, %rbx
    movq $6, %r12
    movq free_ptr(%rip), %rcx
    movq %rcx, %rdx
    addq $32, %rdx
    movq fromspace_end(%rip), %rcx
    cmpq %rcx, %rdx
    jl block281
    jmp block282

	.align 16
block284:
    jmp block283

	.align 16
block285:
    movq %r15, %rdi
    movq $24, %rsi
    callq collect
    jmp block283

	.align 16
mainstart:
    movq $3, %r12
    movq $5, %rbx
    movq free_ptr(%rip), %rcx
    movq %rcx, %rdx
    addq $24, %rdx
    movq fromspace_end(%rip), %rcx
    cmpq %rcx, %rdx
    jl block284
    jmp block285

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
    movq $0, 0(%r15)
    addq $8, %r15
    movq $0, 0(%r15)
    addq $8, %r15
    movq $0, 0(%r15)
    addq $8, %r15
    movq $0, 0(%r15)
    addq $8, %r15
    movq $0, 0(%r15)
    addq $8, %r15
    jmp mainstart


