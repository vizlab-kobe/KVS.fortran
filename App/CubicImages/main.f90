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
  ! Color image
  type( kvs_ColorImage ) :: image
  ! Screen
  type( kvs_Screen ) :: screen

  type( kvs_StructuredVolumeObject ) :: volume2
  type( kvs_TornadoVolumeData ) :: tornado2
  type( kvs_Vec3i ) :: vec2

  type( kvs_Bounds ) :: bounds
  

  resolution % x = dimx
  resolution % y = dimy
  resolution % z = dimz

  allocate( values( nvalues ) )
  values = (/0, 10, 0, 50, 255, 200, 0, 100, 0, 50, 0, 150, 0, 0, 0, 150, 0, 50, 0, 255, 0, 50, 10, 50, 0, 255, 0/)

  !volume = kvs_StructuredVolumeObject()
  !call volume % setGridTypeToUniform()
  !call volume % setResolution( resolution )
  !call volume % setVeclen( veclen )
  !call volume % setValues( values, nvalues )
  !call volume % updateMinMaxValues()
  !call volume % print()
  !call volume % write( "output_volume.kvsml" )

  !isosurface = kvs_Isosurface()
  !call isosurface % setIsolevel( isolevel )

  ! polygon = isosurface % exec( volume )
  polygon = GenerateStreamlines()
  call polygon % print()
  call polygon % write( "output_polygon.kvsml" )

  ! Bounds 
  call screen % registerObject( polygon % get(), bounds % get() )
  call screen % registerObject( polygon % get() )
  call screen % draw()

  image = screen % capture()
  call image % write( "output_image.bmp" )

  call volume % delete()
!  call polygon % delete() ! doesn't need to be deleted
  call isosurface % delete()
  call image % delete()
  call screen % delete()

  contains
  function GenerateStreamlines()
    implicit none
    type( kvs_PolygonObject ) :: GenerateStreamlines
    type( kvs_StructuredVolumeObject ) :: volume
    type( kvs_TornadoVolumeData ) :: tornado
    type( kvs_Vec3i ) :: vec
    type( kvs_PointObject ) :: point
    real, dimension((19-17)*(19-17)*(25-10) * 3) :: points
    integer :: counts = 1
    integer :: x,y,z
    type( kvs_TransferFunction ) :: tfunc
    type( kvs_LineObject ) :: line
    type( kvs_Streamline ) :: streamline
    type( kvs_Tubeline ) :: tubeline
    real :: line_size = 0.2

    vec % x = 32
    vec % y = 32
    vec % z = 32
    tornado = kvs_TornadoVolumeData(vec)
    volume = tornado % exec()
    do z = 10, 25-1
      do y = 17, 19-1
        do x = 17, 19-1
          points(counts) = x
          counts = counts + 1
          points(counts) = y
          counts = counts + 1
          points(counts) = z
          counts = counts + 1
        end do
      end do
    end do
    point = kvs_PointObject()
    call point % setCoords(points, (19-17)*(19-17)*(25-10) * 3)

    tfunc = kvs_TransferFunction()
    streamline = kvs_Streamline()
    line = streamline % exec(volume, point, tfunc)
    call line % setSize(line_size)
    call point % delete()
    call volume % delete()
    tubeline = kvs_Tubeline()
    GenerateStreamlines = tubeline % exec(line, 50)
    call line % delete()
  end function
end program main
