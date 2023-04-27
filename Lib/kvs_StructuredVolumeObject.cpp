#include "kvs_StructuredVolumeObject.h"
#include <kvs/Message>


extern "C"
{

kvs::StructuredVolumeObject* StructuredVolumeObject_new()
{
    return new kvs::StructuredVolumeObject();
}

kvs::StructuredVolumeObject* StructuredVolumeObject_copy( kvs::StructuredVolumeObject* other )
{
    auto* volume = new kvs::StructuredVolumeObject();
    volume->shallowCopy( *other );
    return volume;
}

void StructuredVolumeObject_delete( kvs::StructuredVolumeObject* self )
{
    if ( self ) delete self;
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

void StructuredVolumeObject_updateMinMaxCoords( kvs::StructuredVolumeObject* self )
{
    self->updateMinMaxCoords();
}

void StructuredVolumeObject_updateMinMaxValues( kvs::StructuredVolumeObject* self )
{
    self->updateMinMaxValues();
}

void StructuredVolumeObject_print( kvs::StructuredVolumeObject* self )
{
    self->print( std::cout );
}

void StructuredVolumeObject_read( kvs::StructuredVolumeObject* self, const char* filename )
{
    self->read( std::string( filename ) );
}

void StructuredVolumeObject_write( kvs::StructuredVolumeObject* self, const char* filename )
{
    const bool ascii = true;
    const bool external = false;
    self->write( std::string( filename ), ascii, external );
}

size_t StructuredVolumeObject_numberOfNodes( kvs::StructuredVolumeObject* self )
{
    return self->numberOfNodes();
}

} // end of extern "C"
