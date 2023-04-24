.global _start

.section .text
_start:
xor %rax, %rax
movl (num), %eax
leaq source, %rbx
leaq destination, %rcx
xorq %rdx, %rdx

cmpl $0, %eax
jl neg_HW1

loop_HW1: cmpq %rax, %rdx
je end_HW1
movb (%rbx,%rdx), %r8b 
leaq (%rcx,%rdx), %r9 
movb %r8b, (%r9)
inc %rdx
jmp loop_HW1



neg_HW1: movq %rax, (%rcx)

end_HW1:
