	.align 16
mainconclusion:
    addq $368, %rsp
    popq %rbx
    popq %r13
    popq %r12
    popq %r14
    popq %rbp
    retq 

	.align 16
block298:
    movq $0, %rcx
    movq %rcx, %rax
    jmp mainconclusion

	.align 16
block299:
    movq $42, %rdi
    callq print_int
    jmp block298

	.align 16
block300:
    movq $0, %rdi
    callq print_int
    jmp block298

	.align 16
block301:
    movq free_ptr(%rip), %r11
    addq $408, free_ptr(%rip)
    movq $101, 0(%r11)
    movq %r11, -8(%r15)
    movq -8(%r15), %r11
    movq -216(%rbp), %rax
    movq %rax, 8(%r11)
    movq -8(%r15), %r11
    movq -264(%rbp), %rax
    movq %rax, 16(%r11)
    movq -8(%r15), %r11
    movq -64(%rbp), %rax
    movq %rax, 24(%r11)
    movq -8(%r15), %r11
    movq -192(%rbp), %rax
    movq %rax, 32(%r11)
    movq -8(%r15), %r11
    movq -48(%rbp), %rax
    movq %rax, 40(%r11)
    movq -8(%r15), %r11
    movq -96(%rbp), %rax
    movq %rax, 48(%r11)
    movq -8(%r15), %r11
    movq -184(%rbp), %rax
    movq %rax, 56(%r11)
    movq -8(%r15), %r11
    movq %r14, 64(%r11)
    movq -8(%r15), %r11
    movq -344(%rbp), %rax
    movq %rax, 72(%r11)
    movq -8(%r15), %r11
    movq -392(%rbp), %rax
    movq %rax, 80(%r11)
    movq -8(%r15), %r11
    movq -128(%rbp), %rax
    movq %rax, 88(%r11)
    movq -8(%r15), %r11
    movq -224(%rbp), %rax
    movq %rax, 96(%r11)
    movq -8(%r15), %r11
    movq -312(%rbp), %rax
    movq %rax, 104(%r11)
    movq -8(%r15), %r11
    movq %r12, 112(%r11)
    movq -8(%r15), %r11
    movq -160(%rbp), %rax
    movq %rax, 120(%r11)
    movq -8(%r15), %r11
    movq -152(%rbp), %rax
    movq %rax, 128(%r11)
    movq -8(%r15), %r11
    movq -200(%rbp), %rax
    movq %rax, 136(%r11)
    movq -8(%r15), %r11
    movq -232(%rbp), %rax
    movq %rax, 144(%r11)
    movq -8(%r15), %r11
    movq %r13, 152(%r11)
    movq -8(%r15), %r11
    movq -40(%rbp), %rax
    movq %rax, 160(%r11)
    movq -8(%r15), %r11
    movq -88(%rbp), %rax
    movq %rax, 168(%r11)
    movq -8(%r15), %r11
    movq -240(%rbp), %rax
    movq %rax, 176(%r11)
    movq -8(%r15), %r11
    movq -72(%rbp), %rax
    movq %rax, 184(%r11)
    movq -8(%r15), %r11
    movq -400(%rbp), %rax
    movq %rax, 192(%r11)
    movq -8(%r15), %r11
    movq -248(%rbp), %rax
    movq %rax, 200(%r11)
    movq -8(%r15), %r11
    movq -136(%rbp), %rax
    movq %rax, 208(%r11)
    movq -8(%r15), %r11
    movq -352(%rbp), %rax
    movq %rax, 216(%r11)
    movq -8(%r15), %r11
    movq %rbx, 224(%r11)
    movq -8(%r15), %r11
    movq -208(%rbp), %rax
    movq %rax, 232(%r11)
    movq -8(%r15), %r11
    movq -120(%rbp), %rax
    movq %rax, 240(%r11)
    movq -8(%r15), %r11
    movq -144(%rbp), %rax
    movq %rax, 248(%r11)
    movq -8(%r15), %r11
    movq -168(%rbp), %rax
    movq %rax, 256(%r11)
    movq -8(%r15), %r11
    movq -176(%rbp), %rax
    movq %rax, 264(%r11)
    movq -8(%r15), %r11
    movq -288(%rbp), %rax
    movq %rax, 272(%r11)
    movq -8(%r15), %r11
    movq -368(%rbp), %rax
    movq %rax, 280(%r11)
    movq -8(%r15), %r11
    movq -104(%rbp), %rax
    movq %rax, 288(%r11)
    movq -8(%r15), %r11
    movq -256(%rbp), %rax
    movq %rax, 296(%r11)
    movq -8(%r15), %r11
    movq -384(%rbp), %rax
    movq %rax, 304(%r11)
    movq -8(%r15), %r11
    movq -280(%rbp), %rax
    movq %rax, 312(%r11)
    movq -8(%r15), %r11
    movq -360(%rbp), %rax
    movq %rax, 320(%r11)
    movq -8(%r15), %r11
    movq -80(%rbp), %rax
    movq %rax, 328(%r11)
    movq -8(%r15), %r11
    movq -296(%rbp), %rax
    movq %rax, 336(%r11)
    movq -8(%r15), %r11
    movq -336(%rbp), %rax
    movq %rax, 344(%r11)
    movq -8(%r15), %r11
    movq -320(%rbp), %rax
    movq %rax, 352(%r11)
    movq -8(%r15), %r11
    movq -328(%rbp), %rax
    movq %rax, 360(%r11)
    movq -8(%r15), %r11
    movq -56(%rbp), %rax
    movq %rax, 368(%r11)
    movq -8(%r15), %r11
    movq -112(%rbp), %rax
    movq %rax, 376(%r11)
    movq -8(%r15), %r11
    movq -376(%rbp), %rax
    movq %rax, 384(%r11)
    movq -8(%r15), %r11
    movq -304(%rbp), %rax
    movq %rax, 392(%r11)
    movq -8(%r15), %r11
    movq -272(%rbp), %rax
    movq %rax, 400(%r11)
    movq -8(%r15), %rax
    movq %rax, -16(%r15)
    movq -16(%r15), %rax
    movq 0(%rax), %rax
    sarq %rax
    andq $63, %rax
    movq %rax, %rcx
    cmpq $50, %rcx
    je block299
    jmp block300

	.align 16
block302:
    jmp block301

	.align 16
block303:
    movq %r15, %rdi
    movq $408, %rsi
    callq collect
    jmp block301

	.align 16
mainstart:
    movq $0, -216(%rbp)
    movq $1, -264(%rbp)
    movq $2, -64(%rbp)
    movq $3, -192(%rbp)
    movq $4, -48(%rbp)
    movq $5, -96(%rbp)
    movq $6, -184(%rbp)
    movq $7, %r14
    movq $8, -344(%rbp)
    movq $9, -392(%rbp)
    movq $10, -128(%rbp)
    movq $11, -224(%rbp)
    movq $12, -312(%rbp)
    movq $13, %r12
    movq $14, -160(%rbp)
    movq $15, -152(%rbp)
    movq $16, -200(%rbp)
    movq $17, -232(%rbp)
    movq $18, %r13
    movq $19, -40(%rbp)
    movq $20, -88(%rbp)
    movq $21, -240(%rbp)
    movq $22, -72(%rbp)
    movq $23, -400(%rbp)
    movq $24, -248(%rbp)
    movq $25, -136(%rbp)
    movq $26, -352(%rbp)
    movq $27, %rbx
    movq $28, -208(%rbp)
    movq $29, -120(%rbp)
    movq $30, -144(%rbp)
    movq $31, -168(%rbp)
    movq $32, -176(%rbp)
    movq $33, -288(%rbp)
    movq $34, -368(%rbp)
    movq $35, -104(%rbp)
    movq $36, -256(%rbp)
    movq $37, -384(%rbp)
    movq $38, -280(%rbp)
    movq $39, -360(%rbp)
    movq $40, -80(%rbp)
    movq $41, -296(%rbp)
    movq $42, -336(%rbp)
    movq $43, -320(%rbp)
    movq $44, -328(%rbp)
    movq $45, -56(%rbp)
    movq $46, -112(%rbp)
    movq $47, -376(%rbp)
    movq $48, -304(%rbp)
    movq $49, -272(%rbp)
    movq free_ptr(%rip), %rcx
    movq %rcx, %rdx
    addq $408, %rdx
    movq fromspace_end(%rip), %rcx
    cmpq %rcx, %rdx
    jl block302
    jmp block303

	.globl main
	.align 16
main:
    pushq %rbp
    movq %rsp, %rbp
    pushq %r14
    pushq %r12
    pushq %r13
    pushq %rbx
    subq $368, %rsp
    movq $16384, %rdi
    movq $16384, %rsi
    callq initialize
    movq rootstack_begin(%rip), %r15
    movq $0, 0(%r15)
    addq $8, %r15
    movq $0, 0(%r15)
    addq $8, %r15
    jmp mainstart


