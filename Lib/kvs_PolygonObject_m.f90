module kvs_PolygonObject_m
  use iso_c_binding
  implicit none

  private
  include "kvs_PolygonObject_c.f90"

  ! Class definition
  public :: kvs_PolygonObject
  type kvs_PolygonObject
     private
     type( C_ptr ) :: ptr = C_NULL_ptr
   contains
     final :: kvs_PolygonObject_finalize ! Destructor
     procedure :: delete => kvs_PolygonObject_delete
  end type kvs_PolygonObject

  interface kvs_PolygonObject ! Constructor
     procedure kvs_PolygonObject_new
  end interface kvs_PolygonObject

contains

  function kvs_PolygonObject_new()
    implicit none
    type( kvs_PolygonObject ) :: kvs_PolygonObject_new
    kvs_PolygonObject_new % ptr = C_kvs_PolygonObject_new()
  end function kvs_PolygonObject_new

  subroutine kvs_PolygonObject_finalize( this )
    implicit none
    type( kvs_PolygonObject ) :: this
    if ( c_associated( this % ptr ) ) then
       call C_kvs_PolygonObject_delete( this%ptr )
       this % ptr = C_NULL_ptr
    end if
  end subroutine kvs_PolygonObject_finalize

  subroutine kvs_PolygonObject_delete( this )
    implicit none
    class( kvs_PolygonObject ) :: this
    call C_kvs_PolygonObject_delete( this % ptr )
    this % ptr = C_NULL_ptr
  end subroutine kvs_PolygonObject_delete

end module kvs_PolygonObject_m
