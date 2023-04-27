module kvs_HydrogenVolumeData_m
  use iso_c_binding
  use kvs_Vec3_m
  use kvs_StructuredVolumeObject_m
  implicit none

  private
  include "kvs_HydrogenVolumeData_c.f90"

  ! Class definition
  public :: kvs_HydrogenVolumeData
  type kvs_HydrogenVolumeData
     private
     type( C_ptr ) :: ptr = C_NULL_ptr
   contains
     final :: kvs_HydrogenVolumeData_destroy ! Destructor
     procedure :: delete => kvs_HydrogenVolumeData_delete
     procedure :: setResolution => kvs_HydrogenVolumeData_setResolution
     procedure :: exec => kvs_HydrogenVolumeData_exec
  end type kvs_HydrogenVolumeData

  ! Constructor
  interface kvs_HydrogenVolumeData
     procedure kvs_HydrogenVolumeData_new
  end interface kvs_HydrogenVolumeData

contains

  ! Destructor
  subroutine kvs_HydrogenVolumeData_destroy( this )
    implicit none
    type( kvs_HydrogenVolumeData ) :: this
    if ( c_associated( this % ptr ) ) then
       call C_kvs_HydrogenVolumeData_delete( this % ptr )
       this % ptr = C_NULL_ptr
    end if
  end subroutine kvs_HydrogenVolumeData_destroy

  function kvs_HydrogenVolumeData_new( other )
    implicit none
    type( kvs_HydrogenVolumeData ) :: kvs_HydrogenVolumeData_new
    type( C_ptr ), optional :: other
    if ( present( other ) ) then
       kvs_HydrogenVolumeData_new % ptr = C_kvs_HydrogenVolumeData_copy( other )
    else
       kvs_HydrogenVolumeData_new % ptr = C_kvs_HydrogenVolumeData_new()
    end if
  end function kvs_HydrogenVolumeData_new

  subroutine kvs_HydrogenVolumeData_delete( this )
    implicit none
    class( kvs_HydrogenVolumeData ) ::this
    call C_kvs_HydrogenVolumeData_delete( this%ptr )
    this%ptr = C_NULL_ptr
  end subroutine kvs_HydrogenVolumeData_delete

  subroutine kvs_HydrogenVolumeData_setResolution( this, dimx, dimy, dimz )
    implicit none
    class( kvs_HydrogenVolumeData ) ::this
    integer, intent( in ) :: dimx, dimy, dimz
    call C_kvs_HydrogenVolumeData_setResolution( this % ptr, dimx, dimy, dimz )
  end subroutine kvs_HydrogenVolumeData_setResolution

  function kvs_HydrogenVolumeData_exec( this )
    implicit none
    class( kvs_HydrogenVolumeData ), intent( in ) :: this
    type( kvs_StructuredVolumeObject ) :: kvs_HydrogenVolumeData_exec
    kvs_HydrogenVolumeData_exec = kvs_StructuredVolumeObject( C_kvs_HydrogenVolumeData_exec( this % ptr ) )
  end function kvs_HydrogenVolumeData_exec

end module kvs_HydrogenVolumeData_m
