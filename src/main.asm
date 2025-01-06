.text
	main:

    # --- Paint the Screen with Background Color ------------------------- #

    	lui $8, 0x1001          # Base address of video memory
    	addi $9, $0, 32768      # Counter for 32768 pixels
    	ori $10, $0, 0x2b3205   # Background color (#2B3205)

	for_bgBaseColor:

   		beq $9, $0, draw_line   # If the counter reaches 0, go to draw the line
    	sw $10, 0($8)           # Paint pixel with background color
    	addi $8, $8, 4          # Increment the address by 4 (next pixel)
    	addi $9, $9, -1         # Decrement the counter
    	j for_bgBaseColor       # Go back to the loop

    # --- Draw the Horizontal Line ----------------------------- #

	draw_line:
	
    	lui $8, 0x1001          # Reset the base address
    	ori $10, $0, 0x706535   # Line color (#706535)

    # Horizontal line configuration
    
    	addi $11, $0, 100        # Line length (in logical pixels)
    	addi $12, $0, 20        # Initial position (logical column)
    	addi $13, $0, 50       # Line position (logical row)

    # Calculate the starting address of the line
    
    	mul $13, $13, 1024      # logical_row * real_width (1024)
    	mul $12, $12, 2         # logical_column * 2
    	add $13, $13, $12       # row + column
    	add $8, $8, $13         # Starting address of the line (corrected)

    # Loop to draw the line
    
	for_horizontal:
	
    	beq $11, $0, end        # If length is 0, exit
    	sw $10, 0($8)           # Paint pixel with the line color
    	addi $8, $8, 1024       # Increment the address by 1024 weight line
    	sw $10, 0($8) 	     # Paint pixel with the line color
    	addi $8, $8, -1024      # back original address
    	addi $8, $8, 4	     # Increment the address by 4 (next logical pixel)
    	addi $11, $11, -1       # Decrease the line length
    	j for_horizontal        # Continue the loop

    # --- Finalize ------------------------------------------------ #

	end:
    	addi $2, $0, 10         # End the program
    	syscall
