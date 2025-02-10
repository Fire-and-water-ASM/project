.text
	main:
		
		jal startergame #startergame
		
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
    
startergame:

	addi $4, $0, 0
	addi $5, $0, 0
	addi $6, $0, 512
	addi $7, $0, 256
	ori  $9, $0, 0x2b3205
	jal painter

	addi $4, $0, 30
    	addi $5, $0, 10
    	addi $6, $0, 16
    	addi $7, $0, 4
   	ori  $9, $0, 0xff0000
   	jal painter
   	
   	addi $4, $0, 30
    	addi $5, $0, 10
    	addi $6, $0, 4
    	addi $7, $0, 36
   	ori  $9, $0, 0xff0000
   	jal painter
   	
   	addi $4, $0, 44
    	addi $5, $0, 10
    	addi $6, $0, 16
    	addi $7, $0, 4
   	ori  $9, $0, 0xff0000
   	jal painter
   	
   	
   	# O
   	
   	
   	addi $4, $0, 30
    	addi $5, $0, 34
    	addi $6, $0, 12
    	addi $7, $0, 4
   	ori  $9, $0, 0xff0000
   	jal painter
   	
   	addi $4, $0, 33
    	addi $5, $0, 30
    	addi $6, $0, 4
    	addi $7, $0, 30
   	ori  $9, $0, 0xff0000
   	jal painter
   	
   	addi $4, $0, 62
    	addi $5, $0, 34
    	addi $6, $0, 12
    	addi $7, $0, 4
   	ori  $9, $0, 0xff0000
   	jal painter
   	
   	addi $4, $0, 33
    	addi $5, $0, 46
    	addi $6, $0, 4
    	addi $7, $0, 30
   	ori  $9, $0, 0xff0000
   	jal painter
   	
   	# G
   	
   	addi $4, $0, 30
    	addi $5, $0, 58
    	addi $6, $0, 16
    	addi $7, $0, 4
   	ori  $9, $0, 0xff0000
   	jal painter
   	
   	addi $4, $0, 33
    	addi $5, $0, 74
    	addi $6, $0, 4
    	addi $7, $0, 12
   	ori  $9, $0, 0xff0000
   	jal painter
   	
   	addi $4, $0, 44
    	addi $5, $0, 66
    	addi $6, $0, 8
    	addi $7, $0, 4
   	ori  $9, $0, 0xff0000
   	jal painter
   	
   	addi $4, $0, 41
    	addi $5, $0, 62
    	addi $6, $0, 4
    	addi $7, $0, 4
   	ori  $9, $0, 0xff0000
   	jal painter
   	
   	addi $4, $0, 33
    	addi $5, $0, 54
    	addi $6, $0, 4
    	addi $7, $0, 20
   	ori  $9, $0, 0xff0000
   	jal painter
   	
   	addi $4, $0, 52
    	addi $5, $0, 58
    	addi $6, $0, 8
    	addi $7, $0, 4
   	ori  $9, $0, 0xff0000
   	jal painter
   	
   	addi $4, $0, 52
    	addi $5, $0, 62
    	addi $6, $0, 4
    	addi $7, $0, 8
   	ori  $9, $0, 0xff0000
   	jal painter
   	
   	addi $4, $0, 56
    	addi $5, $0, 62
    	addi $6, $0, 8
    	addi $7, $0, 4
   	ori  $9, $0, 0xff0000
   	jal painter
   	
   	addi $4, $0, 56
    	addi $5, $0, 68
    	addi $6, $0, 4
    	addi $7, $0, 16
   	ori  $9, $0, 0xff0000
   	jal painter
   	
   	addi $4, $0, 71
    	addi $5, $0, 60
    	addi $6, $0, 8
    	addi $7, $0, 4
   	ori  $9, $0, 0xff0000
   	jal painter
   	
   	addi $4, $0, 64
    	addi $5, $0, 56
    	addi $6, $0, 4
    	addi $7, $0, 8
   	ori  $9, $0, 0xff0000
   	jal painter
   	
   	addi $4, $0, 59
    	addi $5, $0, 59
    	addi $6, $0, 4
    	addi $7, $0, 6
   	ori  $9, $0, 0xff0000
   	jal painter
   	
   	# O 
   	
   	addi $4, $0, 33
    	addi $5, $0, 82
    	addi $6, $0, 4
    	addi $7, $0, 28
   	ori  $9, $0, 0xff0000
   	jal painter
   	
   	addi $4, $0, 30
    	addi $5, $0, 86
    	addi $6, $0, 12
    	addi $7, $0, 4
   	ori  $9, $0, 0xff0000
   	jal painter
   	
   	addi $4, $0, 33
    	addi $5, $0, 98
    	addi $6, $0, 4
    	addi $7, $0, 28
   	ori  $9, $0, 0xff0000
   	jal painter
   	
   	addi $4, $0, 60
    	addi $5, $0, 86
    	addi $6, $0, 12
    	addi $7, $0, 4
   	ori  $9, $0, 0xff0000
   	jal painter
   	
   	# E
   	
   	addi $4, $0, 30
    	addi $5, $0, 114
    	addi $6, $0, 4
    	addi $7, $0, 36
   	ori  $9, $0, 0xe3c310
   	jal painter
   	
   	addi $4, $0, 30
    	addi $5, $0, 114
    	addi $6, $0, 16
    	addi $7, $0, 4
   	ori  $9, $0, 0xe3c310
   	jal painter
   	
   	addi $4, $0, 46
    	addi $5, $0, 114
    	addi $6, $0, 16
    	addi $7, $0, 4
   	ori  $9, $0, 0xe3c310
   	jal painter
   	
   	addi $4, $0, 62
    	addi $5, $0, 114
    	addi $6, $0, 16
    	addi $7, $0, 4
   	ori  $9, $0, 0xe3c310
   	jal painter
   	
   	
   	
   	# A
   	
   	addi $4, $0, 30
    	addi $5, $0, 144
    	addi $6, $0, 4
    	addi $7, $0, 36
   	ori  $9, $0, 0x66ccff
   	jal painter
   	
   	addi $4, $0, 30
    	addi $5, $0, 144
    	addi $6, $0, 16
    	addi $7, $0, 4
   	ori  $9, $0, 0x66ccff
   	jal painter
   	
   	addi $4, $0, 30
    	addi $5, $0, 160
    	addi $6, $0, 4
    	addi $7, $0, 36
   	ori  $9, $0, 0x66ccff
   	jal painter
   	
   	addi $4, $0, 46
    	addi $5, $0, 144
    	addi $6, $0, 16
    	addi $7, $0, 4
   	ori  $9, $0, 0x66ccff
   	jal painter
   	
   	addi $4, $0, 24
    	addi $5, $0, 152
    	addi $6, $0, 8
    	addi $7, $0, 4
   	ori  $9, $0, 0x66ccff
   	jal painter
   	
   	addi $4, $0, 20
    	addi $5, $0, 156
    	addi $6, $0, 4
    	addi $7, $0, 8
   	ori  $9, $0, 0x66ccff
   	jal painter
   	
   	addi $4, $0, 20
    	addi $5, $0, 156
    	addi $6, $0, 8
    	addi $7, $0, 4
   	ori  $9, $0, 0x66ccff
   	jal painter
   	
   	
   	
   	# G
   	
   	addi $4, $0, 30
    	addi $5, $0, 172
    	addi $6, $0, 16
    	addi $7, $0, 4
   	ori  $9, $0, 0x66ccff
   	jal painter
   	
   	addi $4, $0, 33
    	addi $5, $0, 188
    	addi $6, $0, 4
    	addi $7, $0, 12
   	ori  $9, $0, 0x66ccff
   	jal painter
   	
   	addi $4, $0, 44
    	addi $5, $0, 180
    	addi $6, $0, 8
    	addi $7, $0, 4
   	ori  $9, $0, 0x66ccff
   	jal painter
   	
   	addi $4, $0, 41
    	addi $5, $0, 176
    	addi $6, $0, 4
    	addi $7, $0, 4
   	ori  $9, $0, 0x66ccff
   	jal painter
   	
   	addi $4, $0, 33
    	addi $5, $0, 168
    	addi $6, $0, 4
    	addi $7, $0, 20
   	ori  $9, $0, 0x66ccff
   	jal painter
   	
   	addi $4, $0, 52
    	addi $5, $0, 172
    	addi $6, $0, 8
    	addi $7, $0, 4
   	ori  $9, $0, 0x66ccff
   	jal painter
   	
   	addi $4, $0, 52
    	addi $5, $0, 176
    	addi $6, $0, 4
    	addi $7, $0, 8
   	ori  $9, $0, 0x66ccff
   	jal painter
   	
   	addi $4, $0, 56
    	addi $5, $0, 176
    	addi $6, $0, 8
    	addi $7, $0, 4
   	ori  $9, $0, 0x66ccff
   	jal painter
   	
   	addi $4, $0, 56
    	addi $5, $0, 182
    	addi $6, $0, 4
    	addi $7, $0, 16
   	ori  $9, $0, 0x66ccff
   	jal painter
   	
   	addi $4, $0, 71
    	addi $5, $0, 174
    	addi $6, $0, 8
    	addi $7, $0, 4
   	ori  $9, $0, 0x66ccff
   	jal painter
   	
   	addi $4, $0, 64
    	addi $5, $0, 170
    	addi $6, $0, 4
    	addi $7, $0, 8
   	ori  $9, $0, 0x66ccff
   	jal painter
   	
   	addi $4, $0, 59
    	addi $5, $0, 173
    	addi $6, $0, 4
    	addi $7, $0, 6
   	ori  $9, $0, 0x66ccff
   	jal painter
   	
   	
   	
   	
   	# U
   	
   	addi $4, $0, 30
    	addi $5, $0, 196
    	addi $6, $0, 4
    	addi $7, $0, 32
   	ori  $9, $0, 0x66ccff
   	jal painter
   	
   	addi $4, $0, 61
    	addi $5, $0, 200
    	addi $6, $0, 16
    	addi $7, $0, 4
   	ori  $9, $0, 0x66ccff
   	jal painter
   	
   	addi $4, $0, 30
    	addi $5, $0, 216
    	addi $6, $0, 4
    	addi $7, $0, 32
   	ori  $9, $0, 0x66ccff
   	jal painter
   	
   	
   	# A
   	
   	addi $4, $0, 30
    	addi $5, $0, 224
    	addi $6, $0, 4
    	addi $7, $0, 36
   	ori  $9, $0, 0x66ccff
   	jal painter
   	
   	addi $4, $0, 30
    	addi $5, $0, 224
    	addi $6, $0, 16
    	addi $7, $0, 4
   	ori  $9, $0, 0x66ccff
   	jal painter
   	
   	addi $4, $0, 30
    	addi $5, $0, 236
    	addi $6, $0, 4
    	addi $7, $0, 36
   	ori  $9, $0, 0x66ccff
   	jal painter
   	
   	addi $4, $0, 46
    	addi $5, $0, 224
    	addi $6, $0, 16
    	addi $7, $0, 4
   	ori  $9, $0, 0x66ccff
   	jal painter
   	
   	
   	
   	# Subtitulo
   	
   	
   	# P
   	
   	addi $4, $0, 80
    	addi $5, $0, 10
    	addi $6, $0, 3
    	addi $7, $0, 21
   	ori  $9, $0, 0xe3c310
   	jal painter
   	
   	addi $4, $0, 80
    	addi $5, $0, 10
    	addi $6, $0, 12
    	addi $7, $0, 3
   	ori  $9, $0, 0xe3c310
   	jal painter
   	
   	addi $4, $0, 80
    	addi $5, $0, 22
    	addi $6, $0, 3
    	addi $7, $0, 12
   	ori  $9, $0, 0xe3c310
   	jal painter
   	
   	addi $4, $0, 89
    	addi $5, $0, 10
    	addi $6, $0, 12
    	addi $7, $0, 3
   	ori  $9, $0, 0xe3c310
   	jal painter
   	
   	
   	
   	# R
   	
   	addi $4, $0, 80
    	addi $5, $0, 28
    	addi $6, $0, 3
    	addi $7, $0, 21
   	ori  $9, $0, 0xe3c310
   	jal painter
   	
   	addi $4, $0, 80
    	addi $5, $0, 28
    	addi $6, $0, 12
    	addi $7, $0, 3
   	ori  $9, $0, 0xe3c310
   	jal painter
   	
   	addi $4, $0, 80
    	addi $5, $0, 37
    	addi $6, $0, 3
    	addi $7, $0, 21
   	ori  $9, $0, 0xe3c310
   	jal painter
   	
   	
   	# E
   	
   	
   	addi $4, $0, 80
    	addi $5, $0, 43
    	addi $6, $0, 3
    	addi $7, $0, 21
   	ori  $9, $0, 0xe3c310
   	jal painter
   	
   	addi $4, $0, 80
    	addi $5, $0, 43
    	addi $6, $0, 12
    	addi $7, $0, 3
   	ori  $9, $0, 0xe3c310
   	jal painter
   	
   	addi $4, $0, 89
    	addi $5, $0, 43
    	addi $6, $0, 12
    	addi $7, $0, 3
   	ori  $9, $0, 0xe3c310
   	jal painter

   	
   	addi $4, $0, 98
    	addi $5, $0, 43
    	addi $6, $0, 12
    	addi $7, $0, 3
   	ori  $9, $0, 0xe3c310
   	jal painter
   	
   	
   	
   	# S
   	
   	addi $4, $0, 80
    	addi $5, $0, 58
    	addi $6, $0, 3
    	addi $7, $0, 12
   	ori  $9, $0, 0xe3c310
   	jal painter
   	
   	addi $4, $0, 80
    	addi $5, $0, 58
    	addi $6, $0, 12
    	addi $7, $0, 3
   	ori  $9, $0, 0xe3c310
   	jal painter
   	
   	addi $4, $0, 89
    	addi $5, $0, 58
    	addi $6, $0, 12
    	addi $7, $0, 3
   	ori  $9, $0, 0xe3c310
   	jal painter
   	
   	addi $4, $0, 89
    	addi $5, $0, 67
    	addi $6, $0, 3
    	addi $7, $0, 12
   	ori  $9, $0, 0xe3c310
   	jal painter

   	
   	addi $4, $0, 98
    	addi $5, $0, 58
    	addi $6, $0, 12
    	addi $7, $0, 3
   	ori  $9, $0, 0xe3c310
   	jal painter
   	
   	
   	
   	# S
   	
   	addi $4, $0, 80
    	addi $5, $0, 73
    	addi $6, $0, 3
    	addi $7, $0, 12
   	ori  $9, $0, 0xe3c310
   	jal painter
   	
   	addi $4, $0, 80
    	addi $5, $0, 73
    	addi $6, $0, 12
    	addi $7, $0, 3
   	ori  $9, $0, 0xe3c310
   	jal painter
   	
   	addi $4, $0, 89
    	addi $5, $0, 73
    	addi $6, $0, 12
    	addi $7, $0, 3
   	ori  $9, $0, 0xe3c310
   	jal painter
   	
   	addi $4, $0, 89
    	addi $5, $0, 82
    	addi $6, $0, 3
    	addi $7, $0, 12
   	ori  $9, $0, 0xe3c310
   	jal painter

   	
   	addi $4, $0, 98
    	addi $5, $0, 73
    	addi $6, $0, 12
    	addi $7, $0, 3
   	ori  $9, $0, 0xe3c310
   	jal painter
   	
   	
   	# S
   	
   	addi $4, $0, 80
    	addi $5, $0, 94
    	addi $6, $0, 3
    	addi $7, $0, 12
   	ori  $9, $0, 0xe3c310
   	jal painter
   	
   	addi $4, $0, 80
    	addi $5, $0, 94
    	addi $6, $0, 12
    	addi $7, $0, 3
   	ori  $9, $0, 0xe3c310
   	jal painter
   	
   	addi $4, $0, 89
    	addi $5, $0, 94
    	addi $6, $0, 12
    	addi $7, $0, 3
   	ori  $9, $0, 0xe3c310
   	jal painter
   	
   	addi $4, $0, 89
    	addi $5, $0, 103
    	addi $6, $0, 3
    	addi $7, $0, 12
   	ori  $9, $0, 0xe3c310
   	jal painter

   	
   	addi $4, $0, 98
    	addi $5, $0, 94
    	addi $6, $0, 12
    	addi $7, $0, 3
   	ori  $9, $0, 0xe3c310
   	jal painter
   	
   	
   	
   	
   	# P
   	
   	addi $4, $0, 80
    	addi $5, $0, 109
    	addi $6, $0, 3
    	addi $7, $0, 21
   	ori  $9, $0, 0xe3c310
   	jal painter
   	
   	addi $4, $0, 80
    	addi $5, $0, 109
    	addi $6, $0, 12
    	addi $7, $0, 3
   	ori  $9, $0, 0xe3c310
   	jal painter
   	
   	addi $4, $0, 80
    	addi $5, $0, 121
    	addi $6, $0, 3
    	addi $7, $0, 12
   	ori  $9, $0, 0xe3c310
   	jal painter
   	
   	addi $4, $0, 89
    	addi $5, $0, 109
    	addi $6, $0, 12
    	addi $7, $0, 3
   	ori  $9, $0, 0xe3c310
   	jal painter
   	
   	# A
   	
   	addi $4, $0, 80
    	addi $5, $0, 127
    	addi $6, $0, 3
    	addi $7, $0, 21
   	ori  $9, $0, 0xe3c310
   	jal painter
   	
   	addi $4, $0, 80
    	addi $5, $0, 127
    	addi $6, $0, 12
    	addi $7, $0, 3
   	ori  $9, $0, 0xe3c310
   	jal painter
   	
   	addi $4, $0, 80
    	addi $5, $0, 136
    	addi $6, $0, 3
    	addi $7, $0, 21
   	ori  $9, $0, 0xe3c310
   	jal painter
   	
   	addi $4, $0, 90
    	addi $5, $0, 127
    	addi $6, $0, 12
    	addi $7, $0, 3
   	ori  $9, $0, 0xe3c310
   	jal painter
   	
   	
   	# C
   	
   	addi $4, $0, 80
    	addi $5, $0, 141
    	addi $6, $0, 3
    	addi $7, $0, 21
   	ori  $9, $0, 0xe3c310
   	jal painter
   	
   	addi $4, $0, 80
    	addi $5, $0, 141
    	addi $6, $0, 12
    	addi $7, $0, 3
   	ori  $9, $0, 0xe3c310
   	jal painter
   	
   	addi $4, $0, 98
    	addi $5, $0, 141
    	addi $6, $0, 12
    	addi $7, $0, 3
   	ori  $9, $0, 0xe3c310
   	jal painter
   	
   	
   	# E
   	
   	addi $4, $0, 80
    	addi $5, $0, 156
    	addi $6, $0, 3
    	addi $7, $0, 21
   	ori  $9, $0, 0xe3c310
   	jal painter
   	
   	addi $4, $0, 80
    	addi $5, $0, 156
    	addi $6, $0, 12
    	addi $7, $0, 3
   	ori  $9, $0, 0xe3c310
   	jal painter
   	
   	
   	addi $4, $0, 89
    	addi $5, $0, 156
    	addi $6, $0, 12
    	addi $7, $0, 3
   	ori  $9, $0, 0xe3c310
   	jal painter
   	
   	addi $4, $0, 98
    	addi $5, $0, 156
    	addi $6, $0, 12
    	addi $7, $0, 3
   	ori  $9, $0, 0xe3c310
   	jal painter
   	home_loop:
   	
   	add $4, $0, ' ' 
   	 lui $8, 0xffff
   	 lw $5, 4($8)
   	 beq $5, $4, start
   	 
   	 add $4, $0, 'l' #RESET
   	  sw $4, 4($8)
   	 j home_loop
   	

    
    
    
    
    
   
start:
	addi $18, $0, 0
	addi $19, $0, 0
	addi $20, $0, 0
	addi $21, $0, 0
	addi $23, $0, +10

	lui $8, 0x1001
	addi $4, $0, 55384
	sw $4, 400000($8) # 1/4 fireboy (up)
	
	lui $8, 0x1001
	addi $4, $0, 66620
	sw $4, 400004($8) # 2/4 fireboy (left)
	
	lui $8, 0x1001
	addi $4, $0, 72792
	sw $4, 400008($8) # 3/4 fireboy (down)
	
	lui $8, 0x1001
	addi $4, $0, 66672
	sw $4, 400012($8) # 4/4 fireboy (right)
	
	lui $8, 0x1001
	addi $4, $0, 55332
	sw $4, 400016($8) # 1/4 watergirl (up)
	
	lui $8, 0x1001
	addi $4, $0, 66572
	sw $4, 400020($8) # 2/4 watergirl (left)
	
	lui $8, 0x1001
	addi $4, $0, 72740
	sw $4, 400024($8) # 3/4 watergirl (down)
	
	lui $8, 0x1001
	addi $4, $0, 66624
	sw $4, 400028($8) # 4/4 watergirl (right)
	
	lui $8, 0x1001
	addi $4, $0, 24344
	sw $4, 400032($8) # 1/2 fireball (left)
	
	lui $8, 0x1001
	addi $4, $0, 24436
	sw $4, 400036($8) # 2/2 fireball (right)
	
	lui $8, 0x1001
	addi $4, $0, 79664
	sw $4, 400040($8) # 1/2 waterball (left)
	
	lui $8, 0x1001
	addi $4, $0, 78732
	sw $4, 400044($8) # 2/2 waterball (right)
	
	lui $8, 0x1001
	addi $4, $0, 0
	sw $4, 400048($8) # fireboy phase 1 pass check
	
	lui $8, 0x1001
	addi $4, $0, 0
	sw $4, 400052($8) # watergirl phase 1 pass check
	
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
   	 addi $14, $0, 90
   	 addi $15, $0, 50
   	 addi $16, $0, -2
   	 addi $17, $0, -2
   	 
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
    
    #PINTANDO A SAIDA
    
    addi $4, $0, 87
    addi $5, $0, 253
    addi $6, $0, 3
    addi $7, $0, 15
    ori  $9, $0, 0x8A7C41
    jal painter
    
    addi $4, $0, 59
    addi $5, $0, 253
    addi $6, $0, 3
    addi $7, $0, 15
    ori  $9, $0, 0x8A7C41
    jal painter
   
    #FIREBALL
    beq $14, $0, set_fireball
    addi $14, $14, -1    	

    #WATERBALL
    beq $15, $0, set_waterball
    add $15, $15, -1
     
    j read_character
    
    set_fireball:
        
    	addi $14, $0, 90
    	mul $16, $16, -1
    	    	    	    	    	
    	j read_character
    	
    set_waterball:
    	addi $15, $0, 50
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
   	 j targed
  
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
		
		j targed
			
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
		
		j targed
		
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
		
		j targed
	
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
		
		j targed
	
up_wg:

	# ADDING UP:
		lui $8, 0x1001
		lw $9, 400016($8)
		add $8, $8, $9
		lw $6, 0($8)
		addi $7, $0, 1645315
		beq $6, $7, blocked
		addi $9, $9, -3072
		lui $8, 0x1001
		sw $9, 400016($8)
	
		addi $20, $20, -3
	
	# ADDING LEFT:
		lui $8, 0x1001
		lw $9, 400020($8)
		addi $9, $9, -3072
		sw $9, 400020($8)
	
	#ADDING DOWN:
		lui $8, 0x1001
		lw $9, 400024($8)
		addi $9, $9, -3072
		sw $9, 400024($8)

	#ADDING RIGHT:
		lui $8, 0x1001
		lw $9, 400028($8)
		addi $9, $9, -3072
		sw $9, 400028($8)
		
	# RESETING CASE	
		add $4, $0, ' '
		lui $8, 0xffff
		sw $4, 4($8)
		
		j targed

left_wg:

	# ADDING LEFT:
		lui $8, 0x1001
		lw $9, 400020($8)
		add $8, $8, $9
		lw $6, 0($8)
		addi $7, $0, 1645315
		beq $6, $7, blocked
		addi $9, $9, -12
		lui $8, 0x1001
		sw $9, 400020($8)
		
		addi $21, $21, -3
	
	# ADDING UP:
		lui $8, 0x1001
		lw $9, 400016($8)
		addi $9, $9, -12
		sw $9, 400016($8)
		
	#ADDING DOWN:
		lui $8, 0x1001
		lw $9, 400024($8)
		addi $9, $9, -12
		sw $9, 400024($8)

	#ADDING RIGHT:
		lui $8, 0x1001
		lw $9, 400028($8)
		addi $9, $9, -12
		sw $9, 400028($8)
		
	# RESETING CASE	
		add $4, $0, ' '
		lui $8, 0xffff
		sw $4, 4($8)
		
		j targed

down_wg:

	# ADDING DOWN:
	
		lui $8, 0x1001
		lw $9, 400024($8)
		add $8, $8, $9
		lw $6, 0($8)
		addi $7, $0, 1645315
		beq $6, $7, blocked
		addi $9, $9, +3072
		lui $8, 0x1001
		sw $9, 400024($8)
		
		add $20, $20, +3
		
				
	# ADDING UP:
	
		lui $8, 0x1001
		lw $9, 400016($8)
		addi $9, $9, +3072
		sw $9, 400016($8)
		
	#ADDING LEFT:
	
		lui $8, 0x1001
		lw $9, 400020($8)
		addi $9, $9, +3072
		sw $9, 400020($8)

	#ADDING RIGHT:
	
		lui $8, 0x1001
		lw $9, 400028($8)
		addi $9, $9, +3072
		sw $9, 400028($8)
		
	# RESETING CASE	
		add $4, $0, ' '
		lui $8, 0xffff
		sw $4, 4($8)
		
		j targed
		

right_wg:

	# ADDING RIGHT:
		lui $8, 0x1001
		lw $9, 400028($8)
		
		add $8, $8, $9
		lw $6, 0($8)
		
		addi $7, $0, 1645315
		beq $6, $7, blocked
		addi $9, $9, +12
		lui $8, 0x1001
		sw $9, 400028($8)
		
		addi $21, $21, +3
		
	# ADDING LEFT:
		lui $8, 0x1001
		lw $9, 400020($8)
		addi $9, $9, +12
		sw $9, 400020($8)
	
	#ADDING DOWN:
		lui $8, 0x1001
		lw $9, 400024($8)
		addi $9, $9, +12
		sw $9, 400024($8)

	#ADDING UP:
		lui $8, 0x1001
		lw $9, 400016($8)
		addi $9, $9, +12
		sw $9, 400016($8)
		
	# RESETING CASE	
		add $4, $0, ' '
		lui $8, 0xffff
		sw $4, 4($8)
		
		j targed
		
		
targed:		
	addi $10, $0, 0
	addi $11, $0, 2
	
	addi $4, $0, 103935
	addi $5, $0, 9075777
		
	# TESTANDO FIREBOY: (4/4)
	lui $8, 0x1001
	lw $9, 400012($8)
	add $8, $8, $9
	lw $7, 0($8)
	
	beq $7, $4, start # RESTART THE GAME (DIED)
	beq $7, $5, next_level_fb # PASS THE GAME
	
	addi $4, $0, 16427828

test_here:

	# TESTANDO WATERGIRL: (4/4)
	lui $8, 0x1001
	lw $9, 400028($8)
	add $8, $8, $9
	lw $7, 0($8)
	
	beq $7, $4, start # RESTART THE GAME (DIED)
	beq $7, $5, next_level_wg # PASS THE GAME
	
	j reset_map

blocked:
	add $4, $0, ' ' #RESET
	sw $4, 4($8) # Reseting the cage
		
	j reset_map
	
next_level_fb:
	lui $8, 0x1001
	addi $9, $0, 1
	sw $9, 400048($8)
	lw $10, 400052($8)
	
	beq $9, $10, start3
	j test_here

		
next_level_wg:
	lui $8, 0x1001
	addi $9, $0, 1
	sw $9, 400052($8)
	lw $10, 400048($8)
	
	beq $9, $10, start3
	j start
	
	
	
	
	
	
	
	
	
	
	
	
	
	

start3:

	addi $18, $0, 0
	addi $19, $0, 0
	addi $20, $0, 0
	addi $21, $0, 0

	lui $8, 0x1001
	addi $4, $0, 55384
	sw $4, 800000($8) # 1/4 fireboy (up)
	
	lui $8, 0x1001
	addi $4, $0, 66620
	sw $4, 800004($8) # 2/4 fireboy (left)
	
	lui $8, 0x1001
	addi $4, $0, 72792
	sw $4, 800008($8) # 3/4 fireboy (down)
	
	lui $8, 0x1001
	addi $4, $0, 67696
	sw $4, 800012($8) # 4/4 fireboy (right)
	
	lui $8, 0x1001
	addi $4, $0, 55332
	sw $4, 800016($8) # 1/4 watergirl (up)
	
	lui $8, 0x1001
	addi $4, $0, 66572
	sw $4, 800020($8) # 2/4 watergirl (left)
	
	lui $8, 0x1001
	addi $4, $0, 72740
	sw $4, 800024($8) # 3/4 watergirl (down)
	
	lui $8, 0x1001
	addi $4, $0, 67644
	sw $4, 800028($8) # 4/4 watergirl (right)
	
	lui $8, 0x1001
	addi $4, $0, 24344
	sw $4, 800032($8) # 1/2 fireball (left)
	
	lui $8, 0x1001
	addi $4, $0, 24436
	sw $4, 800036($8) # 2/2 fireball (right)
	
	lui $8, 0x1001
	addi $4, $0, 79664
	sw $4, 800040($8) # 1/2 waterball (left)
	
	lui $8, 0x1001
	addi $4, $0, 78732
	sw $4, 800044($8) # 2/2 waterball (right)
	
	lui $8, 0x1001
	addi $4, $0, 0
	sw $4, 800048($8) # fireboy phase 1 pass check
	
	lui $8, 0x1001
	addi $4, $0, 0
	sw $4, 800052($8) # watergirl phase 1 pass check
	
	lui $8, 0x1001
	addi $4, $0, 2
	sw $4, 800056($8) # delay to bot
	
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
   	 addi $14, $0, 19
   	 addi $15, $0, 28
   	 addi $16, $0, -2
   	 addi $17, $0, -2
   	 addi $18, $0, 3
   	 addi $20, $0, 3
   	 addi $22, $0, 23
   	 addi $23, $0, -77
   	 addi $24, $0, 16
   	 addi $25, $0, -61
  
reset_map2:
   	
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
		
		addi $4, $0, 81
		addi $5, $0, 41
		addi $6, $0, 29
		addi $7, $0, 3
		ori  $9, $0, 0x191b03
		jal painter
		
		addi $4, $0, 69
		addi $5, $0, 67
		addi $6, $0, 3
		addi $7, $0, 14
		ori  $9, $0, 0x191b03
		jal painter
		
		addi $4, $0, 69
		addi $5, $0, 52
		addi $6, $0, 15
		addi $7, $0, 3
		ori  $9, $0, 0x191b03
		jal painter
		
		addi $4, $0, 53
		addi $5, $0, 52
		addi $6, $0, 3
		addi $7, $0, 18
		ori  $9, $0, 0x191b03
		jal painter
		
		addi $4, $0, 53
		addi $5, $0, 52
		addi $6, $0, 33
		addi $7, $0, 3
		ori  $9, $0, 0x191b03
		jal painter
		
		addi $4, $0, 36
		addi $5, $0, 86
		addi $6, $0, 3
		addi $7, $0, 19
		ori  $9, $0, 0x191b03
		jal painter
		
		addi $4, $0, 53
		addi $5, $0, 85
		addi $6, $0, 3
		addi $7, $0, 17
		ori  $9, $0, 0x191b03
		jal painter
		
		addi $4, $0, 67
		addi $5, $0, 85
		addi $6, $0, 65
		addi $7, $0, 3
		ori  $9, $0, 0x191b03
		jal painter
		
		addi $4, $0, 40
		addi $5, $0, 147
		addi $6, $0, 3
		addi $7, $0, 30
		ori  $9, $0, 0x191b03
		jal painter
		
		addi $4, $0, 39
		addi $5, $0, 147
		addi $6, $0, 18
		addi $7, $0, 3
		ori  $9, $0, 0x191b03
		jal painter
		
		addi $4, $0, 39
		addi $5, $0, 165
		addi $6, $0, 3
		addi $7, $0, 17
		ori  $9, $0, 0x191b03
		jal painter
		
		addi $4, $0, 53
		addi $5, $0, 165
		addi $6, $0, 6
		addi $7, $0, 3
		ori  $9, $0, 0x191b03
		jal painter
		
		addi $4, $0, 36
		addi $5, $0, 168
		addi $6, $0, 3
		addi $7, $0, 19
		ori  $9, $0, 0x191b03
		jal painter
		
		addi $4, $0, 36
		addi $5, $0, 144
		addi $6, $0, 25
		addi $7, $0, 3
		ori  $9, $0, 0x191b03
		jal painter
		
		addi $4, $0, 36
		addi $5, $0, 144
		addi $6, $0, 3
		addi $7, $0, 33
		ori  $9, $0, 0x191b03
		jal painter
		
		addi $4, $0, 54
		addi $5, $0, 86
		addi $6, $0, 64
		addi $7, $0, 3
		ori  $9, $0, 0x191b03
		jal painter
		
		addi $4, $0, 36
		addi $5, $0, 23
		addi $6, $0, 63
		addi $7, $0, 3
		ori  $9, $0, 0x191b03
		jal painter
		
		addi $4, $0, 36
		addi $5, $0, 23
		addi $6, $0, 3
		addi $7, $0, 6
		ori  $9, $0, 0x191b03
		jal painter
		
		addi $4, $0, 39
		addi $5, $0, 23
		addi $6, $0, 18
		addi $7, $0, 3
		ori  $9, $0, 0x191b03
		jal painter
		
		addi $4, $0, 39
		addi $5, $0, 41
		addi $6, $0, 3
		addi $7, $0, 45
		ori  $9, $0, 0x191b03
		jal painter
		
		addi $4, $0, 73
		addi $5, $0, 0
		addi $6, $0, 26
		addi $7, $0, 3
		ori  $9, $0, 0x191b03
		jal painter
		
		addi $4, $0, 73
		addi $5, $0, 23
		addi $6, $0, 3
		addi $7, $0, 28
		ori  $9, $0, 0x191b03
		jal painter
		
		addi $4, $0, 98
		addi $5, $0, 11
		addi $6, $0, 15
		addi $7, $0, 3
		ori  $9, $0, 0x191b03
		jal painter
		
		addi $4, $0, 98
		addi $5, $0, 8
		addi $6, $0, 3
		addi $7, $0, 18
		ori  $9, $0, 0x191b03
		jal painter
		
		addi $4, $0, 114
		addi $5, $0, 8
		addi $6, $0, 96
		addi $7, $0, 3
		ori  $9, $0, 0x191b03
		jal painter
		
		addi $4, $0, 100
		addi $5, $0, 103
		addi $6, $0, 3
		addi $7, $0, 17
		ori  $9, $0, 0x191b03
		jal painter
		
		addi $4, $0, 100
		addi $5, $0, 103
		addi $6, $0, 16
		addi $7, $0, 3
		ori  $9, $0, 0x191b03
		jal painter
		
		addi $4, $0, 100
		addi $5, $0, 116
		addi $6, $0, 3
		addi $7, $0, 16
		ori  $9, $0, 0x191b03
		jal painter
		
		addi $4, $0, 114
		addi $5, $0, 116
		addi $6, $0, 19
		addi $7, $0, 3
		ori  $9, $0, 0x191b03
		jal painter
		
		addi $4, $0, 100
		addi $5, $0, 134
		addi $6, $0, 3
		addi $7, $0, 17
		ori  $9, $0, 0x191b03
		jal painter
		
		addi $4, $0, 100
		addi $5, $0, 134
		addi $6, $0, 16
		addi $7, $0, 3
		ori  $9, $0, 0x191b03
		jal painter
		
		addi $4, $0, 100
		addi $5, $0, 147
		addi $6, $0, 3
		addi $7, $0, 15
		ori  $9, $0, 0x191b03
		jal painter
		
		addi $4, $0, 114
		addi $5, $0, 147
		addi $6, $0, 103
		addi $7, $0, 3
		ori  $9, $0, 0x191b03
		jal painter
		
		addi $4, $0, 100
		addi $5, $0, 250
		addi $6, $0, 3
		addi $7, $0, 17
		ori  $9, $0, 0x191b03
		jal painter
		
		addi $4, $0, 98
		addi $5, $0, 232
		addi $6, $0, 21
		addi $7, $0, 3
		ori  $9, $0, 0x191b03
		jal painter
		
		addi $4, $0, 42
		addi $5, $0, 232
		addi $6, $0, 3
		addi $7, $0, 58
		ori  $9, $0, 0x191b03
		jal painter
		
		addi $4, $0, 42
		addi $5, $0, 232
		addi $6, $0, 24
		addi $7, $0, 3
		ori  $9, $0, 0x191b03
		jal painter
		
		addi $4, $0, 26
		addi $5, $0, 217
		addi $6, $0, 40
		addi $7, $0, 3
		ori  $9, $0, 0x191b03
		jal painter
		
		addi $4, $0, 26
		addi $5, $0, 214
		addi $6, $0, 3
		addi $7, $0, 75
		ori  $9, $0, 0x191b03
		jal painter
		
		addi $4, $0, 98
		addi $5, $0, 165
		addi $6, $0, 50
		addi $7, $0, 3
		ori  $9, $0, 0x191b03
		jal painter

   	 
   	 paint_fireboy2:
       	
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
   	 
   	 
paint_watergirl2:
       	
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
   	 
   	 addi $4, $0, 69
		addi $5, $0, 196
		addi $6, $0, 30
		addi $7, $0, 16
		ori  $9, $0, 0x706535
		jal painter
	

paint_fireball2:

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
        

    
     
paint_waterball2:
    
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
    
    # FIRE BARRIER 1
    addi $4, $0, 100
    	addi $5, $0, 180 
    	addi $6, $0, 3
    	addi $7, $0, 15 
    	ori  $9, $0, 0xFA0100
   	 jal painter 
   	 
   	 addi $4, $0, 100
    	addi $5, $0,180
    	addi $6, $0, 1
    	addi $7, $0, 3
    	ori  $9, $0, 0xFAE846
   	 jal painter 
   	 
   	  addi $4, $0, 102
    	addi $5, $0,181  
    	addi $6, $0, 1
    	addi $7, $0, 11
    	ori  $9, $0, 0xFAE846
   	 jal painter 
   	 
   	   addi $4, $0, 110 
    	addi $5, $0,180 
    	addi $6, $0, 1
    	addi $7, $0, 4
    	ori  $9, $0, 0xFAE846
   	 jal painter 
   	 
   	 
   	 
# WATER BARRIER 1
	
	addi $4, $0, 22
    	addi $5, $0,165 
    	addi $6, $0, 3
    	addi $7, $0, 15 
    	ori  $9, $0, 0x0195FF
   	 jal painter 
   	 
   	 addi $4, $0, 22 
    	addi $5, $0,165 
    	addi $6, $0, 1
    	addi $7, $0, 3
    	ori  $9, $0, 0xBCE2FC
   	 jal painter 
   	 
   	  addi $4, $0, 23
    	addi $5, $0,166  
    	addi $6, $0, 1
    	addi $7, $0, 11
    	ori  $9, $0, 0xBCE2FC
   	 jal painter 
   	 
   	   addi $4, $0, 33
    	addi $5, $0,165 
    	addi $6, $0, 1
    	addi $7, $0, 4
    	ori  $9, $0, 0xBCE2FC
   	 jal painter
	
	    # FIRE BARRIER 2
    addi $4, $0, 69
    	addi $5, $0, 100 
    	addi $6, $0, 3
    	addi $7, $0, 15 
    	ori  $9, $0, 0xFA0100
   	 jal painter 
   	 
   	 addi $4, $0, 69
    	addi $5, $0,100
    	addi $6, $0, 1
    	addi $7, $0, 3
    	ori  $9, $0, 0xFAE846
   	 jal painter 
   	
   	 
   	  addi $4, $0, 70
    	addi $5, $0,101  
    	addi $6, $0, 1
    	addi $7, $0, 11
    	ori  $9, $0, 0xFAE846
   	 jal painter 
   	 
   	   addi $4, $0, 79 
    	addi $5, $0,100 
    	addi $6, $0, 1
    	addi $7, $0, 4
    	ori  $9, $0, 0xFAE846
   	 jal painter 
   	 
   	 # WATER BARRIER 2
	
	addi $4, $0, 69
    	addi $5, $0,120 
    	addi $6, $0, 3
    	addi $7, $0, 15 
    	ori  $9, $0, 0x0195FF
   	 jal painter 
   	 
   	 addi $4, $0, 69 
    	addi $5, $0,120 
    	addi $6, $0, 1
    	addi $7, $0, 3
    	ori  $9, $0, 0xBCE2FC
   	 jal painter 
   	 
   	  addi $4, $0, 70
    	addi $5, $0,121  
    	addi $6, $0, 1
    	addi $7, $0, 11
    	ori  $9, $0, 0xBCE2FC
   	 jal painter 
   	 
   	   addi $4, $0, 79
    	addi $5, $0,120 
    	addi $6, $0, 1
    	addi $7, $0, 4
    	ori  $9, $0, 0xBCE2FC
   	 jal painter
   	 
   	 lui $8, 0x1001
   	 lw $9, 800056($8)
   	 beq $9, $0, bot_delayed
   	 addi $9, $9, -1
   	 sw $9, 800056($8)
   	 j whatever
 
bot_delayed:
	lui $8, 0x1001
	addi $9, $0, 2
	sw $9, 800056($8)
	
	beq $14, $0, set_fireball2
	addi $14, $14, -1
	add $23, $23, $16
testar_la:	
	beq $15, $0, set_waterball2
	addi $15, $15, -1
	add $25, $25, $17
	j whatever
	
set_fireball2:
	addi $14, $0, 19
	mul $16, $16, -1
	j testar_la
set_waterball2:
	addi $15, $0, 28
	mul $17, $17, -1

	j whatever	
	
	
whatever:
	
   	 lui $8, 0xffff
   	 lw $5, 4($8)
   	 addi $6, $0, 'w'
   	 beq $6, $5, up_fb2
   	 addi $6, $0, 'a'
   	 beq $6, $5, left_fb2
   	 addi $6, $0, 's'
   	 beq $6, $5, down_fb2
   	 addi $6, $0, 'd'
   	 beq $6, $5, right_fb2
   	 addi $6, $0, '8'
   	 beq $6, $5, up_wg2
   	 addi $6, $0, '4'
   	 beq $6, $5, left_wg2
   	 addi $6, $0, '2'
   	 beq $6, $5, down_wg2
   	 addi $6, $0, '6'
   	 beq $6, $5, right_wg2
   	 j targed2
   	 
up_fb2:
	addi $18, $18, -3
	lui $8, 0x1001
	lw $9, 800012($8)
	addi $9, $9, -3072
	sw $9, 800012($8)
	
	add $4, $0, ' ' #RESET
   	 lui $8, 0xffff
   	 sw $4, 4($8)
	j targed2
left_fb2:
	addi $19, $19, -3
	lui $8, 0x1001
	lw $9, 800012($8)
	addi $9, $9, -12
	sw $9, 800012($8)
	
	add $4, $0, ' ' #RESET
   	 lui $8, 0xffff
   	 sw $4, 4($8)
	j targed2
down_fb2:
 	addi $18, $18, +3
	lui $8, 0x1001
	lw $9, 800012($8)
	addi $9, $9, +3072
	sw $9, 800012($8)
	
	add $4, $0, ' ' #RESET
   	 lui $8, 0xffff
   	 sw $4, 4($8)
 	j targed2
right_fb2:
	addi $19, $19, +3
	lui $8, 0x1001
	lw $9, 800012($8)
	addi $9, $9, +12
	sw $9, 800012($8)
	
	add $4, $0, ' ' #RESET
   	 lui $8, 0xffff
   	 sw $4, 4($8)
	j targed2	

up_wg2:
	addi $20, $20, -3
	lui $8, 0x1001
	lw $9, 800028($8)
	addi $9, $9, -3072
	sw $9, 800028($8)
	
	add $4, $0, ' ' #RESET
   	 lui $8, 0xffff
   	 sw $4, 4($8)
	j targed2
left_wg2:
	addi $21, $21, -3
	lui $8, 0x1001
	lw $9, 800028($8)
	addi $9, $9, -12
	sw $9, 800028($8)
	
	add $4, $0, ' ' #RESET
   	 lui $8, 0xffff
   	 sw $4, 4($8)
	j targed2
down_wg2:
 	addi $20, $20, +3
	lui $8, 0x1001
	lw $9, 800028($8)
	addi $9, $9, +3072
	sw $9, 800028($8)
	
	add $4, $0, ' ' #RESET
   	 lui $8, 0xffff
   	 sw $4, 4($8)
 	j targed2
right_wg2:
	addi $21, $21, +3
	lui $8, 0x1001
	lw $9, 800028($8)
	addi $9, $9, +12
	sw $9, 800028($8)
	
	add $4, $0, ' ' #RESET
   	 lui $8, 0xffff
   	 sw $4, 4($8)
	j targed2	
 
targed2:
	addi $6, $0, 9075777
	addi $7, $0, 103935
	lui $8, 0x1001
	lw $9, 800012($8)
	add $8, $8, $9
	lw $10, 0($8)

	
	beq $7, $10, start3
	beq $6, $10, next_level_fb2
	
	
test_blue:
	addi $7, $0, 16427828
	lui $8, 0x1001
	lw $9, 800028($8)
	add $8, $8, $9
	lw $10, 0($8)
	beq $7, $10, start3
	beq $6, $10, next_level_wg2
	j reset_map2

next_level_fb2:
	lui $8, 0x1001
	addi $9, $0, 1
	sw $9, 800048($8)
	lw $10, 800052($8)
	
	beq $9, $10, endgame
	j test_blue

next_level_wg2:
	lui $8, 0x1001
	addi $9, $0, 1
	sw $9, 800048($8)
	lw $10, 800052($8)
	
	beq $9, $10, endgame
	j reset_map2
	
endgame:
	addi $4, $0, 0
	addi $5, $0, 0
	addi $6, $0, 256
	addi $7, $0, 129
	ori  $9, $0, 0xff0000
	jal painter
	
	addi $4, $0, 0
	addi $5, $0, 127
	addi $6, $0, 128
	addi $7, $0, 129
	ori  $9, $0, 0x0000ff
	jal painter

end:
	
