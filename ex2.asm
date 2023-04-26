.global _start

.section .text
_start:
xor %rax, %rax
movl (num), %eax
leaq source, %rbx
leaq destination, %rcx
xorq %rdx, %rdx
xorq %r14, %r14
xorq %r10, %r10
xor %r13, %r13
movl (num), %r13d
movq %rax, %r12
xor %r15, %r15

cmpl $0, %eax
jl neg_HW1


before_main_HW1:
cmpq %r10,%rax
je move_on_HW1

leaq (%rbx,%r10), %r11
cmpq %rcx, %r11
je before_need_work_HW1
inc %r10
jmp before_main_HW1


before_need_work_HW1:
movq %r10, %r13
subq %r10, %r12
addq %r12, %r10
addq %r12, %r14

need_work_HW1:
#cmpq %r10,%rax
#je move_on_HW1
#movb (%rcx,%r14), %r8b
#leaq (%rcx,%r10), %r9
#movb %r8b, (%r9)
#inc %r10
#inc %r14
#jmp need_work_HW1

cmpq %r15, %r12
je move_on_HW1
dec %r10
dec %r14
movb (%rcx,%r14), %r8b
leaq (%rcx,%r10), %r9
movb %r8b, (%r9)
inc %r15
jmp need_work_HW1




move_on_HW1:
movq %r13, %rax
leaq source, %rbx
leaq destination, %rcx
xorq %rdx, %rdx


loop_HW1: cmpq %rax, %rdx
je end_HW1
movb (%rbx,%rdx), %r8b
leaq (%rcx,%rdx), %r9
movb %r8b, (%r9)
inc %rdx
jmp loop_HW1



neg_HW1: movl %eax, (%rcx)

end_HW1:
