module kvs_PointObject_m
  use iso_c_binding
  implicit none

  private
  include "kvs_PointObject_c.f90"

  ! Class definition
  public :: kvs_PointObject
  type kvs_PointObject
     private
     type( C_ptr ) :: ptr = C_NULL_ptr
   contains
!     final :: kvs_PointObject_finalize ! Destructor
     procedure :: get => kvs_PointObject_get
     procedure :: delete => kvs_PointObject_delete
     procedure :: print => kvs_PointObject_print
     procedure :: write => kvs_PointObject_write
     procedure :: setCoords => kvs_PointObject_setCoords
  end type kvs_PointObject

  interface kvs_PointObject ! Constructor
     procedure kvs_PointObject_new
  end interface kvs_PointObject

contains

  function kvs_PointObject_get( this )
    implicit none
    class( kvs_PointObject ) :: this
    type( C_ptr ) :: kvs_PointObject_get
    kvs_PointObject_get = this % ptr
  end function kvs_PointObject_get

  function kvs_PointObject_new( other )
    implicit none
    type( kvs_PointObject ) :: kvs_PointObject_new
    type( C_ptr ), optional :: other
    if ( present( other ) ) then
       kvs_PointObject_new % ptr = C_kvs_PointObject_copy( other )
    else
       kvs_PointObject_new % ptr = C_kvs_PointObject_new()
    end if
  end function kvs_PointObject_new

  subroutine kvs_PointObject_finalize( this )
    implicit none
    type( kvs_PointObject ) :: this
    if ( c_associated( this % ptr ) ) then
       call C_kvs_PointObject_delete( this % ptr )
       this % ptr = C_NULL_ptr
    end if
  end subroutine kvs_PointObject_finalize

  subroutine kvs_PointObject_delete( this )
    implicit none
    class( kvs_PointObject ) :: this
    call C_kvs_PointObject_delete( this % ptr )
    this % ptr = C_NULL_ptr
  end subroutine kvs_PointObject_delete

  subroutine kvs_PointObject_print( this )
    implicit none
    class( kvs_PointObject ) :: this
    call C_kvs_PointObject_print( this % ptr )
  end subroutine kvs_PointObject_print

  subroutine kvs_PointObject_read( this, filename )
    implicit none
    class( kvs_PointObject ) :: this
    character( len=1, kind=C_char ), intent( in ) :: filename(*)
    call C_kvs_PointObject_read( this % ptr, filename )
  end subroutine kvs_PointObject_read

  subroutine kvs_PointObject_write( this, filename )
    implicit none
    class( kvs_PointObject ) :: this
    character( len=1, kind=C_char ), intent( in ) :: filename(*)
    call C_kvs_PointObject_write( this % ptr, filename )
  end subroutine kvs_PointObject_write

  subroutine kvs_PointObject_setCoords( this, coords, size )
    implicit none
    class( kvs_PointObject ) :: this
    real, dimension(:), target :: coords
    integer :: size

    call C_kvs_PointObject_setCoords( this % ptr, c_loc(coords), size )
  end subroutine kvs_PointObject_setCoords

end module kvs_PointObject_m
