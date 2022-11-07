integer function i_divide(x,y) result(ans)              ! external functions
        implicit none
        integer, intent(in) :: x,y
        ans = x/y
        return
end function i_divide
real(dp) function r_divide(x,y) result(ans)
        use iso_fortran_env, only:dp=>real64
        implicit none
        real(dp), intent(in) :: x,y
        ans = x/y
        return
end function r_divide
program doublecall
        use iso_fortran_env, only:dp=>real64
        implicit none
        real(dp) :: a,b, rans
        integer  :: c,d, ians
        interface divide                                ! interface, declare the functions
                integer function i_divide(x,y) result(ans)
                        implicit none
                        integer, intent(in) :: x,y
                end function i_divide
                real(dp) function r_divide(x,y) result(ans)
                        use iso_fortran_env, only: dp=>real64
                        implicit none
                        real(dp), intent(in) :: x,y
                end function r_divide
        end interface divide
        print*, "a, b"
        read*, a, b
        rans = divide(a,b)                              ! refrence interface, interface will get the function with the correct type
        print*, "real number division ", rans           ! interface chose the real division
        c = int(a)
        d = int(b)
        ians = divide(c,d)
        print*, "integer number division ", ians        ! intercace chose the integer division
end program doublecall
