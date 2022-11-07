integer(kind=int64) recursive function factorial(a) result(ans)         ! use the recursion key word for... recursions
        use iso_fortran_env, only:int64
        implicit none
        integer(kind=int64) :: a

        if (a <= 0) then
                ans = 1
        else 
                ans = factorial(a - 1) * a                              ! call the function inside the function
        end if

end function factorial

program recusions
        use iso_fortran_env, only:int64         ! use extra precision on integer
        implicit none

        integer(kind=int64) :: a, ans
        integer(kind=int64), external :: factorial                      ! declaire external function
        
        print*, "value for factorial (above 25 causes integer overflow)"
        read*, a
        ans = factorial(a)
        print*, "answer", ans
end program recusions
