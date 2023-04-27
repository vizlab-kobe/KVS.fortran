program main
  use kvs_m
  implicit none

  type( kvs_Application ) :: app
  type( kvs_Screen ) :: screen
  type( kvs_HydrogenVolumeData ) :: data
  type( kvs_StructuredVolumeObject ) :: volume
  type( kvs_PolygonObject ) :: polygon
  type( kvs_Isosurface ) :: isosurface
  type( kvs_Bounds ) :: bounds

  app = kvs_Application()

  screen = kvs_Screen( app )
  call screen % create()

  data = kvs_HydrogenVolumeData()
  call data % setResolution( 32, 32, 32 );

  volume = data % exec()
  call data % delete()

  isosurface = kvs_Isosurface()
  call isosurface % setIsolevel( 128.0 )

  polygon = isosurface % exec( volume )
  call screen % registerObject( polygon % get() )

  bounds = kvs_Bounds()
  call screen % registerObject( polygon % get(), bounds % get() )

  call app % run()

end program main
