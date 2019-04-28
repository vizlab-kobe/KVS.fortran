module kvs_StructuredVolumeObject_m
  use iso_c_binding
  use kvs_Vec3_m
  implicit none

  private

  ! Type
  type kvs_StructuredVolumeObject
     private
     type( C_ptr ) :: object = C_NULL_ptr
  end type kvs_StructuredVolumeObject

  ! C interface
  interface

     function C_kvs_StructuredVolumeObject_new () result( this )&
          bind( C, name="StructuredVolumeObject_new" )
       import
       type( C_ptr ) :: this
     end function C_kvs_StructuredVolumeObject_new

     subroutine C_kvs_StructuredVolumeObject_delete ( this )&
          bind( C, name="StructuredVolumeObject_delete" )
       import
       type( C_ptr ), value :: this
     end subroutine C_kvs_StructuredVolumeObject_delete

     subroutine C_kvs_StructuredVolumeObject_setGridTypeToUniform ( this )&
          bind( C, name="StructuredVolumeObject_setGridTypeToUniform" )
       import
       type( C_ptr ), value :: this
     end subroutine C_kvs_StructuredVolumeObject_setGridTypeToUniform

     subroutine C_kvs_StructuredVolumeObject_setResolution ( this, dimx, dimy, dimz )&
          bind( C, name="StructuredVolumeObject_setResolution" )
       import
       type( C_ptr ), value :: this
       integer( C_int ), value :: dimx
       integer( C_int ), value :: dimy
       integer( C_int ), value :: dimz
     end subroutine C_kvs_StructuredVolumeObject_setResolution

     subroutine C_kvs_StructuredVolumeObject_setVeclen ( this, veclen )&
          bind( C, name="StructuredVolumeObject_setVeclen" )
       import
       type( C_ptr ), value :: this
       integer( C_int ), value :: veclen
     end subroutine C_kvs_StructuredVolumeObject_setVeclen

     subroutine C_kvs_StructuredVolumeObject_setValues ( this, values, nvalues )&
          bind( C, name="StructuredVolumeObject_setValues" )
       import
       type( C_ptr ), value :: this
       real( C_float ) :: values(nvalues)
       integer( C_int ), value :: nvalues
     end subroutine C_kvs_StructuredVolumeObject_setValues

     subroutine C_kvs_StructuredVolumeObject_updateMinMaxCoords ( this )&
          bind( C, name="StructuredVolumeObject_updateMinMaxCoords" )
       import
       type( C_ptr ), value :: this
     end subroutine C_kvs_StructuredVolumeObject_updateMinMaxCoords

     subroutine C_kvs_StructuredVolumeObject_updateMinMaxValues ( this )&
          bind( C, name="StructuredVolumeObject_updateMinMaxValues" )
       import
       type( C_ptr ), value :: this
     end subroutine C_kvs_StructuredVolumeObject_updateMinMaxValues

  end interface

  ! Interface
  interface kvs_StructuredVolumeObject_new
     module procedure F_kvs_StructuredVolumeObject_new
  end interface kvs_StructuredVolumeObject_new

  interface kvs_StructuredVolumeObject_delete
     module procedure F_kvs_StructuredVolumeObject_delete
  end interface kvs_StructuredVolumeObject_delete

  interface kvs_StructuredVolumeObject_setGridTypeToUniform
     module procedure F_kvs_StructuredVolumeObject_setGridTypeToUniform
  end interface kvs_StructuredVolumeObject_setGridTypeToUniform

  interface kvs_StructuredVolumeObject_setResolution
     module procedure F_kvs_StructuredVolumeObject_setResolution
  end interface kvs_StructuredVolumeObject_setResolution

  interface kvs_StructuredVolumeObject_setVeclen
     module procedure F_kvs_StructuredVolumeObject_setVeclen
  end interface kvs_StructuredVolumeObject_setVeclen

  interface kvs_StructuredVolumeObject_setValues
     module procedure F_kvs_StructuredVolumeObject_setValues
  end interface kvs_StructuredVolumeObject_setValues

  interface kvs_StructuredVolumeObject_updateMinMaxCoords
     module procedure F_kvs_StructuredVolumeObject_updateMinMaxCoords
  end interface kvs_StructuredVolumeObject_updateMinMaxCoords

  interface kvs_StructuredVolumeObject_updateMinMaxValues
     module procedure F_kvs_StructuredVolumeObject_updateMinMaxValues
  end interface kvs_StructuredVolumeObject_updateMinMaxValues

  ! Public interface
  public :: kvs_StructuredVolumeObject
  public :: kvs_StructuredVolumeObject_new
  public :: kvs_StructuredVolumeObject_delete
  public :: kvs_StructuredVolumeObject_setGridTypeToUniform
  public :: kvs_StructuredVolumeObject_setResolution
  public :: kvs_StructuredVolumeObject_setVeclen
  public :: kvs_StructuredVolumeObject_setValues
  public :: kvs_StructuredVolumeObject_updateMinMaxCoords
  public :: kvs_StructuredVolumeObject_updateMinMaxValues

contains

  ! F interface
  subroutine F_kvs_StructuredVolumeObject_new ( this )
    type( kvs_StructuredVolumeObject ), intent( out ) :: this
    this%object = C_kvs_StructuredVolumeObject_new()
  end subroutine F_kvs_StructuredVolumeObject_new

  subroutine F_kvs_StructuredVolumeObject_delete ( this )
    type( kvs_StructuredVolumeObject ), intent( inout ) :: this
    call C_kvs_StructuredVolumeObject_delete( this%object )
    this%object = C_NULL_ptr
  end subroutine F_kvs_StructuredVolumeObject_delete

  subroutine F_kvs_StructuredVolumeObject_setGridTypeToUniform ( this )
    type( kvs_StructuredVolumeObject ), intent( inout ) :: this
    call C_kvs_StructuredVolumeObject_setGridTypeToUniform( this%object )
  end subroutine F_kvs_StructuredVolumeObject_setGridTypeToUniform

  subroutine F_kvs_StructuredVolumeObject_setResolution ( this, resolution )
    type( kvs_StructuredVolumeObject ), intent( inout ) :: this
    type( kvs_Vec3i ), intent( in ) :: resolution
    call C_kvs_StructuredVolumeObject_setResolution( this%object, resolution%x, resolution%y, resolution%z )
  end subroutine F_kvs_StructuredVolumeObject_setResolution

  subroutine F_kvs_StructuredVolumeObject_setVeclen ( this, veclen )
    type(kvs_StructuredVolumeObject), intent( inout ) :: this
    integer( C_int ), intent( in ) :: veclen
    call C_kvs_StructuredVolumeObject_setVeclen( this%object, veclen )
  end subroutine F_kvs_StructuredVolumeObject_setVeclen

  subroutine F_kvs_StructuredVolumeObject_setValues ( this, values, nvalues )
    type(kvs_StructuredVolumeObject), intent( inout ) :: this
    real( C_float ), intent( in ) :: values(nvalues)
    integer( C_int ), intent( in ) :: nvalues
    call C_kvs_StructuredVolumeObject_setValues( this%object, values, nvalues )
  end subroutine F_kvs_StructuredVolumeObject_setValues

  subroutine F_kvs_StructuredVolumeObject_updateMinMaxCoords ( this )
    type( kvs_StructuredVolumeObject ), intent( in ) :: this
    call C_kvs_StructuredVolumeObject_updateMinMaxCoords( this%object )
  end subroutine F_kvs_StructuredVolumeObject_updateMinMaxCoords

  subroutine F_kvs_StructuredVolumeObject_updateMinMaxValues ( this )
    type( kvs_StructuredVolumeObject ), intent( in ) :: this
    call C_kvs_StructuredVolumeObject_updateMinMaxValues( this%object )
  end subroutine F_kvs_StructuredVolumeObject_updateMinMaxValues

end module kvs_StructuredVolumeObject_m
