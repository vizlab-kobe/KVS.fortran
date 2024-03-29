module kvs_StructuredVolumeObject_m
  use iso_c_binding
  use kvs_Vec3_m
  implicit none

  ! Class definition
  public :: kvs_StructuredVolumeObject
  type kvs_StructuredVolumeObject
     private
     type( C_ptr ) :: ptr = C_NULL_ptr
   contains
     procedure :: get => kvs_StructuredVolumeObject_get
     procedure :: delete => kvs_StructuredVolumeObject_delete
     procedure :: setName => kvs_StructuredVolumeObject_setName
     procedure :: setGridTypeToUniform => kvs_StructuredVolumeObject_setGridTypeToUniform
     procedure :: setResolution => kvs_StructuredVolumeObject_setResolution
     procedure :: setVeclen => kvs_StructuredVolumeObject_setVeclen
     procedure :: setValues => kvs_StructuredVolumeObject_setValues
     procedure :: setMinMaxValues => kvs_StructuredVolumeObject_setMinMaxValues
     procedure :: updateMinMaxCoords => kvs_StructuredVolumeObject_updateMinMaxCoords
     procedure :: updateMinMaxValues => kvs_StructuredVolumeObject_updateMinMaxValues
     procedure :: print => kvs_StructuredVolumeObject_print
     procedure :: read => kvs_StructuredVolumeObject_read
     procedure :: write => kvs_StructuredVolumeObject_write
     procedure :: numberOfNodes => kvs_StructuredVolumeObject_numberOfNodes
     procedure :: minValue => kvs_StructuredVolumeObject_minValue
     procedure :: maxValue => kvs_StructuredVolumeObject_maxValue
  end type kvs_StructuredVolumeObject

  ! Constructor
  interface kvs_StructuredVolumeObject
     procedure kvs_StructuredVolumeObject_new
  end interface kvs_StructuredVolumeObject

  ! C interfaces
  private
  interface
     function C_kvs_StructuredVolumeObject_new()&
          bind( C, name="StructuredVolumeObject_new" )
       import
       type( C_ptr ) :: C_kvs_StructuredVolumeObject_new
     end function C_kvs_StructuredVolumeObject_new

     function C_kvs_StructuredVolumeObject_copy( other, move )&
          bind( C, name="StructuredVolumeObject_copy" )
       import
       type( C_ptr ) :: C_kvs_StructuredVolumeObject_copy
       type( C_ptr ), value :: other
       logical( C_bool ), optional :: move
     end function C_kvs_StructuredVolumeObject_copy

     subroutine C_kvs_StructuredVolumeObject_delete ( this )&
          bind( C, name="StructuredVolumeObject_delete" )
       import
       type( C_ptr ), value :: this
     end subroutine C_kvs_StructuredVolumeObject_delete

     subroutine C_kvs_StructuredVolumeObject_setName( this, name )&
          bind( C, name="StructuredVolumeObject_setName" )
       import
       type( C_ptr ), value :: this
       character( len=1, kind=C_char ), intent( in ) :: name(*)
     end subroutine C_kvs_StructuredVolumeObject_setName

     subroutine C_kvs_StructuredVolumeObject_setGridTypeToUniform( this )&
          bind( C, name="StructuredVolumeObject_setGridTypeToUniform" )
       import
       type( C_ptr ), value :: this
     end subroutine C_kvs_StructuredVolumeObject_setGridTypeToUniform

     subroutine C_kvs_StructuredVolumeObject_setResolution( this, dimx, dimy, dimz )&
          bind( C, name="StructuredVolumeObject_setResolution" )
       import
       type( C_ptr ), value :: this
       integer( C_int ), value :: dimx
       integer( C_int ), value :: dimy
       integer( C_int ), value :: dimz
     end subroutine C_kvs_StructuredVolumeObject_setResolution

     subroutine C_kvs_StructuredVolumeObject_setVeclen( this, veclen )&
          bind( C, name="StructuredVolumeObject_setVeclen" )
       import
       type( C_ptr ), value :: this
       integer( C_int ), value :: veclen
     end subroutine C_kvs_StructuredVolumeObject_setVeclen

     subroutine C_kvs_StructuredVolumeObject_setValues( this, values, nvalues )&
          bind( C, name="StructuredVolumeObject_setValues" )
       import
       type( C_ptr ), value :: this
       real( C_double ) :: values(nvalues)
       integer( C_int ), value :: nvalues
     end subroutine C_kvs_StructuredVolumeObject_setValues

     subroutine C_kvs_StructuredVolumeObject_setMinMaxValues( this, min_value, max_value )&
          bind( C, name="StructuredVolumeObject_setMinMaxValues" )
       import
       type( C_ptr ), value :: this
       real( C_double ), value :: min_value, max_value
     end subroutine C_kvs_StructuredVolumeObject_setMinMaxValues

     subroutine C_kvs_StructuredVolumeObject_updateMinMaxCoords( this )&
          bind( C, name="StructuredVolumeObject_updateMinMaxCoords" )
       import
       type( C_ptr ), value :: this
     end subroutine C_kvs_StructuredVolumeObject_updateMinMaxCoords

     subroutine C_kvs_StructuredVolumeObject_updateMinMaxValues( this )&
          bind( C, name="StructuredVolumeObject_updateMinMaxValues" )
       import
       type( C_ptr ), value :: this
     end subroutine C_kvs_StructuredVolumeObject_updateMinMaxValues

     subroutine C_kvs_StructuredVolumeObject_print( this )&
          bind( C, name="StructuredVolumeObject_print" )
       import
       type( C_ptr ), value :: this
     end subroutine C_kvs_StructuredVolumeObject_print

     subroutine C_kvs_StructuredVolumeObject_read( this, filename )&
          bind( C, name="StructuredVolumeObject_read" )
       import
       type( C_ptr ), value :: this
       character( len=1, kind=C_char ), intent( in ) :: filename(*)
     end subroutine C_kvs_StructuredVolumeObject_read

     subroutine C_kvs_StructuredVolumeObject_write( this, filename )&
          bind( C, name="StructuredVolumeObject_write" )
       import
       type( C_ptr ), value :: this
       character( len=1, kind=C_char ), intent( in ) :: filename(*)
     end subroutine C_kvs_StructuredVolumeObject_write

     function C_kvs_StructuredVolumeObject_numberOfNodes( this )&
          bind( C, name="StructuredVolumeObject_numberOfNodes" )
       import
       type( C_ptr ), value :: this
       integer( C_size_t ) :: C_kvs_StructuredVolumeObject_numberOfNodes
     end function C_kvs_StructuredVolumeObject_numberOfNodes

     function C_kvs_StructuredVolumeObject_minValue( this )&
          bind( C, name="StructuredVolumeObject_minValue" )
       import
       type( C_ptr ), value :: this
       real( C_double ) :: C_kvs_StructuredVolumeObject_minValue
     end function C_kvs_StructuredVolumeObject_minValue

     function C_kvs_StructuredVolumeObject_maxValue( this )&
          bind( C, name="StructuredVolumeObject_maxValue" )
       import
       type( C_ptr ), value :: this
       real( C_double ) :: C_kvs_StructuredVolumeObject_maxValue
     end function C_kvs_StructuredVolumeObject_maxValue
  end interface

contains

  function kvs_StructuredVolumeObject_get( this )
    implicit none
    class( kvs_StructuredVolumeObject ) :: this
    type( C_ptr ) :: kvs_StructuredVolumeObject_get
    kvs_StructuredVolumeObject_get = this % ptr
  end function kvs_StructuredVolumeObject_get

  function kvs_StructuredVolumeObject_new( other, move )
    implicit none
    type( kvs_StructuredVolumeObject ) :: kvs_StructuredVolumeObject_new
    type( C_ptr ), optional :: other
    logical, optional :: move
    if ( present( other ) ) then
       if ( present( move ) ) then
          kvs_StructuredVolumeObject_new % ptr = C_kvs_StructuredVolumeObject_copy( other, logical( move, kind=C_bool ) )
          if ( move ) other = C_NULL_ptr
       else
          kvs_StructuredVolumeObject_new % ptr = C_kvs_StructuredVolumeObject_copy( other, .false._c_bool )
       endif
    else
       kvs_StructuredVolumeObject_new % ptr = C_kvs_StructuredVolumeObject_new()
    end if
  end function kvs_StructuredVolumeObject_new

  subroutine kvs_StructuredVolumeObject_delete( this )
    implicit none
    class( kvs_StructuredVolumeObject ) :: this
    call C_kvs_StructuredVolumeObject_delete( this % ptr )
    this % ptr = C_NULL_ptr
  end subroutine kvs_StructuredVolumeObject_delete

  subroutine kvs_StructuredVolumeObject_setName( this, name )
    implicit none
    class( kvs_StructuredVolumeObject ) :: this
    character( len=*, kind=C_char ), intent( in ) :: name
    call C_kvs_StructuredVolumeObject_setName( this % ptr, name // C_null_char )
  end subroutine kvs_StructuredVolumeObject_setName

  subroutine kvs_StructuredVolumeObject_setGridTypeToUniform( this )
    implicit none
    class( kvs_StructuredVolumeObject ), intent( in ) :: this
    call C_kvs_StructuredVolumeObject_setGridTypeToUniform( this % ptr )
  end subroutine kvs_StructuredVolumeObject_setGridTypeToUniform

  subroutine kvs_StructuredVolumeObject_setResolution( this, resolution )
    implicit none
    class( kvs_StructuredVolumeObject ), intent( in ) :: this
    class( kvs_Vec3i ), intent( in ) :: resolution
    call C_kvs_StructuredVolumeObject_setResolution( this % ptr, resolution % x, resolution % y, resolution % z )
  end subroutine kvs_StructuredVolumeObject_setResolution

  subroutine kvs_StructuredVolumeObject_setVeclen( this, veclen )
    implicit none
    class( kvs_StructuredVolumeObject ), intent( in ) :: this
    integer( C_int ), intent( in ) :: veclen
    call C_kvs_StructuredVolumeObject_setVeclen( this % ptr, veclen )
  end subroutine kvs_StructuredVolumeObject_setVeclen

  subroutine kvs_StructuredVolumeObject_setValues( this, values, nvalues )
    implicit none
    class( kvs_StructuredVolumeObject ), intent( in ) :: this
    real( C_double ), intent( in ) :: values(nvalues)
    integer( C_int ), intent( in ) :: nvalues
    call C_kvs_StructuredVolumeObject_setValues( this % ptr, values, nvalues )
  end subroutine kvs_StructuredVolumeObject_setValues

  subroutine kvs_StructuredVolumeObject_setMinMaxValues( this, min_value, max_value )
    implicit none
    class( kvs_StructuredVolumeObject ), intent( in ) :: this
    real( C_double ), intent( in ) :: min_value, max_value
    call C_kvs_StructuredVolumeObject_setMinMaxValues( this % ptr, min_value, max_value )
  end subroutine kvs_StructuredVolumeObject_setMinMaxValues

  subroutine kvs_StructuredVolumeObject_updateMinMaxCoords( this )
    implicit none
    class( kvs_StructuredVolumeObject ), intent( in ) :: this
    call C_kvs_StructuredVolumeObject_updateMinMaxCoords( this % ptr )
  end subroutine kvs_StructuredVolumeObject_updateMinMaxCoords

  subroutine kvs_StructuredVolumeObject_updateMinMaxValues( this )
    implicit none
    class( kvs_StructuredVolumeObject ), intent( in ) :: this
    call C_kvs_StructuredVolumeObject_updateMinMaxValues( this % ptr )
  end subroutine kvs_StructuredVolumeObject_updateMinMaxValues

  subroutine kvs_StructuredVolumeObject_print( this )
    implicit none
    class( kvs_StructuredVolumeObject ), intent( in ) :: this
    call C_kvs_StructuredVolumeObject_print( this % ptr )
  end subroutine kvs_StructuredVolumeObject_print

  subroutine kvs_StructuredVolumeObject_read( this, filename )
    implicit none
    class( kvs_StructuredVolumeObject ) :: this
    character( len=*, kind=C_char ), intent( in ) :: filename
    call C_kvs_StructuredVolumeObject_read( this % ptr, filename // C_null_char )
  end subroutine kvs_StructuredVolumeObject_read

  subroutine kvs_StructuredVolumeObject_write( this, filename )
    implicit none
    class( kvs_StructuredVolumeObject ) :: this
    character( len=*, kind=C_char ), intent( in ) :: filename
    call C_kvs_StructuredVolumeObject_write( this % ptr, filename // C_null_char )
  end subroutine kvs_StructuredVolumeObject_write

  integer( C_size_t ) function kvs_StructuredVolumeObject_numberOfNodes( this )
    implicit none
    class( kvs_StructuredVolumeObject ) :: this
    kvs_StructuredVolumeObject_numberOfNodes = C_kvs_StructuredVolumeObject_numberOfNodes( this % ptr )
  end function kvs_StructuredVolumeObject_numberOfNodes

  real( C_double ) function kvs_StructuredVolumeObject_minValue( this )
    implicit none
    class( kvs_StructuredVolumeObject ) :: this
    kvs_StructuredVolumeObject_minValue = C_kvs_StructuredVolumeObject_minValue( this % ptr )
  end function kvs_StructuredVolumeObject_minValue

  real( C_double ) function kvs_StructuredVolumeObject_maxValue( this )
    implicit none
    class( kvs_StructuredVolumeObject ) :: this
    kvs_StructuredVolumeObject_maxValue = C_kvs_StructuredVolumeObject_maxValue( this % ptr )
  end function kvs_StructuredVolumeObject_maxValue

end module kvs_StructuredVolumeObject_m
