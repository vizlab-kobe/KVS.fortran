#include <kvs/HydrogenVolumeData>
#include <kvs/Vector3>
#include <kvs/StructuredVolumeObject>


extern "C"
{

kvs::HydrogenVolumeData* HydrogenVolumeData_new()
{
    return new kvs::HydrogenVolumeData();
}

void HydrogenVolumeData_delete( kvs::HydrogenVolumeData* self )
{
    if ( self ) delete self;
}

void HydrogenVolumeData_setResolution( kvs::HydrogenVolumeData* self, int dimx, int dimy, int dimz )
{
    self->setResolution( kvs::Vec3u( dimx, dimy, dimz ) );
}

kvs::StructuredVolumeObject* HydrogenVolumeData_exec( kvs::HydrogenVolumeData* self )
{
    return self->exec();
}

} // end of extern "C"
