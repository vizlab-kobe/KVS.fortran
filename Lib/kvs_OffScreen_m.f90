module kvs_OffScreen_m
  use iso_c_binding
  use kvs_ColorImage_m
  implicit none

  ! Class definition
  public :: kvs_OffScreen
  type kvs_OffScreen
     private
     type( C_ptr ) :: ptr = C_NULL_ptr
   contains
     final :: kvs_OffScreen_destroy ! Destructor
     procedure :: get => kvs_OffScreen_get
     procedure :: delete => kvs_OffScreen_delete
     procedure :: registerObject => kvs_OffScreen_registerObject
     procedure :: replaceObject => kvs_OffScreen_replaceObject
     procedure :: create => kvs_OffScreen_create
     procedure :: show => kvs_OffScreen_show
     procedure :: hide => kvs_OffScreen_hide
     procedure :: draw => kvs_OffScreen_draw
     procedure :: capture => kvs_OffScreen_capture
  end type kvs_OffScreen

  ! Constructor
  interface kvs_OffScreen
     procedure kvs_OffScreen_new
  end interface kvs_OffScreen

  ! C interfaces
  private
    interface
     function C_kvs_OffScreen_new()&
          bind( C, name="OffScreen_new" )
       import
       type( C_ptr ) :: C_kvs_OffScreen_new
     end function C_kvs_OffScreen_new

     subroutine C_kvs_OffScreen_delete( this )&
          bind( C, name="OffScreen_delete" )
       import
       type( C_ptr ), value :: this
     end subroutine C_kvs_OffScreen_delete

     subroutine C_kvs_OffScreen_registerObject( this, object, renderer )&
          bind( C, name="OffScreen_registerObject" )
       import
       type( C_ptr ), value :: this
       type( C_ptr ), value :: object
       type( C_ptr ), value :: renderer
     end subroutine C_kvs_OffScreen_registerObject

     subroutine C_kvs_OffScreen_replaceObject( this, name, object, delete_object )&
          bind( C, name="OffScreen_replaceObject" )
       import
       type( C_ptr ), value :: this
       character( len=*, kind=C_char ), intent( in ) :: name
       type( C_ptr ), value :: object
       logical, value :: delete_object
     end subroutine C_kvs_OffScreen_replaceObject

     subroutine C_kvs_OffScreen_create( this )&
          bind( C, name="OffScreen_create" )
       import
       type( C_ptr ), value :: this
     end subroutine C_kvs_OffScreen_create

     subroutine C_kvs_OffScreen_show( this )&
          bind( C, name="OffScreen_show" )
       import
       type( C_ptr ), value :: this
     end subroutine C_kvs_OffScreen_show

     subroutine C_kvs_OffScreen_hide( this )&
          bind( C, name="OffScreen_hide" )
       import
       type( C_ptr ), value :: this
     end subroutine C_kvs_OffScreen_hide

     subroutine C_kvs_OffScreen_draw( this )&
          bind( C, name="OffScreen_draw" )
       import
       type( C_ptr ), value :: this
     end subroutine C_kvs_OffScreen_draw

     function C_kvs_OffScreen_capture( this )&
          bind( C, name="OffScreen_capture" )
       import
       type( C_ptr ), value :: this
       type( C_ptr ) :: C_kvs_OffScreen_capture
     end function C_kvs_OffScreen_capture
  end interface

contains

  ! Destructor
  subroutine kvs_OffScreen_destroy( this )
    implicit none
    type( kvs_OffScreen ) :: this
    if ( c_associated( this % ptr ) ) then
       call C_kvs_OffScreen_delete( this % ptr )
       this % ptr = C_NULL_ptr
    endif
  end subroutine kvs_OffScreen_destroy

  function kvs_OffScreen_get( this )
    implicit none
    class( kvs_OffScreen ) :: this
    type( C_ptr ) :: kvs_OffScreen_get
    kvs_OffScreen_get = this % ptr
  end function kvs_OffScreen_get

  function kvs_OffScreen_new()
    implicit none
    type( kvs_OffScreen ) :: kvs_OffScreen_new
    kvs_OffScreen_new % ptr = C_kvs_OffScreen_new()
  end function kvs_OffScreen_new

  subroutine kvs_OffScreen_delete( this )
    implicit none
    class( kvs_OffScreen ) :: this
    call C_kvs_OffScreen_delete( this % ptr )
    this % ptr = C_NULL_ptr
  end subroutine kvs_OffScreen_delete

  subroutine kvs_OffScreen_registerObject( this, object, renderer )
    implicit none
    class( kvs_OffScreen ) :: this
    type( C_ptr ) :: object
    type( C_ptr ), optional :: renderer
    if ( present( renderer ) ) then
       call C_kvs_OffScreen_registerObject( this % ptr, object, renderer )
    else
       call C_kvs_OffScreen_registerObject( this % ptr, object, C_NULL_ptr );
    end if
  end subroutine kvs_OffScreen_registerObject

  subroutine kvs_OffScreen_replaceObject( this, name, object, delete_object )
    implicit none
    class( kvs_OffScreen ), intent( in ) :: this
    character( len=*, kind=C_char ), intent( in ) :: name
    type( C_ptr ), intent( in ) :: object
    logical, intent( in ), optional :: delete_object
    if ( present( delete_object ) ) then
       call C_kvs_OffScreen_replaceObject( this % ptr, name // C_NULL_char, object, delete_object )
    else
       call C_kvs_OffScreen_replaceObject( this % ptr, name // C_NULL_char, object, .true. );
    end if
  end subroutine kvs_OffScreen_replaceObject

  subroutine kvs_OffScreen_create( this )
    implicit none
    class( kvs_OffScreen ) :: this
    call C_kvs_OffScreen_create( this % ptr )
  end subroutine kvs_OffScreen_create

  subroutine kvs_OffScreen_show( this )
    implicit none
    class( kvs_OffScreen ) :: this
    call C_kvs_OffScreen_show( this % ptr )
  end subroutine kvs_OffScreen_show

  subroutine kvs_OffScreen_hide( this )
    implicit none
    class( kvs_OffScreen ) :: this
    call C_kvs_OffScreen_hide( this % ptr )
  end subroutine kvs_OffScreen_hide

  subroutine kvs_OffScreen_draw( this )
    implicit none
    class( kvs_OffScreen ) :: this
    call C_kvs_OffScreen_draw( this % ptr )
  end subroutine kvs_OffScreen_draw

  function kvs_OffScreen_capture( this )
    implicit none
    class( kvs_OffScreen ), intent( in ) :: this
    type( kvs_ColorImage ) :: kvs_OffScreen_capture
    kvs_OffScreen_capture = kvs_ColorImage( C_kvs_OffScreen_capture( this % ptr ) )
  end function kvs_OffScreen_capture

end module kvs_OffScreen_m
