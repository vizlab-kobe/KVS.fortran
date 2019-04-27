program main
  use kvs_m

  implicit none
  integer, parameter :: dimx = 3
  integer, parameter :: dimy = 3
  integer, parameter :: dimz = 3
  integer, parameter :: nvalues = dimx * dimy * dimz
  real, dimension(:), allocatable :: values
  type(kvs_Vec3i) :: resolution
  type(kvs_StructuredVolumeObject) :: object

  resolution%x = dimx
  resolution%y = dimy
  resolution%z = dimz

  allocate( values( nvalues ) )
  values = (/0, 10, 0, 50, 255, 200, 0, 100, 0, 50, 0, 150, 0, 0, 0, 150, 0, 50, 0, 255, 0, 50, 10, 50, 0, 255, 0/)

!  call vis_ExternalFaces( values, size, dimx, dimy, dimz )
!  deallocate( values )

  call kvs_StructuredVolumeObject_new( object )
  call kvs_StructuredVolumeObject_setResolution( object, resolution )
  call kvs_StructuredVolumeObject_setValues( object, values, nvalues )
  call kvs_StructuredVolumeObject_delete( object )

end program main
