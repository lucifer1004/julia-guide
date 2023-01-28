module Julia
    integer :: last = 0;

    contains

subroutine add(a,b,c)
  implicit none
  integer, intent(in) :: a,b
  integer, intent(out) :: c
  c = a + b
  last = c
end subroutine add

function fadd(a,b) result(c)
  implicit none
  integer, intent(in) :: a,b
  integer :: c
  c = a + b
end function fadd

subroutine vadd(a,b,c,n)
  implicit none
  integer, intent(in) :: n, a(n), b(n)
  integer, intent(out) :: c(n)
  c = a + b
end subroutine vadd

end module
