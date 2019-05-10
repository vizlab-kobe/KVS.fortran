module kvs_StructuredVolumeObject_m
  use iso_c_binding
  use kvs_Vec3_m
  implicit none

  private
  include "kvs_StructuredVolumeObject_c.f90"

  ! Class definition
  public :: kvs_StructuredVolumeObject
  type kvs_StructuredVolumeObject
     private
     type( C_ptr ) :: ptr = C_NULL_ptr
   contains
     final :: kvs_StructuredVolumeObject_delete ! Destructor
     procedure :: setGridTypeToUniform => kvs_StructuredVolumeObject_setGridTypeToUniform
     procedure :: setResolution => kvs_StructuredVolumeObject_setResolution
     procedure :: setVeclen => kvs_StructuredVolumeObject_setVeclen
     procedure :: setValues => kvs_StructuredVolumeObject_setValues
     procedure :: updateMinMaxCoords => kvs_StructuredVolumeObject_updateMinMaxCoords
     procedure :: updateMinMaxValues => kvs_StructuredVolumeObject_updateMinMaxValues
  end type kvs_StructuredVolumeObject

  interface kvs_StructuredVolumeObject ! Constructor
     procedure kvs_StructuredVolumeObject_new
  end interface kvs_StructuredVolumeObject

contains

  function kvs_StructuredVolumeObject_new()
    implicit none
    type( kvs_StructuredVolumeObject ) :: kvs_StructuredVolumeObject_new
    kvs_StructuredVolumeObject_new%ptr = C_kvs_StructuredVolumeObject_new()
  end function kvs_StructuredVolumeObject_new

  subroutine kvs_StructuredVolumeObject_delete( this )
    implicit none
    type( kvs_StructuredVolumeObject ) :: this
    call C_kvs_StructuredVolumeObject_delete( this%ptr )
    this%ptr = C_NULL_ptr
  end subroutine kvs_StructuredVolumeObject_delete

  subroutine kvs_StructuredVolumeObject_setGridTypeToUniform( this )
    implicit none
    class( kvs_StructuredVolumeObject ), intent( in ) :: this
    call C_kvs_StructuredVolumeObject_setGridTypeToUniform( this%ptr )
  end subroutine kvs_StructuredVolumeObject_setGridTypeToUniform

  subroutine kvs_StructuredVolumeObject_setResolution( this, resolution )
    implicit none
    class( kvs_StructuredVolumeObject ), intent( in ) :: this
    class( kvs_Vec3i ), intent( in ) :: resolution
    call C_kvs_StructuredVolumeObject_setResolution( this%ptr, resolution%x, resolution%y, resolution%z )
  end subroutine kvs_StructuredVolumeObject_setResolution

  subroutine kvs_StructuredVolumeObject_setVeclen( this, veclen )
    implicit none
    class( kvs_StructuredVolumeObject ), intent( in ) :: this
    integer( C_int ), intent( in ) :: veclen
    call C_kvs_StructuredVolumeObject_setVeclen( this%ptr, veclen )
  end subroutine kvs_StructuredVolumeObject_setVeclen

  subroutine kvs_StructuredVolumeObject_setValues( this, values, nvalues )
    implicit none
    class( kvs_StructuredVolumeObject ), intent( in ) :: this
    real( C_float ), intent( in ) :: values(nvalues)
    integer( C_int ), intent( in ) :: nvalues
    call C_kvs_StructuredVolumeObject_setValues( this%ptr, values, nvalues )
  end subroutine kvs_StructuredVolumeObject_setValues

  subroutine kvs_StructuredVolumeObject_updateMinMaxCoords( this )
    implicit none
    class( kvs_StructuredVolumeObject ), intent( in ) :: this
    call C_kvs_StructuredVolumeObject_updateMinMaxCoords( this%ptr )
  end subroutine kvs_StructuredVolumeObject_updateMinMaxCoords

  subroutine kvs_StructuredVolumeObject_updateMinMaxValues( this )
    implicit none
    class( kvs_StructuredVolumeObject ), intent( in ) :: this
    call C_kvs_StructuredVolumeObject_updateMinMaxValues( this%ptr )
  end subroutine kvs_StructuredVolumeObject_updateMinMaxValues

end module kvs_StructuredVolumeObject_m
