module kvs_TornadoVolumeData_m
  use iso_c_binding
  use kvs_Vec3_m
  use kvs_StructuredVolumeObject_m
  implicit none

!  private
!  include "kvs_TornadoVolumeData_c.f90"

  ! Class definition
  public :: kvs_TornadoVolumeData
  type kvs_TornadoVolumeData
     private
     type( C_ptr ) :: ptr = C_NULL_ptr
   contains
     final :: kvs_TornadoVolumeData_destroy ! Destructor
     procedure :: delete => kvs_TornadoVolumeData_delete
     procedure :: setResolution => kvs_TornadoVolumeData_setResolution
     procedure :: setTime => kvs_TornadoVolumeData_setTime
     procedure :: exec => kvs_TornadoVolumeData_exec
  end type kvs_TornadoVolumeData

  ! Constructor
  interface kvs_TornadoVolumeData
     procedure kvs_TornadoVolumeData_new
  end interface kvs_TornadoVolumeData

  ! C interfaces
  private
  interface
     function C_kvs_TornadoVolumeData_new()&
          bind( C, name="TornadoVolumeData_new" )
       import
       type( C_ptr ) :: C_kvs_TornadoVolumeData_new
     end function C_kvs_TornadoVolumeData_new

     function C_kvs_TornadoVolumeData_copy( other )&
          bind( C, name="TornadoVolumeData_copy" )
       import
       type( C_ptr ) :: C_kvs_TornadoVolumeData_copy
       type( C_ptr ), value :: other
     end function C_kvs_TornadoVolumeData_copy

     subroutine C_kvs_TornadoVolumeData_delete ( this )&
          bind( C, name="TornadoVolumeData_delete" )
       import
       type( C_ptr ), value :: this
     end subroutine C_kvs_TornadoVolumeData_delete

     subroutine C_kvs_TornadoVolumeData_setResolution ( this, dimx, dimy, dimz )&
          bind( C, name="TornadoVolumeData_setResolution" )
       import
       type( C_ptr ), value :: this
       integer( C_int ), value :: dimx, dimy, dimz
     end subroutine C_kvs_TornadoVolumeData_setResolution

     subroutine C_kvs_TornadoVolumeData_setTime ( this, time )&
          bind( C, name="TornadoVolumeData_setTime" )
       import
       type( C_ptr ), value :: this
       integer( C_int ), value :: time
     end subroutine C_kvs_TornadoVolumeData_setTime

     function C_kvs_TornadoVolumeData_exec( this )&
          bind( C, name="TornadoVolumeData_exec" )
       import
       type( C_ptr ), value :: this
       type( C_ptr ) :: C_kvs_TornadoVolumeData_exec
     end function C_kvs_TornadoVolumeData_exec
  end interface

contains

  ! Destructor
  subroutine kvs_TornadoVolumeData_destroy( this )
    implicit none
    type( kvs_TornadoVolumeData ) :: this
    if ( c_associated( this % ptr ) ) then
       call C_kvs_TornadoVolumeData_delete( this % ptr )
       this % ptr = C_NULL_ptr
    end if
  end subroutine kvs_TornadoVolumeData_destroy

  function kvs_TornadoVolumeData_new( other )
    implicit none
    type( kvs_TornadoVolumeData ) :: kvs_TornadoVolumeData_new
    type( C_ptr ), optional :: other
    if ( present( other ) ) then
       kvs_TornadoVolumeData_new % ptr = C_kvs_TornadoVolumeData_copy( other )
    else
       kvs_TornadoVolumeData_new % ptr = C_kvs_TornadoVolumeData_new()
    end if
  end function kvs_TornadoVolumeData_new

  subroutine kvs_TornadoVolumeData_delete( this )
    implicit none
    class( kvs_TornadoVolumeData ) ::this
    call C_kvs_TornadoVolumeData_delete( this%ptr )
    this%ptr = C_NULL_ptr
  end subroutine kvs_TornadoVolumeData_delete

  subroutine kvs_TornadoVolumeData_setResolution( this, dimx, dimy, dimz )
    implicit none
    class( kvs_TornadoVolumeData ) ::this
    integer, intent( in ) :: dimx, dimy, dimz
    call C_kvs_TornadoVolumeData_setResolution( this % ptr, dimx, dimy, dimz )
  end subroutine kvs_TornadoVolumeData_setResolution

  subroutine kvs_TornadoVolumeData_setTime( this, time )
    implicit none
    class( kvs_TornadoVolumeData ) ::this
    integer, intent( in ) :: time
    call C_kvs_TornadoVolumeData_setTime( this % ptr, time )
  end subroutine kvs_TornadoVolumeData_setTime

  function kvs_TornadoVolumeData_exec( this )
    implicit none
    class( kvs_TornadoVolumeData ), intent( in ) :: this
    type( kvs_StructuredVolumeObject ) :: kvs_TornadoVolumeData_exec
    kvs_TornadoVolumeData_exec = kvs_StructuredVolumeObject( C_kvs_TornadoVolumeData_exec( this % ptr ) )
  end function kvs_TornadoVolumeData_exec

end module kvs_TornadoVolumeData_m
