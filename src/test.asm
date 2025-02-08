.text
	main:
		j start

painter:				# Function to paint whatever 
    	
    	lui $8, 0x1001			# Base address of video memory
    	
    	add $10, $0, $6			# Storing the Line Length
    	addi $11, $0, 0			# Stating a Line Counter
    	
    	mul $4, $4, 1024		# X * Real_width (1024)
    	mul $5, $5, 4			# Y * 4
    	add $5, $5, $4			# Row + Column
    	add $8, $8, $5			# Starting address of the line 
    	
    	for_vertical:
    		
    		beq $7, 1, return	 	# If thickness counter = 1, exit
    		addi $7, $7, -1 		# Decrease the vertical counter
    		
    		for_horizontal:
    		
    			beq $6, $0, reset_painter 	# If length = 0, reset painter
    			sw $9, 0($8)				# Paint pixel with the line color
    			addi $8, $8, 4	     		# Increment the address by 4 (next logical pixel)
    			addi $11, $11, 4       		# Increment in counter
    			addi $6, $6, -1      		# Decrease the line length
    			j for_horizontal
    			
    			reset_painter:
    				
    				add $6, $0, $10		# Increment LENGHT REGISTER the original value ($10)
    				sub $8, $8, $11			# Decrease the addresses added in $8
    				addi $8, $8, 1024		# Increment 1024 to skip a line
    				addi $11, $0, 0			# Resetting the $11
    				j for_vertical
    	
return:
	jr $ra
	
timer:
	addi $4, $0, 20000
	nop
	timer_for:
	nop
	beq $4, $0, return
	addi $4, $4, -1
	j timer_for
	nop

start:
	addi $4, $0, 0
	addi $5, $0, 0
	addi $6, $0, 512
	addi $7, $0, 256
	ori  $9, $0, 0x2b3205
	jal painter
	
	lui $8, 0x1001
	lw $4, 51200($8)
	addi $2, $0, 1
	syscall
	
	ori $4, $0, 0xff00ff
	sw $4, 58464($8)
	sw $4, 66660($8)
