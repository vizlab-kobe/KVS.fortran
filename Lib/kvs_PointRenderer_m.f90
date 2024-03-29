module kvs_PointRenderer_m
  use iso_c_binding
  implicit none

  ! Class definition
  public :: kvs_PointRenderer
  type kvs_PointRenderer
     private
     type( C_ptr ) :: ptr = C_NULL_ptr
   contains
     procedure :: delete => kvs_PointRenderer_delete
     procedure :: get => kvs_PointRenderer_get
     procedure :: setAntiAliasingEnabled => kvs_PointRenderer_setAntiAliasingEnabled
     procedure :: setTwoSideLightingEnabled => kvs_PointRenderer_setTwoSideLightingEnabled
  end type kvs_PointRenderer

  ! Constructor
  interface kvs_PointRenderer
     procedure kvs_PointRenderer_new
  end interface kvs_PointRenderer

  ! C interfaces
  private
    interface
     function C_kvs_PointRenderer_new( glsl )&
          bind( C, name="PointRenderer_new" )
       import
       type( C_ptr ) :: C_kvs_PointRenderer_new
       logical( C_bool ) :: glsl
     end function C_kvs_PointRenderer_new

     subroutine C_kvs_PointRenderer_delete( this )&
          bind( C, name="PointRenderer_delete" )
       import
       type( C_ptr ), value :: this
     end subroutine C_kvs_PointRenderer_delete

     subroutine C_kvs_PointRenderer_setAntiAliasingEnabled( this, enable )&
          bind( C, name="PointRenderer_setAntiAliasingEnabled" )
       import
       type( C_ptr ), value :: this
       logical( C_bool ), value :: enable
     end subroutine C_kvs_PointRenderer_setAntiAliasingEnabled

     subroutine C_kvs_PointRenderer_setTwoSideLightingEnabled( this, enable )&
          bind( C, name="PointRenderer_setTwoSideLightingEnabled" )
       import
       type( C_ptr ), value :: this
       logical( C_bool ), value :: enable
     end subroutine C_kvs_PointRenderer_setTwoSideLightingEnabled
  end interface

contains

  function kvs_PointRenderer_get( this )
    implicit none
    class( kvs_PointRenderer ) :: this
    type( C_ptr ) :: kvs_PointRenderer_get
    kvs_PointRenderer_get = this % ptr
  end function kvs_PointRenderer_get

  function kvs_PointRenderer_new( glsl )
    implicit none
    type( kvs_PointRenderer ) :: kvs_PointRenderer_new
    logical, optional :: glsl
    if ( present( glsl ) ) then
       kvs_PointRenderer_new % ptr = C_kvs_PointRenderer_new( logical( glsl, kind=c_bool ) )
    else
       kvs_PointRenderer_new % ptr = C_kvs_PointRenderer_new( .true._c_bool )
    end if
  end function kvs_PointRenderer_new

  subroutine kvs_PointRenderer_delete( this )
    implicit none
    class( kvs_PointRenderer ) :: this
    call C_kvs_PointRenderer_delete( this % ptr )
    this % ptr = C_NULL_ptr
  end subroutine kvs_PointRenderer_delete

  subroutine kvs_PointRenderer_setAntiAliasingEnabled( this, enable )
    implicit none
    class( kvs_PointRenderer ), intent( in ) :: this
    logical, intent( in ) :: enable
    call C_kvs_PointRenderer_setAntiAliasingEnabled( this % ptr, logical( enable, kind=c_bool ) )
  end subroutine kvs_PointRenderer_setAntiAliasingEnabled

  subroutine kvs_PointRenderer_setTwoSideLightingEnabled( this, enable )
    implicit none
    class( kvs_PointRenderer ), intent( in ) :: this
    logical, intent( in ) :: enable
    call C_kvs_PointRenderer_setTwoSideLightingEnabled( this % ptr, logical( enable, kind=c_bool ) )
  end subroutine kvs_PointRenderer_setTwoSideLightingEnabled

end module kvs_PointRenderer_m
