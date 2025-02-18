    .data
white:  .word 0xFFFFFF   # Cor branca

    .text
    .globl main

main:
    # Carregar a cor branca para $t1
    lw $t1, white          # Carrega a cor branca (0xFFFFFF)

    # Endereço base da memória de vídeo
    li $t2, 0x10000000     # Endereço base de memória para a tela no MARS (0x10000000)

       # Pintar a posição 129104
   

    # Pintar a posição 130128
    li $t3, 130128
    add $t4, $t2, $t3
    sw $t1, 0($t4)

    # Pintar a posição 130132
    li $t3, 130132
    add $t4, $t2, $t3
    sw $t1, 0($t4)

    # Pintar a posição 130136
    li $t3, 130136
    add $t4, $t2, $t3
    sw $t1, 0($t4)

    # Pintar a posição 130140
    li $t3, 130140
    add $t4, $t2, $t3
    sw $t1, 0($t4)

    # Pintar a posição 131152
    li $t3, 131152
    add $t4, $t2, $t3
    sw $t1, 0($t4)

    # Pintar a posição 131156
    li $t3, 131156
    add $t4, $t2, $t3
    sw $t1, 0($t4)

    # Pintar a posição 131160
    li $t3, 131160
    add $t4, $t2, $t3
    sw $t1, 0($t4)

    # Pintar a posição 131164
    li $t3, 131164
    add $t4, $t2, $t3
    sw $t1, 0($t4)

    # Pintar a posição 132176
    li $t3, 132176
    add $t4, $t2, $t3
    sw $t1, 0($t4)

    # Pintar a posição 132180
    li $t3, 132180
    add $t4, $t2, $t3
    sw $t1, 0($t4)

    # Pintar a posição 132184
    li $t3, 132184
    add $t4, $t2, $t3
    sw $t1, 0($t4)

    # Pintar a posição 132188
    li $t3, 132188
    add $t4, $t2, $t3
    sw $t1, 0($t4)

    # Pintar a posição 133200
    li $t3, 133200
    add $t4, $t2, $t3
    sw $t1, 0($t4)

    # Pintar a posição 133204
    li $t3, 133204
    add $t4, $t2, $t3
    sw $t1, 0($t4)

    # Pintar a posição 133208
    li $t3, 133208
    add $t4, $t2, $t3
    sw $t1, 0($t4)

    # Pintar a posição 133212
    li $t3, 133212
    add $t4, $t2, $t3
    sw $t1, 0($t4)

        # Pintar a posição 131148
    li $t3, 131148
    add $t4, $t2, $t3
    sw $t1, 0($t4)

    # Pintar a posição 131152
    li $t3, 131152
    add $t4, $t2, $t3
    sw $t1, 0($t4)
    

    # Pintar a posição 132168
    li $t3, 132168
    add $t4, $t2, $t3
    sw $t1, 0($t4)

    # Pintar a posição 132172
    li $t3, 132172
    add $t4, $t2, $t3
    sw $t1, 0($t4)


   # Pintar a posição 131164
    li $t3, 131164
    add $t4, $t2, $t3
    sw $t1, 0($t4)

    # Pintar a posição 131168
    li $t3, 131168
    add $t4, $t2, $t3
    sw $t1, 0($t4)


    # Pintar a posição 132192
    li $t3, 132192
    add $t4, $t2, $t3
    sw $t1, 0($t4)

    # Pintar a posição 132196
    li $t3, 132196
    add $t4, $t2, $t3
    sw $t1, 0($t4)

    # Pintar a posição 133200
    li $t3, 133200
    add $t4, $t2, $t3
    sw $t1, 0($t4)

    # Pintar a posição 133204
    li $t3, 133204
    add $t4, $t2, $t3
    sw $t1, 0($t4)

    # Pintar a posição 134224
    li $t3, 134224
    add $t4, $t2, $t3
    sw $t1, 0($t4)

    # Pintar a posição 134228
    li $t3, 134228
    add $t4, $t2, $t3
    sw $t1, 0($t4)

    # Pintar a posição 135244
    li $t3, 135244
    add $t4, $t2, $t3
    sw $t1, 0($t4)

    # Pintar a posição 135248
    li $t3, 135248
    add $t4, $t2, $t3
    sw $t1, 0($t4)


    # Pintar a posição 134236
    li $t3, 134236
    add $t4, $t2, $t3
    sw $t1, 0($t4)

    # Pintar a posição 134240
    li $t3, 134240
    add $t4, $t2, $t3
    sw $t1, 0($t4)


    # Pintar a posição 135264
    li $t3, 135264
    add $t4, $t2, $t3
    sw $t1, 0($t4)

    # Pintar a posição 135268
    li $t3, 135268
    add $t4, $t2, $t3
    sw $t1, 0($t4) 
	
    # Pintar a posição 129108
    li $t3, 129108
    add $t4, $t2, $t3
    sw $t1, 0($t4)

    # Pintar a posição 129112
    li $t3, 129112
    add $t4, $t2, $t3
    sw $t1, 0($t4)

    # Pintar a posição 130132
    li $t3, 130132
    add $t4, $t2, $t3
    sw $t1, 0($t4)

    # Pintar a posição 130136
    li $t3, 130136
    add $t4, $t2, $t3
    sw $t1, 0($t4)






    # Pintar a posição 125008
    li $t3, 125008
    add $t4, $t2, $t3
    sw $t1, 0($t4)

    # Pintar a posição 125012
    li $t3, 125012
    add $t4, $t2, $t3
    sw $t1, 0($t4)

    # Pintar a posição 125016
    li $t3, 125016
    add $t4, $t2, $t3
    sw $t1, 0($t4)

    # Pintar a posição 125020
    li $t3, 125020
    add $t4, $t2, $t3
    sw $t1, 0($t4)

    # Pintar a posição 126032
    li $t3, 126032
    add $t4, $t2, $t3
    sw $t1, 0($t4)

    # Pintar a posição 126036
    li $t3, 126036
    add $t4, $t2, $t3
    sw $t1, 0($t4)

    # Pintar a posição 126040
    li $t3, 126040
    add $t4, $t2, $t3
    sw $t1, 0($t4)

    # Pintar a posição 126044
    li $t3, 126044
    add $t4, $t2, $t3
    sw $t1, 0($t4)

    # Pintar a posição 127056
    li $t3, 127056
    add $t4, $t2, $t3
    sw $t1, 0($t4)

    # Pintar a posição 127060
    li $t3, 127060
    add $t4, $t2, $t3
    sw $t1, 0($t4)

    # Pintar a posição 127064
    li $t3, 127064
    add $t4, $t2, $t3
    sw $t1, 0($t4)

    # Pintar a posição 127068
    li $t3, 127068
    add $t4, $t2, $t3
    sw $t1, 0($t4)

    # Pintar a posição 128080
    li $t3, 128080
    add $t4, $t2, $t3
    sw $t1, 0($t4)

    # Pintar a posição 128084
    li $t3, 128084
    add $t4, $t2, $t3
    sw $t1, 0($t4)

    # Pintar a posição 128088
    li $t3, 128088
    add $t4, $t2, $t3
    sw $t1, 0($t4)

    # Pintar a posição 128092
    li $t3, 128092
    add $t4, $t2, $t3
    sw $t1, 0($t4)




    # Pintar a posição 123992
    li $t3, 123992
    add $t4, $t2, $t3
    sw $t1, 0($t4)

    # Pintar a posição 123996
    li $t3, 123996
    add $t4, $t2, $t3
    sw $t1, 0($t4)





    # Fim do programa
    li $v0, 10             # Código para sair
    syscall
