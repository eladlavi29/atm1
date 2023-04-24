.global _start

.section .text
_start:
xorq %rbx, %rbx
movq (num), %rax
movq $0, %r8

loop_HW1: cmpq $64, %rbx
je end_HW1
incq %rbx
shr $1, %rax
jb adder_HW1
jmp loop_HW1


adder_HW1: incb %r8b
jmp loop_HW1

end_HW1: movb %r8b, (Bool)
