module kvs_HydrogenVolumeData_m
  use iso_c_binding
  use kvs_Vec3_m
  use kvs_StructuredVolumeObject_m
  implicit none

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

  ! C interfaces
  private
    interface
     function C_kvs_HydrogenVolumeData_new()&
          bind( C, name="HydrogenVolumeData_new" )
       import
       type( C_ptr ) :: C_kvs_HydrogenVolumeData_new
     end function C_kvs_HydrogenVolumeData_new

     subroutine C_kvs_HydrogenVolumeData_delete ( this )&
          bind( C, name="HydrogenVolumeData_delete" )
       import
       type( C_ptr ), value :: this
     end subroutine C_kvs_HydrogenVolumeData_delete

     subroutine C_kvs_HydrogenVolumeData_setResolution ( this, dimx, dimy, dimz )&
          bind( C, name="HydrogenVolumeData_setResolution" )
       import
       type( C_ptr ), value :: this
       integer( C_int ), value :: dimx, dimy, dimz
     end subroutine C_kvs_HydrogenVolumeData_setResolution

     function C_kvs_HydrogenVolumeData_exec( this )&
          bind( C, name="HydrogenVolumeData_exec" )
       import
       type( C_ptr ), value :: this
       type( C_ptr ) :: C_kvs_HydrogenVolumeData_exec
     end function C_kvs_HydrogenVolumeData_exec
  end interface

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

  function kvs_HydrogenVolumeData_new()
    implicit none
    type( kvs_HydrogenVolumeData ) :: kvs_HydrogenVolumeData_new
    kvs_HydrogenVolumeData_new % ptr = C_kvs_HydrogenVolumeData_new()
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
