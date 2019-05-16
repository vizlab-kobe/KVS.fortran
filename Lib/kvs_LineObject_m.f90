module kvs_LineObject_m
  use iso_c_binding
  implicit none

  private
  include "kvs_LineObject_c.f90"

  ! Class definition
  public :: kvs_LineObject
  type kvs_LineObject
     private
     type( C_ptr ) :: ptr = C_NULL_ptr
  contains
     final :: kvs_LineObject_finalize ! Destructor
     procedure :: get => kvs_LineObject_get
     procedure :: delete => kvs_LineObject_delete
     procedure :: setSize => kvs_LineObject_setSize
  end type kvs_LineObject

  interface kvs_LineObject ! Constructor
    procedure kvs_LineObject_new
  end interface kvs_LineObject

  contains

  function kvs_LineObject_get( this )
    implicit none
    class( kvs_LineObject ) :: this
    type( C_ptr ) :: kvs_LineObject_get
    kvs_LineObject_get = this % ptr
  end function kvs_LineObject_get

  function kvs_LineObject_new( other )
    implicit none
    type( kvs_LineObject ) :: kvs_LineObject_new
    type( C_ptr ), optional :: other
    if ( present( other ) ) then
       kvs_LineObject_new % ptr = C_kvs_LineObject_copy( other )
    else
       kvs_LineObject_new % ptr = C_kvs_LineObject_new()
    end if
  end function kvs_LineObject_new

  subroutine kvs_LineObject_finalize( this )
    implicit none
    type( kvs_LineObject ) :: this
    if ( c_associated( this % ptr ) ) then
       call C_kvs_LineObject_delete( this % ptr )
       this % ptr = C_NULL_ptr
    end if
  end subroutine kvs_LineObject_finalize

  subroutine kvs_LineObject_delete( this )
    implicit none
    class( kvs_LineObject ) :: this
    call C_kvs_LineObject_delete( this % ptr )
    this % ptr = C_NULL_ptr
  end subroutine kvs_LineObject_delete

  subroutine kvs_LineObject_setSize( this, line_size )
    implicit none
    class( kvs_LineObject ) :: this
    real( C_float ), value :: line_size
    call C_kvs_LineObject_setSize( this % ptr, line_size )
  end subroutine kvs_LineObject_setSize

end module kvs_LineObject_m
