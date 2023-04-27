module kvs_OrthoSlice_m
  use iso_c_binding
  use kvs_Vec3_m
  use kvs_StructuredVolumeObject_m
  use kvs_PolygonObject_m
  use kvs_TransferFunction_m
  implicit none

  private
  include "kvs_OrthoSlice_c.f90"

  ! Class definition
  public :: kvs_OrthoSlice
  type kvs_OrthoSlice
     private
     type( C_ptr ) :: ptr = C_NULL_ptr
   contains
     final :: kvs_OrthoSlice_destroy ! Destructor
     procedure :: delete => kvs_OrthoSlice_delete
     procedure :: setPlane => kvs_OrthoSlice_setPlane
     procedure :: setTransferFunction => kvs_OrthoSlice_setTransferFunction
     procedure :: exec => kvs_OrthoSlice_exec
  end type kvs_OrthoSlice

  ! Constructor
  interface kvs_OrthoSlice
     procedure kvs_OrthoSlice_new
  end interface kvs_OrthoSlice

contains

  ! Destructor
  subroutine kvs_OrthoSlice_destroy( this )
    implicit none
    type( kvs_OrthoSlice ) :: this
    if ( c_associated( this % ptr ) ) then
       call C_kvs_OrthoSlice_delete( this % ptr )
       this % ptr = C_NULL_ptr
    endif
  end subroutine kvs_OrthoSlice_destroy

  function kvs_OrthoSlice_new()
    implicit none
    type( kvs_OrthoSlice ) :: kvs_OrthoSlice_new
    kvs_OrthoSlice_new % ptr = C_kvs_OrthoSlice_new()
  end function kvs_OrthoSlice_new

  subroutine kvs_OrthoSlice_delete( this )
    implicit none
    class( kvs_OrthoSlice ) :: this
    call C_kvs_OrthoSlice_delete( this % ptr )
    this % ptr = C_NULL_ptr
  end subroutine kvs_OrthoSlice_delete

  subroutine kvs_OrthoSlice_setPlane( this, position, axis )
    implicit none
    class( kvs_OrthoSlice ), intent( in ) :: this
    real( C_float ), intent( in ) :: position
    integer( c_int ), intent( in ) :: axis
    call C_kvs_OrthoSlice_setPlane( this % ptr, position, axis )
  end subroutine kvs_OrthoSlice_setPlane

  subroutine kvs_OrthoSlice_setTransferFunction( this, tfunc )
    implicit none
    class( kvs_OrthoSlice ), intent( in ) :: this
    type( kvs_TransferFunction ), intent( in ) :: tfunc
    call C_kvs_OrthoSlice_setTransferFunction( this % ptr, tfunc % get() )
  end subroutine kvs_OrthoSlice_setTransferFunction

  function kvs_OrthoSlice_exec( this, volume )
    implicit none
    class( kvs_OrthoSlice ), intent( in ) :: this
    class( kvs_StructuredVolumeObject ), intent( in ) :: volume
    type( kvs_PolygonObject ) :: kvs_OrthoSlice_exec
    kvs_OrthoSlice_exec = kvs_PolygonObject( C_kvs_OrthoSlice_exec( this % ptr, volume % get() ) )
  end function kvs_OrthoSlice_exec

end module kvs_OrthoSlice_m
