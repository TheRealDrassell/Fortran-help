module sorting_mod
        implicit none
        contains 
                subroutine get_rand_arr(guess, lower, upper)
                        use iso_fortran_env, only:dp=>real64
                        implicit none
                        real(dp):: rand
                        integer :: i
                        integer, intent(in):: lower, upper                      ! intent(in) since when only want the value in
                        integer, dimension(:), intent(out):: guess              ! what we want as the result
                        do i = 1, size(guess)
                                call random_number(rand)                        ! call intrinsic subroutine
                                guess(i) = lower + floor((upper + 1 - lower)*rand)
                        end do
                end subroutine get_rand_arr
                subroutine get_rand_num(guess, lower, upper)
                        use iso_fortran_env, only:dp=>real64
                        implicit none
                        real(dp):: rand
                        integer, intent(in):: lower, upper
                        integer, intent(out):: guess
                        call random_number(rand)
                        guess = lower + floor((upper + 1 - lower)*rand)
                end subroutine get_rand_num
                subroutine switch(a1, a2)
                        implicit none
                        integer, intent(inout) :: a1, a2
                        integer :: temp
                        temp = a1
                        a1 = a2
                        a2 = temp
                end subroutine switch
                subroutine shift_R(list, i)
                        implicit none
                        integer, dimension(:) :: list
                        integer :: i, j, temp
                        do j=0, i-2
                                if (list(i-j) < list(i-j-1)) then 
                                        call switch(list(i-j), list(i-j-1))     ! call previous subroutine
                                        !temp = list(i-j)
                                        !list(i-j) = list(i-j-1)
                                        !list(i-j-1) = temp
                                else; exit
                                end if
                        end do
                end subroutine shift_R
end module sorting_mod
