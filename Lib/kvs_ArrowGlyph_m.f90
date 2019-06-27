module kvs_ArrowGlyph_m
  use iso_c_binding
  use kvs_TransferFunction_m
  implicit none

  private
  include "kvs_ArrowGlyph_c.f90"

  ! Class definition
  public :: kvs_ArrowGlyph
  type kvs_ArrowGlyph
     private
     type( C_ptr ) :: ptr = C_NULL_ptr
   contains
!     final :: kvs_ArrowGlyph_finalize ! Destructor
     procedure :: delete => kvs_ArrowGlyph_delete
     procedure :: get => kvs_ArrowGlyph_get
     procedure :: setType => kvs_ArrowGlyph_setType
     
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

  enum,bind(c)
    enumerator :: Box=0, Corner = 1, Circle = 2
  end enum

  interface kvs_ArrowGlyph ! Constructor
     procedure kvs_ArrowGlyph_new
  end interface kvs_ArrowGlyph

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

  subroutine kvs_ArrowGlyph_finalize( this )
    implicit none
    type( kvs_ArrowGlyph ) :: this
    if ( c_associated( this % ptr ) ) then
       call C_kvs_ArrowGlyph_delete( this % ptr )
       this % ptr = C_NULL_ptr
    endif
  end subroutine kvs_ArrowGlyph_finalize

  subroutine kvs_ArrowGlyph_delete( this )
    implicit none
    class( kvs_ArrowGlyph ) :: this
    call C_kvs_ArrowGlyph_delete( this % ptr )
    this % ptr = C_NULL_ptr
  end subroutine kvs_ArrowGlyph_delete

  subroutine kvs_ArrowGlyph_setType( this, boundsType )
    implicit none
    class( kvs_ArrowGlyph ), intent( in ) :: this
    integer( C_int ), intent( in ) :: boundsType
    call C_kvs_ArrowGlyph_setType( this % ptr, boundsType )
  end subroutine kvs_ArrowGlyph_setType

  subroutine kvs_ArrowGlyph_setSizeMode( this, sizeMode )
    implicit none
    class( kvs_ArrowGlyph ), intent( in ) :: this
    integer( C_int ), intent( in ) :: sizeMode
    call C_kvs_ArrowGlyph_setSizeMode( this % ptr, sizeMode )
  end subroutine kvs_ArrowGlyph_setSizeMode

  subroutine kvs_ArrowGlyph_setDirectionMode( this, directionMode )
    implicit none
    class( kvs_ArrowGlyph ), intent( in ) :: this
    integer( C_int ), intent( in ) :: directionMode
    call C_kvs_ArrowGlyph_setDirectionMode( this % ptr, directionMode )
  end subroutine kvs_ArrowGlyph_setDirectionMode

  subroutine kvs_ArrowGlyph_setColorMode( this, colorMode )
    implicit none
    class( kvs_ArrowGlyph ), intent( in ) :: this
    integer( C_int ), intent( in ) :: colorMode
    call C_kvs_ArrowGlyph_setColorMode( this % ptr, colorMode )
  end subroutine kvs_ArrowGlyph_setColorMode

  subroutine kvs_ArrowGlyph_setOpacityMode( this, opacityMode )
    implicit none
    class( kvs_ArrowGlyph ), intent( in ) :: this
    integer( C_int ), intent( in ) :: opacityMode
    call C_kvs_ArrowGlyph_setOpacityMode( this % ptr, opacityMode )
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
