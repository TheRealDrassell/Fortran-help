program fib
        use iso_fortran_env, only:dp=>real64
        implicit none
        integer :: x1, x2, maxw
        x1 = 0
        x2 = 1
        print*, "max number of fibonacci"
        read*, maxw
        print*, x1
        print*, x2
        call fibonacci(x1, x2, maxw)
        contains
                recursive subroutine fibonacci(x1, x2, maxw)
                        implicit none
                        integer :: x1, x2, x3, maxw
                        x3 = x1 + x2
                        x1 = x2
                        x2 = x3
                        print*, x3
                        if (x3<=maxw) then
                                call fibonacci(x1,x2, maxw)
                        endif
                end  subroutine fibonacci
end program fib
