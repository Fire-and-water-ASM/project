import time

def calculate_address(vA, vB):

    vA = vA * 4
    vB = vB * 1024
    c = vA + vB
    return c

def main():

    print("Ctrl + C to Stop.\nEnter X and Y\n")
    array = list()
    try:
        while True:
            x = int(input())
            y = int(input())
            z = calculate_address(x, y)
            array.append(z)
    except KeyboardInterrupt:
        print('\n\nResults:')
        for i in array:
            print(i)
        time.sleep(180)
        
main()
