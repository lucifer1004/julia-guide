module JuliaWrapper
   use, intrinsic :: iso_c_binding, only : c_ptr
   type(c_ptr), bind(c, name="jl_main_module") :: jl_main_module

   interface
      subroutine jl_init() bind(c, name="jl_init")
      end subroutine jl_init

      type(c_ptr) function jl_eval_string(str) bind(c, name="jl_eval_string")
         use, intrinsic :: iso_c_binding, only : c_char, c_ptr
         character(kind=c_char), dimension(*), intent(in) :: str
      end function jl_eval_string

      type(c_ptr) function jl_symbol(str) bind(c)
         use, intrinsic :: iso_c_binding, only : c_char, c_ptr
         character(kind=c_char), dimension(*), intent(in) :: str
      end function jl_symbol

      type(c_ptr) function jl_get_global(m, var) bind(c, name="jl_get_global")
         use, intrinsic :: iso_c_binding, only : c_ptr
         type(c_ptr), value, intent(in) :: m, var
      end function jl_get_global

      type(c_ptr) function jl_box_float64(x) bind(c, name="jl_box_float64")
         use, intrinsic :: iso_c_binding, only : c_double, c_ptr
         real(c_double), value, intent(in) :: x
      end function jl_box_float64

      real(c_double) function jl_unbox_float64(x) bind(c, name="jl_unbox_float64")
         use, intrinsic :: iso_c_binding, only : c_double, c_ptr
         type(c_ptr), value, intent(in) :: x
      end function jl_unbox_float64

      type(c_ptr) function jl_call1(f, arg1) bind(c, name="jl_call1")
         use, intrinsic :: iso_c_binding, only : c_ptr
         type(c_ptr), value, intent(in) :: f, arg1
      end function jl_call1

      subroutine jl_atexit_hook(code) bind(c, name="jl_atexit_hook")
         use, intrinsic :: iso_c_binding, only : c_int
         integer(c_int), value :: code
      end subroutine jl_atexit_hook
   end interface
end module JuliaWrapper

program FortranJulia
   use JuliaWrapper
   use iso_c_binding, only : c_char, c_null_char
   implicit none

   type(c_ptr) :: res, sym, jl_sqrt

   call jl_init()
   sym = jl_symbol(c_char_"sqrt"//c_null_char)
   jl_sqrt = jl_get_global(jl_main_module, sym)
   res = jl_call1(jl_sqrt, jl_box_float64(2.0d0))
   print *, jl_unbox_float64(res)
   call jl_atexit_hook(0)
end program FortranJulia
