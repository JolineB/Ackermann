! Program to perform the Ackermann Function 
! done by recursion
program ackMain
	integer:: m, n, endResult
	do m = 0, 3
		do n = 0, 6
			endResult = ackermann(m,n)
			write(*,*) m, n, ': ', endResult
		end do	
	end do	
contains
	recursive Function ackermann(m,n) result(result)
		implicit none
		integer, intent(in) :: m, n
		integer ::result
		if(m == 0) then
			result = n + 1
		else if (n == 0) then
			result = ackermann(m-1, 1)
		else
			result = ackermann(m-1, ackermann(m, n -1))
		end if
	end function ackermann
end program ackMain
