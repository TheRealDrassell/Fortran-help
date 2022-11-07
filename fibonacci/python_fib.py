def main() :
    import numpy as np
    n = int(input("fibonacci number sequence : "))
    x = np.zeros(n, dtype=np.float64)
    x[0] = 0
    x[1] = 1
    for i in range(n) :
        try:
            x[i + 2] = x[i] + x[i+1]
            print("{:39.0f}, {}".format(x[i], i+1))
        except:
            print("{:39.0f}, {}".format(x[i], i+1))
if __name__ == "__main__" :
    main()
