program main
  use kvs_m
  implicit none

  type( kvs_Application ) :: app
  type( kvs_Screen ) :: screen
  type( kvs_HydrogenVolumeData ) :: data
  type( kvs_StructuredVolumeObject ) :: volume
  type( kvs_Bounds ) :: bounds

  app = kvs_Application()

  screen = kvs_Screen( app )
  call screen % create()

  data = kvs_HydrogenVolumeData()
  call data % setResolution( 32, 32, 32 );

  volume = data % exec()
  call data % delete()

  bounds = kvs_Bounds()

  call screen % registerObject( volume % get(), bounds % get() )
  call screen % registerObject( volume % get() )

  call app % run()

end program main
