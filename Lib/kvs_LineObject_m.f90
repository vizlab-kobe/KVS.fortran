module kvs_LineObject_m
  use iso_c_binding
  implicit none

  ! Class definition
  public :: kvs_LineObject
  type kvs_LineObject
     private
     type( C_ptr ) :: ptr = C_NULL_ptr
   contains
     procedure :: get => kvs_LineObject_get
     procedure :: delete => kvs_LineObject_delete
     procedure :: setName => kvs_LineObject_setName
     procedure :: setSize => kvs_LineObject_setSize
  end type kvs_LineObject

  ! Constructor
  interface kvs_LineObject
     procedure kvs_LineObject_new
  end interface kvs_LineObject

  ! C interfaces
  private
  interface
     function C_kvs_LineObject_new () result( this )&
          bind( C, name="LineObject_new" )
       import
       type( C_ptr ) :: this
     end function C_kvs_LineObject_new

     function C_kvs_LineObject_copy( other, move )&
          bind( C, name="LineObject_copy" )
       import
       type( C_ptr ) :: C_kvs_LineObject_copy
       type( C_ptr ), value :: other
       logical( C_bool ), optional :: move
     end function C_kvs_LineObject_copy

     subroutine C_kvs_LineObject_delete ( this )&
          bind( C, name="LineObject_delete" )
       import
       type( C_ptr ), value :: this
     end subroutine C_kvs_LineObject_delete

     subroutine C_kvs_LineObject_setName( this, name )&
          bind( C, name="LineObject_setName" )
       import
       type( C_ptr ), value :: this
       character( len=1, kind=C_char ), intent( in ) :: name(*)
     end subroutine C_kvs_LineObject_setName

     subroutine C_kvs_LineObject_print( this )&
          bind( C, name="LineObject_print" )
       import
       type( C_ptr ), value :: this
     end subroutine C_kvs_LineObject_print

     subroutine C_kvs_LineObject_read( this, filename )&
          bind( C, name="LineObject_read" )
       import
       type( C_ptr ), value :: this
       character( len=1, kind=C_char ), intent( in ) :: filename(*)
     end subroutine C_kvs_LineObject_read

     subroutine C_kvs_LineObject_write( this, filename )&
          bind( C, name="LineObject_write" )
       import
       type( C_ptr ), value :: this
       character( len=1, kind=C_char ), intent( in ) :: filename(*)
     end subroutine C_kvs_LineObject_write

     subroutine C_kvs_LineObject_setSize( this, line_size )&
          bind( C, name="LineObject_setSize" )
       import
       type( C_ptr ), value :: this
       real( C_float ), value :: line_size
     end subroutine C_kvs_LineObject_setSize
  end interface

contains

  function kvs_LineObject_get( this )
    implicit none
    class( kvs_LineObject ) :: this
    type( C_ptr ) :: kvs_LineObject_get
    kvs_LineObject_get = this % ptr
  end function kvs_LineObject_get

  function kvs_LineObject_new( other, move )
    implicit none
    type( kvs_LineObject ) :: kvs_LineObject_new
    type( C_ptr ), optional :: other
    logical, optional :: move
    if ( present( other ) ) then
       if ( present( move ) ) then
          kvs_LineObject_new % ptr = C_kvs_LineObject_copy( other, logical( move, kind=c_bool ) )
          if ( move ) other = C_NULL_ptr
       else
          kvs_LineObject_new % ptr = C_kvs_LineObject_copy( other, .false._c_bool )
       endif
    else
       kvs_LineObject_new % ptr = C_kvs_LineObject_new()
    end if
  end function kvs_LineObject_new

  subroutine kvs_LineObject_delete( this )
    implicit none
    class( kvs_LineObject ) :: this
    call C_kvs_LineObject_delete( this % ptr )
    this % ptr = C_NULL_ptr
  end subroutine kvs_LineObject_delete

  subroutine kvs_LineObject_setName( this, name )
    implicit none
    class( kvs_LineObject ) :: this
    character( len=*, kind=C_char ), intent( in ) :: name
    call C_kvs_LineObject_setName( this % ptr, name // C_null_char )
  end subroutine kvs_LineObject_setName

  subroutine kvs_LineObject_print( this )
    implicit none
    class( kvs_LineObject ) :: this
    call C_kvs_LineObject_print( this % ptr )
  end subroutine kvs_LineObject_print

  subroutine kvs_LineObject_read( this, filename )
    implicit none
    class( kvs_LineObject ) :: this
    character( len=*, kind=C_char ), intent( in ) :: filename
    call C_kvs_LineObject_read( this % ptr, filename // C_null_char )
  end subroutine kvs_LineObject_read

  subroutine kvs_LineObject_write( this, filename )
    implicit none
    class( kvs_LineObject ) :: this
    character( len=*, kind=C_char ), intent( in ) :: filename
    call C_kvs_LineObject_write( this % ptr, filename // C_null_char )
  end subroutine kvs_LineObject_write

  subroutine kvs_LineObject_setSize( this, line_size )
    implicit none
    class( kvs_LineObject ) :: this
    real( C_float ), value :: line_size
    call C_kvs_LineObject_setSize( this % ptr, line_size )
  end subroutine kvs_LineObject_setSize

end module kvs_LineObject_m
