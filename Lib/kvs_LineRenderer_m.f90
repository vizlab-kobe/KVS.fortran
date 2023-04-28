module kvs_LineRenderer_m
  use iso_c_binding
  implicit none

  private
  include "kvs_LineRenderer_c.f90"

  ! Class definition
  public :: kvs_LineRenderer
  type kvs_LineRenderer
     private
     type( C_ptr ) :: ptr = C_NULL_ptr
   contains
     final :: kvs_LineRenderer_destroy ! Destructor
     procedure :: delete => kvs_LineRenderer_delete
     procedure :: get => kvs_LineRenderer_get
     procedure :: setAntiAliasingEnabled => kvs_LineRenderer_setAntiAliasingEnabled
  end type kvs_LineRenderer

  ! Constructor
  interface kvs_LineRenderer
     procedure kvs_LineRenderer_new
  end interface kvs_LineRenderer

contains

  ! Destructor
  subroutine kvs_LineRenderer_destroy( this )
    implicit none
    type( kvs_LineRenderer ) :: this
    if ( c_associated( this % ptr ) ) then
       call C_kvs_LineRenderer_delete( this % ptr )
       this % ptr = C_NULL_ptr
    endif
  end subroutine kvs_LineRenderer_destroy

  function kvs_LineRenderer_get( this )
    implicit none
    class( kvs_LineRenderer ) :: this
    type( C_ptr ) :: kvs_LineRenderer_get
    kvs_LineRenderer_get = this % ptr
  end function kvs_LineRenderer_get

  function kvs_LineRenderer_new( glsl )
    implicit none
    type( kvs_LineRenderer ) :: kvs_LineRenderer_new
    logical, optional :: glsl
    if ( present( glsl ) ) then
       kvs_LineRenderer_new % ptr = C_kvs_LineRenderer_new( glsl )
    else
       kvs_LineRenderer_new % ptr = C_kvs_LineRenderer_new( .true. )
    end if
  end function kvs_LineRenderer_new

  subroutine kvs_LineRenderer_delete( this )
    implicit none
    class( kvs_LineRenderer ) :: this
    call C_kvs_LineRenderer_delete( this % ptr )
    this % ptr = C_NULL_ptr
  end subroutine kvs_LineRenderer_delete

  subroutine kvs_LineRenderer_setAntiAliasingEnabled( this, enable )
    implicit none
    class( kvs_LineRenderer ), intent( in ) :: this
    logical, intent( in ) :: enable
    call C_kvs_LineRenderer_setAntiAliasingEnabled( this % ptr, enable )
  end subroutine kvs_LineRenderer_setAntiAliasingEnabled

end module kvs_LineRenderer_m
