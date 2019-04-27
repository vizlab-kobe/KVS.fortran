module kvs_StructuredVolumeObject_m
  use, intrinsic :: iso_c_binding
  implicit none

  private
  ! Type
  type kvs_StructuredVolumeObject
     private
     type(C_ptr) :: object = C_NULL_ptr
  end type kvs_StructuredVolumeObject

  ! C interface
  interface

     function C_kvs_StructuredVolumeObject_new () result(this) bind(C,name="StructuredVolumeObject_new")
       import
       type(C_ptr) :: this
     end function C_kvs_StructuredVolumeObject_new

     subroutine C_kvs_StructuredVolumeObject_delete (this) bind(C,name="StructuredVolumeObject_delete")
       import
       type(C_ptr), value :: this
     end subroutine C_kvs_StructuredVolumeObject_delete

  end interface

  ! Interface
  interface kvs_StructuredVolumeObject_new
     module procedure F_kvs_StructuredVolumeObject_new
  end interface kvs_StructuredVolumeObject_new

  interface kvs_StructuredVolumeObject_delete
     module procedure F_kvs_StructuredVolumeObject_delete
  end interface kvs_StructuredVolumeObject_delete

  public :: kvs_StructuredVolumeObject, kvs_StructuredVolumeObject_new, kvs_StructuredVolumeObject_delete

contains

  ! F interface
  subroutine F_kvs_StructuredVolumeObject_new (this)
    type(kvs_StructuredVolumeObject), intent(out) :: this
    this%object = C_kvs_StructuredVolumeObject_new()
  end subroutine F_kvs_StructuredVolumeObject_new

  subroutine F_kvs_StructuredVolumeObject_delete (this)
    type(kvs_StructuredVolumeObject), intent(inout) :: this
    call C_kvs_StructuredVolumeObject_delete(this%object)
    this%object = C_NULL_ptr
  end subroutine F_kvs_StructuredVolumeObject_delete

end module kvs_StructuredVolumeObject_m
