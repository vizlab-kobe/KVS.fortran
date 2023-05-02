module kvs_ColorImage_m
  use iso_c_binding
  implicit none

!  private
!  include "kvs_ColorImage_c.f90"

  ! Class definition
  public :: kvs_ColorImage
  type kvs_ColorImage
     private
     type( C_ptr ) :: ptr = C_NULL_ptr
   contains
     final :: kvs_ColorImage_destroy ! Destructor
     procedure :: delete => kvs_ColorImage_delete
     procedure :: read => kvs_ColorImage_read
     procedure :: write => kvs_ColorImage_write
  end type kvs_ColorImage

  ! Constructor
  interface kvs_ColorImage
     procedure kvs_ColorImage_new
  end interface kvs_ColorImage

  ! Private C interfaces
  private
    interface
     function C_kvs_ColorImage_new()&
          bind( C, name="ColorImage_new" )
       import
       type( C_ptr ) :: C_kvs_ColorImage_new
     end function C_kvs_ColorImage_new

     function C_kvs_ColorImage_copy( other )&
          bind( C, name="ColorImage_copy" )
       import
       type( C_ptr ) :: C_kvs_ColorImage_copy
       type( C_ptr ), value :: other
     end function C_kvs_ColorImage_copy

     subroutine C_kvs_ColorImage_delete( this )&
          bind( C, name="ColorImage_delete" )
       import
       type( C_ptr ), value :: this
     end subroutine C_kvs_ColorImage_delete

     subroutine C_kvs_ColorImage_read( this, filename )&
          bind( C, name="ColorImage_read" )
       import
       type( C_ptr ), value :: this
       character( len=1, kind=C_char ), intent( in ) :: filename(*)
     end subroutine C_kvs_ColorImage_read

     subroutine C_kvs_ColorImage_write( this, filename )&
          bind( C, name="ColorImage_write" )
       import
       type( C_ptr ), value :: this
       character( len=1, kind=C_char ), intent( in ) :: filename(*)
     end subroutine C_kvs_ColorImage_write
  end interface

contains

  ! Destructor
  subroutine kvs_ColorImage_destroy( this )
    implicit none
    type( kvs_ColorImage ) :: this
    if ( c_associated( this % ptr ) ) then
       call C_kvs_ColorImage_delete( this % ptr )
       this % ptr = C_NULL_ptr
    endif
  end subroutine kvs_ColorImage_destroy

  function kvs_ColorImage_new( other )
    implicit none
    type( kvs_ColorImage ) :: kvs_ColorImage_new
    type( C_ptr ), optional :: other
    if ( present( other ) ) then
       kvs_ColorImage_new % ptr = C_kvs_ColorImage_copy( other )
    else
       kvs_ColorImage_new % ptr = C_kvs_ColorImage_new()
    end if
  end function kvs_ColorImage_new

  subroutine kvs_ColorImage_delete( this )
    implicit none
    class( kvs_ColorImage ) :: this
    call C_kvs_ColorImage_delete( this % ptr )
    this % ptr = C_NULL_ptr
  end subroutine kvs_ColorImage_delete

  subroutine kvs_ColorImage_read( this, filename )
    implicit none
    class( kvs_ColorImage ) :: this
    character( len=*, kind=C_char ), intent( in ) :: filename
    call C_kvs_ColorImage_read( this % ptr, filename // C_null_char )
  end subroutine kvs_ColorImage_read

  subroutine kvs_ColorImage_write( this, filename )
    implicit none
    class( kvs_ColorImage ) :: this
    character( len=*, kind=C_char ), intent( in ) :: filename
    call C_kvs_ColorImage_write( this % ptr, filename // C_null_char )
  end subroutine kvs_ColorImage_write

end module kvs_ColorImage_m
