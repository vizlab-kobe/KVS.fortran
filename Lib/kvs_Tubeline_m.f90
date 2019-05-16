module kvs_Tubeline_m
  use iso_c_binding
  use kvs_LineObject_m
  use kvs_PolygonObject_m
  implicit none

  private
  include "kvs_Tubeline_c.f90"

  ! Class definition
  public :: kvs_Tubeline
  type kvs_Tubeline
     private
     type( C_ptr ) :: ptr = C_NULL_ptr
  contains
     final :: kvs_Tubeline_finalize ! Destructor
     procedure :: get => kvs_Tubeline_get
     procedure :: delete => kvs_Tubeline_delete
     procedure :: exec => kvs_Tubeline_exec
  end type kvs_Tubeline

  interface kvs_Tubeline ! Constructor
    procedure kvs_Tubeline_new
  end interface kvs_Tubeline

  contains

  function kvs_Tubeline_get( this )
    implicit none
    class( kvs_Tubeline ) :: this
    type( C_ptr ) :: kvs_Tubeline_get
    kvs_Tubeline_get = this % ptr
  end function kvs_Tubeline_get

  function kvs_Tubeline_new( other )
    implicit none
    type( kvs_Tubeline ) :: kvs_Tubeline_new
    type( C_ptr ), optional :: other
    if ( present( other ) ) then
       kvs_Tubeline_new % ptr = C_kvs_Tubeline_copy( other )
    else
       kvs_Tubeline_new % ptr = C_kvs_Tubeline_new()
    end if
  end function kvs_Tubeline_new

  subroutine kvs_Tubeline_finalize( this )
    implicit none
    type( kvs_Tubeline ) :: this
    if ( c_associated( this % ptr ) ) then
       call C_kvs_Tubeline_delete( this % ptr )
       this % ptr = C_NULL_ptr
    end if
  end subroutine kvs_Tubeline_finalize

  subroutine kvs_Tubeline_delete( this )
    implicit none
    class( kvs_Tubeline ) :: this
    call C_kvs_Tubeline_delete( this % ptr )
    this % ptr = C_NULL_ptr
  end subroutine kvs_Tubeline_delete

  function kvs_Tubeline_exec( this, line, ndivs )
    implicit none
    class( kvs_Tubeline ), intent( in ) :: this
    type( kvs_LineObject ) :: line
    integer( C_int ), value :: ndivs
    type( kvs_PolygonObject ) :: kvs_Tubeline_exec
    kvs_Tubeline_exec = kvs_PolygonObject(C_kvs_Tubeline_exec( this % ptr, line % get(), ndivs ))
  end function kvs_Tubeline_exec

end module kvs_Tubeline_m
