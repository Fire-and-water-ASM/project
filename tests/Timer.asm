.text
	main:
		
		j tester
		
	return:
		jr $ra
		
	timer:
		addi $16, $0, 500000 # 500.000
		timer_for:
		beq $16, $0, return
		addi $16, $16, -1
		j timer_for
	
	tester:
		addi $2, $0, 11
		addi $4, $0, 'T'
		syscall
		
		jal timer
		j tester
		
