#include <kvs/TornadoVolumeData>
#include <kvs/Vector3>
#include <kvs/StructuredVolumeObject>


extern "C"
{

kvs::TornadoVolumeData* TornadoVolumeData_new()
{
    return new kvs::TornadoVolumeData();
}

kvs::TornadoVolumeData* TornadoVolumeData_copy( kvs::TornadoVolumeData* other )
{
    auto* data = new kvs::TornadoVolumeData();
    data->shallowCopy( *other );
    return data;
}

void TornadoVolumeData_delete( kvs::TornadoVolumeData* self )
{
    if ( self ) delete self;
}

void TornadoVolumeData_setResolution( kvs::TornadoVolumeData* self, int dimx, int dimy, int dimz )
{
    self->setResolution( kvs::Vec3u( dimx, dimy, dimz ) );
}

void TornadoVolumeData_setTime( kvs::TornadoVolumeData* self, int time )
{
    self->setTime( time );
}

kvs::StructuredVolumeObject* TornadoVolumeData_exec( kvs::TornadoVolumeData* self )
{
    return self->exec();
}

} // end of extern "C"
