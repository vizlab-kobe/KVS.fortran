module kvs_ColorImage_m
  use iso_c_binding
  implicit none

  private
  include "kvs_ColorImage_c.f90"

  ! Class definition
  public :: kvs_ColorImage
  type kvs_ColorImage
     private
     type( C_ptr ) :: ptr = C_NULL_ptr
   contains
     final :: kvs_ColorImage_finalize ! Destructor
     procedure :: delete => kvs_ColorImage_delete
     procedure :: read => kvs_ColorImage_read
     procedure :: write => kvs_ColorImage_write
  end type kvs_ColorImage

  interface kvs_ColorImage ! Constructor
     procedure kvs_ColorImage_new
  end interface kvs_ColorImage

contains

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

  subroutine kvs_ColorImage_finalize( this )
    implicit none
    type( kvs_ColorImage ) :: this
    if ( c_associated( this % ptr ) ) then
       call C_kvs_ColorImage_delete( this % ptr )
       this % ptr = C_NULL_ptr
    endif
  end subroutine kvs_ColorImage_finalize

  subroutine kvs_ColorImage_delete( this )
    implicit none
    class( kvs_ColorImage ) :: this
    call C_kvs_ColorImage_delete( this % ptr )
    this % ptr = C_NULL_ptr
  end subroutine kvs_ColorImage_delete

  subroutine kvs_ColorImage_read( this, filename )
    implicit none
    class( kvs_ColorImage ) :: this
    character( len=1, kind=C_char ), intent( in ) :: filename(*)
    call C_kvs_ColorImage_read( this % ptr, filename )
  end subroutine kvs_ColorImage_read

  subroutine kvs_ColorImage_write( this, filename )
    implicit none
    class( kvs_ColorImage ) :: this
    character( len=1, kind=C_char ), intent( in ) :: filename(*)
    call C_kvs_ColorImage_write( this % ptr, filename )
  end subroutine kvs_ColorImage_write

end module kvs_ColorImage_m

