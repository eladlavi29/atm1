.global _start

.section .text
_start:
	#your code here

	movq head(%rip), %rdi	
	movl $0, %eax
	testq %rdi, %rdi
	je end_HW1
	
	movq Source(%rip), %rcx
	movl Value(%rip), %edx

loop_HW1:
	#Check if the current node has the same val as Value
	cmpl %edx, (%rdi)
	jne ValNotEqual_HW1
	
	movl $222, (%rdi)
	
	ValNotEqual_HW1:
	
	#Iterate through the list
	movq 4(%rdi), %rdi
	testq %rdi, %rdi
	jne loop_HW1

end_HW1:

