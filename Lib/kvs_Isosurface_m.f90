module kvs_Isosurface_m
  use iso_c_binding
  use kvs_Vec3_m
  implicit none

  private

  ! Type
  type kvs_Isosurface
     private
     type( C_ptr ) :: mapper = C_NULL_ptr
  end type kvs_Isosurface

  ! C interface
  interface

     function C_kvs_Isosurface_new () result( this )&
          bind( C, name="Isosurface_new" )
       import
       type( C_ptr ) :: this
     end function C_kvs_Isosurface_new

     subroutine C_kvs_Isosurface_delete ( this )&
          bind( C, name="Isosurface_delete" )
       import
       type( C_ptr ), value :: this
     end subroutine C_kvs_Isosurface_delete

     subroutine C_kvs_Isosurface_setIsolevel ( this, isolevel )&
          bind( C, name="Isosurface_setIsolevel" )
       import
       type( C_ptr ), value :: this
       real( C_float ), value :: isolevel
     end subroutine C_kvs_Isosurface_setIsolevel

  end interface

  ! Interface
  interface kvs_Isosurface_new
     module procedure F_kvs_Isosurface_new
  end interface kvs_Isosurface_new

  interface kvs_Isosurface_delete
     module procedure F_kvs_Isosurface_delete
  end interface kvs_Isosurface_delete

  interface kvs_Isosurface_setIsolevel
     module procedure F_kvs_Isosurface_setIsolevel
  end interface kvs_Isosurface_setIsolevel

  ! Public interface
  public :: kvs_Isosurface
  public :: kvs_Isosurface_new
  public :: kvs_Isosurface_delete
  public :: kvs_Isosurface_setIsolevel

contains

  ! F interface
  subroutine F_kvs_Isosurface_new ( this )
    type( kvs_Isosurface ), intent( out ) :: this
    this%mapper = C_kvs_Isosurface_new()
  end subroutine F_kvs_Isosurface_new

  subroutine F_kvs_Isosurface_delete ( this )
    type( kvs_Isosurface ), intent( inout ) :: this
    call C_kvs_Isosurface_delete( this%mapper )
    this%mapper = C_NULL_ptr
  end subroutine F_kvs_Isosurface_delete

  subroutine F_kvs_Isosurface_setIsolevel ( this, isolevel )
    type( kvs_Isosurface ), intent( inout ) :: this
    real( C_float ), intent( in ) :: isolevel
    call C_kvs_Isosurface_setIsolevel( this%mapper, isolevel )
  end subroutine F_kvs_Isosurface_setIsolevel

end module kvs_Isosurface_m

