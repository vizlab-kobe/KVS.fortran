module kvs_RayCastingRenderer_m
  use iso_c_binding
  use kvs_TransferFunction_m
  implicit none

  ! Class definition
  public :: kvs_RayCastingRenderer
  type kvs_RayCastingRenderer
     private
     type( C_ptr ) :: ptr = C_NULL_ptr
   contains
     procedure :: delete => kvs_RayCastingRenderer_delete
     procedure :: get => kvs_RayCastingRenderer_get
     procedure :: setTransferFunction => kvs_RayCastingRenderer_setTransferFunction
  end type kvs_RayCastingRenderer

  ! Constructor
  interface kvs_RayCastingRenderer
     module procedure kvs_RayCastingRenderer_new
  end interface kvs_RayCastingRenderer

  ! C interfaces
  private
  interface
     function C_kvs_RayCastingRenderer_new( glsl )&
          bind( C, name="RayCastingRenderer_new" )
       import
       type( C_ptr ) :: C_kvs_RayCastingRenderer_new
       logical( C_bool ), value :: glsl
     end function C_kvs_RayCastingRenderer_new

     subroutine C_kvs_RayCastingRenderer_delete( this )&
          bind( C, name="RayCastingRenderer_delete" )
       import
       type( C_ptr ), value :: this
     end subroutine C_kvs_RayCastingRenderer_delete

     subroutine C_kvs_RayCastingRenderer_setTransferFunction( this, tfunc )&
          bind( C, name="RayCastingRenderer_setTransferFunction" )
       import
       type( C_ptr ), value :: this
       type( C_ptr ), value :: tfunc
     end subroutine C_kvs_RayCastingRenderer_setTransferFunction
  end interface

contains

  function kvs_RayCastingRenderer_get( this )
    implicit none
    class( kvs_RayCastingRenderer ) :: this
    type( C_ptr ) :: kvs_RayCastingRenderer_get
    kvs_RayCastingRenderer_get = this % ptr
  end function kvs_RayCastingRenderer_get

  function kvs_RayCastingRenderer_new( glsl )
    implicit none
    type( kvs_RayCastingRenderer ) :: kvs_RayCastingRenderer_new
    logical, optional :: glsl
    if ( present( glsl ) ) then
       kvs_RayCastingRenderer_new % ptr = C_kvs_RayCastingRenderer_new( logical( glsl, kind=c_bool ) )
    else
       kvs_RayCastingRenderer_new % ptr = C_kvs_RayCastingRenderer_new( .true._c_bool )
    end if
  end function kvs_RayCastingRenderer_new

  subroutine kvs_RayCastingRenderer_delete( this )
    implicit none
    class( kvs_RayCastingRenderer ) :: this
    call C_kvs_RayCastingRenderer_delete( this % ptr )
    this % ptr = C_NULL_ptr
  end subroutine kvs_RayCastingRenderer_delete

  subroutine kvs_RayCastingRenderer_setTransferFunction( this, tfunc )
    implicit none
    class( kvs_RayCastingRenderer ), intent( in ) :: this
    type( kvs_TransferFunction ), intent( in ) :: tfunc
    call C_kvs_RayCastingRenderer_setTransferFunction( this % ptr, tfunc % get() )
  end subroutine kvs_RayCastingRenderer_setTransferFunction

end module kvs_RayCastingRenderer_m
