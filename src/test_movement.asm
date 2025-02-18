.data
fireboy_end_1: .word 129104, 129108, 129112, 129116,
                  130128, 130132, 130136, 130140,
                  131152, 131156, 131160, 131164,
                  132176, 132180, 132184, 132188,
                  133200, 133204, 133208, 133212,
                  131148, 131152, 132168, 132172,
                  131164, 131168, 132192, 132196,
                  133200, 133204, 134224, 134228,
                  135244, 135248, 134236, 134240,
                  135264, 135268, 129108, 129112,
                  130132, 130136, 125008, 125012,
                  125016, 125020, 126032, 126036,
                  126040, 126044, 127056, 127060,
                  127064, 127068, 128080, 128084,
                  128088, 128092

.text
.globl main

main:
    la $t0, fireboy_end_1     # Carrega o endereço do array
    li $t1, 0x200000      # Endereço base para armazenar
    li $t2, 0             # Índice
    li $t3, 56            # Número total de valores

loop:
    lw $t4, 0($t0)        # Carrega valor do array
    sw $t4, 0($t1)        # Armazena no endereço destino
    addi $t0, $t0, 4      # Avança para o próximo endereço do array
    addi $t1, $t1, 4      # Avança no espaço de armazenamento
    addi $t2, $t2, 1      # Incrementa contador
    blt $t2, $t3, loop    # Continua até armazenar todos os valores

    # Lendo os valores armazenados em 0x200000 e pintando de branco
    li $t1, 0x200000      # Endereço base de leitura
    li $t2, 0             # Índice
    li $t3, 56            # Número total de valores
    li $t5, 0xFFFFFF      # Cor branca

read_loop:
    lw $t4, 0($t1)        # Lê endereço armazenado
    sw $t5, 0($t4)        # Pinta de branco
    addi $t1, $t1, 4      # Avança para o próximo endereço armazenado
    addi $t2, $t2, 1      # Incrementa contador
    blt $t2, $t3, read_loop  # Continua até o fim

    li $v0, 10           # Finaliza o programa
    syscall