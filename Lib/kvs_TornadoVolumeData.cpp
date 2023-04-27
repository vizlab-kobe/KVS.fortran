#include "kvs_TornadoVolumeData.h"


extern "C"
{

kvs::TornadoVolumeData* TornadoVolumeData_new(int dimx, int dimy, int dimz)
{
    return new kvs::TornadoVolumeData( kvs::Vec3u( dimx, dimy, dimz ) );
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

void TornadoVolumeData_setTime( kvs::TornadoVolumeData* self, int time )
{
    self->setTime( time );
}

kvs::StructuredVolumeObject* TornadoVolumeData_exec( kvs::TornadoVolumeData* self )
{
    return self->exec();
}

} // end of extern "C"
