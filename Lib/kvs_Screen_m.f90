module kvs_Screen_m
  use iso_c_binding
  use kvs_ColorImage_m
  use kvs_Application_m
  implicit none

  private
  include "kvs_Screen_c.f90"

  ! Class definition
  public :: kvs_Screen
  type kvs_Screen
     private
     type( C_ptr ) :: ptr = C_NULL_ptr
   contains
     final :: kvs_Screen_destroy ! Destructor
     procedure :: get => kvs_Screen_get
     procedure :: delete => kvs_Screen_delete
     procedure :: registerObject => kvs_Screen_registerObject
     procedure :: create => kvs_Screen_create
     procedure :: show => kvs_Screen_show
     procedure :: hide => kvs_Screen_hide
     procedure :: draw => kvs_Screen_draw
     procedure :: capture => kvs_Screen_capture
  end type kvs_Screen

  ! Constructor
  interface kvs_Screen
     procedure kvs_Screen_new
  end interface kvs_Screen

contains

  ! Destructor
  subroutine kvs_Screen_destroy( this )
    implicit none
    type( kvs_Screen ) :: this
    if ( c_associated( this % ptr ) ) then
       call C_kvs_Screen_delete( this % ptr )
       this % ptr = C_NULL_ptr
    endif
  end subroutine kvs_Screen_destroy

  function kvs_Screen_get( this )
    implicit none
    class( kvs_Screen ) :: this
    type( C_ptr ) :: kvs_Screen_get
    kvs_Screen_get = this % ptr
  end function kvs_Screen_get

  function kvs_Screen_new( app )
    implicit none
    type( kvs_Application ) :: app
    type( kvs_Screen ) :: kvs_Screen_new
    kvs_Screen_new % ptr = C_kvs_Screen_new( app % get() )
  end function kvs_Screen_new

  subroutine kvs_Screen_delete( this )
    implicit none
    class( kvs_Screen ) :: this
    call C_kvs_Screen_delete( this % ptr )
    this % ptr = C_NULL_ptr
  end subroutine kvs_Screen_delete

  subroutine kvs_Screen_registerObject( this, object, renderer )
    implicit none
    class( kvs_Screen ) :: this
    type( C_ptr ) :: object
    type( C_ptr ), optional :: renderer
    if ( present( renderer ) ) then
       call C_kvs_Screen_registerObject( this % ptr, object, renderer )
    else
       call C_kvs_Screen_registerObject( this % ptr, object, C_NULL_ptr );
    end if
  end subroutine kvs_Screen_registerObject

  subroutine kvs_Screen_create( this )
    implicit none
    class( kvs_Screen ) :: this
    call C_kvs_Screen_create( this % ptr )
  end subroutine kvs_Screen_create

  subroutine kvs_Screen_show( this )
    implicit none
    class( kvs_Screen ) :: this
    call C_kvs_Screen_show( this % ptr )
  end subroutine kvs_Screen_show

  subroutine kvs_Screen_hide( this )
    implicit none
    class( kvs_Screen ) :: this
    call C_kvs_Screen_hide( this % ptr )
  end subroutine kvs_Screen_hide

  subroutine kvs_Screen_draw( this )
    implicit none
    class( kvs_Screen ) :: this
    call C_kvs_Screen_draw( this % ptr )
  end subroutine kvs_Screen_draw

  function kvs_Screen_capture( this )
    implicit none
    class( kvs_Screen ), intent( in ) :: this
    type( kvs_ColorImage ) :: kvs_Screen_capture
    kvs_Screen_capture = kvs_ColorImage( C_kvs_Screen_capture( this % ptr ) )
  end function kvs_Screen_capture

end module kvs_Screen_m
