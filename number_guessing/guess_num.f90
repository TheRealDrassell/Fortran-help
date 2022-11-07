program guessing_game
        use iso_fortran_env, only:dp=>real64
        implicit none
        integer:: guess, lower, upper, answer, i=1
        logical:: prompt = .true.
        print*, "minimum, maximum values of the number to guess"
        read*, lower, upper
        call get_rand_num(guess, lower, upper)                          ! calls self made subrotines
        call get_answer(answer, lower, upper, prompt)
        do while (answer /= guess)
                i = i+1
                if (answer == guess) then
                        print*, "you guessed the number, it was", answer
                else if (answer <= guess) then
                        print*, "your guess is lower, guess again"
                else if (answer >= guess) then
                        print*, "your guess is higher, guess again"
                endif
                call get_answer(answer, lower, upper)
        end do
        print*, "congratulations, it took you ", i, "guesses"
        contains                                                        ! add subroutines here
                subroutine get_rand_num(guess, lower, upper)
                        use iso_fortran_env, only:dp=>real64
                        implicit none
                        real(dp):: rand
                        integer, intent(in):: lower, upper
                        integer, intent(out):: guess
                        call random_number(rand)
                        guess = lower + floor((upper + 1 - lower)*rand)
                end subroutine get_rand_num
                subroutine get_answer(answer, lower, upper, prompt)
                        implicit none
                        integer, intent(out):: answer
                        integer, intent(in):: lower, upper
                        logical, intent(in), optional:: prompt          ! optional means you do not need to give it when calling
                        if (present(prompt)) then                       ! will check if prompt was given or not
                                if (prompt) then
                                        print*, "guess a number between ", lower, " and ", upper
                                endif
                        endif
                        read*, answer
                end subroutine get_answer
end program guessing_game
