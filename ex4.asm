.global _start

.section .text
_start:
	#your code here
	
	movq $head, %rdi	
	movl $0, %eax
	testq %rdi, %rdi
	je end_HW1
	
	xor %rbx, %rbx #rbx will be the prev node of rdi
	movl val(%rip), %edx
	movq Source(%rip), %rcx
	
	
loop1_HW1:
	#Check if the current node has the same val as val
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
		jne preNodeNotFound_HW1
			lea (%rdx), %rax
			jmp loop2End_HW1
		preNodeNotFound_HW1:
				
		mov 4(%rdx), %rdx
		testq %rdx, %rdx
		jne loop2_HW1
		
	loop2End_HW1:
	
	#update prev nodes (rax and rbx)
	testq %rbx, %rbx
	je valNodeIsHead_HW1
	
	lea 4(%rbx), %rbx
	mov %rcx, (%rbx)
	
	jmp valNodeIsHeadEnd_HW1
	
	valNodeIsHead_HW1:
	leaq head(%rip), %rdx
	mov %rcx, (%rdx)
	
	valNodeIsHeadEnd_HW1:
	
	
	testq %rax, %rax
	je sourceIsHead_HW1
	
	lea 4(%rax), %rax
	mov %rdi, (%rax)
	
	jmp sourceIsHeadEnd_HW1
	
	sourceIsHead_HW1:
	
	leaq head(%rip), %rdx
	mov %rdi, (%rdx)
	
	sourceIsHeadEnd_HW1:
	
	#swap next nodes
	mov 4(%rdi), %rdx
	
	lea 4(%rdi), %rax
	mov 4(%rcx), %rbx
	mov %rbx, (%rax)
	
	lea 4(%rcx), %rax
	mov %rdx, (%rax)
	
	jmp end_HW1
	
	ValNotEqual_HW1:
	
	#Iterate through the list
	lea (%rdi), %rbx
	movq 4(%rdi), %rdi
	testq %rdi, %rdi
	jne loop1_HW1

end_HW1:

