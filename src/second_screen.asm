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
    	mul $5, $5, 4			# Y * 4
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
		
		#(0:59 - 41:73)
		addi $4, $0, 59
		addi $5, $0, 0
		addi $6, $0, 41
		addi $7, $0, 15
		ori  $9, $0, 0x706535
		jal painter
		
		#(27:39 - 41:58)
		addi $4, $0, 41
		addi $5, $0, 26
		addi $6, $0, 15
		addi $7, $0, 19
		ori  $9, $0, 0x706535
		jal painter
		
		#(8:39 - 26:53)
		addi $4, $0, 41
		addi $5, $0, 8
		addi $6, $0, 20
		addi $7, $0, 15
		ori  $9, $0, 0x706535
		jal painter
		
		#(8:20 - 22:38)
		addi $4, $0, 22
		addi $5, $0, 8
		addi $6, $0, 15
		addi $7, $0, 20
		ori  $9, $0, 0x706535
		jal painter
		
		#(0:59 - 41:73)
		addi $4, $0, 8
		addi $5, $0, 8
		addi $6, $0, 15
		addi $7, $0, 15
		ori  $9, $0, 0x8D8044
		jal painter
		
		#(23:20 - 104:34)
		addi $4, $0, 22
		addi $5, $0, 23
		addi $6, $0, 81
		addi $7, $0, 15
		ori  $9, $0, 0x706535
		jal painter
		
		#(90:35 - 104:55)
		addi $4, $0, 35
		addi $5, $0, 89
		addi $6, $0, 15
		addi $7, $0, 20
		ori  $9, $0, 0x706535
		jal painter
		
		#(105:41)
		addi $4, $0, 40
		addi $5, $0, 104
		addi $6, $0, 40
		addi $7, $0, 15
		ori  $9, $0, 0x706535
		jal painter
		
		#(109:26)
		addi $4, $0, 26
		addi $5, $0, 109
		addi $6, $0, 15
		addi $7, $0, 15
		ori  $9, $0, 0x8D8044
		jal painter
		
		#(128:19 - 142:40)
		addi $4, $0, 22
		addi $5, $0, 129
		addi $6, $0, 15
		addi $7, $0, 19
		ori  $9, $0, 0x706535
		jal painter
		
		#(143:19 - 196:33)
		addi $4, $0, 22
		addi $5, $0, 143
		addi $6, $0, 53
		addi $7, $0, 15
		ori  $9, $0, 0x706535
		jal painter
		
		addi $4, $0, 22
		addi $5, $0, 196
		addi $6, $0, 15
		addi $7, $0, 15
		ori  $9, $0, 0x8D8044
		jal painter
		
		#(143:19 - 196:33)
		addi $4, $0, 36
		addi $5, $0, 171
		addi $6, $0, 15
		addi $7, $0, 34
		ori  $9, $0, 0x706535
		jal painter
		
		addi $4, $0, 55
		addi $5, $0, 150
		addi $6, $0, 61
		addi $7, $0, 15
		ori  $9, $0, 0x706535
		jal painter
		
		addi $4, $0, 41
		addi $5, $0, 150
		addi $6, $0, 15
		addi $7, $0, 15
		ori  $9, $0, 0x8D8044
		jal painter
		
		addi $4, $0, 69
		addi $5, $0, 196
		addi $6, $0, 15
		addi $7, $0, 25
		ori  $9, $0, 0x706535
		jal painter
		
		addi $4, $0, 100
		addi $5, $0, 150
		addi $6, $0, 85
		addi $7, $0, 15
		ori  $9, $0, 0x706535
		jal painter
		
		addi $4, $0, 100
		addi $5, $0, 235
		addi $6, $0, 15
		addi $7, $0, 15
		ori  $9, $0, 0x8D8044
		jal painter
		
		addi $4, $0, 28
		addi $5, $0, 217
		addi $6, $0, 15
		addi $7, $0, 80
		ori  $9, $0, 0x706535
		jal painter
		
		addi $4, $0, 28
		addi $5, $0, 217
		addi $6, $0, 39
		addi $7, $0, 15
		ori  $9, $0, 0x706535
		jal painter
		
		addi $4, $0, 86
		addi $5, $0, 150
		addi $6, $0, 15
		addi $7, $0, 15
		ori  $9, $0, 0x706535
		jal painter
		
		addi $4, $0, 86
		addi $5, $0, 88
		addi $6, $0, 62
		addi $7, $0, 15
		ori  $9, $0, 0x706535
		jal painter
		
		addi $4, $0, 100
		addi $5, $0, 88
		addi $6, $0, 15
		addi $7, $0, 15
		ori  $9, $0, 0x706535
		jal painter
		
		addi $4, $0, 100
		addi $5, $0, 119
		addi $6, $0, 15
		addi $7, $0, 15
		ori  $9, $0, 0x8D8044
		jal painter
		
		addi $4, $0, 100
		addi $5, $0, 26
		addi $6, $0, 65
		addi $7, $0, 15
		ori  $9, $0, 0x706535
		jal painter
		
		addi $4, $0, 73
		addi $5, $0, 26
		addi $6, $0, 15
		addi $7, $0, 40
		ori  $9, $0, 0x706535
		jal painter
		
		addi $4, $0, 100
		addi $5, $0, 11
		addi $6, $0, 15
		addi $7, $0, 15
		ori  $9, $0, 0x8D8044
		jal painter
		
		addi $4, $0, 69
		addi $5, $0, 150
		addi $6, $0, 15
		addi $7, $0, 15
		ori  $9, $0, 0x706535
		jal painter
		
		addi $4, $0, 69
		addi $5, $0, 70
		addi $6, $0, 95
		addi $7, $0, 15
		ori  $9, $0, 0x706535
		jal painter
		
		addi $4, $0, 83
		addi $5, $0, 70
		addi $6, $0, 15
		addi $7, $0, 15
		ori  $9, $0, 0x706535
		jal painter
		
		addi $4, $0, 83
		addi $5, $0, 35
		addi $6, $0, 50
		addi $7, $0, 15
		ori  $9, $0, 0x706535
		jal painter
		
		addi $4, $0, 55
		addi $5, $0, 70
		addi $6, $0, 15
		addi $7, $0, 15
		ori  $9, $0, 0x706535
		jal painter
		
		addi $4, $0, 55
		addi $5, $0, 55
		addi $6, $0, 15
		addi $7, $0, 15
		ori  $9, $0, 0x8D8044
		jal painter
		
		addi $4, $0, 57
		addi $5, $0, 0
		addi $6, $0, 25
		addi $7, $0, 3
		ori  $9, $0, 0x191b03
		jal painter
		
		addi $4, $0, 55
		addi $5, $0, 23
		addi $6, $0, 3
		addi $7, $0, 5
		ori  $9, $0, 0x191b03
		jal painter
		
		addi $4, $0, 55
		addi $5, $0, 8
		addi $6, $0, 15
		addi $7, $0, 3
		ori  $9, $0, 0x191b03
		jal painter
		
		addi $4, $0, 8
		addi $5, $0, 5
		addi $6, $0, 3
		addi $7, $0, 52
		ori  $9, $0, 0x191b03
		jal painter
		
		addi $4, $0, 6
		addi $5, $0, 5
		addi $6, $0, 19
		addi $7, $0, 3
		ori  $9, $0, 0x191b03
		jal painter
		
		addi $4, $0, 6
		addi $5, $0, 23
		addi $6, $0, 3
		addi $7, $0, 17
		ori  $9, $0, 0x191b03
		jal painter
		
		addi $4, $0, 20
		addi $5, $0, 23
		addi $6, $0, 82
		addi $7, $0, 3
		ori  $9, $0, 0x191b03
		jal painter
		
		addi $4, $0, 20
		addi $5, $0, 104
		addi $6, $0, 3
		addi $7, $0, 21
		ori  $9, $0, 0x191b03
		jal painter
		
		addi $4, $0, 26
		addi $5, $0, 106
		addi $6, $0, 3
		addi $7, $0, 15
		ori  $9, $0, 0x191b03
		jal painter
		
		addi $4, $0, 24
		addi $5, $0, 106
		addi $6, $0, 20
		addi $7, $0, 3
		ori  $9, $0, 0x191b03
		jal painter
		
		addi $4, $0, 24
		addi $5, $0, 124
		addi $6, $0, 3
		addi $7, $0, 17
		ori  $9, $0, 0x191b03
		jal painter
		
		addi $4, $0, 22
		addi $5, $0, 126
		addi $6, $0, 3
		addi $7, $0, 19
		ori  $9, $0, 0x191b03
		jal painter
		
		addi $4, $0, 20
		addi $5, $0, 126
		addi $6, $0, 85
		addi $7, $0, 3
		ori  $9, $0, 0x191b03
		jal painter
		
		addi $4, $0, 20
		addi $5, $0, 211
		addi $6, $0, 3
		addi $7, $0, 18
		ori  $9, $0, 0x191b03
		jal painter
		
		addi $4, $0, 36
		addi $5, $0, 186
		addi $6, $0, 28
		addi $7, $0, 3
		ori  $9, $0, 0x191b03
		jal painter
		
		addi $4, $0, 36
		addi $5, $0, 186
		addi $6, $0, 3
		addi $7, $0, 20
		ori  $9, $0, 0x191b03
		jal painter
		
		addi $4, $0, 53
		addi $5, $0, 186
		addi $6, $0, 25
		addi $7, $0, 3
		ori  $9, $0, 0x191b03
		jal painter
		
		addi $4, $0, 53
		addi $5, $0, 211
		addi $6, $0, 3
		addi $7, $0, 42
		ori  $9, $0, 0x191b03
		jal painter
		
		addi $4, $0, 93
		addi $5, $0, 196
		addi $6, $0, 17
		addi $7, $0, 3
		ori  $9, $0, 0x191b03
		jal painter
		
		addi $4, $0, 69
		addi $5, $0, 193
		addi $6, $0, 3
		addi $7, $0, 27
		ori  $9, $0, 0x191b03
		jal painter
		
		addi $4, $0, 69
		addi $5, $0, 165
		addi $6, $0, 30
		addi $7, $0, 3
		ori  $9, $0, 0x191b03
		jal painter
		
		addi $4, $0, 69
		addi $5, $0, 165
		addi $6, $0, 3
		addi $7, $0, 32
		ori  $9, $0, 0x191b03
		jal painter
		
		addi $4, $0, 83
		addi $5, $0, 85
		addi $6, $0, 80
		addi $7, $0, 4
		ori  $9, $0, 0x191b03
		jal painter
		
		addi $4, $0, 83
		addi $5, $0, 85
		addi $6, $0, 3
		addi $7, $0, 18
		ori  $9, $0, 0x191b03
		jal painter
		
		addi $4, $0, 97
		addi $5, $0, 41
		addi $6, $0, 45
		addi $7, $0, 4
		ori  $9, $0, 0x191b03
		jal painter
		j end
		
# --- END --------------------------------------------------------------------- # 
	
	end: 
	
		addi $2, $0, 10
		syscall

		
