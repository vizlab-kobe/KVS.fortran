module kvs_Application_m
  use iso_c_binding
  implicit none

  !> Class definition
  public :: kvs_Application
  type kvs_Application
     private
     type( C_ptr ) :: ptr = C_NULL_ptr
   contains
     final :: kvs_Application_destroy ! Destructor
     procedure :: get => kvs_Application_get
     procedure :: delete => kvs_Application_delete
     procedure :: run => kvs_Application_run
     procedure :: quit => kvs_Application_quit
  end type kvs_Application

  !> Constructor
  interface kvs_Application
     procedure kvs_Application_new
  end interface kvs_Application

  ! C interfaces
  private
  interface
     function C_kvs_Application_new()&
          bind( C, name="Application_new" )
       import
       type( C_ptr ) :: C_kvs_Application_new
     end function C_kvs_Application_new

     subroutine C_kvs_Application_delete( this )&
          bind( C, name="Application_delete" )
       import
       type( C_ptr ), value :: this
     end subroutine C_kvs_Application_delete

     subroutine C_kvs_Application_run( this )&
          bind( C, name="Application_run" )
       import
       type( C_ptr ), value :: this
     end subroutine C_kvs_Application_run

     subroutine C_kvs_Application_quit( this )&
          bind( C, name="Application_quit" )
       import
       type( C_ptr ), value :: this
     end subroutine C_kvs_Application_quit
  end interface

contains

  !> Destructor
  subroutine kvs_Application_destroy( this )
    implicit none
    type( kvs_Application ) :: this
    if ( c_associated( this % ptr ) ) then
       call C_kvs_Application_delete( this % ptr )
       this % ptr = C_NULL_ptr
    endif
  end subroutine kvs_Application_destroy

  !> Returns pointer to the application class
  function kvs_Application_get( this )
    implicit none
    class( kvs_Application ) :: this
    type( C_ptr ) :: kvs_Application_get
    kvs_Application_get = this % ptr
  end function kvs_Application_get

  function kvs_Application_new()
    implicit none
    type( kvs_Application ) :: kvs_Application_new
    kvs_Application_new % ptr = C_kvs_Application_new()
  end function kvs_Application_new

  subroutine kvs_Application_delete( this )
    implicit none
    class( kvs_Application ) :: this
    call C_kvs_Application_delete( this % ptr )
    this % ptr = C_NULL_ptr
  end subroutine kvs_Application_delete

  subroutine kvs_Application_run( this )
    implicit none
    class( kvs_Application ) :: this
    call C_kvs_Application_run( this % ptr )
  end subroutine kvs_Application_run

  subroutine kvs_Application_quit( this )
    implicit none
    class( kvs_Application ) :: this
    call C_kvs_Application_quit( this % ptr )
  end subroutine kvs_Application_quit

end module kvs_Application_m
