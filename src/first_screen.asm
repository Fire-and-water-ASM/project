.text  

	main:
		
		j starter
	
# --- FUNCTIONS --------------------------------------------------------------- #
		
	paint_bg:						# Function to paint the background
		
		lui $8, 0x1001				# Base address of video memory
		addi $9, $0, 32768			# Number of graphic units
		ori $10, $0, 0x2b3205		# Background color (#2B3205)
		
		paint_bg_px:
		
			beq $9, $0, return 		# Label to return to the function call
			sw $10, 0($8)			# Paint pixel with background color
    		addi $8, $8, 4			# Increment the address by 4 (next pixel)
    		addi $9, $9, -1			# Decrement the counter
    		j paint_bg_px			# Go back to the loop
    	
    	return:
    	
    		jr $ra					# Return to the function call



    painter:					# Function to paint whatever 
    	
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
 
    	
    store_fb_body:
    
    	addi $10, $0, 5 # counter (5)
    	
    	store_fb_body_for:
    	
    		beq $10, $0, return
    		addi $sp, $sp, -20 # ( 5 [address] * 4 [unity])
    		sw $11, 0($sp)
    		sw $12, 4($sp)
    		sw $13, 8($sp)
    		sw $14, 12($sp)
    		sw $15, 16($sp)
    		
    		addi $sp, $sp, 16
    		addi $10, $10, -5
 	 		j store_fb_body_for
 	 			  	
    paint_fb_body:
    
    	ori $9, $0, 0xff0000
        addi $10, $0, 30 # counter
    
    	paint_fb_body_for:
    	
    		beq $10, $0, return
    		lui $8, 0x1001
    		lw $11, 0($sp)
    		add $8, $8, $11
    		sw $9, 0($8)
    	
    		addi $sp, $sp, 4
    		addi $10, $10, -1
    		j paint_fb_body_for
    		
    		
    		
    		
    		
    
    
# --- STARTERCODE ------------------------------------------------------------- # 

	starter:
		# $4 = POSITION Y ( addi $4, $0, 0)
    	# $5 = POSITION X ( addi $5, $0, 0)
		# $6 = WIDTH     ( addi $6, $0, 0)
    	# $7 = HEIGHT  ( addi $7, $0, 0)
    	# $9 = COLOR (ori $9, $0, 0x000000)
    	
		jal paint_bg
		
		#0:57 - 68:71
		addi $4, $0, 57
		addi $5, $0, 0
		addi $6, $0, 68
		addi $7, $0, 15
		ori  $9, $0, 0x706535
		jal painter
		
		#52:36 - 68:71
		addi $4, $0, 36
		addi $5, $0, 53
		addi $6, $0, 15
		addi $7, $0, 22
		ori  $9, $0, 0x706535
		jal painter
		
		#13:36 - 51:51
		addi $4, $0, 36
		addi $5, $0, 13
		addi $6, $0, 40
		addi $7, $0, 15
		ori  $9, $0, 0x706535
		jal painter
		
		#13:17 - 28:35
		addi $4, $0, 17
		addi $5, $0, 13
		addi $6, $0, 15
		addi $7, $0, 20
		ori  $9, $0, 0x706535
		jal painter

		
		#28:17 - 233:30
		addi $4, $0, 17
		addi $5, $0, 28
		addi $6, $0, 204
		addi $7, $0, 15
		ori  $9, $0, 0x706535
		jal painter
		
		#74:31 - 88:46
		addi $4, $0, 31
		addi $5, $0, 74
		addi $6, $0, 15
		addi $7, $0, 15
		ori  $9, $0, 0x8D8044
		jal painter
		
		#139:30 - 158:46
		addi $4, $0, 30
		addi $5, $0, 139
		addi $6, $0, 15
		addi $7, $0, 21
		ori  $9, $0, 0x706535
		jal painter
		
		#159:36 - 254:46
		addi $4, $0, 36
		addi $5, $0, 154
		addi $6, $0, 97
		addi $7, $0, 15
		ori  $9, $0, 0x706535
		jal painter
		
		#239:20 - 254:35
		addi $4, $0, 22
		addi $5, $0, 236
		addi $6, $0, 15
		addi $7, $0, 15
		ori  $9, $0, 0x8D8044
		jal painter
		
		#239:47 - 254:83
		addi $4, $0, 47
		addi $5, $0, 236
		addi $6, $0, 15
		addi $7, $0, 37
		ori  $9, $0, 0x706535
		jal painter
		
		addi $4, $0, 59
		addi $5, $0, 251
		addi $6, $0, 5
		addi $7, $0, 15
		ori  $9, $0, 0x706535
		jal painter
		
		#31:72 - 45:88
		addi $4, $0, 71
		addi $5, $0, 31
		addi $6, $0, 15
		addi $7, $0, 16
		ori  $9, $0, 0x706535
		jal painter
		
		#15:89 - 120:103
		addi $4, $0, 86
		addi $5, $0, 16
		addi $6, $0, 98
		addi $7, $0, 15
		ori  $9, $0, 0x706535
		jal painter
		
		#15:89 SAFE AREA
		addi $4, $0, 86
		addi $5, $0, 16
		addi $6, $0, 15
		addi $7, $0, 15
		ori  $9, $0, 0x8D8044
		jal painter
		
		#76:89 SAFE AREA
		addi $4, $0, 86
		addi $5, $0, 99
		addi $6, $0, 15
		addi $7, $0, 15
		ori  $9, $0, 0x8D8044
		jal painter
		
		#84:69 - 99:88
		addi $4, $0, 69
		addi $5, $0, 84
		addi $6, $0, 15
		addi $7, $0, 19
		ori  $9, $0, 0x706535
		jal painter
		
		#100:69 - 233:84
		addi $4, $0, 69
		addi $5, $0, 99
		addi $6, $0, 133
		addi $7, $0, 15
		ori  $9, $0, 0x706535
		jal painter
		
		#126:84 - 141:103
		addi $4, $0, 83
		addi $5, $0, 126
		addi $6, $0, 15
		addi $7, $0, 19
		ori  $9, $0, 0x706535
		jal painter
		
		#210:84 - 224:88
		addi $4, $0, 83
		addi $5, $0, 210
		addi $6, $0, 15
		addi $7, $0, 5
		ori  $9, $0, 0x706535
		jal painter
		
		#142:89 - 250:103
		addi $4, $0, 87
		addi $5, $0, 141
		addi $6, $0, 110
		addi $7, $0, 15
		ori  $9, $0, 0x706535
		jal painter
		
		#145:104 - 160:119
		addi $4, $0, 101
		addi $5, $0, 146
		addi $6, $0, 15
		addi $7, $0, 15
		ori  $9, $0, 0x8D8044
		jal painter
		
		#193:104 - 210:122
		addi $4, $0, 101
		addi $5, $0, 193
		addi $6, $0, 15
		addi $7, $0, 20
		ori  $9, $0, 0x706535
		jal painter
		
		#211:109 - 228:122
		addi $4, $0, 106
		addi $5, $0, 208
		addi $6, $0, 15
		addi $7, $0, 15
		ori  $9, $0, 0x8D8044
		jal painter
		
		#Walls

		addi $4, $0, 54
		addi $5, $0, 0
		addi $6, $0, 53
		addi $7, $0, 3
		ori  $9, $0, 0x191b03
		jal painter
		
		addi $4, $0, 50
		addi $5, $0, 50
		addi $6, $0, 3
		addi $7, $0, 5
		ori  $9, $0, 0x191b03
		jal painter
		
		addi $4, $0, 50
		addi $5, $0, 13
		addi $6, $0, 38
		addi $7, $0, 3
		ori  $9, $0, 0x191b03
		jal painter
		
		addi $4, $0, 17
		addi $5, $0, 10
		addi $6, $0, 3
		addi $7, $0, 36
		ori  $9, $0, 0x191b03
		jal painter
		
		addi $4, $0, 15
		addi $5, $0, 10
		addi $6, $0, 222
		addi $7, $0, 3
		ori  $9, $0, 0x191b03
		jal painter
		
		addi $4, $0, 15
		addi $5, $0, 232
		addi $6, $0, 4
		addi $7, $0, 17
		ori  $9, $0, 0x191b03
		jal painter
		
		addi $4, $0, 20
		addi $5, $0, 236
		addi $6, $0, 15
		addi $7, $0, 3
		ori  $9, $0, 0x191b03
		jal painter
		
		addi $4, $0, 20
		addi $5, $0, 251
		addi $6, $0, 3
		addi $7, $0, 40
		ori  $9, $0, 0x191b03
		jal painter
		
		addi $4, $0, 73
		addi $5, $0, 251
		addi $6, $0, 3
		addi $7, $0, 10
		ori  $9, $0, 0x191b03
		jal painter
		
		addi $4, $0, 82
		addi $5, $0, 236
		addi $6, $0, 18
		addi $7, $0, 6
		ori  $9, $0, 0x191b03
		jal painter
		
		addi $4, $0, 50
		addi $5, $0, 232
		addi $6, $0, 4
		addi $7, $0, 38
		ori  $9, $0, 0x191b03
		jal painter
		
		addi $4, $0, 54
		addi $5, $0, 0
		addi $6, $0, 53
		addi $7, $0, 3
		ori  $9, $0, 0x191b03
		jal painter
		
		addi $4, $0, 31
		addi $5, $0, 136
		addi $6, $0, 3
		addi $7, $0, 20
		ori  $9, $0, 0x191b03
		jal painter
		
		addi $4, $0, 31
		addi $5, $0, 89
		addi $6, $0, 49
		addi $7, $0, 3
		ori  $9, $0, 0x191b03
		jal painter
		
		addi $4, $0, 31
		addi $5, $0, 89
		addi $6, $0, 3
		addi $7, $0, 15
		ori  $9, $0, 0x191b03
		jal painter
		
		addi $4, $0, 45
		addi $5, $0, 74
		addi $6, $0, 18
		addi $7, $0, 3
		ori  $9, $0, 0x191b03
		jal painter
		
		addi $4, $0, 31
		addi $5, $0, 71
		addi $6, $0, 3
		addi $7, $0, 17
		ori  $9, $0, 0x191b03
		jal painter
		
		addi $4, $0, 31
		addi $5, $0, 28
		addi $6, $0, 44
		addi $7, $0, 3
		ori  $9, $0, 0x191b03
		jal painter
		
		addi $4, $0, 31
		addi $5, $0, 28
		addi $6, $0, 3
		addi $7, $0, 6
		ori  $9, $0, 0x191b03
		jal painter
		
		addi $4, $0, 34
		addi $5, $0, 28
		addi $6, $0, 40
		addi $7, $0, 3
		ori  $9, $0, 0x191b03
		jal painter
		
		addi $4, $0, 34
		addi $5, $0, 68
		addi $6, $0, 3
		addi $7, $0, 39
		ori  $9, $0, 0x191b03
		jal painter
		
		addi $4, $0, 71
		addi $5, $0, 46
		addi $6, $0, 25
		addi $7, $0, 3
		ori  $9, $0, 0x191b03
		jal painter
		
		addi $4, $0, 71
		addi $5, $0, 46
		addi $6, $0, 3
		addi $7, $0, 16
		ori  $9, $0, 0x191b03
		jal painter
		
		addi $4, $0, 84
		addi $5, $0, 46
		addi $6, $0, 38
		addi $7, $0, 3
		ori  $9, $0, 0x191b03
		jal painter
		
		addi $4, $0, 69
		addi $5, $0, 81
		addi $6, $0, 3
		addi $7, $0, 18
		ori  $9, $0, 0x191b03
		jal painter
		
		addi $4, $0, 50
		addi $5, $0, 136
		addi $6, $0, 100
		addi $7, $0, 3
		ori  $9, $0, 0x191b03
		jal painter
		
		addi $4, $0, 34
		addi $5, $0, 154
		addi $6, $0, 82
		addi $7, $0, 3
		ori  $9, $0, 0x191b03
		jal painter
		
		addi $4, $0, 32
		addi $5, $0, 154
		addi $6, $0, 3
		addi $7, $0, 3
		ori  $9, $0, 0x191b03
		jal painter
		
		addi $4, $0, 30
		addi $5, $0, 154
		addi $6, $0, 80
		addi $7, $0, 3
		ori  $9, $0, 0x191b03
		jal painter
		
		addi $4, $0, 30
		addi $5, $0, 233
		addi $6, $0, 3
		addi $7, $0, 5
		ori  $9, $0, 0x191b03
		jal painter
		
		addi $4, $0, 71
		addi $5, $0, 0
		addi $6, $0, 30
		addi $7, $0, 3
		ori  $9, $0, 0x191b03
		jal painter
		
		addi $4, $0, 71
		addi $5, $0, 30
		addi $6, $0, 3
		addi $7, $0, 16
		ori  $9, $0, 0x191b03
		jal painter
		
		addi $4, $0, 85
		addi $5, $0, 15
		addi $6, $0, 18
		addi $7, $0, 3
		ori  $9, $0, 0x191b03
		jal painter
		
		addi $4, $0, 85
		addi $5, $0, 15
		addi $6, $0, 3
		addi $7, $0, 18
		ori  $9, $0, 0x191b03
		jal painter
		
		addi $4, $0, 100
		addi $5, $0, 15
		addi $6, $0, 100
		addi $7, $0, 3
		ori  $9, $0, 0x191b03
		jal painter
		
		addi $4, $0, 85
		addi $5, $0, 115
		addi $6, $0, 3
		addi $7, $0, 18
		ori  $9, $0, 0x191b03
		jal painter
		
		addi $4, $0, 83
		addi $5, $0, 99
		addi $6, $0, 27
		addi $7, $0, 4
		ori  $9, $0, 0x191b03
		jal painter
		
		addi $4, $0, 83
		addi $5, $0, 124
		addi $6, $0, 3
		addi $7, $0, 20
		ori  $9, $0, 0x191b03
		jal painter
		
		addi $4, $0, 101
		addi $5, $0, 124
		addi $6, $0, 20
		addi $7, $0, 3
		ori  $9, $0, 0x191b03
		jal painter
		
		addi $4, $0, 101
		addi $5, $0, 144
		addi $6, $0, 3
		addi $7, $0, 17
		ori  $9, $0, 0x191b03
		jal painter
		
		addi $4, $0, 115
		addi $5, $0, 144
		addi $6, $0, 19
		addi $7, $0, 3
		ori  $9, $0, 0x191b03
		jal painter
		
		addi $4, $0, 101
		addi $5, $0, 161
		addi $6, $0, 3
		addi $7, $0, 17
		ori  $9, $0, 0x191b03
		jal painter
		
		addi $4, $0, 101
		addi $5, $0, 161
		addi $6, $0, 32
		addi $7, $0, 3
		ori  $9, $0, 0x191b03
		jal painter
		
		addi $4, $0, 101
		addi $5, $0, 190
		addi $6, $0, 3
		addi $7, $0, 21
		ori  $9, $0, 0x191b03
		jal painter
		
		addi $4, $0, 120
		addi $5, $0, 190
		addi $6, $0, 35
		addi $7, $0, 3
		ori  $9, $0, 0x191b03
		jal painter
		
		addi $4, $0, 104
		addi $5, $0, 222
		addi $6, $0, 3
		addi $7, $0, 19
		ori  $9, $0, 0x191b03
		jal painter
		
		addi $4, $0, 104
		addi $5, $0, 208
		addi $6, $0, 15
		addi $7, $0, 3
		ori  $9, $0, 0x191b03
		jal painter
		
		addi $4, $0, 101
		addi $5, $0, 208
		addi $6, $0, 3
		addi $7, $0, 5
		ori  $9, $0, 0x191b03
		jal painter
		
		addi $4, $0, 101
		addi $5, $0, 208
		addi $6, $0, 45
		addi $7, $0, 3
		ori  $9, $0, 0x191b03
		jal painter
		
		addi $4, $0, 86
		addi $5, $0, 251
		addi $6, $0, 3
		addi $7, $0, 17
		ori  $9, $0, 0x191b03
		jal painter
		
		addi $4, $0, 83
		addi $5, $0, 225
		addi $6, $0, 30
		addi $7, $0, 5
		ori  $9, $0, 0x191b03
		jal painter
		
		addi $4, $0, 83
		addi $5, $0, 140
		addi $6, $0, 70
		addi $7, $0, 5
		ori  $9, $0, 0x191b03
		jal painter
		
		addi $4, $0, 68
		addi $5, $0, 82
		addi $6, $0, 150
		addi $7, $0, 3
		ori  $9, $0, 0x191b03
		jal painter
		
		# Path between Route 1 and 2
		addi $4, $0, 50
		addi $5, $0, 180
		addi $6, $0, 15
		addi $7, $0, 23
		ori  $9, $0, 0x706535
		jal painter
		
		addi $4, $0, 50
		addi $5, $0, 177
		addi $6, $0, 3
		addi $7, $0, 20
		ori  $9, $0, 0x191b03
		jal painter
		
		addi $4, $0, 50
		addi $5, $0, 195
		addi $6, $0, 3
		addi $7, $0, 20
		ori  $9, $0, 0x191b03
		jal painter
    
		
		addi $11, $0, 60420
    	addi $12, $0, 60428
   		addi $13, $0, 60432
    	addi $14, $0, 60436
    	addi $15, $0, 60444
    	jal store_fb_body
	
	    addi $11, $0, 61448
    	addi $12, $0, 61452
	    addi $13, $0, 61456
    	addi $14, $0, 61460
    	addi $15, $0, 61464
    	jal store_fb_body
	
	    addi $11, $0, 62472
	    addi $12, $0, 62476
	    addi $13, $0, 62480
	    addi $14, $0, 62484
	    addi $15, $0, 62488
    	jal store_fb_body

    	addi $11, $0, 63500
    	addi $12, $0, 63504
    	addi $13, $0, 63508
    	addi $14, $0, 64528
    	addi $15, $0, 65548
    	jal store_fb_body

    	addi $11, $0, 65552
    	addi $12, $0, 65556
    	addi $13, $0, 66568
    	addi $14, $0, 66576
    	addi $15, $0, 66584
    	jal store_fb_body

    	addi $11, $0, 67600
    	addi $12, $0, 68620
    	addi $13, $0, 68628
    	addi $14, $0, 69644
    	addi $15, $0, 69652
    	jal store_fb_body
	
	
	
		jal paint_fb_body
	
		j end
		
		
# --- END --------------------------------------------------------------------- # 
	
	end: 
	
		addi $2, $0, 10
		syscall

		
