module kvs_Screen_m
  use iso_c_binding
  use kvs_ColorImage_m
  use kvs_Application_m
  implicit none

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
     procedure :: replaceObject => kvs_Screen_replaceObject
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

  ! C interfaces
  private
    interface
     function C_kvs_Screen_new( app )&
          bind( C, name="Screen_new" )
       import
       type( C_ptr ), value :: app
       type( C_ptr ) :: C_kvs_Screen_new
     end function C_kvs_Screen_new

     subroutine C_kvs_Screen_delete( this )&
          bind( C, name="Screen_delete" )
       import
       type( C_ptr ), value :: this
     end subroutine C_kvs_Screen_delete

     subroutine C_kvs_Screen_registerObject( this, object, renderer )&
          bind( C, name="Screen_registerObject" )
       import
       type( C_ptr ), value :: this
       type( C_ptr ), value :: object
       type( C_ptr ), value :: renderer
     end subroutine C_kvs_Screen_registerObject

     subroutine C_kvs_Screen_replaceObject( this, name, object, delete_object )&
          bind( C, name="Screen_replaceObject" )
       import
       type( C_ptr ), value :: this
       character( len=*, kind=C_char ), intent( in ) :: name
       type( C_ptr ), value :: object
       logical, value :: delete_object
     end subroutine C_kvs_Screen_replaceObject

     subroutine C_kvs_Screen_create( this )&
          bind( C, name="Screen_create" )
       import
       type( C_ptr ), value :: this
     end subroutine C_kvs_Screen_create

     subroutine C_kvs_Screen_show( this )&
          bind( C, name="Screen_show" )
       import
       type( C_ptr ), value :: this
     end subroutine C_kvs_Screen_show

     subroutine C_kvs_Screen_hide( this )&
          bind( C, name="Screen_hide" )
       import
       type( C_ptr ), value :: this
     end subroutine C_kvs_Screen_hide

     subroutine C_kvs_Screen_draw( this )&
          bind( C, name="Screen_draw" )
       import
       type( C_ptr ), value :: this
     end subroutine C_kvs_Screen_draw

     function C_kvs_Screen_capture( this )&
          bind( C, name="Screen_capture" )
       import
       type( C_ptr ), value :: this
       type( C_ptr ) :: C_kvs_Screen_capture
     end function C_kvs_Screen_capture
  end interface

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

  subroutine kvs_Screen_replaceObject( this, name, object, delete_object )
    implicit none
    class( kvs_Screen ), intent( in ) :: this
    character( len=*, kind=C_char ), intent( in ) :: name
    type( C_ptr ), intent( in ) :: object
    logical, intent( in ), optional :: delete_object
    if ( present( delete_object ) ) then
       call C_kvs_Screen_replaceObject( this % ptr, name // C_NULL_char, object, delete_object )
    else
       call C_kvs_Screen_replaceObject( this % ptr, name // C_NULL_char, object, .true. );
    end if
  end subroutine kvs_Screen_replaceObject

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
