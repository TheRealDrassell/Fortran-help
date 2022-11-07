program test
        use iso_fortran_env, only:dp=>real64
        implicit none
        real(dp), dimension(5):: array
        real(dp), external:: inc        !declare external function
        real(dp) :: ext, ans
        !integer, parameter:: dp=kind(0.d0)
        
        call populate(array)
        print*, array
        
        ext = 1.235233_dp
        ans = inc(ext)
        print*, ans

        contains                               ! contain block for subroutine, needs to be at the end for the program
        subroutine populate(array)
                use iso_fortran_env, only:dp=>real64
                implicit none

                real(dp), dimension(:),intent(out):: array
                integer:: n,i

                n = size(array)
                do i=1, n
                        array(i) = 1.0_dp+i
                end do
        end subroutine populate
end program test

real(dp) function inc(a) result(b)              ! external function
        use iso_fortran_env, only:dp=>real64
        implicit none
        real(dp)::a
        b = a+1
end function
