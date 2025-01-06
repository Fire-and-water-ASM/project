.text
	main:

    # --- Paint the Screen with Background Color ------------------------- #

    	lui $8, 0x1001          # Base address of video memory
    	addi $9, $0, 32768      # Counter for 32768 pixels
    	ori $10, $0, 0x2b3205   # Background color (#2B3205)

	for_bgBaseColor:

   		beq $9, $0, draw_map   # If the counter reaches 0, go to draw the line
    	sw $10, 0($8)           # Paint pixel with background color
    	addi $8, $8, 4          # Increment the address by 4 (next pixel)
    	addi $9, $9, -1         # Decrement the counter
    	j for_bgBaseColor       # Go back to the loop

    # --- Draw the Horizontal Line ----------------------------------- #

	draw_map:
	
    	lui $8, 0x1001          # Reset the base address
    	ori $10, $0, 0x706535   # Line color (#706535)

    # --- Paint the Route ------------------------------------------- #
    
    	addi $11, $0, 14
    	addi $12, $0, 68
    	addi $13, $0, 57344
    
    draw_route:	
    	
    	beq $11, $0, end
    	
    	addi $13, $13, +1024
    	add $8, $8, $13
    	
    	addi $11, $11, -1
    	
    	draw_line:
    	
    	beq $12, $0, draw_route
    	
    	sw $10, 0($8)
    	
    	addi $8, $8, +4
    	addi $12, $12, -1
    	
    	j draw_line
    	
	end:
    	addi $2, $0, 10         # End the program
    	syscall
