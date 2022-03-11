	.align 16
mainconclusion:
    addq $48, %rsp
    popq %rbx
    popq %r13
    popq %r12
    popq %r14
    popq %rbp
    retq 

	.align 16
block241:
    movq free_ptr(%rip), %r11
    addq $24, free_ptr(%rip)
    movq $261, 0(%r11)
    movq %r11, -120(%r15)
    movq -120(%r15), %r11
    movq %rbx, 8(%r11)
    movq -120(%r15), %r11
    movq -8(%r15), %rax
    movq %rax, 16(%r11)
    movq -120(%r15), %rax
    movq %rax, -136(%r15)
    movq -136(%r15), %r11
    movq 16(%r11), %rax
    movq %rax, -184(%r15)
    movq -184(%r15), %r11
    movq 16(%r11), %rax
    movq %rax, -144(%r15)
    movq -144(%r15), %r11
    movq 16(%r11), %rax
    movq %rax, -176(%r15)
    movq -176(%r15), %r11
    movq 16(%r11), %rax
    movq %rax, -128(%r15)
    movq -128(%r15), %r11
    movq 24(%r11), %rax
    movq %rax, -160(%r15)
    movq -160(%r15), %r11
    movq 16(%r11), %rax
    movq %rax, -152(%r15)
    movq -152(%r15), %r11
    movq 16(%r11), %rax
    movq %rax, -168(%r15)
    movq -168(%r15), %r11
    movq 8(%r11), %rcx
    movq %rcx, %rdi
    callq print_int
    movq $0, %rcx
    movq %rcx, %rax
    jmp mainconclusion

	.align 16
block242:
    jmp block241

	.align 16
block243:
    movq %r15, %rdi
    movq $24, %rsi
    callq collect
    jmp block241

	.align 16
block244:
    movq free_ptr(%rip), %r11
    addq $24, free_ptr(%rip)
    movq $261, 0(%r11)
    movq %r11, -112(%r15)
    movq -112(%r15), %r11
    movq %r12, 8(%r11)
    movq -112(%r15), %r11
    movq -48(%r15), %rax
    movq %rax, 16(%r11)
    movq -112(%r15), %rax
    movq %rax, -8(%r15)
    movq free_ptr(%rip), %rcx
    movq %rcx, %rdx
    addq $24, %rdx
    movq fromspace_end(%rip), %rcx
    cmpq %rcx, %rdx
    jl block242
    jmp block243

	.align 16
block245:
    jmp block244

	.align 16
block246:
    movq %r15, %rdi
    movq $24, %rsi
    callq collect
    jmp block244

	.align 16
block247:
    movq free_ptr(%rip), %r11
    addq $24, free_ptr(%rip)
    movq $261, 0(%r11)
    movq %r11, -104(%r15)
    movq -104(%r15), %r11
    movq %r13, 8(%r11)
    movq -104(%r15), %r11
    movq -16(%r15), %rax
    movq %rax, 16(%r11)
    movq -104(%r15), %rax
    movq %rax, -48(%r15)
    movq free_ptr(%rip), %rcx
    movq %rcx, %rdx
    addq $24, %rdx
    movq fromspace_end(%rip), %rcx
    cmpq %rcx, %rdx
    jl block245
    jmp block246

	.align 16
block248:
    jmp block247

	.align 16
block249:
    movq %r15, %rdi
    movq $24, %rsi
    callq collect
    jmp block247

	.align 16
block250:
    movq free_ptr(%rip), %r11
    addq $24, free_ptr(%rip)
    movq $261, 0(%r11)
    movq %r11, -96(%r15)
    movq -96(%r15), %r11
    movq %r14, 8(%r11)
    movq -96(%r15), %r11
    movq -56(%r15), %rax
    movq %rax, 16(%r11)
    movq -96(%r15), %rax
    movq %rax, -16(%r15)
    movq free_ptr(%rip), %rcx
    addq $24, %rcx
    movq fromspace_end(%rip), %rdx
    cmpq %rdx, %rcx
    jl block248
    jmp block249

	.align 16
block251:
    jmp block250

	.align 16
block252:
    movq %r15, %rdi
    movq $24, %rsi
    callq collect
    jmp block250

	.align 16
block253:
    movq free_ptr(%rip), %r11
    addq $32, free_ptr(%rip)
    movq $519, 0(%r11)
    movq %r11, -88(%r15)
    movq -88(%r15), %r11
    movq -48(%rbp), %rax
    movq %rax, 8(%r11)
    movq -88(%r15), %r11
    movq -40(%rbp), %rax
    movq %rax, 16(%r11)
    movq -88(%r15), %r11
    movq -24(%r15), %rax
    movq %rax, 24(%r11)
    movq -88(%r15), %rax
    movq %rax, -56(%r15)
    movq free_ptr(%rip), %rcx
    addq $24, %rcx
    movq fromspace_end(%rip), %rdx
    cmpq %rdx, %rcx
    jl block251
    jmp block252

	.align 16
block254:
    jmp block253

	.align 16
block255:
    movq %r15, %rdi
    movq $32, %rsi
    callq collect
    jmp block253

	.align 16
block256:
    movq free_ptr(%rip), %r11
    addq $24, free_ptr(%rip)
    movq $261, 0(%r11)
    movq %r11, -80(%r15)
    movq -80(%r15), %r11
    movq -56(%rbp), %rax
    movq %rax, 8(%r11)
    movq -80(%r15), %r11
    movq -32(%r15), %rax
    movq %rax, 16(%r11)
    movq -80(%r15), %rax
    movq %rax, -24(%r15)
    movq free_ptr(%rip), %rcx
    addq $32, %rcx
    movq fromspace_end(%rip), %rdx
    cmpq %rdx, %rcx
    jl block254
    jmp block255

	.align 16
block257:
    jmp block256

	.align 16
block258:
    movq %r15, %rdi
    movq $24, %rsi
    callq collect
    jmp block256

	.align 16
block259:
    movq free_ptr(%rip), %r11
    addq $24, free_ptr(%rip)
    movq $261, 0(%r11)
    movq %r11, -64(%r15)
    movq -64(%r15), %r11
    movq -64(%rbp), %rax
    movq %rax, 8(%r11)
    movq -64(%r15), %r11
    movq -40(%r15), %rax
    movq %rax, 16(%r11)
    movq -64(%r15), %rax
    movq %rax, -32(%r15)
    movq free_ptr(%rip), %rcx
    addq $24, %rcx
    movq fromspace_end(%rip), %rdx
    cmpq %rdx, %rcx
    jl block257
    jmp block258

	.align 16
block260:
    jmp block259

	.align 16
block261:
    movq %r15, %rdi
    movq $24, %rsi
    callq collect
    jmp block259

	.align 16
block262:
    movq free_ptr(%rip), %r11
    addq $16, free_ptr(%rip)
    movq $3, 0(%r11)
    movq %r11, -72(%r15)
    movq -72(%r15), %r11
    movq -72(%rbp), %rax
    movq %rax, 8(%r11)
    movq -72(%r15), %rax
    movq %rax, -40(%r15)
    movq free_ptr(%rip), %rcx
    movq %rcx, %rdx
    addq $24, %rdx
    movq fromspace_end(%rip), %rcx
    cmpq %rcx, %rdx
    jl block260
    jmp block261

	.align 16
block263:
    jmp block262

	.align 16
block264:
    movq %r15, %rdi
    movq $16, %rsi
    callq collect
    jmp block262

	.align 16
mainstart:
    movq $3, %rbx
    movq $4, %r12
    movq $5, %r13
    movq $6, %r14
    movq $6, -48(%rbp)
    movq $3, -40(%rbp)
    movq $5, -56(%rbp)
    movq $1, -64(%rbp)
    movq $42, -72(%rbp)
    movq free_ptr(%rip), %rcx
    movq %rcx, %rdx
    addq $16, %rdx
    movq fromspace_end(%rip), %rcx
    cmpq %rcx, %rdx
    jl block263
    jmp block264

	.globl main
	.align 16
main:
    pushq %rbp
    movq %rsp, %rbp
    pushq %r14
    pushq %r12
    pushq %r13
    pushq %rbx
    subq $48, %rsp
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
    movq $0, 0(%r15)
    addq $8, %r15
    movq $0, 0(%r15)
    addq $8, %r15
    movq $0, 0(%r15)
    addq $8, %r15
    jmp mainstart


