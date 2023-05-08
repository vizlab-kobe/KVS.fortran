module kvs_PolygonObject_m
  use iso_c_binding
  implicit none

  ! Class definition
  public :: kvs_PolygonObject
  type kvs_PolygonObject
     private
     type( C_ptr ) :: ptr = C_NULL_ptr
   contains
     final :: kvs_PolygonObject_destroy ! Destructor
     procedure :: get => kvs_PolygonObject_get
     procedure :: delete => kvs_PolygonObject_delete
     procedure :: print => kvs_PolygonObject_print
     procedure :: write => kvs_PolygonObject_write
  end type kvs_PolygonObject

  ! Constructor
  interface kvs_PolygonObject
     procedure kvs_PolygonObject_new
  end interface kvs_PolygonObject

  ! C interface
  private
  interface
     function C_kvs_PolygonObject_new()&
          bind( C, name="PolygonObject_new" )
       import
       type( C_ptr ) :: C_kvs_PolygonObject_new
     end function C_kvs_PolygonObject_new

     function C_kvs_PolygonObject_copy( other, move )&
          bind( C, name="PolygonObject_copy" )
       import
       type( C_ptr ) :: C_kvs_PolygonObject_copy
       type( C_ptr ), value :: other
       logical, optional :: move
     end function C_kvs_PolygonObject_copy

     subroutine C_kvs_PolygonObject_delete( this )&
          bind( C, name="PolygonObject_delete" )
       import
       type( C_ptr ), value :: this
     end subroutine C_kvs_PolygonObject_delete

     subroutine C_kvs_PolygonObject_print( this )&
          bind( C, name="PolygonObject_print" )
       import
       type( C_ptr ), value :: this
     end subroutine C_kvs_PolygonObject_print

     subroutine C_kvs_PolygonObject_read( this, filename )&
          bind( C, name="PolygonObject_read" )
       import
       type( C_ptr ), value :: this
       character( len=1, kind=C_char ), intent( in ) :: filename(*)
     end subroutine C_kvs_PolygonObject_read

     subroutine C_kvs_PolygonObject_write( this, filename )&
          bind( C, name="PolygonObject_write" )
       import
       type( C_ptr ), value :: this
       character( len=1, kind=C_char ), intent( in ) :: filename(*)
     end subroutine C_kvs_PolygonObject_write
  end interface

contains

  ! Destructor
  subroutine kvs_PolygonObject_destroy( this )
    implicit none
    type( kvs_PolygonObject ) :: this
    if ( c_associated( this % ptr ) ) then
       call C_kvs_PolygonObject_delete( this % ptr )
       this % ptr = C_NULL_ptr
    end if
  end subroutine kvs_PolygonObject_destroy

  function kvs_PolygonObject_get( this )
    implicit none
    class( kvs_PolygonObject ) :: this
    type( C_ptr ) :: kvs_PolygonObject_get
    kvs_PolygonObject_get = this % ptr
  end function kvs_PolygonObject_get

  function kvs_PolygonObject_new( other, move )
    implicit none
    type( kvs_PolygonObject ) :: kvs_PolygonObject_new
    type( C_ptr ), optional :: other
    logical, optional :: move
    if ( present( other ) ) then
       if ( present( move ) ) then
          kvs_PolygonObject_new % ptr = C_kvs_PolygonObject_copy( other, move )
          if ( move ) other = C_NULL_ptr
       else
          kvs_PolygonObject_new % ptr = C_kvs_PolygonObject_copy( other, .false. )
       endif
    else
       kvs_PolygonObject_new % ptr = C_kvs_PolygonObject_new()
    end if
  end function kvs_PolygonObject_new

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
