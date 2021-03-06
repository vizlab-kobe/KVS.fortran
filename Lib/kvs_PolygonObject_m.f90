module kvs_PolygonObject_m
  use iso_c_binding
  implicit none

  private
  include "kvs_PolygonObject_c.f90"

  ! Class definition
  public :: kvs_PolygonObject
  type kvs_PolygonObject
     private
     type( C_ptr ) :: ptr = C_NULL_ptr
   contains
!     final :: kvs_PolygonObject_finalize ! Destructor
     procedure :: get => kvs_PolygonObject_get
     procedure :: delete => kvs_PolygonObject_delete
     procedure :: print => kvs_PolygonObject_print
     procedure :: write => kvs_PolygonObject_write
  end type kvs_PolygonObject

  interface kvs_PolygonObject ! Constructor
     procedure kvs_PolygonObject_new
  end interface kvs_PolygonObject

contains

  function kvs_PolygonObject_get( this )
    implicit none
    class( kvs_PolygonObject ) :: this
    type( C_ptr ) :: kvs_PolygonObject_get
    kvs_PolygonObject_get = this % ptr
  end function kvs_PolygonObject_get

  function kvs_PolygonObject_new( other )
    implicit none
    type( kvs_PolygonObject ) :: kvs_PolygonObject_new
    type( C_ptr ), optional :: other
    if ( present( other ) ) then
       kvs_PolygonObject_new % ptr = C_kvs_PolygonObject_copy( other )
    else
       kvs_PolygonObject_new % ptr = C_kvs_PolygonObject_new()
    end if
  end function kvs_PolygonObject_new

  subroutine kvs_PolygonObject_finalize( this )
    implicit none
    type( kvs_PolygonObject ) :: this
    if ( c_associated( this % ptr ) ) then
       call C_kvs_PolygonObject_delete( this % ptr )
       this % ptr = C_NULL_ptr
    end if
  end subroutine kvs_PolygonObject_finalize

  subroutine kvs_PolygonObject_delete( this )
    implicit none
    class( kvs_PolygonObject ) :: this
    call C_kvs_PolygonObject_delete( this % ptr )
    this % ptr = C_NULL_ptr
  end subroutine kvs_PolygonObject_delete

  subroutine kvs_PolygonObject_print( this )
    implicit none
    class( kvs_PolygonObject ) :: this
    call C_kvs_PolygonObject_print( this % ptr )
  end subroutine kvs_PolygonObject_print

  subroutine kvs_PolygonObject_read( this, filename )
    implicit none
    class( kvs_PolygonObject ) :: this
    character( len=*, kind=C_char ), intent( in ) :: filename
    call C_kvs_PolygonObject_read( this % ptr, filename // C_null_char )
  end subroutine kvs_PolygonObject_read

  subroutine kvs_PolygonObject_write( this, filename )
    implicit none
    class( kvs_PolygonObject ) :: this
    character( len=*, kind=C_char ), intent( in ) :: filename
    call C_kvs_PolygonObject_write( this % ptr, filename // C_null_char )
  end subroutine kvs_PolygonObject_write

end module kvs_PolygonObject_m
