.text
	main:

    # --- Paint the Screen with Background Color ------------------------- #

    	lui $8, 0x1001          # Base address of video memory
    	addi $9, $0, 32768      # Counter for 32768 pixels
    	ori $10, $0, 0x2b3205   # Background color (#2B3205)

	for_bgBaseColor:

   		beq $9, $0, draw	     # If the counter reaches 0, go to draw the line
    	sw $10, 0($8)           # Paint pixel with background color
    	addi $8, $8, 4          # Increment the address by 4 (next pixel)
    	addi $9, $9, -1         # Decrement the counter
    	j for_bgBaseColor       # Go back to the loop

    # --- Draw the Horizontal Line ----------------------------- #

	draw:
	
    	lui $8, 0x1001          # Reset the base address
    	ori $10, $0, 0x706535   # Line color (#706535)

    # Horizontal line configuration
    
<<<<<<< HEAD
    	addi $11, $0, 68        # Line length (in logical pixels)
    	addi $12, $0, 0        # Initial position (logical column)
    	addi $13, $0, 57       # Line position (logical row)
    	add  $14, $0, $11	    # Storing the line lenght in $14
    	addi $15, $0, 0        # Line counter
    	addi $16, $0, 14       # Line thickness
=======
    	addi $11, $0, 100        # Line length (in logical pixels)
    	addi $12, $0, 0        # Initial position (logical column)
    	addi $13, $0, 57       # Line position (logical row)
>>>>>>> e55adeac1ce973d217a4b21a4781de561b83a349

    # Calculate the starting address of the line
    
    	mul $13, $13, 1024      # logical_row * real_width (1024)
    	mul $12, $12, 2         # logical_column * 2
    	add $13, $13, $12       # row + column
    	add $8, $8, $13         # Starting address of the line (corrected)

    # Loop to draw
    
    for_vertical:
    
    	beq $16, 1, end		# If thickness counter = 1, exit
    	addi $16, $16, -1	# Decrease the vertical counter
    	
		for_horizontal:
	
<<<<<<< HEAD
    		beq $11, $0, config_row    # If length = 0, config_row
    		sw $10, 0($8)           	# Paint pixel with the line color
    		addi $8, $8, 4	     		# Increment the address by 4 (next logical pixel)
    		addi $15, $15, 4       		# Increment in counter
    		addi $11, $11, -1      		# Decrease the line length
    		j for_horizontal        	# Continue the loop
    	
    		# Reset all configs and jump to another line (vertical -= 1)
    	
    		config_row:
    			
    			add $11, $0, $14	# Increment $11 the original value ($14)
    			sub $8, $8, $15		# Decrease the addresses added in $8
    			addi $8, $8, 1024	# Increment 1024 to skip a line
    			addi $15, $0, 0		# Resetting the $15
    			
    			j for_vertical		# Continue the loop


=======
    	beq $11, $0, end        # If length is 0, exit
    	sw $10, 0($8)           # Paint pixel with the line color
    	addi $8, $8, 4	     # Increment the address by 4 (next logical pixel)
    	addi $11, $11, -1       # Decrease the line length
    	j for_horizontal        # Continue the loop

>>>>>>> e55adeac1ce973d217a4b21a4781de561b83a349
    # --- End ------------------------------------------------ #

	end:
    	addi $2, $0, 10         # End the program
    	syscall
