import numpy as np
import os, sys

def main() :
    try :
        show = sys.argv[1]
    except :
        show = False
    sort = True
    comp, switch , tswitch= 0, 0, 0

    # initialise values
    amount = int(input("size of array (18 max for formating): "))
    _min = int(input("min value : "))
    _max = int(input("max value : "))
    #create the random list
    _list = np.random.rand(amount)
    # turn into int
    _list = _min + np.floor((_max + 1 - _min)*_list)
    print(_list)

    while sort :
        tswitch = 0
        for i in range(amount - 1) :
            comp +=1
            if _list[ i ] > _list[ i+1 ] :
                switch+=1
                tswitch+=1
                _list[[i, i+1]] = _list[[i+1, i]]
                if show == "-s" :
                    print(_list)
        if tswitch == 0:
            sort = False
            if show != "-s" :
                print(_list)
    print(f" {comp} comparisons and {switch} switchs")

if __name__ == "__main__" :
    main()
