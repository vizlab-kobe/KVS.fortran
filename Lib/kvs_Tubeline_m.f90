module kvs_Tubeline_m
  use iso_c_binding
  use kvs_LineObject_m
  use kvs_PolygonObject_m
  implicit none

  ! Class definition
  public :: kvs_Tubeline
  type kvs_Tubeline
     private
     type( C_ptr ) :: ptr = C_NULL_ptr
   contains
     final :: kvs_Tubeline_destroy ! Destructor
     procedure :: get => kvs_Tubeline_get
     procedure :: delete => kvs_Tubeline_delete
     procedure :: exec => kvs_Tubeline_exec
  end type kvs_Tubeline

  ! Constructor
  interface kvs_Tubeline
     procedure kvs_Tubeline_new
  end interface kvs_Tubeline

  ! C interfaces
  private
  interface
     function C_kvs_Tubeline_new () result( this )&
          bind( C, name="Tubeline_new" )
       import
       type( C_ptr ) :: this
     end function C_kvs_Tubeline_new

     function C_kvs_Tubeline_copy( other )&
          bind( C, name="Tubeline_copy" )
       import
       type( C_ptr ) :: C_kvs_Tubeline_copy
       type( C_ptr ), value :: other
     end function C_kvs_Tubeline_copy

     subroutine C_kvs_Tubeline_delete ( this )&
          bind( C, name="Tubeline_delete" )
       import
       type( C_ptr ), value :: this
     end subroutine C_kvs_Tubeline_delete

     subroutine C_kvs_Tubeline_setNumberOfDivisions( this, ndivs )&
          bind( C, name="Tubeline_setNumberOfDivisions" )
       import
       type( C_ptr ), value :: this
       integer( C_int ), value :: ndivs
     end subroutine C_kvs_Tubeline_setNumberOfDivisions

     function C_kvs_Tubeline_exec( this, line ) &
          bind( C, name="Tubeline_exec" )
       import
       type( C_ptr ), value :: this
       type( C_ptr ), value :: line
       type( C_ptr ) :: C_kvs_Tubeline_exec
     end function C_kvs_Tubeline_exec
  end interface

contains

  ! Destructor
  subroutine kvs_Tubeline_destroy( this )
    implicit none
    type( kvs_Tubeline ) :: this
    if ( c_associated( this % ptr ) ) then
       call C_kvs_Tubeline_delete( this % ptr )
       this % ptr = C_NULL_ptr
    end if
  end subroutine kvs_Tubeline_destroy

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

  subroutine kvs_Tubeline_delete( this )
    implicit none
    class( kvs_Tubeline ) :: this
    call C_kvs_Tubeline_delete( this % ptr )
    this % ptr = C_NULL_ptr
  end subroutine kvs_Tubeline_delete

  subroutine kvs_Tubeline_setNumbferOfDivisions( this, ndivs )
    implicit none
    class( kvs_Tubeline ), intent( in ) :: this
    integer( C_int ), intent( in ) :: ndivs
    call C_kvs_Tubeline_setNumberOfDivisions( this % ptr, ndivs )
  end subroutine kvs_Tubeline_setNumbferOfDivisions

  function kvs_Tubeline_exec( this, line )
    implicit none
    class( kvs_Tubeline ), intent( in ) :: this
    type( kvs_LineObject ) :: line
    type( kvs_PolygonObject ) :: kvs_Tubeline_exec
    kvs_Tubeline_exec = kvs_PolygonObject( C_kvs_Tubeline_exec( this % ptr, line % get() ) )
  end function kvs_Tubeline_exec

end module kvs_Tubeline_m
