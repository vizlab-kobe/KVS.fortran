module kvs_Isosurface_m
  use iso_c_binding
  use kvs_Vec3_m
  use kvs_StructuredVolumeObject_m
  use kvs_PolygonObject_m
  use kvs_TransferFunction_m
  implicit none

  ! Class definition
  public :: kvs_Isosurface
  type kvs_Isosurface
     private
     type( C_ptr ) :: ptr = C_NULL_ptr
   contains
     final :: kvs_Isosurface_destroy ! Destructor
     procedure :: delete => kvs_Isosurface_delete
     procedure :: setIsolevel => kvs_Isosurface_setIsolevel
     procedure :: exec => kvs_Isosurface_exec
  end type kvs_Isosurface

  ! Constructor
  interface kvs_Isosurface
     procedure kvs_Isosurface_new
  end interface kvs_Isosurface

  ! C interfaces
  private
    interface
     function C_kvs_Isosurface_new()&
          bind( C, name="Isosurface_new" )
       import
       type( C_ptr ) :: C_kvs_Isosurface_new
     end function C_kvs_Isosurface_new

     subroutine C_kvs_Isosurface_delete( this )&
          bind( C, name="Isosurface_delete" )
       import
       type( C_ptr ), value :: this
     end subroutine C_kvs_Isosurface_delete

     subroutine C_kvs_Isosurface_setIsolevel( this, isolevel )&
          bind( C, name="Isosurface_setIsolevel" )
       import
       type( C_ptr ), value :: this
       real( C_float ), value :: isolevel
     end subroutine C_kvs_Isosurface_setIsolevel

     subroutine C_kvs_Isosurface_setTransferFunction( this, tfunc )&
          bind( C, name="Isosurface_setIsolevel" )
       import
       type( C_ptr ), value :: this
       type( C_ptr ), value :: tfunc
     end subroutine C_kvs_Isosurface_setTransferFunction

     function C_kvs_Isosurface_exec( this, volume )&
          bind( C, name="Isosurface_exec" )
       import
       type( C_ptr ), value :: this
       type( C_ptr ), value :: volume
       type( C_ptr ) :: C_kvs_Isosurface_exec
     end function C_kvs_Isosurface_exec
  end interface

contains

  ! Destructor
  subroutine kvs_Isosurface_destroy( this )
    implicit none
    type( kvs_Isosurface ) :: this
    if ( c_associated( this % ptr ) ) then
       call C_kvs_Isosurface_delete( this % ptr )
       this % ptr = C_NULL_ptr
    endif
  end subroutine kvs_Isosurface_destroy

  function kvs_Isosurface_new()
    implicit none
    type( kvs_Isosurface ) :: kvs_Isosurface_new
    kvs_Isosurface_new % ptr = C_kvs_Isosurface_new()
  end function kvs_Isosurface_new

  subroutine kvs_Isosurface_delete( this )
    implicit none
    class( kvs_Isosurface ) :: this
    call C_kvs_Isosurface_delete( this % ptr )
    this % ptr = C_NULL_ptr
  end subroutine kvs_Isosurface_delete

  subroutine kvs_Isosurface_setIsolevel( this, isolevel )
    implicit none
    class( kvs_Isosurface ), intent( in ) :: this
    real( C_float ), intent( in ) :: isolevel
    call C_kvs_Isosurface_setIsolevel( this % ptr, isolevel )
  end subroutine kvs_Isosurface_setIsolevel

  subroutine kvs_Isosurface_setTransferFunction( this, tfunc )
    implicit none
    class( kvs_Isosurface ), intent( in ) :: this
    type( kvs_TransferFunction ), intent( in ) :: tfunc
    call C_kvs_Isosurface_setTransferFunction( this % ptr, tfunc % get() )
  end subroutine kvs_Isosurface_setTransferFunction

  function kvs_Isosurface_exec( this, volume )
    implicit none
    class( kvs_Isosurface ), intent( in ) :: this
    class( kvs_StructuredVolumeObject ), intent( in ) :: volume
    type( kvs_PolygonObject ) :: kvs_Isosurface_exec
    kvs_Isosurface_exec = kvs_PolygonObject( C_kvs_Isosurface_exec( this % ptr, volume % get() ) )
  end function kvs_Isosurface_exec

end module kvs_Isosurface_m
