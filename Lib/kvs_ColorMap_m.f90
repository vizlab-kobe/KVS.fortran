module kvs_ColorMap_m
  use iso_c_binding
  implicit none

!  private
!  include "kvs_ColorMap_c.f90"

  ! Class definition
  public :: kvs_ColorMap
  type kvs_ColorMap
     private
     type( C_ptr ) :: ptr = C_NULL_ptr
   contains
     final :: kvs_ColorMap_destroy ! Destructor
     procedure :: get => kvs_ColorMap_get
     procedure :: delete => kvs_ColorMap_delete
     procedure :: setRange => kvs_ColorMap_setRange
     procedure :: setResolution => kvs_ColorMap_setResolution
     procedure :: create => kvs_ColorMap_create
  end type kvs_ColorMap

  ! Constructor
  interface kvs_ColorMap
     procedure kvs_ColorMap_new
  end interface kvs_ColorMap

  ! Colormap functions
  public :: kvs_ColorMap_Rainbow
  public :: kvs_ColorMap_CoolWarm
  public :: kvs_ColorMap_BrewerBrBG
  public :: kvs_ColorMap_BrewerPiYG
  public :: kvs_ColorMap_BrewerPRGn
  public :: kvs_ColorMap_BrewerPuOr
  public :: kvs_ColorMap_BrewerRdBu
  public :: kvs_ColorMap_BrewerRdGy
  public :: kvs_ColorMap_BrewerRdYlBu
  public :: kvs_ColorMap_BrewerRdYlGn
  public :: kvs_ColorMap_BrewerSpectral
  public :: kvs_ColorMap_Viridis
  public :: kvs_ColorMap_Plasma
  public :: kvs_ColorMap_Inferno
  public :: kvs_ColorMap_Magma
  public :: kvs_ColorMap_Cividis

  ! Private C interfaces
  private
    interface
     function C_kvs_ColorMap_new() result( this )&
          bind( C, name="ColorMap_new" )
       import
       type( C_ptr ) :: this
     end function C_kvs_ColorMap_new

     subroutine C_kvs_ColorMap_delete( this )&
          bind( C, name="ColorMap_delete" )
       import
       type( C_ptr ), value :: this
     end subroutine C_kvs_ColorMap_delete

     subroutine C_kvs_ColorMap_setRange( this, min_value, max_value )&
          bind( C, name="ColorMap_setRange" )
       import
       type( C_ptr ), value :: this
       real( C_float ), value :: min_value
       real( C_float ), value :: max_value
     end subroutine C_kvs_ColorMap_setRange

     subroutine C_kvs_ColorMap_setResolution( this, resolution )&
          bind( C, name="ColorMap_setResolution" )
       import
       type( C_ptr ), value :: this
       integer( C_int ), value :: resolution
     end subroutine C_kvs_ColorMap_setResolution

     subroutine C_kvs_ColorMap_create( this )&
          bind( C, name="ColorMap_create" )
       import
       type( C_ptr ), value :: this
     end subroutine C_kvs_ColorMap_create

     function C_kvs_ColorMap_Rainbow( resolution ) result( this )&
          bind( C, name="ColorMap_Rainbow" )
       import
       integer( C_int ), value :: resolution
       type( C_ptr ) :: this
     end function C_kvs_ColorMap_Rainbow

     function C_kvs_ColorMap_CoolWarm( resolution ) result( this )&
          bind( C, name="ColorMap_CoolWarm" )
       import
       integer( C_int ), value :: resolution
       type( C_ptr ) :: this
     end function C_kvs_ColorMap_CoolWarm

     function C_kvs_ColorMap_BrewerBrBG( resolution ) result( this )&
          bind( C, name="ColorMap_BrewerBrBG" )
       import
       integer( C_int ), value :: resolution
       type( C_ptr ) :: this
     end function C_kvs_ColorMap_BrewerBrBG

     function C_kvs_ColorMap_BrewerPiYG( resolution ) result( this )&
          bind( C, name="ColorMap_BrewerPiYG" )
       import
       integer( C_int ), value :: resolution
       type( C_ptr ) :: this
     end function C_kvs_ColorMap_BrewerPiYG

     function C_kvs_ColorMap_BrewerPRGn( resolution ) result( this )&
          bind( C, name="ColorMap_BrewerPRGn" )
       import
       integer( C_int ), value :: resolution
       type( C_ptr ) :: this
     end function C_kvs_ColorMap_BrewerPRGn

     function C_kvs_ColorMap_BrewerPuOr( resolution ) result( this )&
          bind( C, name="ColorMap_BrewerPuOr" )
       import
       integer( C_int ), value :: resolution
       type( C_ptr ) :: this
     end function C_kvs_ColorMap_BrewerPuOr

     function C_kvs_ColorMap_BrewerRdBu( resolution ) result( this )&
          bind( C, name="ColorMap_BrewerRdBu" )
       import
       integer( C_int ), value :: resolution
       type( C_ptr ) :: this
     end function C_kvs_ColorMap_BrewerRdBu

     function C_kvs_ColorMap_BrewerRdGy( resolution ) result( this )&
          bind( C, name="ColorMap_BrewerRdGy" )
       import
       integer( C_int ), value :: resolution
       type( C_ptr ) :: this
     end function C_kvs_ColorMap_BrewerRdGy

     function C_kvs_ColorMap_BrewerRdYlBu( resolution ) result( this )&
          bind( C, name="ColorMap_BrewerRdYlBu" )
       import
       integer( C_int ), value :: resolution
       type( C_ptr ) :: this
     end function C_kvs_ColorMap_BrewerRdYlBu

     function C_kvs_ColorMap_BrewerRdYlGn( resolution ) result( this )&
          bind( C, name="ColorMap_BrewerRdYlGn" )
       import
       integer( C_int ), value :: resolution
       type( C_ptr ) :: this
     end function C_kvs_ColorMap_BrewerRdYlGn

     function C_kvs_ColorMap_BrewerSpectral( resolution ) result( this )&
          bind( C, name="ColorMap_BrewerSpectral" )
       import
       integer( C_int ), value :: resolution
       type( C_ptr ) :: this
     end function C_kvs_ColorMap_BrewerSpectral

     function C_kvs_ColorMap_Viridis( resolution ) result( this )&
          bind( C, name="ColorMap_Viridis" )
       import
       integer( C_int ), value :: resolution
       type( C_ptr ) :: this
     end function C_kvs_ColorMap_Viridis

     function C_kvs_ColorMap_Plasma( resolution ) result( this )&
          bind( C, name="ColorMap_Plasma" )
       import
       integer( C_int ), value :: resolution
       type( C_ptr ) :: this
     end function C_kvs_ColorMap_Plasma

     function C_kvs_ColorMap_Inferno( resolution ) result( this )&
          bind( C, name="ColorMap_Inferno" )
       import
       integer( C_int ), value :: resolution
       type( C_ptr ) :: this
     end function C_kvs_ColorMap_Inferno

     function C_kvs_ColorMap_Magma( resolution ) result( this )&
          bind( C, name="ColorMap_Magma" )
       import
       integer( C_int ), value :: resolution
       type( C_ptr ) :: this
     end function C_kvs_ColorMap_Magma

     function C_kvs_ColorMap_Cividis( resolution ) result( this )&
          bind( C, name="ColorMap_Cividis" )
       import
       integer( C_int ), value :: resolution
       type( C_ptr ) :: this
     end function C_kvs_ColorMap_Cividis
  end interface

contains

  ! Destructor
  subroutine kvs_ColorMap_destroy( this )
    implicit none
    type( kvs_ColorMap ) :: this
    if ( c_associated( this % ptr ) ) then
       call C_kvs_ColorMap_delete( this % ptr )
       this % ptr = C_NULL_ptr
    end if
  end subroutine kvs_ColorMap_destroy

  function kvs_ColorMap_get( this )
    implicit none
    class( kvs_ColorMap ) :: this
    type( C_ptr ) :: kvs_ColorMap_get
    kvs_ColorMap_get = this % ptr
  end function kvs_ColorMap_get

  function kvs_ColorMap_new()
    implicit none
    type( kvs_ColorMap ) :: kvs_ColorMap_new
    kvs_ColorMap_new % ptr = C_kvs_ColorMap_new()
  end function kvs_ColorMap_new

  subroutine kvs_ColorMap_delete( this )
    implicit none
    class( kvs_ColorMap ) :: this
    call C_kvs_ColorMap_delete( this % ptr )
    this % ptr = C_NULL_ptr
  end subroutine kvs_ColorMap_delete

  subroutine kvs_ColorMap_setRange( this, min_value, max_value )
    implicit none
    class( kvs_ColorMap ), intent( in ) :: this
    real( C_float ), intent( in ) :: min_value
    real( C_float ), intent( in ) :: max_value
    call C_kvs_ColorMap_setRange( this % ptr, min_value, max_value )
  end subroutine kvs_ColorMap_setRange

  subroutine kvs_ColorMap_setResolution( this, resolution )
    implicit none
    class( kvs_ColorMap ), intent( in ) :: this
    integer( C_int ), intent( in ) :: resolution
    call C_kvs_ColorMap_setResolution( this % ptr, resolution )
  end subroutine kvs_ColorMap_setResolution

  subroutine kvs_ColorMap_create( this )
    implicit none
    class( kvs_ColorMap ) :: this
    call C_kvs_ColorMap_create( this % ptr )
  end subroutine kvs_ColorMap_create

  function kvs_ColorMap_Rainbow( resolution )
    implicit none
    type( kvs_ColorMap ) :: kvs_ColorMap_Rainbow
    integer( C_int ), optional :: resolution
    if ( present( resolution ) ) then
       kvs_ColorMap_Rainbow % ptr = C_kvs_ColorMap_Rainbow( resolution )
    else
       kvs_ColorMap_Rainbow % ptr = C_kvs_ColorMap_Rainbow( 256 )
    end if
  end function kvs_ColorMap_Rainbow

  function kvs_ColorMap_CoolWarm( resolution )
    implicit none
    type( kvs_ColorMap ) :: kvs_ColorMap_CoolWarm
    integer( C_int ), optional :: resolution
    if ( present( resolution ) ) then
       kvs_ColorMap_CoolWarm % ptr = C_kvs_ColorMap_CoolWarm( resolution )
    else
       kvs_ColorMap_CoolWarm % ptr = C_kvs_ColorMap_CoolWarm( 256 )
    end if
  end function kvs_ColorMap_CoolWarm

  function kvs_ColorMap_BrewerBrBG( resolution )
    implicit none
    type( kvs_ColorMap ) :: kvs_ColorMap_BrewerBrBG
    integer( C_int ), optional :: resolution
    if ( present( resolution ) ) then
       kvs_ColorMap_BrewerBrBG % ptr = C_kvs_ColorMap_BrewerBrBG( resolution )
    else
       kvs_ColorMap_BrewerBrBG % ptr = C_kvs_ColorMap_BrewerBrBG( 256 )
    end if
  end function kvs_ColorMap_BrewerBrBG

  function kvs_ColorMap_BrewerPiYG( resolution )
    implicit none
    type( kvs_ColorMap ) :: kvs_ColorMap_BrewerPiYG
    integer( C_int ), optional :: resolution
    if ( present( resolution ) ) then
       kvs_ColorMap_BrewerPiYG % ptr = C_kvs_ColorMap_BrewerPiYG( resolution )
    else
       kvs_ColorMap_BrewerPiYG % ptr = C_kvs_ColorMap_BrewerPiYG( 256 )
    end if
  end function kvs_ColorMap_BrewerPiYG

  function kvs_ColorMap_BrewerPRGn( resolution )
    implicit none
    type( kvs_ColorMap ) :: kvs_ColorMap_BrewerPRGn
    integer( C_int ), optional :: resolution
    if ( present( resolution ) ) then
       kvs_ColorMap_BrewerPRGn % ptr = C_kvs_ColorMap_BrewerPRGn( resolution )
    else
       kvs_ColorMap_BrewerPRGn % ptr = C_kvs_ColorMap_BrewerPRGn( 256 )
    end if
  end function kvs_ColorMap_BrewerPRGn

  function kvs_ColorMap_BrewerPuOr( resolution )
    implicit none
    type( kvs_ColorMap ) :: kvs_ColorMap_BrewerPuOr
    integer( C_int ), optional :: resolution
    if ( present( resolution ) ) then
       kvs_ColorMap_BrewerPuOr % ptr = C_kvs_ColorMap_BrewerPuOr( resolution )
    else
       kvs_ColorMap_BrewerPuOr % ptr = C_kvs_ColorMap_BrewerPuOr( 256 )
    end if
  end function kvs_ColorMap_BrewerPuOr

  function kvs_ColorMap_BrewerRdBu( resolution )
    implicit none
    type( kvs_ColorMap ) :: kvs_ColorMap_BrewerRdBu
    integer( C_int ), optional :: resolution
    if ( present( resolution ) ) then
       kvs_ColorMap_BrewerRdBu % ptr = C_kvs_ColorMap_BrewerRdBu( resolution )
    else
       kvs_ColorMap_BrewerRdBu % ptr = C_kvs_ColorMap_BrewerRdBu( 256 )
    end if
  end function kvs_ColorMap_BrewerRdBu

  function kvs_ColorMap_BrewerRdGy( resolution )
    implicit none
    type( kvs_ColorMap ) :: kvs_ColorMap_BrewerRdGy
    integer( C_int ), optional :: resolution
    if ( present( resolution ) ) then
       kvs_ColorMap_BrewerRdGy % ptr = C_kvs_ColorMap_BrewerRdGy( resolution )
    else
       kvs_ColorMap_BrewerRdGy % ptr = C_kvs_ColorMap_BrewerRdGy( 256 )
    end if
  end function kvs_ColorMap_BrewerRdGy

  function kvs_ColorMap_BrewerRdYlBu( resolution )
    implicit none
    type( kvs_ColorMap ) :: kvs_ColorMap_BrewerRdYlBu
    integer( C_int ), optional :: resolution
    if ( present( resolution ) ) then
       kvs_ColorMap_BrewerRdYlBu % ptr = C_kvs_ColorMap_BrewerRdYlBu( resolution )
    else
       kvs_ColorMap_BrewerRdYlBu % ptr = C_kvs_ColorMap_BrewerRdYlBu( 256 )
    end if
  end function kvs_ColorMap_BrewerRdYlBu

  function kvs_ColorMap_BrewerRdYlGn( resolution )
    implicit none
    type( kvs_ColorMap ) :: kvs_ColorMap_BrewerRdYlGn
    integer( C_int ), optional :: resolution
    if ( present( resolution ) ) then
       kvs_ColorMap_BrewerRdYlGn % ptr = C_kvs_ColorMap_BrewerRdYlGn( resolution )
    else
       kvs_ColorMap_BrewerRdYlGn % ptr = C_kvs_ColorMap_BrewerRdYlGn( 256 )
    end if
  end function kvs_ColorMap_BrewerRdYlGn

  function kvs_ColorMap_BrewerSpectral( resolution )
    implicit none
    type( kvs_ColorMap ) :: kvs_ColorMap_BrewerSpectral
    integer( C_int ), optional :: resolution
    if ( present( resolution ) ) then
       kvs_ColorMap_BrewerSpectral % ptr = C_kvs_ColorMap_BrewerSpectral( resolution )
    else
       kvs_ColorMap_BrewerSpectral % ptr = C_kvs_ColorMap_BrewerSpectral( 256 )
    end if
  end function kvs_ColorMap_BrewerSpectral

  function kvs_ColorMap_Viridis( resolution )
    implicit none
    type( kvs_ColorMap ) :: kvs_ColorMap_Viridis
    integer( C_int ), optional :: resolution
    if ( present( resolution ) ) then
       kvs_ColorMap_Viridis % ptr = C_kvs_ColorMap_Viridis( resolution )
    else
       kvs_ColorMap_Viridis % ptr = C_kvs_ColorMap_Viridis( 256 )
    end if
  end function kvs_ColorMap_Viridis

  function kvs_ColorMap_Plasma( resolution )
    implicit none
    type( kvs_ColorMap ) :: kvs_ColorMap_Plasma
    integer( C_int ), optional :: resolution
    if ( present( resolution ) ) then
       kvs_ColorMap_Plasma % ptr = C_kvs_ColorMap_Plasma( resolution )
    else
       kvs_ColorMap_Plasma % ptr = C_kvs_ColorMap_Plasma( 256 )
    end if
  end function kvs_ColorMap_Plasma

  function kvs_ColorMap_Inferno( resolution )
    implicit none
    type( kvs_ColorMap ) :: kvs_ColorMap_Inferno
    integer( C_int ), optional :: resolution
    if ( present( resolution ) ) then
       kvs_ColorMap_Inferno % ptr = C_kvs_ColorMap_Inferno( resolution )
    else
       kvs_ColorMap_Inferno % ptr = C_kvs_ColorMap_Inferno( 256 )
    end if
  end function kvs_ColorMap_Inferno

  function kvs_ColorMap_Magma( resolution )
    implicit none
    type( kvs_ColorMap ) :: kvs_ColorMap_Magma
    integer( C_int ), optional :: resolution
    if ( present( resolution ) ) then
       kvs_ColorMap_Magma % ptr = C_kvs_ColorMap_Magma( resolution )
    else
       kvs_ColorMap_Magma % ptr = C_kvs_ColorMap_Magma( 256 )
    end if
  end function kvs_ColorMap_Magma

  function kvs_ColorMap_Cividis( resolution )
    implicit none
    type( kvs_ColorMap ) :: kvs_ColorMap_Cividis
    integer( C_int ), optional :: resolution
    if ( present( resolution ) ) then
       kvs_ColorMap_Cividis % ptr = C_kvs_ColorMap_Cividis( resolution )
    else
       kvs_ColorMap_Cividis % ptr = C_kvs_ColorMap_Cividis( 256 )
    end if
  end function kvs_ColorMap_Cividis

end module kvs_ColorMap_m
