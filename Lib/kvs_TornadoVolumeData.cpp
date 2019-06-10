#include "kvs_TornadoVolumeData.h"


extern "C"
{

kvs::TornadoVolumeData* TornadoVolumeData_new(int dimx, int dimy, int dimz)
{
    return new kvs::TornadoVolumeData(kvs::Vec3u(dimx, dimy, dimz));
}

void TornadoVolumeData_delete( kvs::TornadoVolumeData* self )
{
    delete self;
}

void TornadoVolumeData_setTime( kvs::TornadoVolumeData* self, int time )
{
    self->setTime(time);
}

kvs::TornadoVolumeData* TornadoVolumeData_copy( kvs::TornadoVolumeData* other )
{
//    kvsMessageDebug() << "TornadoVolumeData_copy is called." << std::endl;
    kvs::TornadoVolumeData* line = new kvs::TornadoVolumeData();
    line->shallowCopy( *other );
    return line;
}
kvs::StructuredVolumeObject* TornadoVolumeData_exec( kvs::TornadoVolumeData* self )
{
  return self->exec();
}
}
