module kvs_Streamline_m
  use iso_c_binding
  use kvs_StructuredVolumeObject_m
  use kvs_PointObject_m
  use kvs_TransferFunction_m
  use kvs_LineObject_m
  implicit none

  private
  include "kvs_Streamline_c.f90"

  ! Class definition
  public :: kvs_Streamline
  type kvs_Streamline
     private
     type( C_ptr ) :: ptr = C_NULL_ptr
   contains
     final :: kvs_Streamline_destroy ! Destructor
     procedure :: get => kvs_Streamline_get
     procedure :: delete => kvs_Streamline_delete
     procedure :: setSeedPoints => kvs_Streamline_setSeedPoints
     procedure :: setTransferFunction => kvs_Streamline_setTransferFunction
     procedure :: exec => kvs_Streamline_exec
  end type kvs_Streamline

  ! Constructor
  interface kvs_Streamline
     procedure kvs_Streamline_new
  end interface kvs_Streamline

contains

  ! Destructor
  subroutine kvs_Streamline_destroy( this )
    implicit none
    type( kvs_Streamline ) :: this
    if ( c_associated( this % ptr ) ) then
       call C_kvs_Streamline_delete( this % ptr )
       this % ptr = C_NULL_ptr
    end if
  end subroutine kvs_Streamline_destroy

  function kvs_Streamline_get( this )
    implicit none
    class( kvs_Streamline ) :: this
    type( C_ptr ) :: kvs_Streamline_get
    kvs_Streamline_get = this % ptr
  end function kvs_Streamline_get

  function kvs_Streamline_new( other )
    implicit none
    type( kvs_Streamline ) :: kvs_Streamline_new
    type( C_ptr ), optional :: other
    if ( present( other ) ) then
       kvs_Streamline_new % ptr = C_kvs_Streamline_copy( other )
    else
       kvs_Streamline_new % ptr = C_kvs_Streamline_new()
    end if
  end function kvs_Streamline_new

  subroutine kvs_Streamline_delete( this )
    implicit none
    class( kvs_Streamline ) :: this
    call C_kvs_Streamline_delete( this % ptr )
    this % ptr = C_NULL_ptr
  end subroutine kvs_Streamline_delete

  subroutine kvs_Streamline_setSeedPoints( this, points )
    implicit none
    class( kvs_Streamline ), intent( in ) :: this
    type( kvs_PointObject ), intent( in ) :: points
    call C_kvs_Streamline_setSeedPoints( this % ptr, points % get() )
  end subroutine kvs_Streamline_setSeedPoints

  subroutine kvs_Streamline_setTransferFunction( this, tfunc )
    implicit none
    class( kvs_Streamline ), intent( in ) :: this
    type( kvs_TransferFunction ), intent( in ) :: tfunc
    call C_kvs_Streamline_setTransferFunction( this % ptr, tfunc % get() )
  end subroutine kvs_Streamline_setTransferFunction

  function kvs_Streamline_exec( this, volume )
    implicit none
    class( kvs_Streamline ), intent( in ) :: this
    type( kvs_StructuredVolumeObject ) :: volume
    type( kvs_LineObject ) :: kvs_Streamline_exec
    kvs_Streamline_exec = kvs_LineObject( C_kvs_Streamline_exec( this % ptr, volume % get() ) )
  end function kvs_Streamline_exec

end module kvs_Streamline_m
