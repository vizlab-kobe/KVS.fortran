module kvs_PointObject_m
  use iso_c_binding
  implicit none

  ! Class definition
  public :: kvs_PointObject
  type kvs_PointObject
     private
     type( C_ptr ) :: ptr = C_NULL_ptr
   contains
     final :: kvs_PointObject_destroy ! Destructor
     procedure :: get => kvs_PointObject_get
     procedure :: delete => kvs_PointObject_delete
     procedure :: print => kvs_PointObject_print
     procedure :: write => kvs_PointObject_write
     procedure :: setCoords => kvs_PointObject_setCoords
  end type kvs_PointObject

  ! Constructor
  interface kvs_PointObject
     procedure kvs_PointObject_new
  end interface kvs_PointObject

  ! C interfaces
  private
    interface
     function C_kvs_PointObject_new()&
          bind( C, name="PointObject_new" )
       import
       type( C_ptr ) :: C_kvs_PointObject_new
     end function C_kvs_PointObject_new

     function C_kvs_PointObject_copy( other, move )&
          bind( C, name="PointObject_copy" )
       import
       type( C_ptr ) :: C_kvs_PointObject_copy
       type( C_ptr ), value :: other
       logical, value :: move
     end function C_kvs_PointObject_copy

     subroutine C_kvs_PointObject_delete( this )&
          bind( C, name="PointObject_delete" )
       import
       type( C_ptr ), value :: this
     end subroutine C_kvs_PointObject_delete

     subroutine C_kvs_PointObject_print( this )&
          bind( C, name="PointObject_print" )
       import
       type( C_ptr ), value :: this
     end subroutine C_kvs_PointObject_print

     subroutine C_kvs_PointObject_read( this, filename )&
          bind( C, name="PointObject_read" )
       import
       type( C_ptr ), value :: this
       character( len=1, kind=C_char ), intent( in ) :: filename(*)
     end subroutine C_kvs_PointObject_read

     subroutine C_kvs_PointObject_write( this, filename )&
          bind( C, name="PointObject_write" )
       import
       type( C_ptr ), value :: this
       character( len=1, kind=C_char ), intent( in ) :: filename(*)
     end subroutine C_kvs_PointObject_write

     subroutine C_Kvs_PointObject_setCoords( this, coords, size )&
          bind( C, name="PointObject_setCoords" )
       import
       type( C_ptr ), value :: this
       type( C_ptr ), value :: coords
       integer( C_int ), value :: size
     end subroutine C_kvs_PointObject_setCoords
  end interface

contains

  ! Destructor
  subroutine kvs_PointObject_destroy( this )
    implicit none
    type( kvs_PointObject ) :: this
    if ( c_associated( this % ptr ) ) then
       call C_kvs_PointObject_delete( this % ptr )
       this % ptr = C_NULL_ptr
    end if
  end subroutine kvs_PointObject_destroy

  function kvs_PointObject_get( this )
    implicit none
    class( kvs_PointObject ) :: this
    type( C_ptr ) :: kvs_PointObject_get
    kvs_PointObject_get = this % ptr
  end function kvs_PointObject_get

  function kvs_PointObject_new( other, move )
    implicit none
    type( kvs_PointObject ) :: kvs_PointObject_new
    type( C_ptr ), optional :: other
    logical, optional :: move
    if ( present( other ) ) then
       if ( present( move ) ) then
          kvs_PointObject_new % ptr = C_kvs_PointObject_copy( other, move )
          if ( move ) other = C_NULL_ptr
       else
          kvs_PointObject_new % ptr = C_kvs_PointObject_copy( other, .false. )
       endif
    else
       kvs_PointObject_new % ptr = C_kvs_PointObject_new()
    end if
  end function kvs_PointObject_new

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
    character( len=*, kind=C_char ), intent( in ) :: filename
    call C_kvs_PointObject_read( this % ptr, filename // C_null_char )
  end subroutine kvs_PointObject_read

  subroutine kvs_PointObject_write( this, filename )
    implicit none
    class( kvs_PointObject ) :: this
    character( len=*, kind=C_char ), intent( in ) :: filename
    call C_kvs_PointObject_write( this % ptr, filename // C_null_char )
  end subroutine kvs_PointObject_write

  subroutine kvs_PointObject_setCoords( this, coords, size )
    implicit none
    class( kvs_PointObject ) :: this
    real, dimension(:), target :: coords
    integer :: size
    call C_kvs_PointObject_setCoords( this % ptr, c_loc( coords ), size )
  end subroutine kvs_PointObject_setCoords

end module kvs_PointObject_m
