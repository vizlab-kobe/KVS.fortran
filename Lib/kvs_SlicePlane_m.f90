module kvs_SlicePlane_m
  use iso_c_binding
  use kvs_Vec3_m
  use kvs_StructuredVolumeObject_m
  use kvs_PolygonObject_m
  use kvs_TransferFunction_m
  implicit none

  private
  include "kvs_SlicePlane_c.f90"

  ! Class definition
  public :: kvs_SlicePlane
  type kvs_SlicePlane
     private
     type( C_ptr ) :: ptr = C_NULL_ptr
   contains
!     final :: kvs_SlicePlane_finalize ! Destructor
     procedure :: delete => kvs_SlicePlane_delete
     procedure :: setPlane => kvs_SlicePlane_setPlane
     procedure :: exec => kvs_SlicePlane_exec
  end type kvs_SlicePlane

  interface kvs_SlicePlane ! Constructor
     procedure kvs_SlicePlane_new
  end interface kvs_SlicePlane

contains

  function kvs_SlicePlane_new()
    implicit none
    type( kvs_SlicePlane ) :: kvs_SlicePlane_new
    kvs_SlicePlane_new % ptr = C_kvs_SlicePlane_new()
  end function kvs_SlicePlane_new

  subroutine kvs_SlicePlane_finalize( this )
    implicit none
    type( kvs_SlicePlane ) :: this
    if ( c_associated( this % ptr ) ) then
       call C_kvs_SlicePlane_delete( this % ptr )
       this % ptr = C_NULL_ptr
    endif
  end subroutine kvs_SlicePlane_finalize

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
    call C_kvs_SlicePlane_setPlane( this % ptr, c_loc(point), c_loc(normal) )
  end subroutine kvs_SlicePlane_setPlane

  subroutine kvs_SlicePlane_setTransferFunction( this, tf )
    implicit none
    class( kvs_SlicePlane ), intent( in ) :: this
    type( kvs_TransferFunction ), intent( in ) :: tf
    call C_kvs_SlicePlane_setTransferFunction( this % ptr, tf % get() )
  end subroutine kvs_SlicePlane_setTransferFunction

  function kvs_SlicePlane_exec( this, volume )
    implicit none
    class( kvs_SlicePlane ), intent( in ) :: this
    class( kvs_StructuredVolumeObject ), intent( in ) :: volume
    type( kvs_PolygonObject ) :: kvs_SlicePlane_exec
    kvs_SlicePlane_exec = kvs_PolygonObject( C_kvs_SlicePlane_exec( this % ptr, volume % get() ) )
  end function kvs_SlicePlane_exec

end module kvs_SlicePlane_m
