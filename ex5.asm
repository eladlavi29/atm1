.global _start

.section .text
_start:
	#your code here
	#rdi contains the iterator
	movq root(%rip), %rdi	
	testq %rdi, %rdi
	je end_HW1
	
	#rdx contains the new node's val
	movq new_node(%rip), %rdx
	
	#find the father of the new leaf new node
	loop1_HW1:
		#Check if the current node has the same val as val
		cmp %rdx, (%rdi)
		je end_HW1
		
		#Iterate through the tree
		cmp %rdx, (%rdi) #if current node val <= new node val
		jl newNodeValIsSmaller_HW1
		
		#if current node val > new node val
		mov 16(%rdi), %rdi
		jmp newNodeValIsSmallerEnd_HW1
		
		newNodeValIsSmaller_HW1:
		mov 8(%rdi), %rdi
		
		newNodeValIsSmallerEnd_HW1:
		
		testq %rdi, %rdi
		jne loop1_HW1
	
end_HW1: