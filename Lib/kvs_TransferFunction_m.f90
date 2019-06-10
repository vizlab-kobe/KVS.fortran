module kvs_TransferFunction_m
  use iso_c_binding
  implicit none

  private
  include "kvs_TransferFunction_c.f90"

  ! Class definition
  public :: kvs_TransferFunction
  type kvs_TransferFunction
     private
     type( C_ptr ) :: ptr = C_NULL_ptr
  contains
     final :: kvs_TransferFunction_finalize ! Destructor
     procedure :: get => kvs_TransferFunction_get
     procedure :: delete => kvs_TransferFunction_delete
  end type kvs_TransferFunction

  interface kvs_TransferFunction ! Constructor
    procedure kvs_TransferFunction_new
  end interface kvs_TransferFunction

  contains

  function kvs_TransferFunction_get( this )
    implicit none
    class( kvs_TransferFunction ) :: this
    type( C_ptr ) :: kvs_TransferFunction_get
    kvs_TransferFunction_get = this % ptr
  end function kvs_TransferFunction_get

  function kvs_TransferFunction_new()
    implicit none
    type( kvs_TransferFunction ) :: kvs_TransferFunction_new
     kvs_TransferFunction_new % ptr = C_kvs_TransferFunction_new()
  end function kvs_TransferFunction_new

  subroutine kvs_TransferFunction_finalize( this )
    implicit none
    type( kvs_TransferFunction ) :: this
    if ( c_associated( this % ptr ) ) then
       call C_kvs_TransferFunction_delete( this % ptr )
       this % ptr = C_NULL_ptr
    end if
  end subroutine kvs_TransferFunction_finalize

  subroutine kvs_TransferFunction_delete( this )
    implicit none
    class( kvs_TransferFunction ) :: this
    call C_kvs_TransferFunction_delete( this % ptr )
    this % ptr = C_NULL_ptr
  end subroutine kvs_TransferFunction_delete

end module kvs_TransferFunction_m
