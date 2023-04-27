#include <kvs/TornadoVolumeData>
#include <kvs/Vector3>


extern "C"
{

kvs::TornadoVolumeData* TornadoVolumeData_new( int dimx, int dimy, int dimz );
kvs::TornadoVolumeData* TornadoVolumeData_copy( kvs::TornadoVolumeData* other );
void TornadoVolumeData_delete( kvs::TornadoVolumeData* self );
void TornadoVolumeData_setTime( kvs::TornadoVolumeData* self, int time );
kvs::StructuredVolumeObject* TornadoVolumeData_exec( kvs::TornadoVolumeData* self );

} // end of extern "C"
