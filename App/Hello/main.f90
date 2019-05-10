program main
  use kvs_m

  implicit none
  integer, parameter :: dimx = 3
  integer, parameter :: dimy = 3
  integer, parameter :: dimz = 3
  integer, parameter :: veclen = 1
  integer, parameter :: nvalues = dimx * dimy * dimz * veclen
  real, dimension(:), allocatable :: values

  type(kvs_Vec3i) :: resolution
  type(kvs_StructuredVolumeObject) :: volume

  real, parameter :: isolevel = 128
  type(kvs_Isosurface) :: isosurface

  resolution%x = dimx
  resolution%y = dimy
  resolution%z = dimz

  allocate( values( nvalues ) )
  values = (/0, 10, 0, 50, 255, 200, 0, 100, 0, 50, 0, 150, 0, 0, 0, 150, 0, 50, 0, 255, 0, 50, 10, 50, 0, 255, 0/)

  volume = kvs_StructuredVolumeObject()
  call volume % setGridTypeToUniform()
  call volume % setResolution( resolution )
  call volume % setVeclen( veclen )
  call volume % setValues( values, nvalues )
  call volume % updateMinMaxValues()

  isosurface = kvs_Isosurface()
  call isosurface % setIsolevel( isolevel )

end program main
