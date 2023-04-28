module kvs_RayCastingRenderer_m
  use iso_c_binding
  use kvs_TransferFunction_m
  implicit none

  private
  include "kvs_RayCastingRenderer_c.f90"

  ! Class definition
  public :: kvs_RayCastingRenderer
  type kvs_RayCastingRenderer
     private
     type( C_ptr ) :: ptr = C_NULL_ptr
   contains
     final :: kvs_RayCastingRenderer_destroy ! Destructor
     procedure :: delete => kvs_RayCastingRenderer_delete
     procedure :: get => kvs_RayCastingRenderer_get
     procedure :: setTransferFunction => kvs_RayCastingRenderer_setTransferFunction
  end type kvs_RayCastingRenderer

  ! Constructor
  interface kvs_RayCastingRenderer
     procedure kvs_RayCastingRenderer_new
  end interface kvs_RayCastingRenderer

contains

  ! Destructor
  subroutine kvs_RayCastingRenderer_destroy( this )
    implicit none
    type( kvs_RayCastingRenderer ) :: this
    if ( c_associated( this % ptr ) ) then
       call C_kvs_RayCastingRenderer_delete( this % ptr )
       this % ptr = C_NULL_ptr
    endif
  end subroutine kvs_RayCastingRenderer_destroy

  function kvs_RayCastingRenderer_get( this )
    implicit none
    class( kvs_RayCastingRenderer ) :: this
    type( C_ptr ) :: kvs_RayCastingRenderer_get
    kvs_RayCastingRenderer_get = this % ptr
  end function kvs_RayCastingRenderer_get

  function kvs_RayCastingRenderer_new( sw )
    implicit none
    type( kvs_RayCastingRenderer ) :: kvs_RayCastingRenderer_new
    logical, optional :: sw
    if ( present( sw ) ) then
       kvs_RayCastingRenderer_new % ptr = C_kvs_RayCastingRenderer_new( .false. )
    else
       kvs_RayCastingRenderer_new % ptr = C_kvs_RayCastingRenderer_new( sw )
    end if
  end function kvs_RayCastingRenderer_new

  subroutine kvs_RayCastingRenderer_delete( this )
    implicit none
    class( kvs_RayCastingRenderer ) :: this
    call C_kvs_RayCastingRenderer_delete( this % ptr )
    this % ptr = C_NULL_ptr
  end subroutine kvs_RayCastingRenderer_delete

  subroutine kvs_RayCastingRenderer_setTransferFunction( this, tfunc )
    implicit none
    class( kvs_RayCastingRenderer ), intent( in ) :: this
    type( kvs_TransferFunction ), intent( in ) :: tfunc
    call C_kvs_RayCastingRenderer_setTransferFunction( this % ptr, tfunc % get() )
  end subroutine kvs_RayCastingRenderer_setTransferFunction

end module kvs_RayCastingRenderer_m
