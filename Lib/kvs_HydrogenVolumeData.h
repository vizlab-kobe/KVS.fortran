#include <kvs/HydrogenVolumeData>


extern "C"
{

kvs::HydrogenVolumeData* HydrogenVolumeData_new();
kvs::HydrogenVolumeData* HydrogenVolumeData_copy( kvs::HydrogenVolumeData* other );
void HydrogenVolumeData_delete( kvs::HydrogenVolumeData* self );
void HydrogenVolumeData_setResolution( kvs::HydrogenVolumeData* self, int dimx, int dimy, int dimz );
kvs::StructuredVolumeObject* HydrogenVolumeData_exec( kvs::HydrogenVolumeData* self );

} // end of extern "C"
