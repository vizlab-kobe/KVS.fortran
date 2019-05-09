module kvs_PolygonObject_m
  use iso_c_binding
  implicit none

  private
  public :: kvs_PolygonObject

  ! C interface
  interface
     function C_kvs_PolygonObject_new() bind( C, name="PolygonObject_new" )
       import
       type( C_ptr ) :: C_kvs_PolygonObject_new
     end function C_kvs_PolygonObject_new

     subroutine C_kvs_PolygonObject_delete( this ) bind( C, name="PolygonObject_delete" )
       import
       type( C_ptr ), value :: this
     end subroutine C_kvs_PolygonObject_delete
  end interface

  ! Type definition
  type kvs_PolygonObject
     private
     type( C_ptr ) :: object = C_NULL_ptr
   contains
     final :: F_kvs_PolygonObject_delete
  end type kvs_PolygonObject

  interface kvs_PolygonObject
     procedure F_kvs_PolygonObject_new
  end interface kvs_PolygonObject

contains
  ! Fortran interface
  function F_kvs_PolygonObject_new()
    implicit none
    type( kvs_PolygonObject ) :: F_kvs_PolygonObject_new
    F_kvs_PolygonObject_new%object = C_kvs_PolygonObject_new()
  end function F_kvs_PolygonObject_new

  subroutine F_kvs_PolygonObject_delete( this )
    implicit none
    type( kvs_PolygonObject ) :: this
    call C_kvs_PolygonObject_delete( this%object )
    this%object = C_NULL_ptr
  end subroutine F_kvs_PolygonObject_delete

end module kvs_PolygonObject_m
