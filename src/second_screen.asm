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
		
	
  	# Primeiro bloco
    addi $4, $0, 12        # Posição Y
    addi $5, $0, 4         # Posição X
    addi $6, $0, 16        # Altura do bloco
	addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    # Segundo bloco
    addi $4, $0, 12        # Posição Y
    addi $5, $0, 24        # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    # Terceiro bloco
    addi $4, $0, 12        # Posição Y
    addi $5, $0, 44        # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    # Quarto bloco
    addi $4, $0, 12        # Posição Y
    addi $5, $0, 64        # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    # Quinto bloco
    addi $4, $0, 12        # Posição Y
    addi $5, $0, 84        # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    # Sexto bloco
    addi $4, $0, 12        # Posição Y
    addi $5, $0, 104       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    # Sétimo bloco
    addi $4, $0, 12        # Posição Y
    addi $5, $0, 124       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    # Oitavo bloco
    addi $4, $0, 12        # Posição Y
    addi $5, $0, 144       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    # Nono bloco
    addi $4, $0, 12        # Posição Y
    addi $5, $0, 164       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    # Décimo bloco
    addi $4, $0, 12        # Posição Y
    addi $5, $0, 184       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    # Décimo primeiro bloco
    addi $4, $0, 12        # Posição Y
    addi $5, $0, 204       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    # Décimo segundo bloco
    addi $4, $0, 12        # Posição Y
    addi $5, $0, 224       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter
    
     # Primeiro bloco
    addi $4, $0, 20        # Posição Y
    addi $5, $0, 4         # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 20        # Posição Y
    addi $5, $0, 224       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter
    
    addi $4, $0, 20        # Posição Y
    addi $5, $0, 4         # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter
    
    addi $4, $0, 28        # Posição Y
    addi $5, $0, 4       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

 addi $4, $0, 28        # Posição Y
    addi $5, $0, 4       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter
    
     addi $4, $0, 28        # Posição Y
    addi $5, $0, 24       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter
    
     addi $4, $0, 28        # Posição Y
    addi $5, $0, 44       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter
    
	addi $4, $0, 28        # Posição Y
    addi $5, $0, 64       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter,
    
    addi $4, $0, 28        # Posição Y
    addi $5, $0, 84       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter
    
     addi $4, $0, 28        # Posição Y
    addi $5, $0, 104       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter
    
     addi $4, $0, 28        # Posição Y
    addi $5, $0, 124       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter
    
      addi $4, $0, 28        # Posição Y
    addi $5, $0, 144       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter
    
         addi $4, $0, 28        # Posição Y
    addi $5, $0, 164       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter
    
          addi $4, $0, 28        # Posição Y
    addi $5, $0, 184       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter
    
       addi $4, $0, 28        # Posição Y
    addi $5, $0, 204       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter
    
         addi $4, $0, 28        # Posição Y
    addi $5, $0, 224       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter
    
      addi $4, $0, 36        # Posição Y
    addi $5, $0, 4       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter
    
     addi $4, $0, 36        # Posição Y
    addi $5, $0, 24       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter
    
    addi $4, $0, 36        # Posição Y
    addi $5, $0, 44       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter
    
       addi $4, $0, 36        # Posição Y
    addi $5, $0, 64       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter
    
     addi $4, $0, 36        # Posição Y
    addi $5, $0, 84       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter
    
    addi $4, $0, 36        # Posição Y
    addi $5, $0, 104       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter
    
     addi $4, $0, 36        # Posição Y
    addi $5, $0, 124       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter
    
     addi $4, $0, 36        # Posição Y
    addi $5, $0, 144       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter
    
      addi $4, $0, 36        # Posição Y
    addi $5, $0, 164       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

  addi $4, $0, 36        # Posição Y
    addi $5, $0, 184       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

  addi $4, $0, 36        # Posição Y
    addi $5, $0, 204       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter
    
      addi $4, $0, 36        # Posição Y
    addi $5, $0, 224       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter
    
        addi $4, $0, 44        # Posição Y
    addi $5, $0, 4         # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 44        # Posição Y
    addi $5, $0, 24        # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 44        # Posição Y
    addi $5, $0, 44        # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 44        # Posição Y
    addi $5, $0, 64        # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 44        # Posição Y
    addi $5, $0, 84        # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 44        # Posição Y
    addi $5, $0, 104       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 44        # Posição Y
    addi $5, $0, 124       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 44        # Posição Y
    addi $5, $0, 144       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 44        # Posição Y
    addi $5, $0, 164       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 44        # Posição Y
    addi $5, $0, 184       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 44        # Posição Y
    addi $5, $0, 204       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 44        # Posição Y
    addi $5, $0, 224       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter
    
        addi $4, $0, 52        # Posição Y
    addi $5, $0, 4         # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 52        # Posição Y
    addi $5, $0, 24        # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 52        # Posição Y
    addi $5, $0, 44        # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 52        # Posição Y
    addi $5, $0, 64        # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 52        # Posição Y
    addi $5, $0, 84        # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 52        # Posição Y
    addi $5, $0, 104       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 52        # Posição Y
    addi $5, $0, 124       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 52        # Posição Y
    addi $5, $0, 144       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 52        # Posição Y
    addi $5, $0, 164       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 52        # Posição Y
    addi $5, $0, 184       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 52        # Posição Y
    addi $5, $0, 204       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 52        # Posição Y
    addi $5, $0, 224       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter
    
        addi $4, $0, 60        # Posição Y
    addi $5, $0, 4         # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 60        # Posição Y
    addi $5, $0, 24        # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 60        # Posição Y
    addi $5, $0, 44        # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 60        # Posição Y
    addi $5, $0, 64        # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 60        # Posição Y
    addi $5, $0, 84        # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 60        # Posição Y
    addi $5, $0, 104       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 60        # Posição Y
    addi $5, $0, 124       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 60        # Posição Y
    addi $5, $0, 144       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 60        # Posição Y
    addi $5, $0, 164       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 60        # Posição Y
    addi $5, $0, 184       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 60        # Posição Y
    addi $5, $0, 204       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 60        # Posição Y
    addi $5, $0, 224       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter
    
        addi $4, $0, 60        # Posição Y
    addi $5, $0, 4         # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 60        # Posição Y
    addi $5, $0, 24        # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 60        # Posição Y
    addi $5, $0, 44        # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 60        # Posição Y
    addi $5, $0, 64        # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 60        # Posição Y
    addi $5, $0, 84        # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 60        # Posição Y
    addi $5, $0, 104       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 60        # Posição Y
    addi $5, $0, 124       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 60        # Posição Y
    addi $5, $0, 144       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 60        # Posição Y
    addi $5, $0, 164       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 60        # Posição Y
    addi $5, $0, 184       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 60        # Posição Y
    addi $5, $0, 204       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 60        # Posição Y
    addi $5, $0, 224       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter
    
        addi $4, $0, 68        # Posição Y
    addi $5, $0, 4         # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 68        # Posição Y
    addi $5, $0, 24        # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 68        # Posição Y
    addi $5, $0, 44        # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 68        # Posição Y
    addi $5, $0, 64        # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 68        # Posição Y
    addi $5, $0, 84        # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 68        # Posição Y
    addi $5, $0, 104       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 68        # Posição Y
    addi $5, $0, 124       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 68        # Posição Y
    addi $5, $0, 144       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 68        # Posição Y
    addi $5, $0, 164       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 68        # Posição Y
    addi $5, $0, 184       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 68        # Posição Y
    addi $5, $0, 204       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 68        # Posição Y
    addi $5, $0, 224       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter
    
        addi $4, $0, 68        # Posição Y
    addi $5, $0, 4         # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 68        # Posição Y
    addi $5, $0, 24        # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 68        # Posição Y
    addi $5, $0, 44        # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 68        # Posição Y
    addi $5, $0, 64        # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 68        # Posição Y
    addi $5, $0, 84        # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 68        # Posição Y
    addi $5, $0, 104       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 68        # Posição Y
    addi $5, $0, 124       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 68        # Posição Y
    addi $5, $0, 144       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 68        # Posição Y
    addi $5, $0, 164       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 68        # Posição Y
    addi $5, $0, 184       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 68        # Posição Y
    addi $5, $0, 204       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 68        # Posição Y
    addi $5, $0, 224       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter
    
        addi $4, $0, 76        # Posição Y
    addi $5, $0, 4         # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 76        # Posição Y
    addi $5, $0, 24        # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 76        # Posição Y
    addi $5, $0, 44        # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 76        # Posição Y
    addi $5, $0, 64        # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 76        # Posição Y
    addi $5, $0, 84        # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 76        # Posição Y
    addi $5, $0, 104       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 76        # Posição Y
    addi $5, $0, 124       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 76        # Posição Y
    addi $5, $0, 144       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 76        # Posição Y
    addi $5, $0, 164       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 76        # Posição Y
    addi $5, $0, 184       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 76        # Posição Y
    addi $5, $0, 204       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 76        # Posição Y
    addi $5, $0, 224       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter
    
        addi $4, $0, 76        # Posição Y
    addi $5, $0, 4         # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 76        # Posição Y
    addi $5, $0, 24        # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 76        # Posição Y
    addi $5, $0, 44        # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 76        # Posição Y
    addi $5, $0, 64        # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 76        # Posição Y
    addi $5, $0, 84        # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 76        # Posição Y
    addi $5, $0, 104       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 76        # Posição Y
    addi $5, $0, 124       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 76        # Posição Y
    addi $5, $0, 144       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 76        # Posição Y
    addi $5, $0, 164       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 76        # Posição Y
    addi $5, $0, 184       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 76        # Posição Y
    addi $5, $0, 204       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 76        # Posição Y
    addi $5, $0, 224       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter
    
        addi $4, $0, 84        # Posição Y
    addi $5, $0, 4         # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 84        # Posição Y
    addi $5, $0, 24        # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 84        # Posição Y
    addi $5, $0, 44        # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 84        # Posição Y
    addi $5, $0, 64        # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 84        # Posição Y
    addi $5, $0, 84        # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 84        # Posição Y
    addi $5, $0, 104       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 84        # Posição Y
    addi $5, $0, 124       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 84        # Posição Y
    addi $5, $0, 144       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 84        # Posição Y
    addi $5, $0, 164       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 84        # Posição Y
    addi $5, $0, 184       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 84        # Posição Y
    addi $5, $0, 204       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 84        # Posição Y
    addi $5, $0, 224       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter
    
        addi $4, $0, 84        # Posição Y
    addi $5, $0, 4         # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 84        # Posição Y
    addi $5, $0, 24        # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 84        # Posição Y
    addi $5, $0, 44        # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 84        # Posição Y
    addi $5, $0, 64        # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 84        # Posição Y
    addi $5, $0, 84        # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 84        # Posição Y
    addi $5, $0, 104       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 84        # Posição Y
    addi $5, $0, 124       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 84        # Posição Y
    addi $5, $0, 144       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 84        # Posição Y
    addi $5, $0, 164       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 84        # Posição Y
    addi $5, $0, 184       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 84        # Posição Y
    addi $5, $0, 204       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 84        # Posição Y
    addi $5, $0, 224       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter
    
        addi $4, $0, 92        # Posição Y
    addi $5, $0, 4         # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 92        # Posição Y
    addi $5, $0, 24        # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 92        # Posição Y
    addi $5, $0, 44        # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 92        # Posição Y
    addi $5, $0, 64        # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 92        # Posição Y
    addi $5, $0, 84        # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 92        # Posição Y
    addi $5, $0, 104       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 92        # Posição Y
    addi $5, $0, 124       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 92        # Posição Y
    addi $5, $0, 144       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 92        # Posição Y
    addi $5, $0, 164       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 92        # Posição Y
    addi $5, $0, 184       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 92        # Posição Y
    addi $5, $0, 204       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 92        # Posição Y
    addi $5, $0, 224       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter
    
        addi $4, $0, 92        # Posição Y
    addi $5, $0, 4         # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 92        # Posição Y
    addi $5, $0, 24        # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 92        # Posição Y
    addi $5, $0, 44        # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 92        # Posição Y
    addi $5, $0, 64        # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 92        # Posição Y
    addi $5, $0, 84        # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 92        # Posição Y
    addi $5, $0, 104       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 92        # Posição Y
    addi $5, $0, 124       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 92        # Posição Y
    addi $5, $0, 144       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 92        # Posição Y
    addi $5, $0, 164       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 92        # Posição Y
    addi $5, $0, 184       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 92        # Posição Y
    addi $5, $0, 204       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 92        # Posição Y
    addi $5, $0, 224       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter
    
        addi $4, $0, 100        # Posição Y
    addi $5, $0, 4         # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 100        # Posição Y
    addi $5, $0, 24        # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 100        # Posição Y
    addi $5, $0, 44        # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 100        # Posição Y
    addi $5, $0, 64        # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 100        # Posição Y
    addi $5, $0, 84        # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 100        # Posição Y
    addi $5, $0, 104       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 100        # Posição Y
    addi $5, $0, 124       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 100        # Posição Y
    addi $5, $0, 144       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 100        # Posição Y
    addi $5, $0, 164       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 100        # Posição Y
    addi $5, $0, 184       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 100        # Posição Y
    addi $5, $0, 204       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 100        # Posição Y
    addi $5, $0, 224       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter
    
        addi $4, $0, 100        # Posição Y
    addi $5, $0, 4         # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 100        # Posição Y
    addi $5, $0, 24        # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 100        # Posição Y
    addi $5, $0, 44        # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 100        # Posição Y
    addi $5, $0, 64        # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 100        # Posição Y
    addi $5, $0, 84        # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 100        # Posição Y
    addi $5, $0, 104       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 100        # Posição Y
    addi $5, $0, 124       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 100        # Posição Y
    addi $5, $0, 144       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 100        # Posição Y
    addi $5, $0, 164       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 100        # Posição Y
    addi $5, $0, 184       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 100        # Posição Y
    addi $5, $0, 204       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 100        # Posição Y
    addi $5, $0, 224       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter
    
        addi $4, $0, 108        # Posição Y
    addi $5, $0, 4         # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 108        # Posição Y
    addi $5, $0, 24        # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 108        # Posição Y
    addi $5, $0, 44        # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 108        # Posição Y
    addi $5, $0, 64        # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 108        # Posição Y
    addi $5, $0, 84        # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 108        # Posição Y
    addi $5, $0, 104       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 108        # Posição Y
    addi $5, $0, 124       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 108        # Posição Y
    addi $5, $0, 144       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 108        # Posição Y
    addi $5, $0, 164       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 108        # Posição Y
    addi $5, $0, 184       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 108        # Posição Y
    addi $5, $0, 204       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 108        # Posição Y
    addi $5, $0, 224       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter
    
        addi $4, $0, 108        # Posição Y
    addi $5, $0, 4         # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 108        # Posição Y
    addi $5, $0, 24        # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 108        # Posição Y
    addi $5, $0, 44        # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 108        # Posição Y
    addi $5, $0, 64        # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 108        # Posição Y
    addi $5, $0, 84        # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 108        # Posição Y
    addi $5, $0, 104       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 108        # Posição Y
    addi $5, $0, 124       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 108        # Posição Y
    addi $5, $0, 144       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 108        # Posição Y
    addi $5, $0, 164       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 108        # Posição Y
    addi $5, $0, 184       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 108        # Posição Y
    addi $5, $0, 204       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 108        # Posição Y
    addi $5, $0, 224       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter
    
        addi $4, $0, 116       # Posição Y
    addi $5, $0, 4         # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 116       # Posição Y
    addi $5, $0, 24        # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 116       # Posição Y
    addi $5, $0, 44        # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 116       # Posição Y
    addi $5, $0, 64        # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 116       # Posição Y
    addi $5, $0, 84        # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 116       # Posição Y
    addi $5, $0, 104       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 116       # Posição Y
    addi $5, $0, 124       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 116       # Posição Y
    addi $5, $0, 144       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 116       # Posição Y
    addi $5, $0, 164       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 116       # Posição Y
    addi $5, $0, 184       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 116       # Posição Y
    addi $5, $0, 204       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 116       # Posição Y
    addi $5, $0, 224       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter
    
        addi $4, $0, 116       # Posição Y
    addi $5, $0, 4         # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 116       # Posição Y
    addi $5, $0, 24        # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 116       # Posição Y
    addi $5, $0, 44        # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 116       # Posição Y
    addi $5, $0, 64        # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 116       # Posição Y
    addi $5, $0, 84        # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 116       # Posição Y
    addi $5, $0, 104       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 116       # Posição Y
    addi $5, $0, 124       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 116       # Posição Y
    addi $5, $0, 144       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 116       # Posição Y
    addi $5, $0, 164       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 116       # Posição Y
    addi $5, $0, 184       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 116       # Posição Y
    addi $5, $0, 204       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 116       # Posição Y
    addi $5, $0, 224       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter
    
        addi $4, $0, 124       # Posição Y
    addi $5, $0, 4         # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 124       # Posição Y
    addi $5, $0, 24        # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 124       # Posição Y
    addi $5, $0, 44        # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 124       # Posição Y
    addi $5, $0, 64        # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 124       # Posição Y
    addi $5, $0, 84        # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 124       # Posição Y
    addi $5, $0, 104       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 124       # Posição Y
    addi $5, $0, 124       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 124       # Posição Y
    addi $5, $0, 144       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 124       # Posição Y
    addi $5, $0, 164       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 124       # Posição Y
    addi $5, $0, 184       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 124       # Posição Y
    addi $5, $0, 204       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 124       # Posição Y
    addi $5, $0, 224       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter
    
        addi $4, $0, 124       # Posição Y
    addi $5, $0, 4         # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 124       # Posição Y
    addi $5, $0, 24        # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 124       # Posição Y
    addi $5, $0, 44        # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 124       # Posição Y
    addi $5, $0, 64        # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 124       # Posição Y
    addi $5, $0, 84        # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 124       # Posição Y
    addi $5, $0, 104       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 124       # Posição Y
    addi $5, $0, 124       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 124       # Posição Y
    addi $5, $0, 144       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 124       # Posição Y
    addi $5, $0, 164       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 124       # Posição Y
    addi $5, $0, 184       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 124       # Posição Y
    addi $5, $0, 204       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter

    addi $4, $0, 124       # Posição Y
    addi $5, $0, 224       # Posição X
    addi $6, $0, 16        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter
    
    addi $4, $0, 4       # Posição Y
    addi $5, $0, 244       # Posição X
    addi $6, $0, 8        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter
    
       addi $4, $0, 12       # Posição Y
    addi $5, $0, 244       # Posição X
    addi $6, $0, 8        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter
    
     addi $4, $0, 20       # Posição Y
    addi $5, $0, 244       # Posição X
    addi $6, $0, 8        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter
    
     addi $4, $0, 28       # Posição Y
    addi $5, $0, 244       # Posição X
    addi $6, $0, 8        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter
    
     addi $4, $0, 32       # Posição Y
    addi $5, $0, 244       # Posição X
    addi $6, $0, 8        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter
		
		
 addi $4, $0, 40       # Posição Y
    addi $5, $0, 244       # Posição X
    addi $6, $0, 8        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter
    
     addi $4, $0, 48       # Posição Y
    addi $5, $0, 244       # Posição X
    addi $6, $0, 8        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter
    
     addi $4, $0, 56       # Posição Y
    addi $5, $0, 244       # Posição X
    addi $6, $0, 8        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter
    
     addi $4, $0, 64       # Posição Y
    addi $5, $0, 244       # Posição X
    addi $6, $0, 8        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter
    
     addi $4, $0, 72       # Posição Y
    addi $5, $0, 244       # Posição X
    addi $6, $0, 8        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter
    
      addi $4, $0, 80       # Posição Y
    addi $5, $0, 244       # Posição X
    addi $6, $0, 8        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter
    
      addi $4, $0, 88       # Posição Y
    addi $5, $0, 244       # Posição X
    addi $6, $0, 8        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter
    
      addi $4, $0, 96       # Posição Y
    addi $5, $0, 244       # Posição X
    addi $6, $0, 8        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter
    
      addi $4, $0, 104       # Posição Y
    addi $5, $0, 244       # Posição X
    addi $6, $0, 8        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter
    
      addi $4, $0, 112       # Posição Y
    addi $5, $0, 244       # Posição X
    addi $6, $0, 8        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter
    
    addi $4, $0, 120       # Posição Y
    addi $5, $0, 244       # Posição X
    addi $6, $0, 8        # Altura do bloco
    addi $7, $0, 6         # Largura do bloco
    ori  $9, $0, 0x5a660f  # Cor do bloco
    jal painter
		
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
		
		
		
		
		addi $20, $20, 5
		addi $21, $21, -30
        # first layer
        paint_fireball:
        addi $20, $0, 5
        addi $21, $0, -30

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
        
        
        addi $20, $20, 25
        addi $21, $0, 0
         # first layer
        paint_waterball:
        	
        addi $4, $20, 71
        add $5, $21, 210
        addi $6, $0, 8
        addi $7, $0, 12
        ori  $9, $0, 0x0195FF
        jal painter

        addi $4, $20, 72
        addi $5, $21, 209
        addi $6, $0, 1
        addi $7, $0, 10
        ori  $9, $0, 0x0195FF
        jal painter

        addi $4, $20, 73
        addi $5, $21, 208
        addi $6, $0, 1
        addi $7, $0, 8
        ori  $9, $0, 0x0195FF
        jal painter

        addi $4, $20, 72
        addi $5, $21, 218
        addi $6, $0, 2
        addi $7, $0, 10
        ori  $9, $0, 0x0195FF
        jal painter

        addi $4, $20, 73
        addi $5, $21, 220
        addi $6, $0, 2
        addi $7, $0, 8
        ori  $9, $0, 0x0195FF
        jal painter

        addi $4, $20, 74
        addi $5, $21, 222
        addi $6, $0, 2
        addi $7, $0, 6
        ori  $9, $0, 0x0195FF
        jal painter

        addi $4, $20, 75
        addi $5, $21, 224
        addi $6, $0, 2
        addi $7, $0, 4
        ori  $9, $0, 0x0195FF
        jal painter

        addi $4, $20, 76
        addi $5, $21, 226
        addi $6, $0, 2
        addi $7, $0, 2
        ori  $9, $0, 0x0195FF
        jal painter

        addi $4, $20, 77
        addi $5, $21, 228
        addi $6, $0, 1
        addi $7, $0, 1
        ori  $9, $0, 0x0195FF
        jal painter

       # second layer
       
       
	addi $4, $20, 73
        addi $5, $21, 208
        addi $6, $0,1
        addi $7, $0, 8
        ori  $9, $0, 0x0285E5
        jal painter	
        
        addi $4, $20, 78
        addi $5, $21, 209
        addi $6, $0, 1
        addi $7, $0, 2
        ori  $9, $0, 0x0285E5
        jal painter
        
        addi $4, $20, 79
        addi $5, $21, 209
        addi $6, $0, 2
        addi $7, $0, 3
        ori  $9, $0, 0x0285E5
        jal painter
        
         addi $4, $20, 79
        addi $5, $21, 210
        addi $6, $0, 2
        addi $7, $0, 4
        ori  $9, $0, 0x0285E5
        jal painter
        
        addi $4, $20, 81
        addi $5, $21, 210
        addi $6, $0, 8
        addi $7, $0, 2
        ori  $9, $0, 0x0285E5
        jal painter
        
        addi $4, $20, 80
        addi $5, $21, 218
        addi $6, $0, 2
        addi $7, $0, 2
        ori  $9, $0, 0x0285E5
        jal painter
        
         addi $4, $20, 79
        addi $5, $21, 220
        addi $6, $0, 2
        addi $7, $0, 2
        ori  $9, $0, 0x0285E5
        jal painter
        
         addi $4, $20, 78
        addi $5, $21, 222
        addi $6, $0, 2
        addi $7, $0, 2
        ori  $9, $0, 0x0285E5
        jal painter
        
           addi $4, $20, 77
        addi $5, $21, 224
        addi $6, $0, 2
        addi $7, $0, 2
        ori  $9, $0, 0x0285E5
        jal painter
        
            addi $4, $20, 76
        addi $5, $21, 226
        addi $6, $0, 2
        addi $7, $0, 2
        ori  $9, $0, 0x0285E5
        jal painter
        
        # three layer
        
         addi $4, $20, 72
        addi $5, $21, 213
        addi $6, $0, 4
        addi $7, $0, 4
        ori  $9, $0, 0xBCE2FC
        jal painter
        
          addi $4, $20, 73
        addi $5, $21, 212
        addi $6, $0, 2
        addi $7, $0, 3
        ori  $9, $0, 0xBCE2FC
        jal painter
        
   	
          addi $4, $20, 72
        addi $5, $21, 216
        addi $6, $0, 2
        addi $7, $0, 3
        ori  $9, $0, 0xBCE2FC
        jal painter
        
        addi $4, $20, 73
        addi $5, $21, 218
        addi $6, $0, 2
        addi $7, $0, 2
        ori  $9, $0, 0xBCE2FC
        jal painter
        
         addi $4, $20, 74
        addi $5, $21, 220
        addi $6, $0, 2
        addi $7, $0, 2
        ori  $9, $0, 0xBCE2FC
        jal painter
        
          addi $4, $20, 75
        addi $5, $21, 222
        addi $6, $0, 2
        addi $7, $0, 2
        ori  $9, $0, 0xBCE2FC
        jal painter
		
		j end
		
# --- END --------------------------------------------------------------------- # 
	
	end: 
	
		addi $2, $0, 10
		syscall

		
