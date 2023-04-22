.global _start

.section .text
_start:
	#your code here

	movq head(%rip), %rdi	
	movl $0, %eax
	testq %rdi, %rdi
	je end_HW1
	
	xor %rbx, %rbx #rbx will be the prev node of rdi
	movl Value(%rip), %edx
	movq Source(%rip), %rcx

loop1_HW1:
	#Check if the current node has the same val as Value
	cmpl %edx, (%rdi)
	jne ValNotEqual_HW1
	
	#If the detacted node is identical to Source don't do anything
	cmpq (%rdi), %rcx
	je end_HW1

	#Replace the node with Source
	
	#Find the prev nodes of Source (If not found it will be 0)
	xor %rax, %rax #rax will be the prev node of source
	movq head(%rip), %rdx
	
	loop2_HW1:
		cmp 4(%rdx), %rcx
		cmove (%rdx), %rax
		cmp 4(%rdx), %rcx
		jmp loop2End_HW1
		mov 4(%rdx), %rdx
		testq %rdx, %rdx
		jne loop2_HW1
		
	loop2End_HW1:
	
	movl $222, (%rbx)
	#movl $222, (%rax)
	
	/*
	#update prev nodes (rax and rbx)
	testq %rax, %rax
	je valNodeIsHead_HW1
	
	lea 4(%rax), %rax
	lea (%rdi), %rax
	
	jmp valNodeIsHeadEnd_HW1
	
	valNodeIsHead_HW1:
	movq head(%rip), %rdx
	lea (%rdi), %rdx
	
	valNodeIsHeadEnd_HW1:
	
	testq %rbx, %rbx
	je sourceIsHead_HW1
	
	lea 4(%rbx), %rbx
	lea (%rcx), %rbx
	
	jmp sourceIsHeadEnd_HW1
	
	sourceIsHead_HW1:
	
	movq head(%rip), %rdx
	lea (%rcx), %rdx
	
	sourceIsHeadEnd_HW1:
	
	#swap next nodes
	lea 4(%rdi), %rax
	lea 4(%rcx), %rbx
	
	mov %rax, %rdx
	mov %rbx, %rax
	mov %rdx, %rbx
	*/
	
	jmp end_HW1
	
	ValNotEqual_HW1:
	
	#Iterate through the list
	mov %rdi, %rbx
	movq 4(%rdi), %rdi
	testq %rdi, %rdi
	jne loop1_HW1

end_HW1:

