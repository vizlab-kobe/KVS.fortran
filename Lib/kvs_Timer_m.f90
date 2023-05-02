module kvs_Timer_m
  use iso_c_binding
  implicit none

!  private
!  include "kvs_Timer_c.f90"

  ! Class definition
  public :: kvs_Timer
  type kvs_Timer
     private
     type( C_ptr ) :: ptr = C_NULL_ptr
   contains
     final :: kvs_Timer_destroy ! Destructor
     procedure :: get => kvs_Timer_get
     procedure :: delete => kvs_Timer_delete
     procedure :: start => kvs_Timer_start
     procedure :: stop => kvs_Timer_stop
     procedure :: sec => kvs_Timer_sec
  end type kvs_Timer

  ! Constructor
  interface kvs_Timer
     procedure kvs_Timer_new
  end interface kvs_Timer

  ! C interfaces
  private
  interface
     function C_kvs_Timer_new () result( this )&
          bind( C, name="Timer_new" )
       import
       type( C_ptr ) :: this
     end function C_kvs_Timer_new

     subroutine C_kvs_Timer_delete ( this )&
          bind( C, name="Timer_delete" )
       import
       type( C_ptr ), value :: this
     end subroutine C_kvs_Timer_delete

     subroutine C_kvs_Timer_start ( this )&
          bind( C, name="Timer_start" )
       import
       type( C_ptr ) :: this
     end subroutine C_kvs_Timer_start

     subroutine C_kvs_Timer_stop ( this )&
          bind( C, name="Timer_stop" )
       import
       type( C_ptr ) :: this
     end subroutine C_kvs_Timer_stop

     function C_kvs_Timer_sec (this)&
          bind( C, name="Timer_sec" )
       import
       type( C_ptr ), value :: this
       real ( C_double ) :: C_kvs_Timer_sec
     end function C_kvs_Timer_sec
  end interface

contains

  ! Destructor
  subroutine kvs_Timer_destroy( this )
    implicit none
    type( kvs_Timer ) :: this
    if ( c_associated( this % ptr ) ) then
       call C_kvs_Timer_delete( this % ptr )
       this % ptr = C_NULL_ptr
    end if
  end subroutine kvs_Timer_destroy

  function kvs_Timer_get( this )
    implicit none
    class( kvs_Timer ) :: this
    type( C_ptr ) :: kvs_Timer_get
    kvs_Timer_get = this % ptr
  end function kvs_Timer_get

  function kvs_Timer_new()
    implicit none
    type( kvs_Timer ) :: kvs_Timer_new
    kvs_Timer_new % ptr = C_kvs_Timer_new()
  end function kvs_Timer_new

  subroutine kvs_Timer_delete( this )
    implicit none
    class( kvs_Timer ) :: this
    call C_kvs_Timer_delete( this % ptr )
    this % ptr = C_NULL_ptr
  end subroutine kvs_Timer_delete

  subroutine kvs_Timer_start( this )
    implicit none
    class( kvs_Timer ) :: this
    call C_kvs_Timer_start( this % ptr )
  end subroutine kvs_Timer_start

  subroutine kvs_Timer_stop( this )
    implicit none
    class( kvs_Timer ) :: this
    call C_kvs_Timer_stop( this % ptr )
  end subroutine kvs_Timer_stop

  real( C_double ) function kvs_Timer_sec( this )
    implicit none
    class( kvs_Timer ) :: this
    kvs_Timer_sec = C_kvs_Timer_sec( this % ptr )
  end function kvs_Timer_sec

end module kvs_Timer_m
