.global _start

.section .text
_start:
	#your code here
	#rsi contains the prev leaf
	xor %rsi, %rsi
	#rdi contains the iterator
	movq root(%rip), %rdi	 
	testq %rdi, %rdi
	je end_HW1
	
	#rdx contains the new node's val
	movq new_node(%rip), %rdx
	movq %rdx, %rdx
	
	#find the father of the fathr of new node
	loop1_HW1:	
		mov %rdi, %rsi
		#Check if the current node has the same val as val
		cmp %rdx, (%rdi)
		je end_HW1
		
		movq $1, (%rdi)
		
		#Iterate through the tree
		cmp %rdx, (%rdi) #if current node val >= new node val
		jg newNodeValIsSmaller_HW1
		
		#if current node val < new node val
		mov 16(%rdi), %rdi
		jmp newNodeValIsSmallerEnd_HW1
		
		newNodeValIsSmaller_HW1:
		mov 8(%rdi), %rdi
		
		newNodeValIsSmallerEnd_HW1:
		
		testq %rdi, %rdi
		jne loop1_HW1
		
	#set the new node to be a son of the father	
	cmp %rdx, (%rsi) #if father val >= new node val
	jg newNodeIsLeftSon_HW1
	
	#if current node val < new node val
	lea 16(%rsi), %rcx
	jmp newNodeIsLeftSonEnd_HW1
	
	newNodeIsLeftSon_HW1:
	lea 8(%rsi), %rcx
	
	newNodeIsLeftSonEnd_HW1:
	
	movq new_node(%rip), %rdx
	mov %rdx, (%rcx)
	
end_HW1: