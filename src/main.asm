.text
	main:
		
		# Loading initial values
		
		lui $8, 0x1001 # Declaring the Data Address
		
		# Paiting the Background ----------------------------- #
		
		addi $9, $0, 32768 # Counter
		ori $10, $0, 0x2b3205 # BgBaseColor
		
		for_bgBaseColor:
	
			beq $9, $0, end # If(Counter == 0): jump to "end"
			sw $10, 0($8) # Painting pixel
			addi $8, $8, 4 # Adding +4 to Address
			addi $9, $9, -1 # Counter += -1 
			j for_bgBaseColor
			
		# ----------------------------------------------------- #
	
	end:
		
		addi $2, $0, 10
		syscall
		
		
		