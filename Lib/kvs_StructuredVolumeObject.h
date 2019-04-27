#include <kvs/StructuredVolumeObject>


extern "C"
{
kvs::StructuredVolumeObject* StructuredVolumeObject_new();
void StructuredVolumeObject_delete( kvs::StructuredVolumeObject* self );
void StructuredVolumeObject_setGridTypeToUniform( kvs::StructuredVolumeObject* self );
void StructuredVolumeObject_setResolution( kvs::StructuredVolumeObject* self, int dimx, int dimy, int dimz );
void StructuredVolumeObject_setVeclen( kvs::StructuredVolumeObject* self, int veclen );
void StructuredVolumeObject_setValues( kvs::StructuredVolumeObject* self, float* values, int nvalues );
}
