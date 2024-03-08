module kvs_TransferFunction_m
  use iso_c_binding
  use kvs_ColorMap_m
  use kvs_OpacityMap_m
  implicit none

  ! Class definition
  public :: kvs_TransferFunction
  type kvs_TransferFunction
     private
     type( C_ptr ) :: ptr = C_NULL_ptr
   contains
     procedure :: get => kvs_TransferFunction_get
     procedure :: delete => kvs_TransferFunction_delete
     procedure :: setColorMap => kvs_TransferFunction_setColorMap
     procedure :: setOpacityMap => kvs_TransferFunction_setOpacityMap
     procedure :: setRange => kvs_TransferFunction_setRange
  end type kvs_TransferFunction

  ! Constructor
  interface kvs_TransferFunction
     procedure kvs_TransferFunction_new
  end interface kvs_TransferFunction

  ! C interfaces
  private
  interface
     function C_kvs_TransferFunction_new () result( this )&
          bind( C, name="TransferFunction_new" )
       import
       type( C_ptr ) :: this
     end function C_kvs_TransferFunction_new

     subroutine C_kvs_TransferFunction_delete ( this )&
          bind( C, name="TransferFunction_delete" )
       import
       type( C_ptr ), value :: this
     end subroutine C_kvs_TransferFunction_delete

     subroutine C_kvs_TransferFunction_read( this, filename )&
          bind( C, name="TransferFunction_read" )
       import
       type( C_ptr ), value :: this
       character( len=1, kind=C_char ), intent( in ) :: filename(*)
     end subroutine C_kvs_TransferFunction_read

     subroutine C_kvs_TransferFunction_write( this, filename )&
          bind( C, name="TransferFunction_write" )
       import
       type( C_ptr ), value :: this
       character( len=1, kind=C_char ), intent( in ) :: filename(*)
     end subroutine C_kvs_TransferFunction_write

     subroutine C_kvs_TransferFunction_setColorMap( this, cmap )&
          bind( C, name="TransferFunction_setColorMap" )
       import
       type( C_ptr ), value :: this
       type( C_ptr ), value :: cmap
     end subroutine C_kvs_TransferFunction_setColorMap

     subroutine C_kvs_TransferFunction_setOpacityMap( this, omap )&
          bind( C, name="TransferFunction_setOpacityMap" )
       import
       type( C_ptr ), value :: this
       type( C_ptr ), value :: omap
     end subroutine C_kvs_TransferFunction_setOpacityMap

     subroutine C_kvs_TransferFunction_setRange( this, min_value, max_value )&
          bind( C, name="TransferFunction_setRange" )
       import
       type( C_ptr ),   value :: this
       real( C_double ), value :: min_value, max_value
     end subroutine C_kvs_TransferFunction_setRange
  end interface

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

  subroutine kvs_TransferFunction_delete( this )
    implicit none
    class( kvs_TransferFunction ) :: this
    call C_kvs_TransferFunction_delete( this % ptr )
    this % ptr = C_NULL_ptr
  end subroutine kvs_TransferFunction_delete

  subroutine kvs_TransferFunction_setColorMap( this, cmap )
    implicit none
    class( kvs_TransferFunction ), intent( in ) :: this
    type( kvs_ColorMap ), intent( in ) :: cmap
    call C_kvs_TransferFunction_setColorMap( this % ptr, cmap % get() )
  end subroutine kvs_TransferFunction_setColorMap

  subroutine kvs_TransferFunction_setOpacityMap( this, omap )
    implicit none
    class( kvs_TransferFunction ), intent( in ) :: this
    type( kvs_OpacityMap ), intent( in ) :: omap
    call C_kvs_TransferFunction_setOpacityMap( this % ptr, omap % get() )
  end subroutine kvs_TransferFunction_setOpacityMap

  subroutine kvs_TransferFunction_setRange( this, min_value, max_value )
    implicit none
    class( kvs_TransferFunction ), intent( in ) :: this
    real( C_double ), intent( in ) :: min_value, max_value
    call C_kvs_TransferFunction_setRange( this % ptr, min_value, max_value )
  end subroutine kvs_TransferFunction_setRange

end module kvs_TransferFunction_m
