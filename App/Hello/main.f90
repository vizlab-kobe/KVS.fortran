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

!  call vis_ExternalFaces( values, size, dimx, dimy, dimz )
!  deallocate( values )

  call kvs_StructuredVolumeObject_new( volume )
  call kvs_StructuredVolumeObject_setGridTypeToUniform( volume )
  call kvs_StructuredVolumeObject_setResolution( volume, resolution )
  call kvs_StructuredVolumeObject_setVeclen( volume, veclen )
  call kvs_StructuredVolumeObject_setValues( volume, values, nvalues )
  call kvs_StructuredVolumeObject_updateMinMaxValues( volume )
  call kvs_StructuredVolumeObject_delete( volume )

  call kvs_Isosurface_new( isosurface )
  call kvs_Isosurface_setIsolevel( isosurface, isolevel )
  call kvs_Isosurface_delete( isosurface )

end program main
