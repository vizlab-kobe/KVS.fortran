#include "kvs_StructuredVolumeObject.h"


extern "C"
{

kvs::StructuredVolumeObject* StructuredVolumeObject_new()
{
    return new kvs::StructuredVolumeObject();
}

void StructuredVolumeObject_delete( kvs::StructuredVolumeObject* self )
{
    delete self;
}
void StructuredVolumeObject_setGridTypeToUniform( kvs::StructuredVolumeObject* self )
{
    self->setGridTypeToUniform();
}

void StructuredVolumeObject_setResolution( kvs::StructuredVolumeObject* self, int dimx, int dimy, int dimz )
{
    self->setResolution( kvs::Vec3u( dimx, dimy, dimz ) );
}

void StructuredVolumeObject_setVeclen( kvs::StructuredVolumeObject* self, int veclen )
{
    self->setVeclen( veclen );
}

void StructuredVolumeObject_setValues( kvs::StructuredVolumeObject* self, float* values, int nvalues )
{
    self->setValues( kvs::ValueArray<float>( values, nvalues ) );
}

}
