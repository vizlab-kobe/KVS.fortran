module kvs_Isosurface_m
  use iso_c_binding
  use kvs_Vec3_m
  use kvs_StructuredVolumeObject_m
  use kvs_PolygonObject_m
  implicit none

  private
  include "kvs_Isosurface_c.f90"

  ! Class definition
  public :: kvs_Isosurface
  type kvs_Isosurface
     private
     type( C_ptr ) :: ptr = C_NULL_ptr
   contains
!     final :: kvs_Isosurface_finalize ! Destructor
     procedure :: delete => kvs_Isosurface_delete
     procedure :: setIsolevel => kvs_Isosurface_setIsolevel
     procedure :: exec => kvs_Isosurface_exec
  end type kvs_Isosurface

  interface kvs_Isosurface ! Constructor
     procedure kvs_Isosurface_new
  end interface kvs_Isosurface

contains

  function kvs_Isosurface_new()
    implicit none
    type( kvs_Isosurface ) :: kvs_Isosurface_new
    kvs_Isosurface_new % ptr = C_kvs_Isosurface_new()
  end function kvs_Isosurface_new

  subroutine kvs_Isosurface_finalize( this )
    implicit none
    type( kvs_Isosurface ) :: this
    if ( c_associated( this % ptr ) ) then
       call C_kvs_Isosurface_delete( this % ptr )
       this % ptr = C_NULL_ptr
    endif
  end subroutine kvs_Isosurface_finalize

  subroutine kvs_Isosurface_delete( this )
    implicit none
    class( kvs_Isosurface ) :: this
    call C_kvs_Isosurface_delete( this % ptr )
    this % ptr = C_NULL_ptr
  end subroutine kvs_Isosurface_delete

  subroutine kvs_Isosurface_setIsolevel( this, isolevel )
    implicit none
    class( kvs_Isosurface ), intent( in ) :: this
    real( C_float ), intent( in ) :: isolevel
    call C_kvs_Isosurface_setIsolevel( this % ptr, isolevel )
  end subroutine kvs_Isosurface_setIsolevel

  function kvs_Isosurface_exec( this, volume )
    implicit none
    class( kvs_Isosurface ), intent( in ) :: this
    class( kvs_StructuredVolumeObject ), intent( in ) :: volume
    type( kvs_PolygonObject ) :: kvs_Isosurface_exec
    kvs_Isosurface_exec = kvs_PolygonObject( C_kvs_Isosurface_exec( this % ptr, volume % get() ) )
  end function kvs_Isosurface_exec

end module kvs_Isosurface_m
