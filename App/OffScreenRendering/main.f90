program main
  use kvs_m
  implicit none

  type( kvs_OffScreen ) :: screen
  type( kvs_HydrogenVolumeData ) :: data
  type( kvs_StructuredVolumeObject ) :: volume
  type( kvs_PolygonObject ) :: polygon
  type( kvs_Isosurface ) :: isosurface
  type( kvs_Bounds ) :: bounds
  type( kvs_ColorImage ) :: image

  screen = kvs_OffScreen()
  call screen % create()

  data = kvs_HydrogenVolumeData()
  call data % setResolution( 32, 32, 32 );

  volume = data % exec()
  call data % delete()

  isosurface = kvs_Isosurface()
  call isosurface % setIsolevel( 90.0 )

  polygon = isosurface % exec( volume )
  bounds = kvs_Bounds()

  call screen % registerObject( polygon % get(), bounds % get() )
  call screen % registerObject( polygon % get() )
  call screen % draw()

  image = screen % capture()
  call image % write( "output.bmp" )

end program main
