#include <kvs/TornadoVolumeData>


extern "C"
{

kvs::TornadoVolumeData* TornadoVolumeData_new();
kvs::TornadoVolumeData* TornadoVolumeData_copy( kvs::TornadoVolumeData* other );
void TornadoVolumeData_delete( kvs::TornadoVolumeData* self );
void TornadoVolumeData_setResolution( kvs::TornadoVolumeData* self, int dimx, int dimy, int dimz );
void TornadoVolumeData_setTime( kvs::TornadoVolumeData* self, int time );
kvs::StructuredVolumeObject* TornadoVolumeData_exec( kvs::TornadoVolumeData* self );

} // end of extern "C"
