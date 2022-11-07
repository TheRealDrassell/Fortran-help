program fib2
        implicit none
        integer(selected_int_kind ( 38 )), allocatable, dimension(:) :: x
        integer :: i, n
        print*, "number of fibonacci sequence, 185 max for formating"
        read*, n
        allocate(x(n))
        x( 1 ) = 0
        x( 2 ) = 1
        do i = 3, n 
                x( i ) = x( i-2 ) + x( i-1 )
        end do
        do i=1, n
                print*, x(i), i
        end do
        deallocate(x)
end program fib2
