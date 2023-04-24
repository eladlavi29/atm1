.global _start

.section .text
_start:

movq $array1, %rax
movq $array2, %rbx
movq $mergedArray, %rcx


movq $0, %r8
movq $0, %r9
movq $0, %r10
movq $0, %r14

loop_HW1: 
movl (%rax,%r8,4), %r11d
cmpl $0, %r11d 
jne main_HW1
movl (%rbx,%r9,4), %r12d
cmpl $0, %r12d
jne main_HW1

jmp finish_HW1

main_HW1:
movl (%rax,%r8,4), %r11d
movl (%rbx,%r9,4), %r12d


leal (%rcx,%r10,4), %r13d

cmp %r11d, %r12d
jb firstbigger_HW1


secondbigger_HW1:
inc %r9
cmpl %r14d, %r12d
je loop_HW1
movl %r12d, %r14d
movl %r12d, (%r13d)
jmp cont_HW1

firstbigger_HW1: 
inc %r8
cmpl %r14d, %r11d
je loop_HW1
movl %r11d, %r14d
movl %r11d, (%r13d)
jmp cont_HW1


cont_HW1:
inc %r10
jmp loop_HW1


finish_HW1:
leal (%rcx,%r10,4), %r13d
movl $0, (%r13d)


