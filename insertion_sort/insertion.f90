program insertion
        use sorting_mod
        implicit none
        integer :: lower, upper, amount, i              !initializing values
        integer, allocatable, dimension(:) :: list
        character(len=1) :: show1
        logical :: show2 = .false.

        print*, "lower, upper, amount"                  ! quick questions
        read*, lower, upper, amount
        print*, "show in action? Y/n"
        read*, show1

        if (show1 == "y") then                          ! showing?
                show2 = .true.
        end if

        allocate(list(amount))                          ! allocate the array given its size
        call get_rand_arr(list, lower, upper)           ! call self made subroutine within sorting_mod.f90
        print 10 , list

        do i = 2, size(list)
                call shift_r(list, i)                   ! other self made subroutine
                if ( show2 ) then
                        print 10, list
                end if
        end do
        print 10, list

        deallocate(list)                                ! always deallocate allocated arrays
        10 format (99i3)                                ! formating
end program insertion
