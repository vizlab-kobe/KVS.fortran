module kvs_OpacityMap_m
  use iso_c_binding
  implicit none

  ! Class definition
  public :: kvs_OpacityMap
  type kvs_OpacityMap
     private
     type( C_ptr ) :: ptr = C_NULL_ptr
   contains
     final :: kvs_OpacityMap_destroy ! Destructor
     procedure :: get => kvs_OpacityMap_get
     procedure :: delete => kvs_OpacityMap_delete
     procedure :: setRange => kvs_OpacityMap_setRange
     procedure :: setResolution => kvs_OpacityMap_setResolution
     procedure :: addPoint => kvs_OpacityMap_addPoint
     procedure :: removePoint => kvs_OpacityMap_removePoint
     procedure :: create => kvs_OpacityMap_create
  end type kvs_OpacityMap

  ! Constructor
  interface kvs_OpacityMap
     procedure kvs_OpacityMap_new
  end interface kvs_OpacityMap

  ! C interfaces
  private
    interface
     function C_kvs_OpacityMap_new() result( this )&
          bind( C, name="OpacityMap_new" )
       import
       type( C_ptr ) :: this
     end function C_kvs_OpacityMap_new

     subroutine C_kvs_OpacityMap_delete( this )&
          bind( C, name="OpacityMap_delete" )
       import
       type( C_ptr ), value :: this
     end subroutine C_kvs_OpacityMap_delete

     subroutine C_kvs_OpacityMap_setRange( this, min_value, max_value )&
          bind( C, name="OpacityMap_setRange" )
       import
       type( C_ptr ), value :: this
       real( C_float ), value :: min_value
       real( C_float ), value :: max_value
     end subroutine C_kvs_OpacityMap_setRange

     subroutine C_kvs_OpacityMap_setResolution( this, resolution )&
          bind( C, name="OpacityMap_setResolution" )
       import
       type( C_ptr ), value :: this
       integer( C_int ), value :: resolution
     end subroutine C_kvs_OpacityMap_setResolution

     subroutine C_kvs_OpacityMap_addPoint( this, svalue, opacity )&
          bind( C, name="OpacityMap_addPoint" )
       import
       type( C_ptr ), value :: this
       real( C_float ), value :: svalue
       real( C_float ), value :: opacity
     end subroutine C_kvs_OpacityMap_addPoint

     subroutine C_kvs_OpacityMap_removePoint( this, svalue )&
          bind( C, name="OpacityMap_removePoint" )
       import
       type( C_ptr ), value :: this
       real( C_float ), value :: svalue
     end subroutine C_kvs_OpacityMap_removePoint

     subroutine C_kvs_OpacityMap_create( this )&
          bind( C, name="OpacityMap_create" )
       import
       type( C_ptr ), value :: this
     end subroutine C_kvs_OpacityMap_create
  end interface

contains

  ! Destructor
  subroutine kvs_OpacityMap_destroy( this )
    implicit none
    type( kvs_OpacityMap ) :: this
    if ( c_associated( this % ptr ) ) then
       call C_kvs_OpacityMap_delete( this % ptr )
       this % ptr = C_NULL_ptr
    end if
  end subroutine kvs_OpacityMap_destroy

  function kvs_OpacityMap_get( this )
    implicit none
    class( kvs_OpacityMap ) :: this
    type( C_ptr ) :: kvs_OpacityMap_get
    kvs_OpacityMap_get = this % ptr
  end function kvs_OpacityMap_get

  function kvs_OpacityMap_new()
    implicit none
    type( kvs_OpacityMap ) :: kvs_OpacityMap_new
    kvs_OpacityMap_new % ptr = C_kvs_OpacityMap_new()
  end function kvs_OpacityMap_new

  subroutine kvs_OpacityMap_delete( this )
    implicit none
    class( kvs_OpacityMap ) :: this
    call C_kvs_OpacityMap_delete( this % ptr )
    this % ptr = C_NULL_ptr
  end subroutine kvs_OpacityMap_delete

  subroutine kvs_OpacityMap_setRange( this, min_value, max_value )
    implicit none
    class( kvs_OpacityMap ), intent( in ) :: this
    real( C_float ), intent( in ) :: min_value
    real( C_float ), intent( in ) :: max_value
    call C_kvs_OpacityMap_setRange( this % ptr, min_value, max_value )
  end subroutine kvs_OpacityMap_setRange

  subroutine kvs_OpacityMap_setResolution( this, resolution )
    implicit none
    class( kvs_OpacityMap ), intent( in ) :: this
    integer( C_int ), intent( in ) :: resolution
    call C_kvs_OpacityMap_setResolution( this % ptr, resolution )
  end subroutine kvs_OpacityMap_setResolution

  subroutine kvs_OpacityMap_addPoint( this, svalue, opacity )
    implicit none
    class( kvs_OpacityMap ), intent( in ) :: this
    real( C_float ), intent( in ) :: svalue
    real( C_float ), intent( in ) :: opacity
    call C_kvs_OpacityMap_addPoint( this % ptr, svalue, opacity )
  end subroutine kvs_OpacityMap_addPoint

  subroutine kvs_OpacityMap_removePoint( this, svalue )
    implicit none
    class( kvs_OpacityMap ), intent( in ) :: this
    real( C_float ), intent( in ) :: svalue
    call C_kvs_OpacityMap_removePoint( this % ptr, svalue )
  end subroutine kvs_OpacityMap_removePoint

  subroutine kvs_OpacityMap_create( this )
    implicit none
    class( kvs_OpacityMap ) :: this
    call C_kvs_OpacityMap_create( this % ptr )
  end subroutine kvs_OpacityMap_create

end module kvs_OpacityMap_m

