.text
	main:
		
		jal start
		
# --- FUNCTIONS --------------------------------------------------------------- #

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
	addi $16, $0, 20000
	nop
	timer_for:
	nop
	beq $16, $0, return
	addi $16, $16, -1
	j timer_for
	nop
	
# --- CODE ---------------------------------------------------#
	# $4 = POSITION Y ( addi $4, $0, 0)
	# $5 = POSITION X ( addi $5, $0, 0)
	# $6 = WIDTH     ( addi $6, $0, 0)
	# $7 = HEIGHT  ( addi $7, $0, 0)
	# $9 = COLOR (ori $9, $0, 0x000000)
    
start:
    	
    	#Background
	addi $4, $0, 0
	addi $5, $0, 0
	addi $6, $0, 512
	addi $7, $0, 256
	ori  $9, $0, 0x2b3205
	jal painter
	
	
	#Details: Horizontal
    	addi $4, $0, 0
    	addi $5, $0, 0
    	addi $6, $0, 256
    	addi $7, $0, 6 
   	ori  $9, $0, 0x5a660f 
   	jal painter
   	
    	addi $4, $0, 12
    	addi $5, $0, 0
    	addi $6, $0, 256
    	addi $7, $0, 6 
   	ori  $9, $0, 0x5a660f 
   	jal painter
   	
    	addi $4, $0, 24
    	addi $5, $0, 0
    	addi $6, $0, 256
    	addi $7, $0, 6 
   	ori  $9, $0, 0x5a660f 
   	jal painter
   	
    	addi $4, $0, 36
    	addi $5, $0, 0
    	addi $6, $0, 256
    	addi $7, $0, 6 
   	ori  $9, $0, 0x5a660f 
   	jal painter
   	
   	addi $4, $0, 48
    	addi $5, $0, 0
    	addi $6, $0, 256
    	addi $7, $0, 6 
   	ori  $9, $0, 0x5a660f 
   	jal painter
   	
   	addi $4, $0, 60
    	addi $5, $0, 0
    	addi $6, $0, 256
    	addi $7, $0, 6 
   	ori  $9, $0, 0x5a660f 
   	jal painter
   	
   	addi $4, $0, 72
    	addi $5, $0, 0
    	addi $6, $0, 256
    	addi $7, $0, 6 
   	ori  $9, $0, 0x5a660f 
   	jal painter
   	
   	addi $4, $0, 84
    	addi $5, $0, 0
    	addi $6, $0, 256
    	addi $7, $0, 6 
   	ori  $9, $0, 0x5a660f 
   	jal painter
   	
   	addi $4, $0, 96
    	addi $5, $0, 0
    	addi $6, $0, 256
    	addi $7, $0, 6 
   	ori  $9, $0, 0x5a660f 
   	jal painter
   	
   	addi $4, $0, 108
    	addi $5, $0, 0
    	addi $6, $0, 256
    	addi $7, $0, 6 
   	ori  $9, $0, 0x5a660f 
   	jal painter
   	
   	addi $4, $0, 120
    	addi $5, $0, 0
    	addi $6, $0, 256
    	addi $7, $0, 6 
   	ori  $9, $0, 0x5a660f 
   	jal painter
   	
   	addi $4, $0, 132
    	addi $5, $0, 0
    	addi $6, $0, 256
    	addi $7, $0, 6 
   	ori  $9, $0, 0x5a660f 
   	jal painter
   	
   	#Details: Vertical
   	addi $4, $0, 0
    	addi $5, $0, 0
    	addi $6, $0, 6
    	addi $7, $0, 512 
   	ori  $9, $0, 0x2b3205
   	jal painter
   	
   	addi $4, $0, 0
    	addi $5, $0, 24
    	addi $6, $0, 6
    	addi $7, $0, 512 
   	ori  $9, $0, 0x2b3205
   	jal painter
   	
   	addi $4, $0, 0
    	addi $5, $0, 48
    	addi $6, $0, 6
    	addi $7, $0, 512 
   	ori  $9, $0, 0x2b3205
   	jal painter
   	
   	addi $4, $0, 0
    	addi $5, $0, 72
    	addi $6, $0, 6
    	addi $7, $0, 512 
   	ori  $9, $0, 0x2b3205
   	jal painter
   	
   	addi $4, $0, 0
    	addi $5, $0, 96
    	addi $6, $0, 6
    	addi $7, $0, 512 
   	ori  $9, $0, 0x2b3205
   	jal painter
   	
   	addi $4, $0, 0
    	addi $5, $0, 120
    	addi $6, $0, 6
    	addi $7, $0, 512 
   	ori  $9, $0, 0x2b3205
   	jal painter
   	
   	addi $4, $0, 0
    	addi $5, $0, 144
    	addi $6, $0, 6
    	addi $7, $0, 512 
   	ori  $9, $0, 0x2b3205
   	jal painter
   	
   	addi $4, $0, 0
    	addi $5, $0, 168
    	addi $6, $0, 6
    	addi $7, $0, 512 
   	ori  $9, $0, 0x2b3205
   	jal painter
   	
   	addi $4, $0, 0
    	addi $5, $0, 192
    	addi $6, $0, 6
    	addi $7, $0, 512 
   	ori  $9, $0, 0x2b3205
   	jal painter
   	
   	addi $4, $0, 0
    	addi $5, $0, 216
    	addi $6, $0, 6
    	addi $7, $0, 512 
   	ori  $9, $0, 0x2b3205
   	jal painter
   	
   	addi $4, $0, 0
    	addi $5, $0, 240
    	addi $6, $0, 6
    	addi $7, $0, 512 
   	ori  $9, $0, 0x2b3205
   	jal painter
	
	#Routes
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
        addi $7, $0, 27
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
        addi $6, $0, 115
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
        addi $5, $0, 114
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
        addi $5, $0, 211
        addi $6, $0, 45
        addi $7, $0, 3
        ori  $9, $0, 0x191b03
        jal painter
        
        addi $4, $0, 83
        addi $5, $0, 225
        addi $6, $0, 32
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
        
        addi $4, $0, 73
        addi $5, $0, 232
        addi $6, $0, 25
        addi $7, $0, 3
        ori  $9, $0, 0x191b03
        jal painter
		
		addi $16, $0, -1
		addi $17, $0, -1
		addi $18, $0, 180
		addi $19, $0, 100
		
paint_fireboy:
       	
       	addi $4, $22, 63
    	addi $5, $23, 20
    	addi $6, $0, 4
    	addi $7, $0, 5
    	ori  $9, $0, 0xf91111
   	 jal painter
   	 
   	  	
       	addi $4, $22, 64
    	addi $5, $23, 19
    	addi $6, $0, 2
    	addi $7, $0, 2
    	ori  $9, $0, 0xf91111
   	 jal painter
   	 
   	 	  	
       	addi $4, $22, 65
    	addi $5, $23, 18
    	addi $6, $0, 2
    	addi $7, $0, 2
    	ori  $9, $0, 0xf91111
   	 jal painter
   	 
   	 addi $4, $22, 64
    	addi $5, $23, 23
    	addi $6, $0, 2
    	addi $7, $0, 2
    	ori  $9, $0, 0xf91111
   	 jal painter
   	 
   	 	  	
       	addi $4, $22, 65
    	addi $5, $23, 24
    	addi $6, $0, 2
    	addi $7, $0, 2
    	ori  $9, $0, 0xf91111
   	 jal painter
   	 
   	  	  	
       	addi $4, $22, 67
    	addi $5, $23, 20
    	addi $6, $0, 2
    	addi $7, $0, 2
    	ori  $9, $0, 0xf91111
   	 jal painter
   	 
   	addi $4, $22, 68
    	addi $5, $23, 19
    	addi $6, $0, 2
    	addi $7, $0, 2
    	ori  $9, $0, 0xf91111
   	 jal painter
   	 
   	 addi $4, $22, 67
    	addi $5, $23, 23
    	addi $6, $0, 2
    	addi $7, $0, 2
    	ori  $9, $0, 0xf91111
   	 jal painter
   	 
   	addi $4, $22, 68 
    	addi $5, $23, 24
    	addi $6, $0, 2
    	addi $7, $0, 2
    	ori  $9, $0, 0xf91111
   	 jal painter
   	 
   	 
       	addi $4, $22, 62
    	addi $5, $23, 21
    	addi $6, $0, 2
    	addi $7, $0, 2
    	ori  $9, $0, 0xf91111
   	 jal painter
   	 
   	 addi $4, $22, 58
    	addi $5, $23, 20
    	addi $6, $0, 4
    	addi $7, $0, 5
    	ori  $9, $0, 0xf91111
   	 jal painter
   	 
   	addi $4, $22, 58
    	addi $5, $23,20
    	addi $6, $0, 1
    	addi $7, $0, 3 
    	ori  $9, $0, 0xeede48
   	 jal painter
   	 
   	 addi $4, $22, 58
    	addi $5, $23,20
    	addi $6, $0, 2
    	addi $7, $0, 2
    	ori  $9, $0, 0xeede48
   	 jal painter
   	 
   	  addi $4, $22, 57
    	addi $5, $23,22
    	addi $6, $0, 2
    	addi $7, $0, 2
    	ori  $9, $0, 0xeede48
   	 jal painter
   	 
   	 addi $4, $22, 59
    	addi $5, $23,23
    	addi $6, $0, 1
    	addi $7, $0, 3
    	ori  $9, $0, 0x000000
   	 jal painter
   	 
   	  addi $4, $22, 59
    	addi $5, $23,21
    	addi $6, $0, 1
    	addi $7, $0, 3
    	ori  $9, $0, 0x000000
   	 jal painter
   	 
   	 
   	 paint_watergirl:
       	
       	addi $4, $22, 63
    	addi $5, $23, 8
    	addi $6, $0, 4
    	addi $7, $0, 5
    	ori  $9, $0, 0x1195f4
   	 jal painter
   	 
   	  	
       	addi $4, $22, 64
    	addi $5, $23, 7
    	addi $6, $0, 2
    	addi $7, $0, 2
    	ori  $9, $0, 0x1195f4
   	 jal painter
   	 
   	 	  	
       	addi $4, $22, 65
    	addi $5, $23, 6
    	addi $6, $0, 2
    	addi $7, $0, 2
    	ori  $9, $0, 0x1195f4
   	 jal painter
   	 
   	 addi $4, $22, 64
    	addi $5, $23, 11
    	addi $6, $0, 2
    	addi $7, $0, 2
    	ori  $9, $0, 0x1195f4
   	 jal painter
   	 
   	 	  	
       	addi $4, $22, 65
    	addi $5, $23, 12
    	addi $6, $0, 2
    	addi $7, $0, 2
    	ori  $9, $0, 0x1195f4
   	 jal painter
   	 
   	  	  	
       	addi $4, $22, 67
    	addi $5, $23, 8
    	addi $6, $0, 2
    	addi $7, $0, 2
    	ori  $9, $0, 0x1195f4 
   	 jal painter
   	 
   	addi $4, $22, 68
    	addi $5, $23, 7 
    	addi $6, $0, 2
    	addi $7, $0, 2
    	ori  $9, $0, 0x1195f4
   	 jal painter
   	 
   	 addi $4, $22, 67
    	addi $5, $23, 11
    	addi $6, $0, 2
    	addi $7, $0, 2
    	ori  $9, $0, 0x1195f4
   	 jal painter
   	 
   	addi $4, $22, 68 
    	addi $5, $23, 12
    	addi $6, $0, 2
    	addi $7, $0, 2
    	ori  $9, $0, 0x1195f4
   	 jal painter
   	 
   	 
       	addi $4, $22, 62
    	addi $5, $23, 9
    	addi $6, $0, 2
    	addi $7, $0, 2
    	ori  $9, $0, 0x1195f4
   	 jal painter
   	 
   	 addi $4, $22, 58
    	addi $5, $23, 8
    	addi $6, $0, 4
    	addi $7, $0, 5
    	ori  $9, $0, 0x1195f4
   	 jal painter
   	 
   	 addi $4, $22, 57
    	addi $5, $23, 7
    	addi $6, $0, 6
    	addi $7, $0, 2
    	ori  $9, $0, 0xbae2fc
   	 jal painter
   	 
   	addi $4, $22, 57
    	addi $5, $23, 7
    	addi $6, $0, 2
    	addi $7, $0, 3
    	ori  $9, $0, 0xbae2fc
   	 jal painter
   	 
   	addi $4, $22, 59
    	addi $5, $23, 6
    	addi $6, $0, 2
    	addi $7, $0, 2
    	ori  $9, $0, 0xbae2fc
   	 jal painter
   	 
   	 addi $4, $22, 60
    	addi $5, $23, 5
    	addi $6, $0, 2
    	addi $7, $0, 2
    	ori  $9, $0, 0xbae2fc
   	 jal painter
   	 
   	  addi $4, $22, 58
    	addi $5, $23, 12
    	addi $6, $0, 2
    	addi $7, $0, 3
    	ori  $9, $0, 0xbae2fc
   	 jal painter
   	 
   	 addi $4, $22, 59 
    	addi $5, $23,11
    	addi $6, $0, 1
    	addi $7, $0, 3
    	ori  $9, $0, 0x000000
   	 jal painter
   	 
   	  addi $4, $22, 59
    	addi $5, $23,9
    	addi $6, $0, 1
    	addi $7, $0, 3
    	ori  $9, $0, 0x000000
   	 jal painter
   	 
   	 
	fire_barrier:
	
	addi $4, $22, 36
    	addi $5, $23,230 
    	addi $6, $0, 3
    	addi $7, $0, 15 
    	ori  $9, $0, 0xFA0100
   	 jal painter 
   	 
   	 addi $4, $22, 36
    	addi $5, $23,230 
    	addi $6, $0, 1
    	addi $7, $0, 3
    	ori  $9, $0, 0xFAE846
   	 jal painter 
   	 
   	  addi $4, $22, 38
    	addi $5, $23,232  
    	addi $6, $0, 1
    	addi $7, $0, 11
    	ori  $9, $0, 0xFAE846
   	 jal painter 
   	 
   	   addi $4, $22, 48 
    	addi $5, $23,231 
    	addi $6, $0, 1
    	addi $7, $0, 3
    	ori  $9, $0, 0xFAE846
   	 jal painter 
   	 
   	 
   	 
   	 water_barrier:
	
	addi $4, $22, 87
    	addi $5, $23,230 
    	addi $6, $0, 3
    	addi $7, $0, 15 
    	ori  $9, $0, 0x0195FF
   	 jal painter 
   	 
   	 addi $4, $22, 87 
    	addi $5, $23,230 
    	addi $6, $0, 1
    	addi $7, $0, 3
    	ori  $9, $0, 0xBCE2FC
   	 jal painter 
   	 
   	  addi $4, $22, 89
    	addi $5, $23,232  
    	addi $6, $0, 1
    	addi $7, $0, 11
    	ori  $9, $0, 0xBCE2FC
   	 jal painter 
   	 
   	   addi $4, $22, 99
    	addi $5, $23,231 
    	addi $6, $0, 1
    	addi $7, $0, 3
    	ori  $9, $0, 0xBCE2FC
   	 jal painter
   	 
   	 # reseting values to paint fireball and waterball
   	 addi $18, $0, 90
   	 addi $19, $0, 60
		
reset_fireball:

    addi $4, $20, 17
    add $5, $21,  460
    addi $6, $0, 8
    addi $7, $0, 12
    ori  $9, $0, 0x706535
    jal painter

    addi $4, $20, 18
    addi $5, $21, 459
    addi $6, $0, 1
    addi $7, $0, 10
    ori  $9, $0, 0x706535
    jal painter

    addi $4, $20, 19
    addi $5, $21, 458
    addi $6, $0, 1
    addi $7, $0, 8
    ori  $9, $0, 0x706535
    jal painter

    addi $4, $20, 18
    addi $5, $21, 468
    addi $6, $0, 2
    addi $7, $0, 10
    ori  $9, $0, 0x706535
    jal painter

    addi $4, $20, 19
    addi $5, $21, 470
    addi $6, $0, 2
    addi $7, $0, 8
    ori  $9, $0, 0x706535
    jal painter

    addi $4, $20, 20
    addi $5, $21, 472
    addi $6, $0, 2
    addi $7, $0, 6
    ori  $9, $0, 0x706535
    jal painter

    addi $4, $20, 21
    addi $5, $21, 474
    addi $6, $0, 2
    addi $7, $0, 4
    ori  $9, $0, 0x706535
    jal painter

    addi $4, $20, 22
    addi $5, $21, 476
    addi $6, $0, 2
    addi $7, $0, 2
    ori  $9, $0, 0x706535
    jal painter

    addi $4, $20, 23
    addi $5, $21, 478
    addi $6, $0, 1
    addi $7, $0, 1
    ori  $9, $0, 0x706535
    jal painter

    # Second layer
    addi $4, $20, 18
    addi $5, $21, 460
    addi $6, $0, 8
    addi $7, $0, 10
    ori  $9, $0, 0x706535
    jal painter

    addi $4, $20, 19
    addi $5, $21, 459
    addi $6, $0, 1
    addi $7, $0, 8
    ori  $9, $0, 0x706535
    jal painter

    addi $4, $20, 19
    addi $5, $21, 468
    addi $6, $0, 2
    addi $7, $0, 8
    ori  $9, $0, 0x706535
    jal painter

    addi $4, $20, 20
    addi $5, $21, 470
    addi $6, $0, 2
    addi $7, $0, 6
    ori  $9, $0, 0x706535
    jal painter

    addi $4, $20, 21
    addi $5, $21, 472
    addi $6, $0, 2
    addi $7, $0, 4
    ori  $9, $0, 0x706535
    jal painter

    addi $4, $20, 22
    addi $5, $21, 475
    addi $6, $0, 1
    addi $7, $0, 2
    ori  $9, $0, 0x706535
    jal painter

    # Three layer
    addi $4, $20, 19
    addi $5, $21, 460
    addi $6, $0, 8
    addi $7, $0, 8
    ori  $9, $0, 0x706535
    jal painter

    addi $4, $20, 20
    addi $5, $21, 459
    addi $6, $0, 1
    addi $7, $0, 6
    ori  $9, $0, 0x706535
    jal painter

    addi $4, $20, 20
    addi $5, $21, 468
    addi $6, $0, 2
    addi $7, $0, 6
    ori  $9, $0, 0x706535
    jal painter

    addi $4, $20, 21
    addi $5, $21, 470
    addi $6, $0, 2
    addi $7, $0, 4
    ori  $9, $0, 0x706535
    jal painter

    addi $4, $20, 22
    addi $5, $21, 472
    addi $6, $0, 3
    addi $7, $0, 2
    ori  $9, $0, 0x706535
    jal painter

    # Four layer
    addi $4, $20, 20
    addi $5, $21, 462
    addi $6, $0, 6
    addi $7, $0, 6
    ori  $9, $0, 0x706535
    jal painter

    addi $4, $20, 21
    addi $5, $21, 461
    addi $6, $0, 1
    addi $7, $0, 4
    ori  $9, $0, 0x706535
    jal painter

    addi $4, $20, 21
    addi $5, $21, 468
    addi $6, $0, 2
    addi $7, $0, 4
    ori  $9, $0, 0x706535
    jal painter

    addi $4, $20, 22
    addi $5, $21, 470
    addi $6, $0, 2
    addi $7, $0, 2
    ori  $9, $0, 0x706535
    jal painter
		
	add $21, $21, $16	
		
paint_fireball:

        addi $4, $20, 17
        add $5, $21,  460
        addi $6, $0, 8
        addi $7, $0, 12
        ori  $9, $0, 0xFA0100
        jal painter

        addi $4, $20, 18
        addi $5, $21, 459
        addi $6, $0, 1
        addi $7, $0, 10
        ori  $9, $0, 0xFA0100
        jal painter

        addi $4, $20, 19
        addi $5, $21, 458
        addi $6, $0, 1
        addi $7, $0, 8
        ori  $9, $0, 0xFA0100
        jal painter

        addi $4, $20, 18
        addi $5, $21, 468
        addi $6, $0, 2
        addi $7, $0, 10
        ori  $9, $0, 0xFA0100
        jal painter

        addi $4, $20, 19
        addi $5, $21, 470
        addi $6, $0, 2
        addi $7, $0, 8
        ori  $9, $0, 0xFA0100
        jal painter

        addi $4, $20, 20
        addi $5, $21, 472
        addi $6, $0, 2
        addi $7, $0, 6
        ori  $9, $0, 0xFA0100
        jal painter

        addi $4, $20, 21
        addi $5, $21, 474
        addi $6, $0, 2
        addi $7, $0, 4
        ori  $9, $0, 0xFA0100
        jal painter

        addi $4, $20, 22
        addi $5, $21, 476
        addi $6, $0, 2
        addi $7, $0, 2
        ori  $9, $0, 0xFA0100
        jal painter

        addi $4, $20, 23
        addi $5, $21, 478
        addi $6, $0, 1
        addi $7, $0, 1
        ori  $9, $0, 0xFA0100
        jal painter

        # Second layer
        addi $4, $20, 18
        addi $5, $21, 460
        addi $6, $0, 8
        addi $7, $0, 10
        ori  $9, $0, 0xF94723
        jal painter

        addi $4, $20, 19
        addi $5, $21, 459
        addi $6, $0, 1
        addi $7, $0, 8
        ori  $9, $0, 0xF94723
        jal painter

        addi $4, $20, 19
        addi $5, $21, 468
        addi $6, $0, 2
        addi $7, $0, 8
        ori  $9, $0, 0xF94723
        jal painter

        addi $4, $20, 20
        addi $5, $21, 470
        addi $6, $0, 2
        addi $7, $0, 6
        ori  $9, $0, 0xF94723
        jal painter

        addi $4, $20, 21
        addi $5, $21, 472
        addi $6, $0, 2
        addi $7, $0, 4
        ori  $9, $0, 0xF94723
        jal painter

        addi $4, $20, 22
        addi $5, $21, 475
        addi $6, $0, 1
        addi $7, $0, 2
        ori  $9, $0, 0xF94723
        jal painter

        # Three layer
        addi $4, $20, 19
        addi $5, $21, 460
        addi $6, $0, 8
        addi $7, $0, 8
        ori  $9, $0, 0xFAAB34
        jal painter

        addi $4, $20, 20
        addi $5, $21, 459
        addi $6, $0, 1
        addi $7, $0, 6
        ori  $9, $0, 0xFAAB34
        jal painter

        addi $4, $20, 20
        addi $5, $21, 468
        addi $6, $0, 2
        addi $7, $0, 6
        ori  $9, $0, 0xFAAB34
        jal painter

        addi $4, $20, 21
        addi $5, $21, 470
        addi $6, $0, 2
        addi $7, $0, 4
        ori  $9, $0, 0xFAAB34
        jal painter

        addi $4, $20, 22
        addi $5, $21, 472
        addi $6, $0, 3
        addi $7, $0, 2
        ori  $9, $0, 0xFAAB34
        jal painter

        # Four layer
        addi $4, $20, 20
        addi $5, $21, 462
        addi $6, $0, 6
        addi $7, $0, 6
        ori  $9, $0, 0xFAE846
        jal painter

        addi $4, $20, 21
        addi $5, $21, 461
        addi $6, $0, 1
        addi $7, $0, 4
        ori  $9, $0, 0xFAE846
        jal painter

        addi $4, $20, 21
        addi $5, $21, 468
        addi $6, $0, 2
        addi $7, $0, 4
        ori  $9, $0, 0xFAE846
        jal painter

        addi $4, $20, 22
        addi $5, $21, 470
        addi $6, $0, 2
        addi $7, $0, 2
        ori  $9, $0, 0xFAE846
        jal painter

reset_waterball:
    
    addi $4, $22, 71
    add $5, $23, 210
    addi $6, $0, 8
    addi $7, $0, 12
    ori  $9, $0, 0x706535
    jal painter

    addi $4, $22, 72
    addi $5, $23, 209
    addi $6, $0, 1
    addi $7, $0, 10
    ori  $9, $0, 0x706535
    jal painter

    addi $4, $22, 73
    addi $5, $23, 208
    addi $6, $0, 1
    addi $7, $0, 8
    ori  $9, $0, 0x706535
    jal painter

    addi $4, $22, 72
    addi $5, $23, 218
    addi $6, $0, 2
    addi $7, $0, 10
    ori  $9, $0, 0x706535
    jal painter

    addi $4, $22, 73
    addi $5, $23, 220
    addi $6, $0, 2
    addi $7, $0, 8
    ori  $9, $0, 0x706535
    jal painter

    addi $4, $22, 74
    addi $5, $23, 222
    addi $6, $0, 2
    addi $7, $0, 6
    ori  $9, $0, 0x706535
    jal painter

    addi $4, $22, 75
    addi $5, $23, 224
    addi $6, $0, 2
    addi $7, $0, 4
    ori  $9, $0, 0x706535
    jal painter

    addi $4, $22, 76
    addi $5, $23, 226
    addi $6, $0, 2
    addi $7, $0, 2
    ori  $9, $0, 0x706535
    jal painter

    addi $4, $22, 77
    addi $5, $23, 228
    addi $6, $0, 1
    addi $7, $0, 1
    ori  $9, $0, 0x706535
    jal painter

    # second layer

    addi $4, $22, 73
    addi $5, $23, 208
    addi $6, $0, 1
    addi $7, $0, 8
    ori  $9, $0, 0x706535
    jal painter

    addi $4, $22, 78
    addi $5, $23, 209
    addi $6, $0, 1
    addi $7, $0, 2
    ori  $9, $0, 0x706535
    jal painter

    addi $4, $22, 79
    addi $5, $23, 209
    addi $6, $0, 2
    addi $7, $0, 3
    ori  $9, $0, 0x706535
    jal painter

    addi $4, $22, 79
    addi $5, $23, 210
    addi $6, $0, 2
    addi $7, $0, 4
    ori  $9, $0, 0x706535
    jal painter

    addi $4, $22, 81
    addi $5, $23, 210
    addi $6, $0, 8
    addi $7, $0, 2
    ori  $9, $0, 0x706535
    jal painter

    addi $4, $22, 80
    addi $5, $23, 218
    addi $6, $0, 2
    addi $7, $0, 2
    ori  $9, $0, 0x706535
    jal painter

    addi $4, $22, 79
    addi $5, $23, 220
    addi $6, $0, 2
    addi $7, $0, 2
    ori  $9, $0, 0x706535
    jal painter

    addi $4, $22, 78
    addi $5, $23, 222
    addi $6, $0, 2
    addi $7, $0, 2
    ori  $9, $0, 0x706535
    jal painter

    addi $4, $22, 77
    addi $5, $23, 224
    addi $6, $0, 2
    addi $7, $0, 2
    ori  $9, $0, 0x706535
    jal painter

    addi $4, $22, 76
    addi $5, $23, 226
    addi $6, $0, 2
    addi $7, $0, 2
    ori  $9, $0, 0x706535
    jal painter

    # three layer

    addi $4, $22, 72
    addi $5, $23, 213
    addi $6, $0, 4
    addi $7, $0, 4
    ori  $9, $0, 0x706535
    jal painter

    addi $4, $22, 73
    addi $5, $23, 212
    addi $6, $0, 2
    addi $7, $0, 3
    ori  $9, $0, 0x706535
    jal painter

    addi $4, $22, 72
    addi $5, $23, 216
    addi $6, $0, 2
    addi $7, $0, 3
    ori  $9, $0, 0x706535
    jal painter

    addi $4, $22, 73
    addi $5, $23, 218
    addi $6, $0, 2
    addi $7, $0, 2
    ori  $9, $0, 0x706535
    jal painter

    addi $4, $22, 74
    addi $5, $23, 220
    addi $6, $0, 2
    addi $7, $0, 2
    ori  $9, $0, 0x706535
    jal painter

    addi $4, $22, 75
    addi $5, $23, 222
    addi $6, $0, 2
    addi $7, $0, 2
    ori  $9, $0, 0x706535
    jal painter
     
     add $23, $23, $17	
                     
paint_waterball:
    
    addi $4, $22, 71
    add $5, $23, 210
    addi $6, $0, 8
    addi $7, $0, 12
    ori  $9, $0, 0x0195FF
    jal painter

    addi $4, $22, 72
    addi $5, $23, 209
    addi $6, $0, 1
    addi $7, $0, 10
    ori  $9, $0, 0x0195FF
    jal painter

    addi $4, $22, 73
    addi $5, $23, 208
    addi $6, $0, 1
    addi $7, $0, 8
    ori  $9, $0, 0x0195FF
    jal painter

    addi $4, $22, 72
    addi $5, $23, 218
    addi $6, $0, 2
    addi $7, $0, 10
    ori  $9, $0, 0x0195FF
    jal painter

    addi $4, $22, 73
    addi $5, $23, 220
    addi $6, $0, 2
    addi $7, $0, 8
    ori  $9, $0, 0x0195FF
    jal painter

    addi $4, $22, 74
    addi $5, $23, 222
    addi $6, $0, 2
    addi $7, $0, 6
    ori  $9, $0, 0x0195FF
    jal painter

    addi $4, $22, 75
    addi $5, $23, 224
    addi $6, $0, 2
    addi $7, $0, 4
    ori  $9, $0, 0x0195FF
    jal painter

    addi $4, $22, 76
    addi $5, $23, 226
    addi $6, $0, 2
    addi $7, $0, 2
    ori  $9, $0, 0x0195FF
    jal painter

    addi $4, $22, 77
    addi $5, $23, 228
    addi $6, $0, 1
    addi $7, $0, 1
    ori  $9, $0, 0x0195FF
    jal painter

    # second layer

    addi $4, $22, 73
    addi $5, $23, 208
    addi $6, $0, 1
    addi $7, $0, 8
    ori  $9, $0, 0x0285E5
    jal painter

    addi $4, $22, 78
    addi $5, $23, 209
    addi $6, $0, 1
    addi $7, $0, 2
    ori  $9, $0, 0x0285E5
    jal painter

    addi $4, $22, 79
    addi $5, $23, 209
    addi $6, $0, 2
    addi $7, $0, 3
    ori  $9, $0, 0x0285E5
    jal painter

    addi $4, $22, 79
    addi $5, $23, 210
    addi $6, $0, 2
    addi $7, $0, 4
    ori  $9, $0, 0x0285E5
    jal painter

    addi $4, $22, 81
    addi $5, $23, 210
    addi $6, $0, 8
    addi $7, $0, 2
    ori  $9, $0, 0x0285E5
    jal painter

    addi $4, $22, 80
    addi $5, $23, 218
    addi $6, $0, 2
    addi $7, $0, 2
    ori  $9, $0, 0x0285E5
    jal painter

    addi $4, $22, 79
    addi $5, $23, 220
    addi $6, $0, 2
    addi $7, $0, 2
    ori  $9, $0, 0x0285E5
    jal painter

    addi $4, $22, 78
    addi $5, $23, 222
    addi $6, $0, 2
    addi $7, $0, 2
    ori  $9, $0, 0x0285E5
    jal painter

    addi $4, $22, 77
    addi $5, $23, 224
    addi $6, $0, 2
    addi $7, $0, 2
    ori  $9, $0, 0x0285E5
    jal painter

    addi $4, $22, 76
    addi $5, $23, 226
    addi $6, $0, 2
    addi $7, $0, 2
    ori  $9, $0, 0x0285E5
    jal painter

    # three layer

    addi $4, $22, 72
    addi $5, $23, 213
    addi $6, $0, 4
    addi $7, $0, 4
    ori  $9, $0, 0xBCE2FC
    jal painter

    addi $4, $22, 73
    addi $5, $23, 212
    addi $6, $0, 2
    addi $7, $0, 3
    ori  $9, $0, 0xBCE2FC
    jal painter

    addi $4, $22, 72
    addi $5, $23, 216
    addi $6, $0, 2
    addi $7, $0, 3
    ori  $9, $0, 0xBCE2FC
    jal painter

    addi $4, $22, 73
    addi $5, $23, 218
    addi $6, $0, 2
    addi $7, $0, 2
    ori  $9, $0, 0xBCE2FC
    jal painter

    addi $4, $22, 74
    addi $5, $23, 220
    addi $6, $0, 2
    addi $7, $0, 2
    ori  $9, $0, 0xBCE2FC
    jal painter

    addi $4, $22, 75
    addi $5, $23, 222
    addi $6, $0, 2
    addi $7, $0, 2
    ori  $9, $0, 0xBCE2FC
    jal painter
    
    beq $18, $0, set_fireball
    add $21, $21, $16
    addi $18, $18, -1
    
    beq $19, $0, set_waterball
    add $23, $23, $17
    add $19, $19, -1
    
    j reset_fireball
    
    set_fireball:
    	addi $18, $0, 90
    	mul $16, $16, -1
    	addi $2, $0, 1
    	add $4, $0, $16
    	syscall
    	j reset_fireball
    set_waterball:
    	addi $19, $0, 60
    	mul $17, $17, -1
    	j reset_fireball
    
        
       		
end:
	addi $2, $0, 10
	syscall
