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
	#place the node's val in eax
	movl (%rdi), %eax

	#Check if the current node has the same val as Value
	cmpl %edx, %eax
	jne ValNotEqual_HW1
	
	movl $222, dword ptr %rdi
	
	ValNotEqual_HW1:
	
	#Iterate through the list
	movq 4(%rdi), %rdi
	testq %rdi, %rdi
	jne loop_HW1

end_HW1:

