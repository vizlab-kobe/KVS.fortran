module kvs_PolygonRenderer_m
  use iso_c_binding
  implicit none

  ! Class definition
  public :: kvs_PolygonRenderer
  type kvs_PolygonRenderer
     private
     type( C_ptr ) :: ptr = C_NULL_ptr
   contains
     procedure :: delete => kvs_PolygonRenderer_delete
     procedure :: get => kvs_PolygonRenderer_get
     procedure :: setAntiAliasingEnabled => kvs_PolygonRenderer_setAntiAliasingEnabled
     procedure :: setTwoSideLightingEnabled => kvs_PolygonRenderer_setTwoSideLightingEnabled
  end type kvs_PolygonRenderer

  ! Constructor
  interface kvs_PolygonRenderer
     procedure kvs_PolygonRenderer_new
  end interface kvs_PolygonRenderer

  ! C interfaces
  private
  interface
     function C_kvs_PolygonRenderer_new( glsl )&
          bind( C, name="PolygonRenderer_new" )
       import
       type( C_ptr ) :: C_kvs_PolygonRenderer_new
       logical( C_bool ) :: glsl
     end function C_kvs_PolygonRenderer_new

     subroutine C_kvs_PolygonRenderer_delete( this )&
          bind( C, name="PolygonRenderer_delete" )
       import
       type( C_ptr ), value :: this
     end subroutine C_kvs_PolygonRenderer_delete

     subroutine C_kvs_PolygonRenderer_setAntiAliasingEnabled( this, enable )&
          bind( C, name="PolygonRenderer_setAntiAliasingEnabled" )
       import
       type( C_ptr ), value :: this
       logical( C_bool ), value :: enable
     end subroutine C_kvs_PolygonRenderer_setAntiAliasingEnabled

     subroutine C_kvs_PolygonRenderer_setTwoSideLightingEnabled( this, enable )&
          bind( C, name="PolygonRenderer_setTwoSideLightingEnabled" )
       import
       type( C_ptr ), value :: this
       logical( C_bool ), value :: enable
     end subroutine C_kvs_PolygonRenderer_setTwoSideLightingEnabled
  end interface

contains

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
       kvs_PolygonRenderer_new % ptr = C_kvs_PolygonRenderer_new( logical( glsl, kind=c_bool ) )
    else
       kvs_PolygonRenderer_new % ptr = C_kvs_PolygonRenderer_new( .true._c_bool )
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
    call C_kvs_PolygonRenderer_setAntiAliasingEnabled( this % ptr, logical( enable, kind=c_bool ) )
  end subroutine kvs_PolygonRenderer_setAntiAliasingEnabled

  subroutine kvs_PolygonRenderer_setTwoSideLightingEnabled( this, enable )
    implicit none
    class( kvs_PolygonRenderer ), intent( in ) :: this
    logical, intent( in ) :: enable
    call C_kvs_PolygonRenderer_setTwoSideLightingEnabled( this % ptr, logical( enable, kind=c_bool ) )
  end subroutine kvs_PolygonRenderer_setTwoSideLightingEnabled

end module kvs_PolygonRenderer_m
