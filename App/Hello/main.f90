program main
  use kvs_m

  implicit none
  integer, parameter :: dimx = 3
  integer, parameter :: dimy = 3
  integer, parameter :: dimz = 3
  integer, parameter :: veclen = 1
  integer, parameter :: nvalues = dimx * dimy * dimz * veclen
  real, dimension(:), allocatable :: values
  ! Volume object
  type( kvs_Vec3i ) :: resolution
  type( kvs_StructuredVolumeObject ) :: volume
  ! Isosurface mapper
  real, parameter :: isolevel = 128
  type( kvs_Isosurface ) :: isosurface
  ! Polygon object
  type( kvs_PolygonObject ) :: polygon

  resolution % x = dimx
  resolution % y = dimy
  resolution % z = dimz

  allocate( values( nvalues ) )
  values = (/0, 10, 0, 50, 255, 200, 0, 100, 0, 50, 0, 150, 0, 0, 0, 150, 0, 50, 0, 255, 0, 50, 10, 50, 0, 255, 0/)

  volume = kvs_StructuredVolumeObject()
  call volume % setGridTypeToUniform()
  call volume % setResolution( resolution )
  call volume % setVeclen( veclen )
  call volume % setValues( values, nvalues )
  call volume % updateMinMaxValues()
  call volume % print()
  call volume % write( "output_volume.kvsml" )

  isosurface = kvs_Isosurface()
  call isosurface % setIsolevel( isolevel )

  polygon = isosurface % exec( volume )
  call polygon % print()
  call polygon % write( "output_polygon.kvsml" )

  call volume % delete()
  call polygon % delete()
  call isosurface % delete()

end program main
