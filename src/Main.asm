.text
	main:
		j tela_1
		

# ----------------------------------- FUNÇÕES ------------------------------------------#
# Fun??o para pintar linhas com espessura
# Par?metros:
# $a0 ($4) = coordenada x inicial (0-255, pois 512/2)
# $a1 ($5) = coordenada y inicial (0-127, pois 256/2)
# $a2 ($6) = comprimento da linha
# $a3 ($7) = espessura da linha
# $t1 ($9) = cor da linha

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

# ---------------------------------------------------------------------------------------#

abertura:

	# Pintando o Fundo
	
	addi $4, $0, 0
	addi $5, $0, 0
	addi $6, $0, 255
	addi $7, $0, 127
	ori  $9, $0, 0x2b3205
	jal painter
	
	# Pintando a Abetura
	
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
    ori $9, $0, 0xff0000
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
    
    # Testando se ele clicou espaço
    
home_loop:

    add $4, $0, ' '      # Carrega o caractere de espaço em $4
    lui $8, 0xffff       # Carrega o endereço base 0xffff0000 em $8
    lw $5, 4($8)         # Lê o valor do teclado (endereço 0xffff0004)
    beq $5, $4, tela_1    # Se o caractere lido for espaço, pula para 'tela_1'

    add $4, $0, 'l'      # Carrega o caractere 'l' em $4 (RESET)
    sw $4, 4($8)         # Escreve o caractere 'l' no endereço 0xffff0004
    j home_loop          # Volta para o início do loop
  
tela_1:

	# Pintando o Fundo
	
	addi $4, $0, 0
	addi $5, $0, 0
	addi $6, $0, 255
	addi $7, $0, 127
	ori  $9, $0, 0x2b3205
	jal painter

	# Details: Horizontal
    addi $4, $0, 0
    addi $5, $0, 0
    addi $6, $0, 255
    addi $7, $0, 6
    ori  $9, $0, 0x5a660f
    jal painter

    addi $4, $0, 12
    addi $5, $0, 0
    addi $6, $0, 255
    addi $7, $0, 6
    ori  $9, $0, 0x5a660f
    jal painter

    addi $4, $0, 24
    addi $5, $0, 0
    addi $6, $0, 255
    addi $7, $0, 6
    ori  $9, $0, 0x5a660f
    jal painter

    addi $4, $0, 36
    addi $5, $0, 0
    addi $6, $0, 255
    addi $7, $0, 6
    ori  $9, $0, 0x5a660f
    jal painter

    addi $4, $0, 48
    addi $5, $0, 0
    addi $6, $0, 255
    addi $7, $0, 6
    ori  $9, $0, 0x5a660f
    jal painter

    addi $4, $0, 60
    addi $5, $0, 0
    addi $6, $0, 255
    addi $7, $0, 6
    ori  $9, $0, 0x5a660f
    jal painter

    addi $4, $0, 72
    addi $5, $0, 0
    addi $6, $0, 255
    addi $7, $0, 6
    ori  $9, $0, 0x5a660f
    jal painter

    addi $4, $0, 84
    addi $5, $0, 0
    addi $6, $0, 255
    addi $7, $0, 6
    ori  $9, $0, 0x5a660f
    jal painter

    addi $4, $0, 96
    addi $5, $0, 0
    addi $6, $0, 255
    addi $7, $0, 6
    ori  $9, $0, 0x5a660f
    jal painter

    addi $4, $0, 108
    addi $5, $0, 0
    addi $6, $0, 255
    addi $7, $0, 6
    ori  $9, $0, 0x5a660f
    jal painter

    addi $4, $0, 120
    addi $5, $0, 0
    addi $6, $0, 255
    addi $7, $0, 6
    ori  $9, $0, 0x5a660f
    jal painter

    addi $4, $0, 132
    addi $5, $0, 0
    addi $6, $0, 255
    addi $7, $0, 6
    ori  $9, $0, 0x5a660f
    jal painter

# Details: Vertical
    addi $4, $0, 0
    addi $5, $0, 0
    addi $6, $0, 6
    addi $7, $0, 127
    ori  $9, $0, 0x2b3205
    jal painter

    addi $4, $0, 0
    addi $5, $0, 24
    addi $6, $0, 6
    addi $7, $0, 127
    ori  $9, $0, 0x2b3205
    jal painter

    addi $4, $0, 0
    addi $5, $0, 48
    addi $6, $0, 6
    addi $7, $0, 127
    ori  $9, $0, 0x2b3205
    jal painter

    addi $4, $0, 0
    addi $5, $0, 72
    addi $6, $0, 6
    addi $7, $0, 127
    ori  $9, $0, 0x2b3205
    jal painter

    addi $4, $0, 0
    addi $5, $0, 96
    addi $6, $0, 6
    addi $7, $0, 127
    ori  $9, $0, 0x2b3205
    jal painter

    addi $4, $0, 0
    addi $5, $0, 120
    addi $6, $0, 6
    addi $7, $0, 127
    ori  $9, $0, 0x2b3205
    jal painter

    addi $4, $0, 0
    addi $5, $0, 144
    addi $6, $0, 6
    addi $7, $0, 127
    ori  $9, $0, 0x2b3205
    jal painter

    addi $4, $0, 0
    addi $5, $0, 168
    addi $6, $0, 6
    addi $7, $0, 127
    ori  $9, $0, 0x2b3205
    jal painter

    addi $4, $0, 0
    addi $5, $0, 192
    addi $6, $0, 6
    addi $7, $0, 127
    ori  $9, $0, 0x2b3205
    jal painter

    addi $4, $0, 0
    addi $5, $0, 216
    addi $6, $0, 6
    addi $7, $0, 127
    ori  $9, $0, 0x2b3205
    jal painter

    addi $4, $0, 0
    addi $5, $0, 240
    addi $6, $0, 6
    addi $7, $0, 127
    ori  $9, $0, 0x2b3205
    jal painter
    
    # Pintando as estradas
    
    # Routes
    # 0:57 - 68:71
    addi $4, $0, 57
    addi $5, $0, 0
    addi $6, $0, 68
    addi $7, $0, 15
    ori  $9, $0, 0x706535
    jal painter

    # 52:36 - 68:71
    addi $4, $0, 36
    addi $5, $0, 53
    addi $6, $0, 15
    addi $7, $0, 22
    ori  $9, $0, 0x706535
    jal painter

    # 13:36 - 51:51
    addi $4, $0, 36
    addi $5, $0, 13
    addi $6, $0, 40
    addi $7, $0, 15
    ori  $9, $0, 0x706535
    jal painter

    # 13:17 - 28:35
    addi $4, $0, 17
    addi $5, $0, 13
    addi $6, $0, 15
    addi $7, $0, 20
    ori  $9, $0, 0x706535
    jal painter

    # 28:17 - 233:30
    addi $4, $0, 17
    addi $5, $0, 28
    addi $6, $0, 204
    addi $7, $0, 15
    ori  $9, $0, 0x706535
    jal painter

    # 74:31 - 88:46
    addi $4, $0, 31
    addi $5, $0, 74
    addi $6, $0, 15
    addi $7, $0, 15
    ori  $9, $0, 0x8D8044
    jal painter

    # 139:30 - 158:46
    addi $4, $0, 30
    addi $5, $0, 139
    addi $6, $0, 15
    addi $7, $0, 21
    ori  $9, $0, 0x706535
    jal painter

    # 159:36 - 254:46
    addi $4, $0, 36
    addi $5, $0, 154
    addi $6, $0, 97
    addi $7, $0, 15
    ori  $9, $0, 0x706535
    jal painter

    # 239:20 - 254:35
    addi $4, $0, 22
    addi $5, $0, 236
    addi $6, $0, 15
    addi $7, $0, 15
    ori  $9, $0, 0x8D8044
    jal painter

    # 239:47 - 254:83
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

    # 31:72 - 45:88
    addi $4, $0, 71
    addi $5, $0, 31
    addi $6, $0, 15
    addi $7, $0, 16
    ori  $9, $0, 0x706535
    jal painter

    # 15:89 - 120:103
    addi $4, $0, 86
    addi $5, $0, 16
    addi $6, $0, 98
    addi $7, $0, 15
    ori  $9, $0, 0x706535
    jal painter

    # 15:89 SAFE AREA
    addi $4, $0, 86
    addi $5, $0, 16
    addi $6, $0, 15
    addi $7, $0, 15
    ori  $9, $0, 0x8D8044
    jal painter

    # 76:89 SAFE AREA
    addi $4, $0, 86
    addi $5, $0, 99
    addi $6, $0, 15
    addi $7, $0, 15
    ori  $9, $0, 0x8D8044
    jal painter

    # 84:69 - 99:88
    addi $4, $0, 69
    addi $5, $0, 84
    addi $6, $0, 15
    addi $7, $0, 19
    ori  $9, $0, 0x706535
    jal painter

    # 100:69 - 233:84
    addi $4, $0, 69
    addi $5, $0, 99
    addi $6, $0, 133
    addi $7, $0, 15
    ori  $9, $0, 0x706535
    jal painter

    # 126:84 - 141:103
    addi $4, $0, 83
    addi $5, $0, 126
    addi $6, $0, 15
    addi $7, $0, 19
    ori  $9, $0, 0x706535
    jal painter

    # 210:84 - 224:88
    addi $4, $0, 83
    addi $5, $0, 210
    addi $6, $0, 15
    addi $7, $0, 5
    ori  $9, $0, 0x706535
    jal painter

    # 142:89 - 250:103
    addi $4, $0, 87
    addi $5, $0, 141
    addi $6, $0, 115
    addi $7, $0, 15
    ori  $9, $0, 0x706535
    jal painter

    # 145:104 - 160:119
    addi $4, $0, 101
    addi $5, $0, 146
    addi $6, $0, 15
    addi $7, $0, 15
    ori  $9, $0, 0x8D8044
    jal painter

    # 193:104 - 210:122
    addi $4, $0, 101
    addi $5, $0, 193
    addi $6, $0, 15
    addi $7, $0, 20
    ori  $9, $0, 0x706535
    jal painter

    # 211:109 - 228:122
    addi $4, $0, 106
    addi $5, $0, 208
    addi $6, $0, 15
    addi $7, $0, 15
    ori  $9, $0, 0x8D8044
    jal painter

	# Walls
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
    
    # Parede da vitória ( cima )
    
    addi $4, $0, 59
    addi $5, $0, 251
    addi $6, $0, 5
    addi $7, $0, 15
    ori $9, $0, 0x786e39
    jal painter
    
    # Parede da vitória ( baixo )
    
    addi $4, $0, 87
    addi $5, $0, 251
    addi $6, $0, 5
    addi $7, $0, 15
    ori $9, $0, 0x786e39
    jal painter
    
    # Barreira de água
    
    addi $4, $0, 36
    addi $5, $0, 230
    addi $6, $0, 3
    addi $7, $0, 15
    ori  $9, $0, 0x0195FF
    jal painter
    
    # Barreira de fogo
    
    addi $4, $0, 87
    addi $5, $0, 230
    addi $6, $0, 3
    addi $7, $0, 15
    ori  $9, $0, 0xFA0100
    jal painter
    
    addi $10, $0, 120 # Contador bola de fogo
    addi $11, $0, 60 # Contador bola de água
    addi $12, $0, -1 # Inversor bola de fogo
    addi $13, $0, -1 # Inversor bola de água
    
movimento_bot:
	
	# Reset bola de fogo
	# First layer
	
    addi $4, $22, 17
    add $5, $23, 460
    addi $6, $0, 8
    addi $7, $0, 12
    ori  $9, $0, 0x706535
    jal painter

    addi $4, $22, 18
    addi $5, $23, 459
    addi $6, $0, 1
    addi $7, $0, 10
    ori  $9, $0, 0x706535
    jal painter

    addi $4, $22, 19
    addi $5, $23, 458
    addi $6, $0, 1
    addi $7, $0, 8
    ori  $9, $0, 0x706535
    jal painter

    addi $4, $22, 18
    addi $5, $23, 468
    addi $6, $0, 2
    addi $7, $0, 10
    ori  $9, $0, 0x706535
    jal painter

    addi $4, $22, 19
    addi $5, $23, 470
    addi $6, $0, 2
    addi $7, $0, 8
    ori  $9, $0, 0x706535
    jal painter

    addi $4, $22, 20
    addi $5, $23, 472
    addi $6, $0, 2
    addi $7, $0, 6
    ori  $9, $0, 0x706535
    jal painter

    addi $4, $22, 21
    addi $5, $23, 474
    addi $6, $0, 2
    addi $7, $0, 4
    ori  $9, $0, 0x706535
    jal painter

    addi $4, $22, 22
    addi $5, $23, 476
    addi $6, $0, 2
    addi $7, $0, 2
    ori  $9, $0, 0x706535
    jal painter

    addi $4, $22, 23
    addi $5, $23, 478
    addi $6, $0, 1
    addi $7, $0, 1
    ori  $9, $0, 0x706535
    jal painter

    # Second layer
    addi $4, $22, 18
    addi $5, $23, 460
    addi $6, $0, 8
    addi $7, $0, 10
    ori  $9, $0, 0x706535
    jal painter

    addi $4, $22, 19
    addi $5, $23, 459
    addi $6, $0, 1
    addi $7, $0, 8
    ori  $9, $0, 0x706535
    jal painter

    addi $4, $22, 19
    addi $5, $23, 468
    addi $6, $0, 2
    addi $7, $0, 8
    ori  $9, $0, 0x706535
    jal painter

    addi $4, $22, 20
    addi $5, $23, 470
    addi $6, $0, 2
    addi $7, $0, 6
    ori  $9, $0, 0x706535
    jal painter

    addi $4, $22, 21
    addi $5, $23, 472
    addi $6, $0, 2
    addi $7, $0, 4
    ori  $9, $0, 0x706535
    jal painter

    addi $4, $22, 22
    addi $5, $23, 475
    addi $6, $0, 1
    addi $7, $0, 2
    ori  $9, $0, 0x706535
    jal painter

    # Third layer
    addi $4, $22, 19
    addi $5, $23, 460
    addi $6, $0, 8
    addi $7, $0, 8
    ori  $9, $0, 0x706535
    jal painter

    addi $4, $22, 20
    addi $5, $23, 459
    addi $6, $0, 1
    addi $7, $0, 6
    ori  $9, $0, 0x706535
    jal painter

    addi $4, $22, 20
    addi $5, $23, 468
    addi $6, $0, 2
    addi $7, $0, 6
    ori  $9, $0, 0x706535
    jal painter

    addi $4, $22, 21
    addi $5, $23, 470
    addi $6, $0, 2
    addi $7, $0, 4
    ori  $9, $0, 0x706535
    jal painter

    addi $4, $22, 22
    addi $5, $23, 472
    addi $6, $0, 3
    addi $7, $0, 2
    ori  $9, $0, 0x706535
    jal painter

    # Fourth layer
    addi $4, $22, 20
    addi $5, $23, 462
    addi $6, $0, 6
    addi $7, $0, 6
    ori  $9, $0, 0x706535
    jal painter

    addi $4, $22, 21
    addi $5, $23, 461
    addi $6, $0, 1
    addi $7, $0, 4
    ori  $9, $0, 0x706535
    jal painter

    addi $4, $22, 21
    addi $5, $23, 468
    addi $6, $0, 2
    addi $7, $0, 4
    ori  $9, $0, 0x706535
    jal painter

    addi $4, $22, 22
    addi $5, $23, 470
    addi $6, $0, 2
    addi $7, $0, 2
    ori  $9, $0, 0x706535
    jal painter
	
	# Bola de fogo
	
	add $23, $23, $12
	
	# First layer
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

    # Third layer
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

    # Fourth layer
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
    
    # Reset bola de agua
    # First layer
    addi $4, $24, 71
    add $5, $25, 210
    addi $6, $0, 8
    addi $7, $0, 12
    ori  $9, $0, 0x706535
    jal painter

    addi $4, $24, 72
    addi $5, $25, 209
    addi $6, $0, 1
    addi $7, $0, 10
    ori  $9, $0, 0x706535
    jal painter

    addi $4, $24, 73
    addi $5, $25, 208
    addi $6, $0, 1
    addi $7, $0, 8
    ori  $9, $0, 0x706535
    jal painter

    addi $4, $24, 72
    addi $5, $25, 218
    addi $6, $0, 2
    addi $7, $0, 10
    ori  $9, $0, 0x706535
    jal painter

    addi $4, $24, 73
    addi $5, $25, 220
    addi $6, $0, 2
    addi $7, $0, 8
    ori  $9, $0, 0x706535
    jal painter

    addi $4, $24, 74
    addi $5, $25, 222
    addi $6, $0, 2
    addi $7, $0, 6
    ori  $9, $0, 0x706535
    jal painter

    addi $4, $24, 75
    addi $5, $25, 224
    addi $6, $0, 2
    addi $7, $0, 4
    ori  $9, $0, 0x706535
    jal painter

    addi $4, $24, 76
    addi $5, $25, 226
    addi $6, $0, 2
    addi $7, $0, 2
    ori  $9, $0, 0x706535
    jal painter

    addi $4, $24, 77
    addi $5, $25, 228
    addi $6, $0, 1
    addi $7, $0, 1
    ori  $9, $0, 0x706535
    jal painter

    # Second layer
    addi $4, $24, 73
    addi $5, $25, 208
    addi $6, $0, 1
    addi $7, $0, 8
    ori  $9, $0, 0x706535
    jal painter

    addi $4, $24, 78
    addi $5, $25, 209
    addi $6, $0, 1
    addi $7, $0, 2
    ori  $9, $0, 0x706535
    jal painter

    addi $4, $24, 79
    addi $5, $25, 209
    addi $6, $0, 2
    addi $7, $0, 3
    ori  $9, $0, 0x706535
    jal painter

    addi $4, $24, 79
    addi $5, $25, 210
    addi $6, $0, 2
    addi $7, $0, 4
    ori  $9, $0, 0x706535
    jal painter

    addi $4, $24, 81
    addi $5, $25, 210
    addi $6, $0, 8
    addi $7, $0, 2
    ori  $9, $0, 0x706535
    jal painter

    addi $4, $24, 80
    addi $5, $25, 218
    addi $6, $0, 2
    addi $7, $0, 2
    ori  $9, $0, 0x706535
    jal painter

    addi $4, $24, 79
    addi $5, $25, 220
    addi $6, $0, 2
    addi $7, $0, 2
    ori  $9, $0, 0x706535
    jal painter

    addi $4, $24, 78
    addi $5, $25, 222
    addi $6, $0, 2
    addi $7, $0, 2
    ori  $9, $0, 0x706535
    jal painter

    addi $4, $24, 77
    addi $5, $25, 224
    addi $6, $0, 2
    addi $7, $0, 2
    ori  $9, $0, 0x706535
    jal painter

    addi $4, $24, 76
    addi $5, $25, 226
    addi $6, $0, 2
    addi $7, $0, 2
    ori  $9, $0, 0x706535
    jal painter

    # Third layer
    addi $4, $24, 72
    addi $5, $25, 213
    addi $6, $0, 4
    addi $7, $0, 4
    ori  $9, $0, 0x706535
    jal painter

    addi $4, $24, 73
    addi $5, $25, 212
    addi $6, $0, 2
    addi $7, $0, 3
    ori  $9, $0, 0x706535
    jal painter

    addi $4, $24, 72
    addi $5, $25, 216
    addi $6, $0, 2
    addi $7, $0, 3
    ori  $9, $0, 0x706535
    jal painter

    addi $4, $24, 73
    addi $5, $25, 218
    addi $6, $0, 2
    addi $7, $0, 2
    ori  $9, $0, 0x706535
    jal painter

    addi $4, $24, 74
    addi $5, $25, 220
    addi $6, $0, 2
    addi $7, $0, 2
    ori  $9, $0, 0x706535
    jal painter

    addi $4, $24, 75
    addi $5, $25, 222
    addi $6, $0, 2
    addi $7, $0, 2
    ori  $9, $0, 0x706535
    jal painter
    
    # Bola de agua
    
    add $25, $25, $13
    
    # First layer
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

    # Second layer
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

    # Third layer
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
    
    addi $10, $10, -1 # Diminuindo 1 do contador bola de fogo
    addi $11, $10, -1 # Diminuindo 1 do contador bola de água
    
  