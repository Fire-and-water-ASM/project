import time

def calculate_address(vA, vB):
    """Calcula o endereço a partir das coordenadas X (vA) e Y (vB)."""
    vA = vA * 4
    vB = vB * 1024
    c = vA + vB
    return c

def get_painted_positions(x, y, width, height):
    """Retorna todas as posições dos pixels pintados de um retângulo."""
    painted_positions = []
    
    for i in range(height):  # Para cada linha dentro da altura
        for j in range(width):  # Para cada coluna dentro da largura
            # Calcula a posição de cada pixel
            pixel_position = calculate_address(x + j, y + i)
            painted_positions.append(pixel_position)    
    
    return painted_positions

def main():
    print("Ctrl + C to Stop.\nEnter X, Y, Width, and Height\n")
    array = list()
    try:
        while True:
            x = int(input("Enter X: "))
            y = int(input("Enter Y: "))
            width = int(input("Enter Width: "))
            height = int(input("Enter Height: "))
            positions = get_painted_positions(x, y * 2, width, height)
            array.append(positions)
    except KeyboardInterrupt:
        print('\n\nResults:')
        for positions in array:
            for pos in positions:
                print(pos)
        print('\n\n\n')
        main()

main()
