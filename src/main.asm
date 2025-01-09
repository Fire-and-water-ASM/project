.text 
	
	main: 
		
		j starter
	
# --- FUNCTIONS --------------------------------------------------------------- #
	
	paint_bg:						# Function to paint the background
		
		lui $8, 0x1001				# Base address of video memory
		addi $9, $0, 32768			# Number of graphic units
		ori $10, $0, 0x2b3205		# Background color (#2B3205)
		
		paint_bg_px:
		
			beq $9, $0, end_paint_bg	# Label to return to the function call
			sw $10, 0($8)			# Paint pixel with background color
    		addi $8, $8, 4			# Increment the address by 4 (next pixel)
    		addi $9, $9, -1			# Decrement the counter
    		j paint_bg_px			# Go back to the loop
    	
    	end_paint_bg:
    	
    		jr $ra					# Return to the function call



    painter:					# Function to paint whatever 
    	
    	lui $8, 0x1001			# Base address of video memory
    	# $4 = POSITION X ( addi $4, $0, 0)
    	# $5 = POSITION Y ( addi $5, $0, 0)
		# $6 = LENGTH     ( addi $6, $0, 0)
    	# $7 = THICKNESS  ( addi $7, $0, 0)
    	# $9 = COLOR (ori $9, $0, 0x000000)
    	add $10, $0, $6			# Storing the Line Length
    	addi $11, $0, 0			# Stating a Line Counter
    	
    	mul $4, $4, 1024		# X * Real_width (1024)
    	mul $5, $5, 2			# Y * 2
    	add $5, $5, $4			# Row + Column
    	add $8, $8, $5			# Starting address of the line 
    	
    	for_vertical:
    		
    		beq $7, 1, end_painter 	# If thickness counter = 1, exit
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
    		
    	end_painter:
    		
    		jr $ra	# Return to the function call
    			

# --- STARTERCODE ------------------------------------------------------------- # 

	starter:
	
		jal paint_bg
		
		# ROUTE (0:57 - 68:79)
		addi $4, $0, 57
		addi $5, $0, 0
		addi $6, $0, 68
		addi $7, $0, 14
		ori  $9, $0, 0x706535
		jal painter
		
		
		
		j end
		
# --- END --------------------------------------------------------------------- # 
	
	end: 
	
		addi $2, $0, 10
		syscall

		