module kvs_Vec3_m
  implicit none

  ! Class definition
  public :: kvs_Vec3
  type :: kvs_Vec3
     real :: x, y, z
  end type kvs_Vec3

  public :: kvs_Vec3d
  type :: kvs_Vec3d
     double precision :: x, y, z
  end type kvs_Vec3d

  public :: kvs_Vec3i
  type :: kvs_Vec3i
     integer :: x, y, z
  end type kvs_Vec3i

  ! Constructor
  interface kvs_Vec3
     procedure kvs_Vec3_new
  end interface kvs_Vec3

  interface kvs_Vec3d
     procedure kvs_Vec3d_new
  end interface kvs_Vec3d

  interface kvs_Vec3i
     procedure kvs_Vec3i_new
  end interface kvs_Vec3i

contains

  function kvs_Vec3_new( x, y, z )
    implicit none
    real, intent( in ), optional :: x, y, z
    type( kvs_Vec3 ) :: kvs_Vec3_new
    if ( present(x) ) then; kvs_Vec3_new % x = x; end if
    if ( present(y) ) then; kvs_Vec3_new % y = y; end if
    if ( present(z) ) then; kvs_Vec3_new % z = z; end if
  end function kvs_Vec3_new

  function kvs_Vec3d_new( x, y, z )
    implicit none
    double precision, intent( in ), optional :: x, y, z
    type( kvs_Vec3d ) :: kvs_Vec3d_new
    if ( present(x) ) then; kvs_Vec3d_new % x = x; end if
    if ( present(y) ) then; kvs_Vec3d_new % y = y; end if
    if ( present(z) ) then; kvs_Vec3d_new % z = z; end if
  end function kvs_Vec3d_new

  function kvs_Vec3i_new( x, y, z )
    implicit none
    integer, intent( in ), optional :: x, y, z
    type( kvs_Vec3i ) :: kvs_Vec3i_new
    if ( present(x) ) then; kvs_Vec3i_new % x = x; end if
    if ( present(y) ) then; kvs_Vec3i_new % y = y; end if
    if ( present(z) ) then; kvs_Vec3i_new % z = z; end if
  end function kvs_Vec3i_new

end module kvs_Vec3_m
