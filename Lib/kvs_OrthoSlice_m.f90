module kvs_OrthoSlice_m
  use iso_c_binding
  use kvs_Vec3_m
  use kvs_StructuredVolumeObject_m
  use kvs_PolygonObject_m
  use kvs_TransferFunction_m
  implicit none

  ! Class definition
  public :: kvs_OrthoSlice
  type kvs_OrthoSlice
     private
     type( C_ptr ) :: ptr = C_NULL_ptr
   contains
     procedure :: delete => kvs_OrthoSlice_delete
     procedure :: setPlane => kvs_OrthoSlice_setPlane
     procedure :: setTransferFunction => kvs_OrthoSlice_setTransferFunction
     procedure :: exec => kvs_OrthoSlice_exec
  end type kvs_OrthoSlice

  ! Constructor
  interface kvs_OrthoSlice
     procedure kvs_OrthoSlice_new
  end interface kvs_OrthoSlice

  ! C interfaces
  private
    interface
     function C_kvs_OrthoSlice_new()&
          bind( C, name="OrthoSlice_new" )
       import
       type( C_ptr ) :: C_kvs_OrthoSlice_new
     end function C_kvs_OrthoSlice_new

     subroutine C_kvs_OrthoSlice_delete( this )&
          bind( C, name="OrthoSlice_delete" )
       import
       type( C_ptr ), value :: this
     end subroutine C_kvs_OrthoSlice_delete

     subroutine C_kvs_OrthoSlice_setPlane( this, position, axis )&
          bind( C, name="OrthoSlice_setPlane" )
       import
       type( C_ptr ), value :: this
       real( C_float ), value :: position
       integer( C_int ), value :: axis
     end subroutine C_kvs_OrthoSlice_setPlane

     subroutine C_kvs_OrthoSlice_setTransferFunction( this, tfunc )&
          bind( C, name="OrthoSlice_setTransferFunction" )
       import
       type( C_ptr ), value :: this
       type( C_ptr ), value :: tfunc
     end subroutine C_kvs_OrthoSlice_setTransferFunction

     function C_kvs_OrthoSlice_exec( this, volume )&
          bind( C, name="OrthoSlice_exec" )
       import
       type( C_ptr ), value :: this
       type( C_ptr ), value :: volume
       type( C_ptr ) :: C_kvs_OrthoSlice_exec
     end function C_kvs_OrthoSlice_exec
  end interface

contains

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
