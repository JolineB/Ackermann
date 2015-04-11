! Taken from "Computer Programming in Fortran 90 and 95"
! By: V. Rajaraman
!
! Program 19.2
! Description of a stack and operations on it
module stack_structure
	implicit none
	integer, parameter :: max_size = 1000000
	!the maximum size of the above stack is 1000000
	real, dimension (1:max_size) :: stack
	integer :: stack_top = 0
	logical :: stack_full, stack_empty
contains
	subroutine push(pushed_no)
		real, intent(in) :: pushed_no
		logical :: stack_full, stack_empty
		if (stack_full) then
			print *,"stack full, cannot push value"
			return
		endif
		stack_top = stack_top + 1
		stack(stack_top) = pushed_no
		stack_empty = .false.
		if(stack_top == max_size) then
			stack_full = .true.
		endif
	end subroutine push
	subroutine pop(popped_no)
		real, intent(out) :: popped_no
		if(stack_empty) then
			print *,"stack empty, cannot pop value"
			return
		endif
		popped_no = stack(stack_top)
		stack_top = stack_top - 1
		stack_full = .false.
		if (stack_top < 0) then
			stack_empty = .true.
		endif
	end subroutine pop
end module stack_structure
