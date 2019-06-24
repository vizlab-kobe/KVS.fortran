module kvs_Bounds_m
  use iso_c_binding
  use kvs_LineObject_m
  implicit none

  private
  include "kvs_Bounds_c.f90"

  ! Class definition
  public :: kvs_Bounds
  type kvs_Bounds
     private
     type( C_ptr ) :: ptr = C_NULL_ptr
   contains
!     final :: kvs_Bounds_finalize ! Destructor
     procedure :: delete => kvs_Bounds_delete
     procedure :: get => kvs_Bounds_get
     procedure :: setType => kvs_Bounds_setType
     procedure :: setLineWidth => kvs_Bounds_setLineWidth
     procedure :: setCornerScale => kvs_Bounds_setCornerScale
     procedure :: setCircleDivision => kvs_Bounds_setCircleDivision
     procedure :: enableAntiAliasing => kvs_Bounds_enableAntiAliasing
     procedure :: disableAntiAliasing => kvs_Bounds_disableAntiAliasing
     procedure :: show => kvs_Bounds_show
     procedure :: hide => kvs_Bounds_hide
     
     ! RendererBase
     procedure :: enableShading => kvs_Bounds_enableShading
     procedure :: disableShading => kvs_Bounds_disableShading
  end type kvs_Bounds

  enum,bind(c)
    enumerator :: Box=0, Corner = 1, Circle = 2
  end enum

  interface kvs_Bounds ! Constructor
     procedure kvs_Bounds_new
  end interface kvs_Bounds

contains

  function kvs_Bounds_get( this )
    implicit none
    class( kvs_Bounds ) :: this
    type( C_ptr ) :: kvs_Bounds_get
    kvs_Bounds_get = this % ptr
  end function kvs_Bounds_get

  function kvs_Bounds_new()
    implicit none
    type( kvs_Bounds ) :: kvs_Bounds_new
    kvs_Bounds_new % ptr = C_kvs_Bounds_new()
  end function kvs_Bounds_new

  subroutine kvs_Bounds_finalize( this )
    implicit none
    type( kvs_Bounds ) :: this
    if ( c_associated( this % ptr ) ) then
       call C_kvs_Bounds_delete( this % ptr )
       this % ptr = C_NULL_ptr
    endif
  end subroutine kvs_Bounds_finalize

  subroutine kvs_Bounds_delete( this )
    implicit none
    class( kvs_Bounds ) :: this
    call C_kvs_Bounds_delete( this % ptr )
    this % ptr = C_NULL_ptr
  end subroutine kvs_Bounds_delete

  subroutine kvs_Bounds_setType( this, boundsType )
    implicit none
    class( kvs_Bounds ), intent( in ) :: this
    integer( C_int ), intent( in ) :: boundsType
    call C_kvs_Bounds_setType( this % ptr, boundsType )
  end subroutine kvs_Bounds_setType

!  subroutine kvs_Bounds_setLineColor( this, lineColor )
!    implicit none
!    class( kvs_Bounds ), intent( in ) :: this
!    class( kvs_RGBColor ), intent( in ) :: lineColor
!    call C_kvs_Bounds_setLineColor( this % ptr, lineColor )
!  end subroutine kvs_Bounds_setLineColor

  subroutine kvs_Bounds_setLineWidth( this, lineWidth )
    implicit none
    class( kvs_Bounds ), intent( in ) :: this
    real( C_float ), intent( in ) :: lineWidth
    call C_kvs_Bounds_setLineWidth( this % ptr, lineWidth )
  end subroutine kvs_Bounds_setLineWidth

  subroutine kvs_Bounds_setCornerScale( this, cornerScale )
    implicit none
    class( kvs_Bounds ), intent( in ) :: this
    real( C_float ), intent( in ) :: cornerScale
    call C_kvs_Bounds_setCornerScale( this % ptr, cornerScale )
  end subroutine kvs_Bounds_setCornerScale

  subroutine kvs_Bounds_setCircleDivision( this, circleDivision )
    implicit none
    class( kvs_Bounds ), intent( in ) :: this
    real( C_float ), intent( in ) :: circleDivision
    call C_kvs_Bounds_setCircleDivision( this % ptr, circleDivision )
  end subroutine kvs_Bounds_setCircleDivision

  subroutine kvs_Bounds_enableAntiAliasing( this )
    implicit none
    class( kvs_Bounds ), intent( in ) :: this
    call C_kvs_Bounds_enableAntiAliasing( this % ptr)
  end subroutine kvs_Bounds_enableAntiAliasing

  subroutine kvs_Bounds_disableAntiAliasing( this )
    implicit none
    class( kvs_Bounds ), intent( in ) :: this
    call C_kvs_Bounds_disableAntiAliasing( this % ptr )
  end subroutine kvs_Bounds_disableAntiAliasing

  subroutine kvs_Bounds_show( this )
    implicit none
    class( kvs_Bounds ), intent( in ) :: this
    call C_kvs_Bounds_show( this % ptr )
  end subroutine kvs_Bounds_show

  subroutine kvs_Bounds_hide( this )
    implicit none
    class( kvs_Bounds ), intent( in ) :: this
    call C_kvs_Bounds_hide( this % ptr )
  end subroutine kvs_Bounds_hide

  function kvs_Bounds_outputLineObject( this, object_ptr )
    implicit none
    class( kvs_Bounds ), intent( in ) :: this
    type( C_ptr ), intent( in ) :: object_ptr
    type( kvs_LineObject ) :: kvs_Bounds_outputLineObject
    kvs_Bounds_outputLineObject = kvs_LineObject(C_kvs_Bounds_outputLineObject( this % ptr, object_ptr ));
  end function kvs_Bounds_outputLineObject

  ! RendererBase
  subroutine kvs_Bounds_enableShading( this )
    implicit none
    class( kvs_Bounds ), intent( in ) :: this
    call C_kvs_Bounds_enableShading( this % ptr )
  end subroutine kvs_Bounds_enableShading

  subroutine kvs_Bounds_disableShading( this )
    implicit none
    class( kvs_Bounds ), intent( in ) :: this
    call C_kvs_Bounds_disableShading( this % ptr )
  end subroutine kvs_Bounds_disableShading

end module kvs_Bounds_m
