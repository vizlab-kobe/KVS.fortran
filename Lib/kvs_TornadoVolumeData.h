#include <kvs/TornadoVolumeData>
#include <kvs/Vector3>


extern "C"
{
kvs::TornadoVolumeData* TornadoVolumeData_new(int dimx, int dimy, int dimz);
void TornadoVolumeData_delete( kvs::TornadoVolumeData* self );
void TornadoVolumeData_setTime( kvs::TornadoVolumeData* self, int time );
kvs::TornadoVolumeData* TornadoVolumeData_copy( kvs::TornadoVolumeData* other );
kvs::StructuredVolumeObject* TornadoVolumeData_exec( kvs::TornadoVolumeData* self );
}
