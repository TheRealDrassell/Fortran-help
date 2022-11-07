program bubble
        implicit none
        integer, allocatable, dimension(:) :: list              ! allocatable array
        integer :: lower, upper, amount
        integer :: i, rand
        integer :: cmp = 0, swtch = 0, tswtch = 0
        character (len=1) :: show1
        logical :: sort = .true., show2
        print*, "min, max (max 99), amount (max 70 for formatting)"     !quick question
        read*, lower, upper, amount
        print*, "show in action? Y/n"
        read*, show1
        if ( show1=="y" ) then
                show2 = .true.
        else
                show2 = .false.
        end if
        allocate(list(amount))                                  ! allocate array
        do i = 1, amount
                call get_rand_num(rand, lower, upper)           ! call instrinsic subroutine
                list(i) = rand
        end do
        print 10, list
        do while (sort)                                         ! sorting
                tswtch = 0
                do i = 1, amount-1
                        cmp=cmp+1
                        if (list(i) > list(i+1)) then
                                swtch=swtch+1
                                tswtch=tswtch+1
                                call switch(list(i), list(i+1))         ! call subroutine declared later
                        end if
                end do
                if (tswtch == 0) then
                        sort = .false.
                end if
                if (show2 .eqv. .true.) then
                        print 10, list                          ! shows the list as its being sorted
                end if
        end do
        print 10, list
        print*, cmp, " comparisons and ", swtch, " switchs"
        deallocate(list)
        10 format(99i3)
        contains                                                ! subroutines
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
end program bubble
