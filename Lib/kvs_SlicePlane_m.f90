module kvs_SlicePlane_m
  use iso_c_binding
  use kvs_Vec3_m
  use kvs_StructuredVolumeObject_m
  use kvs_PolygonObject_m
  use kvs_TransferFunction_m
  implicit none

  ! Class definition
  public :: kvs_SlicePlane
  type kvs_SlicePlane
     private
     type( C_ptr ) :: ptr = C_NULL_ptr
   contains
     procedure :: delete => kvs_SlicePlane_delete
     procedure :: setPlane => kvs_SlicePlane_setPlane
     procedure :: exec => kvs_SlicePlane_exec
  end type kvs_SlicePlane

  ! Constructor
  interface kvs_SlicePlane
     procedure kvs_SlicePlane_new
  end interface kvs_SlicePlane

  ! C interfaces
  private
  interface
     function C_kvs_SlicePlane_new()&
          bind( C, name="SlicePlane_new" )
       import
       type( C_ptr ) :: C_kvs_SlicePlane_new
     end function C_kvs_SlicePlane_new

     subroutine C_kvs_SlicePlane_delete( this )&
          bind( C, name="SlicePlane_delete" )
       import
       type( C_ptr ), value :: this
     end subroutine C_kvs_SlicePlane_delete

     subroutine C_kvs_SlicePlane_setPlane( this, point, normal )&
          bind( C, name="SlicePlane_setPlane" )
       import
       type( C_ptr ), value :: this
       type( C_ptr ), value :: point
       type( C_ptr ), value :: normal
     end subroutine C_kvs_SlicePlane_setPlane

     subroutine C_kvs_SlicePlane_setTransferFunction( this, tfunc )&
          bind( C, name="SlicePlane_setTransferFunction" )
       import
       type( C_ptr ), value :: this
       type( C_ptr ), value :: tfunc
     end subroutine C_kvs_SlicePlane_setTransferFunction

     function C_kvs_SlicePlane_exec( this, volume )&
          bind( C, name="SlicePlane_exec" )
       import
       type( C_ptr ), value :: this
       type( C_ptr ), value :: volume
       type( C_ptr ) :: C_kvs_SlicePlane_exec
     end function C_kvs_SlicePlane_exec
  end interface

contains

  function kvs_SlicePlane_new()
    implicit none
    type( kvs_SlicePlane ) :: kvs_SlicePlane_new
    kvs_SlicePlane_new % ptr = C_kvs_SlicePlane_new()
  end function kvs_SlicePlane_new

  subroutine kvs_SlicePlane_delete( this )
    implicit none
    class( kvs_SlicePlane ) :: this
    call C_kvs_SlicePlane_delete( this % ptr )
    this % ptr = C_NULL_ptr
  end subroutine kvs_SlicePlane_delete

  subroutine kvs_SlicePlane_setPlane( this, point, normal )
    implicit none
    class( kvs_SlicePlane ), intent( in ) :: this
    real( c_float ), dimension(:), target, intent( in ) :: point
    real( c_float ), dimension(:), target, intent( in ) :: normal
    call C_kvs_SlicePlane_setPlane( this % ptr, c_loc( point ), c_loc( normal ) )
  end subroutine kvs_SlicePlane_setPlane

  subroutine kvs_SlicePlane_setTransferFunction( this, tfunc )
    implicit none
    class( kvs_SlicePlane ), intent( in ) :: this
    type( kvs_TransferFunction ), intent( in ) :: tfunc
    call C_kvs_SlicePlane_setTransferFunction( this % ptr, tfunc % get() )
  end subroutine kvs_SlicePlane_setTransferFunction

  function kvs_SlicePlane_exec( this, volume )
    implicit none
    class( kvs_SlicePlane ), intent( in ) :: this
    class( kvs_StructuredVolumeObject ), intent( in ) :: volume
    type( kvs_PolygonObject ) :: kvs_SlicePlane_exec
    kvs_SlicePlane_exec = kvs_PolygonObject( C_kvs_SlicePlane_exec( this % ptr, volume % get() ) )
  end function kvs_SlicePlane_exec

end module kvs_SlicePlane_m
