program factorial
    implicit none
    integer :: n, i
    integer(kind=8) :: result

    print *, "Enter a number:"
    read *, n

    result = 1
    do i = 1, n
        result = result * i
    end do

    print *, "Factorial of", n, "is", result

end program factorial