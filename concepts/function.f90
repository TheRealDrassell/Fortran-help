integer function i_divide(x,y) result(ans)      ! external function, returns ans, no need to declare ans, is declared by the func
        implicit none                           ! functions can only return one value
        integer, intent(in):: x,y
        ans = x/y
        return
end function i_divide

real function r_divide(x,y) result(ans)
        use iso_fortran_env, only:dp=>real64
        implicit none
        real, intent(in) :: x,y
        ans = x/y
        return
end function r_divide

program maker
        use iso_fortran_env, only:dp=>real64
        implicit none

        real :: a,b,rans                        ! declaretions
        real, external :: r_divide              ! declare external functions
        integer  :: c,d,ians
        integer, external  :: i_divide
        a = 1.0_dp
        b = 2.0_dp
        rans = r_divide(a,b)

        print*, "real division", rans

        c = 1
        d = 2
        ians = i_divide(c,d)
        print*, "integer division", ians

end program maker
