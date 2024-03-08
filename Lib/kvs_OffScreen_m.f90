module kvs_OffScreen_m
  use iso_c_binding
  use kvs_ColorImage_m
  use kvs_Vec3_m
  implicit none

  ! Class definition
  public :: kvs_OffScreen
  type kvs_OffScreen
     private
     type( C_ptr ) :: ptr = C_NULL_ptr
   contains
     procedure :: get => kvs_OffScreen_get
     procedure :: delete => kvs_OffScreen_delete
     procedure :: registerObject => kvs_OffScreen_registerObject
     procedure :: replaceObject => kvs_OffScreen_replaceObject
     procedure :: hasObject => kvs_OffScreen_hasObject
     procedure :: setLightPosition => kvs_OffScreen_setLightPosition
     procedure :: setCameraPosition => kvs_OffScreen_setCameraPosition
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
       character( len=1, kind=C_char ), intent( in ) :: name(*)
       type( C_ptr ), value :: object
       logical( C_bool ), value :: delete_object
     end subroutine C_kvs_OffScreen_replaceObject

     function C_kvs_OffScreen_hasObject( this, name )&
          bind( C, name="OffScreen_hasObject" )
       import
       type( C_ptr ), value :: this
       character( len=1, kind=C_char ), intent( in ) :: name(*)
       logical( C_bool ) :: C_kvs_OffScreen_hasObject
     end function C_kvs_OffScreen_hasObject

     subroutine C_kvs_OffScreen_setLightPosition( this, x, y, z )&
          bind( C, name="OffScreen_setLightPosition" )
       import
       type( C_ptr ), value :: this
       real( C_float ), value :: x, y, z
     end subroutine C_kvs_OffScreen_setLightPosition

     subroutine C_kvs_OffScreen_setCameraPosition( this, x, y, z )&
          bind( C, name="OffScreen_setCameraPosition" )
       import
       type( C_ptr ), value :: this
       real( C_float ), value :: x, y, z
     end subroutine C_kvs_OffScreen_setCameraPosition

     subroutine C_kvs_OffScreen_setCameraLookAt( this, x, y, z )&
          bind( C, name="OffScreen_setCameraLookAt" )
       import
       type( C_ptr ), value :: this
       real( C_float ), value :: x, y, z
     end subroutine C_kvs_OffScreen_setCameraLookAt

     subroutine C_kvs_OffScreen_setCameraUpVector( this, x, y, z )&
          bind( C, name="OffScreen_setCameraUpVector" )
       import
       type( C_ptr ), value :: this
       real( C_float ), value :: x, y, z
     end subroutine C_kvs_OffScreen_setCameraUpVector

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
       call C_kvs_OffScreen_replaceObject( this % ptr, name, object, logical( delete_object, kind=c_bool ) )
    else
       call C_kvs_OffScreen_replaceObject( this % ptr, name, object, .true._c_bool );
    end if
  end subroutine kvs_OffScreen_replaceObject

  logical function kvs_OffScreen_hasObject( this, name )
    implicit none
    class( kvs_OffScreen ) :: this
    character( len=*, kind=C_char ), intent( in ) :: name
    kvs_OffScreen_hasObject = logical( C_kvs_OffScreen_hasObject( this % ptr, name ), kind=4 )
  end function kvs_OffScreen_hasObject

  subroutine kvs_OffScreen_setLightPosition( this, position )
    implicit none
    class( kvs_OffScreen ), intent( in ) :: this
    class( kvs_Vec3 ), intent( in ) :: position
    call C_kvs_OffScreen_setLightPosition( this % ptr, position % x, position % y, position % z )
  end subroutine kvs_OffScreen_setLightPosition

  subroutine kvs_OffScreen_setCameraPosition( this, position, look_at, up_vector )
    implicit none
    class( kvs_OffScreen ), intent( in ) :: this
    class( kvs_Vec3 ), intent( in ) :: position
    class( kvs_Vec3 ), intent( in ), optional :: look_at, up_vector
    call C_kvs_OffScreen_setCameraPosition( this % ptr, position % x, position % y, position % z )
    if ( present( look_at ) ) then
       call C_kvs_OffScreen_setCameraLookAt( this % ptr, look_at % x, look_at % y, look_at % z )
    end if
    if ( present( up_vector ) ) then
       call C_kvs_OffScreen_setCameraUpVector( this % ptr, up_vector % x, up_vector % y, up_vector % z )
    end if
  end subroutine kvs_OffScreen_setCameraPosition

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
    kvs_OffScreen_capture = kvs_ColorImage( C_kvs_OffScreen_capture( this % ptr ), .true. )
  end function kvs_OffScreen_capture

end module kvs_OffScreen_m
