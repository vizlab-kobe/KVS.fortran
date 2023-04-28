module kvs_PolygonRenderer_m
  use iso_c_binding
  implicit none

  private
  include "kvs_PolygonRenderer_c.f90"

  ! Class definition
  public :: kvs_PolygonRenderer
  type kvs_PolygonRenderer
     private
     type( C_ptr ) :: ptr = C_NULL_ptr
   contains
     final :: kvs_PolygonRenderer_destroy ! Destructor
     procedure :: delete => kvs_PolygonRenderer_delete
     procedure :: get => kvs_PolygonRenderer_get
     procedure :: setAntiAliasingEnabled => kvs_PolygonRenderer_setAntiAliasingEnabled
     procedure :: setTwoSideLightingEnabled => kvs_PolygonRenderer_setTwoSideLightingEnabled
  end type kvs_PolygonRenderer

  ! Constructor
  interface kvs_PolygonRenderer
     procedure kvs_PolygonRenderer_new
  end interface kvs_PolygonRenderer

contains

  ! Destructor
  subroutine kvs_PolygonRenderer_destroy( this )
    implicit none
    type( kvs_PolygonRenderer ) :: this
    if ( c_associated( this % ptr ) ) then
       call C_kvs_PolygonRenderer_delete( this % ptr )
       this % ptr = C_NULL_ptr
    endif
  end subroutine kvs_PolygonRenderer_destroy

  function kvs_PolygonRenderer_get( this )
    implicit none
    class( kvs_PolygonRenderer ) :: this
    type( C_ptr ) :: kvs_PolygonRenderer_get
    kvs_PolygonRenderer_get = this % ptr
  end function kvs_PolygonRenderer_get

  function kvs_PolygonRenderer_new( glsl )
    implicit none
    type( kvs_PolygonRenderer ) :: kvs_PolygonRenderer_new
    logical, optional :: glsl
    if ( present( glsl ) ) then
       kvs_PolygonRenderer_new % ptr = C_kvs_PolygonRenderer_new( glsl )
    else
       kvs_PolygonRenderer_new % ptr = C_kvs_PolygonRenderer_new( .true. )
    end if
  end function kvs_PolygonRenderer_new

  subroutine kvs_PolygonRenderer_delete( this )
    implicit none
    class( kvs_PolygonRenderer ) :: this
    call C_kvs_PolygonRenderer_delete( this % ptr )
    this % ptr = C_NULL_ptr
  end subroutine kvs_PolygonRenderer_delete

  subroutine kvs_PolygonRenderer_setAntiAliasingEnabled( this, enable )
    implicit none
    class( kvs_PolygonRenderer ), intent( in ) :: this
    logical, intent( in ) :: enable
    call C_kvs_PolygonRenderer_setAntiAliasingEnabled( this % ptr, enable )
  end subroutine kvs_PolygonRenderer_setAntiAliasingEnabled

  subroutine kvs_PolygonRenderer_setTwoSideLightingEnabled( this, enable )
    implicit none
    class( kvs_PolygonRenderer ), intent( in ) :: this
    logical, intent( in ) :: enable
    call C_kvs_PolygonRenderer_setTwoSideLightingEnabled( this % ptr, enable )
  end subroutine kvs_PolygonRenderer_setTwoSideLightingEnabled

end module kvs_PolygonRenderer_m
