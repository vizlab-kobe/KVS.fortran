module kvs_Vec3_m
  implicit none

  private

  type :: kvs_Vec3
     real :: x, y, z
  end type kvs_Vec3

  type :: kvs_Vec3d
     double precision :: x, y, z
  end type kvs_Vec3d

  type :: kvs_Vec3i
     integer :: x, y, z
  end type kvs_Vec3i

  ! Public interface
  public :: kvs_Vec3
  public :: kvs_Vec3d
  public :: kvs_Vec3i

end module kvs_Vec3_m
