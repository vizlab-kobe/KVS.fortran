module kvs_ArrowGlyph_m
  use iso_c_binding
  use kvs_TransferFunction_m
  implicit none

  ! Class definition
  public :: kvs_ArrowGlyph
  type kvs_ArrowGlyph
     private
     type( C_ptr ) :: ptr = C_NULL_ptr
   contains
     procedure :: delete => kvs_ArrowGlyph_delete
     procedure :: get => kvs_ArrowGlyph_get
     procedure :: setArrowType => kvs_ArrowGlyph_setArrowType
     procedure :: setArrowTypeToLine => kvs_ArrowGlyph_setArrowTypeToLine
     procedure :: setArrowTypeToTube => kvs_ArrowGlyph_setArrowTypeToTube
     ! GlyphBase
     procedure :: setSizeMode => kvs_ArrowGlyph_setSizeMode
     procedure :: setDirectionMode => kvs_ArrowGlyph_setDirectionMode
     procedure :: setColorMode => kvs_ArrowGlyph_setColorMode
     procedure :: setOpacityMode => kvs_ArrowGlyph_setOpacityMode
     procedure :: setCoords => kvs_ArrowGlyph_setCoords
     procedure :: setSizes => kvs_ArrowGlyph_setSizes
     procedure :: setDirections => kvs_ArrowGlyph_setDirections
     procedure :: setColors => kvs_ArrowGlyph_setColors
     procedure :: setOpacities => kvs_ArrowGlyph_setOpacities
     procedure :: setScale => kvs_ArrowGlyph_setScale
     procedure :: setTransferFunction => kvs_ArrowGlyph_setTransferFunction
     ! RendererBase
     procedure :: enableShading => kvs_ArrowGlyph_enableShading
     procedure :: disableShading => kvs_ArrowGlyph_disableShading
  end type kvs_ArrowGlyph

  ! Arrow type
  enum,bind(c)
     enumerator :: Line=0, Tube = 1
  end enum

  ! Constructor
  interface kvs_ArrowGlyph
     procedure kvs_ArrowGlyph_new
  end interface kvs_ArrowGlyph

  ! C interfaces
  private
  interface
     function C_kvs_ArrowGlyph_new()&
          bind( C, name="ArrowGlyph_new" )
       import
       type( C_ptr ) :: C_kvs_ArrowGlyph_new
     end function C_kvs_ArrowGlyph_new

     subroutine C_kvs_ArrowGlyph_delete( this )&
          bind( C, name="ArrowGlyph_delete" )
       import
       type( C_ptr ), value :: this
     end subroutine C_kvs_ArrowGlyph_delete

     subroutine C_kvs_ArrowGlyph_setArrowType( this, arrow_type )&
          bind( C, name="ArrowGlyph_setArrowType" )
       import
       type( C_ptr ), value :: this
       integer( C_int ), value :: arrow_type
     end subroutine C_kvs_ArrowGlyph_setArrowType

     subroutine C_kvs_ArrowGlyph_setArrowTypeToLine( this )&
          bind( C, name="ArrowGlyph_setArrowTypeToLine" )
       import
       type( C_ptr ), value :: this
     end subroutine C_kvs_ArrowGlyph_setArrowTypeToLine

     subroutine C_kvs_ArrowGlyph_setArrowTypeToTube( this )&
          bind( C, name="ArrowGlyph_setArrowTypeToTube" )
       import
       type( C_ptr ), value :: this
     end subroutine C_kvs_ArrowGlyph_setArrowTypeToTube

     ! GlyphBase
     subroutine C_kvs_ArrowGlyph_setSizeMode( this, mode )&
          bind( C, name="ArrowGlyph_setSizeMode" )
       import
       type( C_ptr ), value :: this
       integer( C_int ), value :: mode
     end subroutine C_kvs_ArrowGlyph_setSizeMode

     subroutine C_kvs_ArrowGlyph_setDirectionMode( this, mode )&
          bind( C, name="ArrowGlyph_setDirectionMode" )
       import
       type( C_ptr ), value :: this
       integer( C_int ), value :: mode
     end subroutine C_kvs_ArrowGlyph_setDirectionMode

     subroutine C_kvs_ArrowGlyph_setColorMode( this, mode )&
          bind( C, name="ArrowGlyph_setColorMode" )
       import
       type( C_ptr ), value :: this
       integer( C_int ), value :: mode
     end subroutine C_kvs_ArrowGlyph_setColorMode

     subroutine C_kvs_ArrowGlyph_setOpacityMode( this, mode )&
          bind( C, name="ArrowGlyph_setOpacityMode" )
       import
       type( C_ptr ), value :: this
       integer( C_int ), value :: mode
     end subroutine C_kvs_ArrowGlyph_setOpacityMode

     subroutine C_kvs_ArrowGlyph_setCoords( this, coords, size )&
          bind( C, name="ArrowGlyph_setCoords" )
       import
       type( C_ptr ), value :: this
       type( C_ptr ), value :: coords ! float array
       integer( C_int ), value :: size
     end subroutine C_kvs_ArrowGlyph_setCoords

     subroutine C_kvs_ArrowGlyph_setSizes( this, sizes, size )&
          bind( C, name="ArrowGlyph_setSizes" )
       import
       type( C_ptr ), value :: this
       type( C_ptr ), value :: sizes ! float array
       integer( C_int ), value :: size
     end subroutine C_kvs_ArrowGlyph_setSizes

     subroutine C_kvs_ArrowGlyph_setDirections( this, directions, size )&
          bind( C, name="ArrowGlyph_setDirections" )
       import
       type( C_ptr ), value :: this
       type( C_ptr ), value :: directions ! float array
       integer( C_int ), value :: size
     end subroutine C_kvs_ArrowGlyph_setDirections

     subroutine C_kvs_ArrowGlyph_setColors( this, colors, size )&
          bind( C, name="ArrowGlyph_setColors" )
       import
       type( C_ptr ), value :: this
       type( C_ptr ), value :: colors ! uint8_t array
       integer( C_int ), value :: size
     end subroutine C_kvs_ArrowGlyph_setColors

     subroutine C_kvs_ArrowGlyph_setOpacities( this, opacities, size )&
          bind( C, name="ArrowGlyph_setOpacities" )
       import
       type( C_ptr ), value :: this
       type( C_ptr ), value :: opacities ! uint8_t array
       integer( C_int ), value :: size
     end subroutine C_kvs_ArrowGlyph_setOpacities

     subroutine C_kvs_ArrowGlyph_setScale( this, scale )&
          bind( C, name="ArrowGlyph_setScale" )
       import
       type( C_ptr ), value :: this
       real( C_float ), value :: scale
     end subroutine C_kvs_ArrowGlyph_setScale

     subroutine C_kvs_ArrowGlyph_setTransferFunction( this, tfunc )&
          bind( C, name="ArrowGlyph_setTransferFunction" )
       import
       type( C_ptr ), value :: this
       type( C_ptr ), value :: tfunc
     end subroutine C_kvs_ArrowGlyph_setTransferFunction

     ! RendererBase
     subroutine C_kvs_ArrowGlyph_enableShading( this )&
          bind( C, name="ArrowGlyph_enableShading" )
       import
       type( C_ptr ), value :: this
     end subroutine C_kvs_ArrowGlyph_enableShading

     subroutine C_kvs_ArrowGlyph_disableShading( this )&
          bind( C, name="ArrowGlyph_disableShading" )
       import
       type( C_ptr ), value :: this
     end subroutine C_kvs_ArrowGlyph_disableShading
  end interface

contains

  function kvs_ArrowGlyph_get( this )
    implicit none
    class( kvs_ArrowGlyph ) :: this
    type( C_ptr ) :: kvs_ArrowGlyph_get
    kvs_ArrowGlyph_get = this % ptr
  end function kvs_ArrowGlyph_get

  function kvs_ArrowGlyph_new()
    implicit none
    type( kvs_ArrowGlyph ) :: kvs_ArrowGlyph_new
    kvs_ArrowGlyph_new % ptr = C_kvs_ArrowGlyph_new()
  end function kvs_ArrowGlyph_new

  subroutine kvs_ArrowGlyph_delete( this )
    implicit none
    class( kvs_ArrowGlyph ) :: this
    call C_kvs_ArrowGlyph_delete( this % ptr )
    this % ptr = C_NULL_ptr
  end subroutine kvs_ArrowGlyph_delete

  subroutine kvs_ArrowGlyph_setArrowType( this, arrow_type )
    implicit none
    class( kvs_ArrowGlyph ), intent( in ) :: this
    integer( C_int ), intent( in ) :: arrow_type
    call C_kvs_ArrowGlyph_setArrowType( this % ptr, arrow_type )
  end subroutine kvs_ArrowGlyph_setArrowType

  subroutine kvs_ArrowGlyph_setArrowTypeToLine( this )
    implicit none
    class( kvs_ArrowGlyph ), intent( in ) :: this
    call C_kvs_ArrowGlyph_setArrowTypeToLine( this % ptr )
  end subroutine kvs_ArrowGlyph_setArrowTypeToLine

  subroutine kvs_ArrowGlyph_setArrowTypeToTube( this )
    implicit none
    class( kvs_ArrowGlyph ), intent( in ) :: this
    call C_kvs_ArrowGlyph_setArrowTypeToTube( this % ptr )
  end subroutine kvs_ArrowGlyph_setArrowTypeToTube

  subroutine kvs_ArrowGlyph_setSizeMode( this, mode )
    implicit none
    class( kvs_ArrowGlyph ), intent( in ) :: this
    integer( C_int ), intent( in ) :: mode
    call C_kvs_ArrowGlyph_setSizeMode( this % ptr, mode )
  end subroutine kvs_ArrowGlyph_setSizeMode

  subroutine kvs_ArrowGlyph_setDirectionMode( this, mode )
    implicit none
    class( kvs_ArrowGlyph ), intent( in ) :: this
    integer( C_int ), intent( in ) :: mode
    call C_kvs_ArrowGlyph_setDirectionMode( this % ptr, mode )
  end subroutine kvs_ArrowGlyph_setDirectionMode

  subroutine kvs_ArrowGlyph_setColorMode( this, mode )
    implicit none
    class( kvs_ArrowGlyph ), intent( in ) :: this
    integer( C_int ), intent( in ) :: mode
    call C_kvs_ArrowGlyph_setColorMode( this % ptr, mode )
  end subroutine kvs_ArrowGlyph_setColorMode

  subroutine kvs_ArrowGlyph_setOpacityMode( this, mode )
    implicit none
    class( kvs_ArrowGlyph ), intent( in ) :: this
    integer( C_int ), intent( in ) :: mode
    call C_kvs_ArrowGlyph_setOpacityMode( this % ptr, mode )
  end subroutine kvs_ArrowGlyph_setOpacityMode

  subroutine kvs_ArrowGlyph_setCoords( this, coords, size )
    implicit none
    class( kvs_ArrowGlyph ) :: this
    real, dimension(:), target :: coords
    integer :: size
    call C_kvs_ArrowGlyph_setCoords( this % ptr, c_loc(coords), size )
  end subroutine kvs_ArrowGlyph_setCoords

  subroutine kvs_ArrowGlyph_setSizes( this, sizes, size )
    implicit none
    class( kvs_ArrowGlyph ) :: this
    real, dimension(:), target :: sizes
    integer :: size
    call C_kvs_ArrowGlyph_setSizes( this % ptr, c_loc(sizes), size )
  end subroutine kvs_ArrowGlyph_setSizes

  subroutine kvs_ArrowGlyph_setDirections( this, directions, size )
    implicit none
    class( kvs_ArrowGlyph ) :: this
    real, dimension(:), target :: directions
    integer :: size
    call C_kvs_ArrowGlyph_setDirections( this % ptr, c_loc(directions), size )
  end subroutine kvs_ArrowGlyph_setDirections

  subroutine kvs_ArrowGlyph_setColors( this, colors, size )
    implicit none
    class( kvs_ArrowGlyph ) :: this
    integer, dimension(:), target :: colors
    integer :: size
    call C_kvs_ArrowGlyph_setColors( this % ptr, c_loc(colors), size )
  end subroutine kvs_ArrowGlyph_setColors

  subroutine kvs_ArrowGlyph_setOpacities( this, opacities, size )
    implicit none
    class( kvs_ArrowGlyph ) :: this
    integer, dimension(:), target :: opacities
    integer :: size

    call C_kvs_ArrowGlyph_setOpacities( this % ptr, c_loc(opacities), size )
  end subroutine kvs_ArrowGlyph_setOpacities

  subroutine kvs_ArrowGlyph_setScale( this, scale )
    implicit none
    class( kvs_ArrowGlyph ), intent( in ) :: this
    real( C_float ), intent( in ) :: scale
    call C_kvs_ArrowGlyph_setScale( this % ptr, scale )
  end subroutine kvs_ArrowGlyph_setScale

  subroutine kvs_ArrowGlyph_setTransferFunction( this, tfunc )
    implicit none
    class( kvs_ArrowGlyph ), intent( in ) :: this
    type( kvs_TransferFunction ), intent( in ) :: tfunc
    call C_kvs_ArrowGlyph_setTransferFunction( this % ptr, tfunc % get() )
  end subroutine kvs_ArrowGlyph_setTransferFunction

  ! RendererBase
  subroutine kvs_ArrowGlyph_enableShading( this )
    implicit none
    class( kvs_ArrowGlyph ), intent( in ) :: this
    call C_kvs_ArrowGlyph_enableShading( this % ptr )
  end subroutine kvs_ArrowGlyph_enableShading

  subroutine kvs_ArrowGlyph_disableShading( this )
    implicit none
    class( kvs_ArrowGlyph ), intent( in ) :: this
    call C_kvs_ArrowGlyph_disableShading( this % ptr )
  end subroutine kvs_ArrowGlyph_disableShading

end module kvs_ArrowGlyph_m
