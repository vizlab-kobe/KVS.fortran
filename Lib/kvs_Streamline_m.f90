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
     final :: kvs_Streamline_finalize ! Destructor
     procedure :: get => kvs_Streamline_get
     procedure :: delete => kvs_Streamline_delete
     procedure :: exec => kvs_Streamline_exec
  end type kvs_Streamline

  interface kvs_Streamline ! Constructor
    procedure kvs_Streamline_new
  end interface kvs_Streamline

  contains

  function kvs_Streamline_get( this )
    implicit none
    class( kvs_Streamline ) :: this
    type( C_ptr ) :: kvs_Streamline_get
    kvs_Streamline_get = this % ptr
  end function kvs_Streamline_get

  function kvs_Streamline_new(  other )
    implicit none
    type( kvs_Streamline ) :: kvs_Streamline_new
    type( C_ptr ), optional :: other
    if ( present( other ) ) then
       kvs_Streamline_new % ptr = C_kvs_Streamline_copy( other )
    else
       kvs_Streamline_new % ptr = C_kvs_Streamline_new()
    end if
  end function kvs_Streamline_new

  subroutine kvs_Streamline_finalize( this )
    implicit none
    type( kvs_Streamline ) :: this
    if ( c_associated( this % ptr ) ) then
       call C_kvs_Streamline_delete( this % ptr )
       this % ptr = C_NULL_ptr
    end if
  end subroutine kvs_Streamline_finalize

  subroutine kvs_Streamline_delete( this )
    implicit none
    class( kvs_Streamline ) :: this
    call C_kvs_Streamline_delete( this % ptr )
    this % ptr = C_NULL_ptr
  end subroutine kvs_Streamline_delete

  function kvs_Streamline_exec( this, volume, point, tfunc )
    implicit none
    type( kvs_StructuredVolumeObject ) :: volume
    type( kvs_PointObject ) :: point
    type( kvs_TransferFunction ) :: tfunc
    class( kvs_Streamline ), intent( in ) :: this
    type( kvs_LineObject ) :: kvs_Streamline_exec
    kvs_Streamline_exec = kvs_LineObject(C_kvs_Streamline_exec( this % ptr, volume % get(), point % get(), tfunc % get() ))
  end function kvs_Streamline_exec

end module kvs_Streamline_m
