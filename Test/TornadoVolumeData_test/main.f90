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
  real, parameter :: isolevel = 0.0
  type( kvs_Isosurface ) :: isosurface
  ! Polygon object
  type( kvs_PolygonObject ) :: polygon
  ! Color image
  type( kvs_ColorImage ) :: image
  ! Tornado Volume Data
  type( kvs_TornadoVolumeData ) :: tornado
  ! Screen
  type( kvs_Screen ) :: screen

  resolution % x = dimx
  resolution % y = dimy
  resolution % z = dimz

  allocate( values( nvalues ) )
  values = (/0, 10, 0, 50, 255, 200, 0, 100, 0, 50, 0, 150, 0, 0, 0, 150, 0, 50, 0, 255, 0, 50, 10, 50, 0, 255, 0/)

  tornado = kvs_TornadoVolumeData( resolution )
  volume = tornado % exec()
  
  ! volume = kvs_StructuredVolumeObject()
  call volume % setGridTypeToUniform()
  ! call volume % setResolution( resolution )
  call volume % setVeclen( veclen )
  ! call volume % setValues( values, nvalues )
  call volume % updateMinMaxValues()
  call volume % print()
  call volume % write( "output_volume.kvsml" )

  isosurface = kvs_Isosurface()
  call isosurface % setIsolevel( isolevel )

  polygon = isosurface % exec( volume )
  call polygon % print()
  call polygon % write( "output_polygon.kvsml" )

  screen = kvs_Screen()
  call screen % registerObject( polygon % get() )
  call screen % draw()

  image = screen % capture()
  call image % write( "output_image.bmp" )

  call volume % delete()
!  call polygon % delete() ! doesn't need to be deleted
  call isosurface % delete()
  call image % delete()
  call screen % delete()
  call tornado % delete()

end program main
