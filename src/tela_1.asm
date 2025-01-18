
    
.text  
main:
		
		j starter

fb_pixels:
	
    sub $sp, $sp, 234       # Aloca espaço para 32 pares (32 * 2 palavras = 64 bytes)

    # Armazena os pares (x, y)
    li $t0, 1              # x1
    li $t1, 59             # y1
    sw $t0, 0($sp)         # Armazena x1
    sw $t1, 4($sp)         # Armazena y1

    li $t0, 3              # x2
    li $t1, 59             # y2
    sw $t0, 8($sp)         # Armazena x2
    sw $t1, 12($sp)        # Armazena y2

    li $t0, 4              # x3
    li $t1, 59             # y3
    sw $t0, 16($sp)        # Armazena x3
    sw $t1, 20($sp)        # Armazena y3

    li $t0, 5              # x4
    li $t1, 59             # y4
    sw $t0, 24($sp)        # Armazena x4
    sw $t1, 28($sp)        # Armazena y4

    li $t0, 7              # x5
    li $t1, 59             # y5
    sw $t0, 32($sp)        # Armazena x5
    sw $t1, 36($sp)        # Armazena y5

    li $t0, 2              # x6
    li $t1, 60             # y6
    sw $t0, 40($sp)        # Armazena x6
    sw $t1, 44($sp)        # Armazena y6

    li $t0, 4              # x7
    li $t1, 60             # y7
    sw $t0, 48($sp)        # Armazena x7
    sw $t1, 52($sp)        # Armazena y7

    li $t0, 6              # x8
    li $t1, 60             # y8
    sw $t0, 56($sp)        # Armazena x8
    sw $t1, 60($sp)        # Armazena y8

    li $t0, 2              # x9
    li $t1, 61             # y9
    sw $t0, 64($sp)        # Armazena x9
    sw $t1, 68($sp)        # Armazena y9

    li $t0, 3              # x10
    li $t1, 61             # y10
    sw $t0, 72($sp)        # Armazena x10
    sw $t1, 76($sp)        # Armazena y10

    li $t0, 4              # x11
    li $t1, 61             # y11
    sw $t0, 80($sp)        # Armazena x11
    sw $t1, 84($sp)        # Armazena y11

    li $t0, 5              # x12
    li $t1, 61             # y12
    sw $t0, 88($sp)        # Armazena x12
    sw $t1, 92($sp)        # Armazena y12

    li $t0, 6              # x13
    li $t1, 61             # y13
    sw $t0, 96($sp)        # Armazena x13
    sw $t1, 100($sp)       # Armazena y13

    li $t0, 3              # x14
    li $t1, 62             # y14
    sw $t0, 104($sp)       # Armazena x14
    sw $t1, 108($sp)       # Armazena y14

    li $t0, 4              # x15
    li $t1, 62             # y15
    sw $t0, 112($sp)       # Armazena x15
    sw $t1, 116($sp)       # Armazena y15

    li $t0, 5              # x16
    li $t1, 62             # y16
    sw $t0, 120($sp)       # Armazena x16
    sw $t1, 124($sp)       # Armazena y16

    li $t0, 4              # x17
    li $t1, 63             # y17
    sw $t0, 128($sp)       # Armazena x17
    sw $t1, 132($sp)       # Armazena y17

    li $t0, 3              # x18
    li $t1, 64             # y18
    sw $t0, 136($sp)       # Armazena x18
    sw $t1, 140($sp)       # Armazena y18

    li $t0, 4              # x19
    li $t1, 64             # y19
    sw $t0, 144($sp)       # Armazena x19
    sw $t1, 148($sp)       # Armazena y19

    li $t0, 5              # x20
    li $t1, 64             # y20
    sw $t0, 152($sp)       # Armazena x20
    sw $t1, 156($sp)       # Armazena y20

    li $t0, 2              # x21
    li $t1, 65             # y21
    sw $t0, 160($sp)       # Armazena x21
    sw $t1, 164($sp)       # Armazena y21

    li $t0, 4              # x22
    li $t1, 65             # y22
    sw $t0, 168($sp)       # Armazena x22
    sw $t1, 172($sp)       # Armazena y22

    li $t0, 6              # x23
    li $t1, 65             # y23
    sw $t0, 176($sp)       # Armazena x23
    sw $t1, 180($sp)       # Armazena y23

    li $t0, 4              # x24
    li $t1, 66             # y24
    sw $t0, 184($sp)       # Armazena x24
    sw $t1, 188($sp)       # Armazena y24

    li $t0, 3              # x25
    li $t1, 67             # y25
    sw $t0, 192($sp)       # Armazena x25
    sw $t1, 196($sp)       # Armazena y25

    li $t0, 5              # x26
    li $t1, 67             # y26
    sw $t0, 200($sp)       # Armazena x26
    sw $t1, 204($sp)       # Armazena y26

    li $t0, 3              # x27
    li $t1, 68             # y27
    sw $t0, 208($sp)       # Armazena x27
    sw $t1, 212($sp)       # Armazena y27

    li $t0, 5              # x28
    li $t1, 68             # y28
    sw $t0, 216($sp)       # Armazena x28
    sw $t1, 220($sp)       # Armazena y28
    
    li $t0, 3
    li $t1, 60
    sw $t0, 224($sp)
    sw $t1, 226($sp)
    
    li $t0, 5
    li $t1, 60
    sw $t0, 230($sp)
    sw $t1, 234($sp)
    
    j paint_fb
			
	
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
    	
    paint_fb:
    	lui $8, 0x1001
    	ori $9, 0xff0000
    	ori $10, 0xff8900
    	addi $11, $0, 56
    	
    	paint_body_fb:
    		beq $11, $0, end_fb
    		lw $12, 0($sp)
    		addi $sp, $sp, 4
    		lw $13, 0($sp)
    		addi $sp, $sp, 4
    		mult $13, $12
    		mul $13, $13, 4
    		
    		add $8, $8, $13
    		sw $9, 0($8)
    		
    		addi $11, $11, -1
  			j paint_body_fb
    	
    	end_fb:
    		jr $ra
    
    
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
		
		jal fb_pixels

		j end
		
		
# --- END --------------------------------------------------------------------- # 
	
	end: 
	
		addi $2, $0, 10
		syscall

		
