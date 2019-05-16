module kvs_Screen_m
  use iso_c_binding
  use kvs_ColorImage_m
  implicit none

  private
  include "kvs_Screen_c.f90"

  ! Class definition
  public :: kvs_Screen
  type kvs_Screen
     private
     type( C_ptr ) :: ptr = C_NULL_ptr
   contains
!     final :: kvs_Screen_finalize ! Destructor
     procedure :: delete => kvs_Screen_delete
     procedure :: registerObject => kvs_Screen_registerObject
     procedure :: draw => kvs_Screen_draw
     procedure :: capture => kvs_Screen_capture
  end type kvs_Screen

  interface kvs_Screen ! Constructor
     procedure kvs_Screen_new
  end interface kvs_Screen

contains

  function kvs_Screen_new()
    implicit none
    type( kvs_Screen ) :: kvs_Screen_new
    kvs_Screen_new % ptr = C_kvs_Screen_new()
  end function kvs_Screen_new

  subroutine kvs_Screen_finalize( this )
    implicit none
    type( kvs_Screen ) :: this
    if ( c_associated( this % ptr ) ) then
       call C_kvs_Screen_delete( this % ptr )
       this % ptr = C_NULL_ptr
    endif
  end subroutine kvs_Screen_finalize

  subroutine kvs_Screen_delete( this )
    implicit none
    class( kvs_Screen ) :: this
    call C_kvs_Screen_delete( this % ptr )
    this % ptr = C_NULL_ptr
  end subroutine kvs_Screen_delete

  subroutine kvs_Screen_registerObject( this, object_ptr, renderer_ptr )
    implicit none
    class( kvs_Screen ) :: this
    type( C_ptr ) :: object_ptr
    type( C_ptr ), optional :: renderer_ptr
    if ( present( renderer_ptr ) ) then
       call C_kvs_Screen_registerObject( this % ptr, object_ptr, renderer_ptr )
    else
       call C_kvs_Screen_registerObject( this % ptr, object_ptr, C_NULL_ptr );
    end if
  end subroutine kvs_Screen_registerObject

  subroutine kvs_Screen_draw( this )
    implicit none
    class( kvs_Screen ) :: this
    call C_kvs_Screen_draw( this % ptr )
  end subroutine kvs_Screen_draw

  function kvs_Screen_capture( this )
    implicit none
    class( kvs_Screen ), intent( in ) :: this
    type( kvs_ColorImage ) :: kvs_Screen_capture
    kvs_Screen_capture = kvs_ColorImage( C_kvs_Screen_capture( this % ptr ) )
  end function kvs_Screen_capture

end module kvs_Screen_m
