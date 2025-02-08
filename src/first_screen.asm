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
	addi $4, $0, 20000
	nop
	timer_for:
	nop
	beq $4, $0, return
	addi $4, $4, -1
	j timer_for
	nop
# --- CODE ---------------------------------------------------#
	# $4 = POSITION Y ( addi $4, $0, 0)
	# $5 = POSITION X ( addi $5, $0, 0)
	# $6 = WIDTH     ( addi $6, $0, 0)
	# $7 = HEIGHT  ( addi $7, $0, 0)
	# $9 = COLOR (ori $9, $0, 0x000000)
    
start:

	lui $8, 0x1001
	addi $4, $0, 52320
	sw $4, 400000($8) # 1/4 fireboy (up)
	
	lui $8, 0x1001
	addi $4, $0, 66620
	sw $4, 400004($8) # 2/4 fireboy (left)
	
	lui $8, 0x1001
	addi $4, $0, 72780
	sw $4, 400008($8) # 3/4 fireboy (down)
	
	lui $8, 0x1001
	addi $4, $0, 66672
	sw $4, 400012($8) # 4/4 fireboy (right)
	
	lui $8, 0x1001
	addi $4, $0, 1
	sw $4, 400016($8) # 1/4 watergirl (up)
	
	lui $8, 0x1001
	addi $4, $0, 1
	sw $4, 400020($8) # 2/4 watergirl (left)
	
	lui $8, 0x1001
	addi $4, $0, 1
	sw $4, 400024($8) # 3/4 watergirl (down)
	
	lui $8, 0x1001
	addi $4, $0, 1
	sw $4, 400028($8) # 4/4 watergirl (right)
	
	lui $8, 0x1001
	addi $4, $0, 1
	sw $4, 400032($8) # 1/1 fireball
	
	lui $8, 0x1001
	addi $4, $0, 1
	sw $4, 400036($8) # 1/1 waterball
	
	
    	
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
   	
   	# reseting values to paint fireball and waterball
   	 addi $14, $0, 140
   	 addi $15, $0, 100
   	 addi $16, $0, -8
   	 addi $17, $0, -8
   	 
reset_map: 
 
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
		
paint_fireboy:
       	
       	addi $4, $18, 63
    	addi $5, $19, 20
    	addi $6, $0, 4
    	addi $7, $0, 5
    	ori  $9, $0, 0xf91111
   	 jal painter
   	 
   	  	
       	addi $4, $18, 64
    	addi $5, $19, 19
    	addi $6, $0, 2
    	addi $7, $0, 2
    	ori  $9, $0, 0xf91111
   	 jal painter
   	 
   	 	  	
       	addi $4, $18, 65
    	addi $5, $19, 18
    	addi $6, $0, 2
    	addi $7, $0, 2
    	ori  $9, $0, 0xf91111
   	 jal painter
   	 
   	 addi $4, $18, 64
    	addi $5, $19, 23
    	addi $6, $0, 2
    	addi $7, $0, 2
    	ori  $9, $0, 0xf91111
   	 jal painter
   	 
   	 	  	
       	addi $4, $18, 65
    	addi $5, $19, 24
    	addi $6, $0, 2
    	addi $7, $0, 2
    	ori  $9, $0, 0xf91111
   	 jal painter
   	 
   	  	  	
       	addi $4, $18, 67
    	addi $5, $19, 20
    	addi $6, $0, 2
    	addi $7, $0, 2
    	ori  $9, $0, 0xf91111
   	 jal painter
   	 
   	addi $4, $18, 68
    	addi $5, $19, 19
    	addi $6, $0, 2
    	addi $7, $0, 2
    	ori  $9, $0, 0xf91111
   	 jal painter
   	 
   	 addi $4, $18, 67
    	addi $5, $19, 23
    	addi $6, $0, 2
    	addi $7, $0, 2
    	ori  $9, $0, 0xf91111
   	 jal painter
   	 
   	addi $4, $18, 68 
    	addi $5, $19, 24
    	addi $6, $0, 2
    	addi $7, $0, 2
    	ori  $9, $0, 0xf91111
   	 jal painter
   	 
   	 
       	addi $4, $18, 62
    	addi $5, $19, 21
    	addi $6, $0, 2
    	addi $7, $0, 2
    	ori  $9, $0, 0xf91111
   	 jal painter
   	 
   	 addi $4, $18, 58
    	addi $5, $19, 20
    	addi $6, $0, 4
    	addi $7, $0, 5
    	ori  $9, $0, 0xf91111
   	 jal painter
   	 
   	addi $4, $18, 58
    	addi $5, $19,20
    	addi $6, $0, 1
    	addi $7, $0, 3 
    	ori  $9, $0, 0xeede48
   	 jal painter
   	 
   	 addi $4, $18, 58
    	addi $5, $19,20
    	addi $6, $0, 2
    	addi $7, $0, 2
    	ori  $9, $0, 0xeede48
   	 jal painter
   	 
   	  addi $4, $18, 57
    	addi $5, $19,22
    	addi $6, $0, 2
    	addi $7, $0, 2
    	ori  $9, $0, 0xeede48
   	 jal painter
   	 
   	 addi $4, $18, 59
    	addi $5, $19,23
    	addi $6, $0, 1
    	addi $7, $0, 3
    	ori  $9, $0, 0x000000
   	 jal painter
   	 
   	  addi $4, $18, 59
    	addi $5, $19,21
    	addi $6, $0, 1
    	addi $7, $0, 3
    	ori  $9, $0, 0x000000
   	 jal painter
   	 
   	 
paint_watergirl:
       	
       	addi $4, $20, 63
    	addi $5, $21, 8
    	addi $6, $0, 4
    	addi $7, $0, 5
    	ori  $9, $0, 0x1195f4
   	 jal painter
   	 
   	  	
       	addi $4, $20, 64
    	addi $5, $21, 7
    	addi $6, $0, 2
    	addi $7, $0, 2
    	ori  $9, $0, 0x1195f4
   	 jal painter
   	 
   	 	  	
       	addi $4, $20, 65
    	addi $5, $21, 6
    	addi $6, $0, 2
    	addi $7, $0, 2
    	ori  $9, $0, 0x1195f4
   	 jal painter
   	 
   	 addi $4, $20, 64
    	addi $5, $21, 11
    	addi $6, $0, 2
    	addi $7, $0, 2
    	ori  $9, $0, 0x1195f4
   	 jal painter
   	 
   	 	  	
       	addi $4, $20, 65
    	addi $5, $21, 12
    	addi $6, $0, 2
    	addi $7, $0, 2
    	ori  $9, $0, 0x1195f4
   	 jal painter
   	 
   	  	  	
       	addi $4, $20, 67
    	addi $5, $21, 8
    	addi $6, $0, 2
    	addi $7, $0, 2
    	ori  $9, $0, 0x1195f4 
   	 jal painter
   	 
   	addi $4, $20, 68
    	addi $5, $21, 7 
    	addi $6, $0, 2
    	addi $7, $0, 2
    	ori  $9, $0, 0x1195f4
   	 jal painter
   	 
   	 addi $4, $20, 67
    	addi $5, $21, 11
    	addi $6, $0, 2
    	addi $7, $0, 2
    	ori  $9, $0, 0x1195f4
   	 jal painter
   	 
   	addi $4, $20, 68 
    	addi $5, $21, 12
    	addi $6, $0, 2
    	addi $7, $0, 2
    	ori  $9, $0, 0x1195f4
   	 jal painter
   	 
   	 
       	addi $4, $20, 62
    	addi $5, $21, 9
    	addi $6, $0, 2
    	addi $7, $0, 2
    	ori  $9, $0, 0x1195f4
   	 jal painter
   	 
   	 addi $4, $20, 58
    	addi $5, $21, 8
    	addi $6, $0, 4
    	addi $7, $0, 5
    	ori  $9, $0, 0x1195f4
   	 jal painter
   	 
   	 addi $4, $20, 57
    	addi $5, $21, 7
    	addi $6, $0, 6
    	addi $7, $0, 2
    	ori  $9, $0, 0xbae2fc
   	 jal painter
   	 
   	addi $4, $20, 57
    	addi $5, $21, 7
    	addi $6, $0, 2
    	addi $7, $0, 3
    	ori  $9, $0, 0xbae2fc
   	 jal painter
   	 
   	addi $4, $20, 59
    	addi $5, $21, 6
    	addi $6, $0, 2
    	addi $7, $0, 2
    	ori  $9, $0, 0xbae2fc
   	 jal painter
   	 
   	 addi $4, $20, 60
    	addi $5, $21, 5
    	addi $6, $0, 2
    	addi $7, $0, 2
    	ori  $9, $0, 0xbae2fc
   	 jal painter
   	 
   	  addi $4, $20, 58
    	addi $5, $21, 12
    	addi $6, $0, 2
    	addi $7, $0, 3
    	ori  $9, $0, 0xbae2fc
   	 jal painter
   	 
   	 addi $4, $20, 59 
    	addi $5, $21,11
    	addi $6, $0, 1
    	addi $7, $0, 3
    	ori  $9, $0, 0x000000
   	 jal painter
   	 
   	  addi $4, $20, 59
    	addi $5, $21,9
    	addi $6, $0, 1
    	addi $7, $0, 3
    	ori  $9, $0, 0x000000
   	 jal painter
   	 
   	 
	fire_barrier:
	
	addi $4, $0, 36
    	addi $5, $0, 230 
    	addi $6, $0, 3
    	addi $7, $0, 15 
    	ori  $9, $0, 0xFA0100
   	 jal painter 
   	 
   	 addi $4, $0, 36
    	addi $5, $0,230 
    	addi $6, $0, 1
    	addi $7, $0, 3
    	ori  $9, $0, 0xFAE846
   	 jal painter 
   	 
   	  addi $4, $0, 38
    	addi $5, $0,232  
    	addi $6, $0, 1
    	addi $7, $0, 11
    	ori  $9, $0, 0xFAE846
   	 jal painter 
   	 
   	   addi $4, $0, 48 
    	addi $5, $0,231 
    	addi $6, $0, 1
    	addi $7, $0, 3
    	ori  $9, $0, 0xFAE846
   	 jal painter 
   	 
   	 
   	 
   	 water_barrier:
	
	addi $4, $0, 87
    	addi $5, $0,230 
    	addi $6, $0, 3
    	addi $7, $0, 15 
    	ori  $9, $0, 0x0195FF
   	 jal painter 
   	 
   	 addi $4, $0, 87 
    	addi $5, $0,230 
    	addi $6, $0, 1
    	addi $7, $0, 3
    	ori  $9, $0, 0xBCE2FC
   	 jal painter 
   	 
   	  addi $4, $0, 89
    	addi $5, $0,232  
    	addi $6, $0, 1
    	addi $7, $0, 11
    	ori  $9, $0, 0xBCE2FC
   	 jal painter 
   	 
   	   addi $4, $0, 99
    	addi $5, $0,231 
    	addi $6, $0, 1
    	addi $7, $0, 3
    	ori  $9, $0, 0xBCE2FC
   	 jal painter
		
	add $23, $23, $16	
		
paint_fireball:

        addi $4, $22, 17
        add $5, $23, 460
        addi $6, $0, 8
        addi $7, $0, 12
        ori  $9, $0, 0xFA0100
        jal painter

        addi $4, $22, 18
        addi $5, $23, 459
        addi $6, $0, 1
        addi $7, $0, 10
        ori  $9, $0, 0xFA0100
        jal painter

        addi $4, $22, 19
        addi $5, $23, 458
        addi $6, $0, 1
        addi $7, $0, 8
        ori  $9, $0, 0xFA0100
        jal painter

        addi $4, $22, 18
        addi $5, $23, 468
        addi $6, $0, 2
        addi $7, $0, 10
        ori  $9, $0, 0xFA0100
        jal painter

        addi $4, $22, 19
        addi $5, $23, 470
        addi $6, $0, 2
        addi $7, $0, 8
        ori  $9, $0, 0xFA0100
        jal painter

        addi $4, $22, 20
        addi $5, $23, 472
        addi $6, $0, 2
        addi $7, $0, 6
        ori  $9, $0, 0xFA0100
        jal painter

        addi $4, $22, 21
        addi $5, $23, 474
        addi $6, $0, 2
        addi $7, $0, 4
        ori  $9, $0, 0xFA0100
        jal painter

        addi $4, $22, 22
        addi $5, $23, 476
        addi $6, $0, 2
        addi $7, $0, 2
        ori  $9, $0, 0xFA0100
        jal painter

        addi $4, $22, 23
        addi $5, $23, 478
        addi $6, $0, 1
        addi $7, $0, 1
        ori  $9, $0, 0xFA0100
        jal painter

        # Second layer
        addi $4, $22, 18
        addi $5, $23, 460
        addi $6, $0, 8
        addi $7, $0, 10
        ori  $9, $0, 0xF94723
        jal painter

        addi $4, $22, 19
        addi $5, $23, 459
        addi $6, $0, 1
        addi $7, $0, 8
        ori  $9, $0, 0xF94723
        jal painter

        addi $4, $22, 19
        addi $5, $23, 468
        addi $6, $0, 2
        addi $7, $0, 8
        ori  $9, $0, 0xF94723
        jal painter

        addi $4, $22, 20
        addi $5, $23, 470
        addi $6, $0, 2
        addi $7, $0, 6
        ori  $9, $0, 0xF94723
        jal painter

        addi $4, $22, 21
        addi $5, $23, 472
        addi $6, $0, 2
        addi $7, $0, 4
        ori  $9, $0, 0xF94723
        jal painter

        addi $4, $22, 22
        addi $5, $23, 475
        addi $6, $0, 1
        addi $7, $0, 2
        ori  $9, $0, 0xF94723
        jal painter

        # Three layer
        addi $4, $22, 19
        addi $5, $23, 460
        addi $6, $0, 8
        addi $7, $0, 8
        ori  $9, $0, 0xFAAB34
        jal painter

        addi $4, $22, 20
        addi $5, $23, 459
        addi $6, $0, 1
        addi $7, $0, 6
        ori  $9, $0, 0xFAAB34
        jal painter

        addi $4, $22, 20
        addi $5, $23, 468
        addi $6, $0, 2
        addi $7, $0, 6
        ori  $9, $0, 0xFAAB34
        jal painter

        addi $4, $22, 21
        addi $5, $23, 470
        addi $6, $0, 2
        addi $7, $0, 4
        ori  $9, $0, 0xFAAB34
        jal painter

        addi $4, $22, 22
        addi $5, $23, 472
        addi $6, $0, 3
        addi $7, $0, 2
        ori  $9, $0, 0xFAAB34
        jal painter

        # Four layer
        addi $4, $22, 20
        addi $5, $23, 462
        addi $6, $0, 6
        addi $7, $0, 6
        ori  $9, $0, 0xFAE846
        jal painter

        addi $4, $22, 21
        addi $5, $23, 461
        addi $6, $0, 1
        addi $7, $0, 4
        ori  $9, $0, 0xFAE846
        jal painter

        addi $4, $22, 21
        addi $5, $23, 468
        addi $6, $0, 2
        addi $7, $0, 4
        ori  $9, $0, 0xFAE846
        jal painter

        addi $4, $22, 22
        addi $5, $23, 470
        addi $6, $0, 2
        addi $7, $0, 2
        ori  $9, $0, 0xFAE846
        jal painter
     
     add $25, $25, $17
     
paint_waterball:
    
    addi $4, $24, 71
    add $5, $25, 210
    addi $6, $0, 8
    addi $7, $0, 12
    ori  $9, $0, 0x0195FF
    jal painter

    addi $4, $24, 72
    addi $5, $25, 209
    addi $6, $0, 1
    addi $7, $0, 10
    ori  $9, $0, 0x0195FF
    jal painter

    addi $4, $24, 73
    addi $5, $25, 208
    addi $6, $0, 1
    addi $7, $0, 8
    ori  $9, $0, 0x0195FF
    jal painter

    addi $4, $24, 72
    addi $5, $25, 218
    addi $6, $0, 2
    addi $7, $0, 10
    ori  $9, $0, 0x0195FF
    jal painter

    addi $4, $24, 73
    addi $5, $25, 220
    addi $6, $0, 2
    addi $7, $0, 8
    ori  $9, $0, 0x0195FF
    jal painter

    addi $4, $24, 74
    addi $5, $25, 222
    addi $6, $0, 2
    addi $7, $0, 6
    ori  $9, $0, 0x0195FF
    jal painter

    addi $4, $24, 75
    addi $5, $25, 224
    addi $6, $0, 2
    addi $7, $0, 4
    ori  $9, $0, 0x0195FF
    jal painter

    addi $4, $24, 76
    addi $5, $25, 226
    addi $6, $0, 2
    addi $7, $0, 2
    ori  $9, $0, 0x0195FF
    jal painter

    addi $4, $24, 77
    addi $5, $25, 228
    addi $6, $0, 1
    addi $7, $0, 1
    ori  $9, $0, 0x0195FF
    jal painter

    # second layer

    addi $4, $24, 73
    addi $5, $25, 208
    addi $6, $0, 1
    addi $7, $0, 8
    ori  $9, $0, 0x0285E5
    jal painter

    addi $4, $24, 78
    addi $5, $25, 209
    addi $6, $0, 1
    addi $7, $0, 2
    ori  $9, $0, 0x0285E5
    jal painter

    addi $4, $24, 79
    addi $5, $25, 209
    addi $6, $0, 2
    addi $7, $0, 3
    ori  $9, $0, 0x0285E5
    jal painter

    addi $4, $24, 79
    addi $5, $25, 210
    addi $6, $0, 2
    addi $7, $0, 4
    ori  $9, $0, 0x0285E5
    jal painter

    addi $4, $24, 81
    addi $5, $25, 210
    addi $6, $0, 8
    addi $7, $0, 2
    ori  $9, $0, 0x0285E5
    jal painter

    addi $4, $24, 80
    addi $5, $25, 218
    addi $6, $0, 2
    addi $7, $0, 2
    ori  $9, $0, 0x0285E5
    jal painter

    addi $4, $24, 79
    addi $5, $25, 220
    addi $6, $0, 2
    addi $7, $0, 2
    ori  $9, $0, 0x0285E5
    jal painter

    addi $4, $24, 78
    addi $5, $25, 222
    addi $6, $0, 2
    addi $7, $0, 2
    ori  $9, $0, 0x0285E5
    jal painter

    addi $4, $24, 77
    addi $5, $25, 224
    addi $6, $0, 2
    addi $7, $0, 2
    ori  $9, $0, 0x0285E5
    jal painter

    addi $4, $24, 76
    addi $5, $25, 226
    addi $6, $0, 2
    addi $7, $0, 2
    ori  $9, $0, 0x0285E5
    jal painter

    # three layer

    addi $4, $24, 72
    addi $5, $25, 213
    addi $6, $0, 4
    addi $7, $0, 4
    ori  $9, $0, 0xBCE2FC
    jal painter

    addi $4, $24, 73
    addi $5, $25, 212
    addi $6, $0, 2
    addi $7, $0, 3
    ori  $9, $0, 0xBCE2FC
    jal painter

    addi $4, $24, 72
    addi $5, $25, 216
    addi $6, $0, 2
    addi $7, $0, 3
    ori  $9, $0, 0xBCE2FC
    jal painter

    addi $4, $24, 73
    addi $5, $25, 218
    addi $6, $0, 2
    addi $7, $0, 2
    ori  $9, $0, 0xBCE2FC
    jal painter

    addi $4, $24, 74
    addi $5, $25, 220
    addi $6, $0, 2
    addi $7, $0, 2
    ori  $9, $0, 0xBCE2FC
    jal painter

    addi $4, $24, 75
    addi $5, $25, 222
    addi $6, $0, 2
    addi $7, $0, 2
    ori  $9, $0, 0xBCE2FC
    jal painter
    
    
    
    beq $14, $0, set_fireball
    addi $14, $14, -1
    
    beq $15, $0, set_waterball
    add $15, $15, -1 
    
    j read_character
    
    set_fireball:
    	addi $14, $0, 140
    	mul $16, $16, -1
    	j read_character
    	
    set_waterball:
    	addi $15, $0, 100
    	mul $17, $17, -1
    	j read_character
   
read_character:

	 add $4, $0, ' ' #RESET
   	 lui $8, 0xffff
   	 lw $5, 4($8)
   	 addi $6, $0, 'w'
   	 beq $6, $5, up_fb
   	 addi $6, $0, 'a'
   	 beq $6, $5, left_fb
   	 addi $6, $0, 's'
   	 beq $6, $5, down_fb
   	 addi $6, $0, 'd'
   	 beq $6, $5, right_fb
   	 addi $6, $0, '8'
   	 beq $6, $5, up_wg
   	 addi $6, $0, '4'
   	 beq $6, $5, left_wg
   	 addi $6, $0, '2'
   	 beq $6, $5, down_wg
   	 addi $6, $0, '6'
   	 beq $6, $5, right_wg
   	 j reset_map
  
up_fb:
	
	# ADDING UP:
		lui $8, 0x1001
		lw $9, 400000($8)
		add $8, $8, $9
		lw $6, 0($8)
		addi $7, $0, 1645315
		beq $6, $7, blocked
		addi $9, $9, -3072
		lui $8, 0x1001
		sw $9, 400000($8)
	
		addi $18, $18, -3
	
	# ADDING LEFT:
		lui $8, 0x1001
		lw $9, 400004($8)
		addi $9, $9, -3072
		sw $9, 400004($8)
	
	#ADDING DOWN:
		lui $8, 0x1001
		lw $9, 400008($8)
		addi $9, $9, -3072
		sw $9, 400008($8)

	#ADDING RIGHT:
		lui $8, 0x1001
		lw $9, 400012($8)
		addi $9, $9, -3072
		sw $9, 400012($8)
		
	# RESETING CASE	
		add $4, $0, ' '
		lui $8, 0xffff
		sw $4, 4($8)
		
		j reset_map
			
left_fb:
			
	# ADDING LEFT:
		lui $8, 0x1001
		lw $9, 400004($8)
		add $8, $8, $9
		lw $6, 0($8)
		addi $7, $0, 1645315
		beq $6, $7, blocked
		addi $9, $9, -12
		lui $8, 0x1001
		sw $9, 400004($8)
		
		addi $19, $19, -3
	
	# ADDING UP:
		lui $8, 0x1001
		lw $9, 400000($8)
		addi $9, $9, -12
		sw $9, 400000($8)
		
	#ADDING DOWN:
		lui $8, 0x1001
		lw $9, 400008($8)
		addi $9, $9, -12
		sw $9, 400008($8)

	#ADDING RIGHT:
		lui $8, 0x1001
		lw $9, 400012($8)
		addi $9, $9, -12
		sw $9, 400012($8)
		
	# RESETING CASE	
		add $4, $0, ' '
		lui $8, 0xffff
		sw $4, 4($8)
		
		j reset_map
		
down_fb:

	# ADDING DOWN:
	
		lui $8, 0x1001
		lw $9, 400008($8)
		add $8, $8, $9
		lw $6, 0($8)
		addi $7, $0, 1645315
		beq $6, $7, blocked
		addi $9, $9, +3072
		lui $8, 0x1001
		sw $9, 400008($8)
		
		add $18, $18, +3
	
	# ADDING UP:
	
		lui $8, 0x1001
		lw $9, 400000($8)
		addi $9, $9, +3072
		sw $9, 400000($8)
		
	#ADDING LEFT:
	
		lui $8, 0x1001
		lw $9, 400004($8)
		addi $9, $9, +3072
		sw $9, 400004($8)

	#ADDING RIGHT:
	
		lui $8, 0x1001
		lw $9, 400012($8)
		addi $9, $9, +3072
		sw $9, 400012($8)
		
	# RESETING CASE	
		add $4, $0, ' '
		lui $8, 0xffff
		sw $4, 4($8)
		
		j reset_map
	
right_fb:

	# ADDING RIGHT:
		lui $8, 0x1001
		lw $9, 400012($8)
		
		add $8, $8, $9
		lw $6, 0($8)
		
		addi $7, $0, 1645315
		beq $6, $7, blocked
		addi $9, $9, +12
		lui $8, 0x1001
		sw $9, 400012($8)
		
		addi $19, $19, +3
		
	# ADDING LEFT:
		lui $8, 0x1001
		lw $9, 400004($8)
		addi $9, $9, +12
		sw $9, 400004($8)
	
	#ADDING DOWN:
		lui $8, 0x1001
		lw $9, 400008($8)
		addi $9, $9, +12
		sw $9, 400008($8)

	#ADDING UP:
		lui $8, 0x1001
		lw $9, 400000($8)
		addi $9, $9, +12
		sw $9, 400000($8)
		
	# RESETING CASE	
		add $4, $0, ' '
		lui $8, 0xffff
		sw $4, 4($8)
		
		j reset_map
	
up_wg:
	sw $4, 4($8)
	addi $20, $20, -3
	j reset_map
left_wg:
	sw $4, 4($8)
	addi $21, $21, -6
	j reset_map
down_wg:
	sw $4, 4($8)
	addi $20, $20, +3
	j reset_map
right_wg:
	sw $4, 4($8)
	addi $21, $21, +6
	j reset_map
	
blocked:
	add $4, $0, ' ' #RESET
	sw $4, 4($8) # Reseting the cage
	
	addi $4, $0, 'B'
	addi $2, $0, 11
	syscall
	
	j reset_map

        
       		
end:
	addi $2, $0, 10
	syscall
