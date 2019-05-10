#include "kvs_StructuredVolumeObject.h"
#include <kvs/Message>


extern "C"
{

kvs::StructuredVolumeObject* StructuredVolumeObject_new()
{
    kvsMessageDebug() << "StructuredVolumeObject_new is called." << std::endl;
    return new kvs::StructuredVolumeObject();
}

void StructuredVolumeObject_delete( kvs::StructuredVolumeObject* self )
{
    kvsMessageDebug() << "StructuredVolumeObject_delete is called." << std::endl;
    if ( self ) delete self;
}

void StructuredVolumeObject_setGridTypeToUniform( kvs::StructuredVolumeObject* self )
{
    kvsMessageDebug() << "StructuredVolumeObject_setGridTypeToUniform is called." << std::endl;
    self->setGridTypeToUniform();
}

void StructuredVolumeObject_setResolution( kvs::StructuredVolumeObject* self, int dimx, int dimy, int dimz )
{
    kvsMessageDebug() << "StructuredVolumeObject_setResolution is called." << std::endl;
    self->setResolution( kvs::Vec3u( dimx, dimy, dimz ) );
}

void StructuredVolumeObject_setVeclen( kvs::StructuredVolumeObject* self, int veclen )
{
    kvsMessageDebug() << "StructuredVolumeObject_setVeclen is called." << std::endl;
    self->setVeclen( veclen );
}

void StructuredVolumeObject_setValues( kvs::StructuredVolumeObject* self, float* values, int nvalues )
{
    kvsMessageDebug() << "StructuredVolumeObject_setValues is called." << std::endl;
    self->setValues( kvs::ValueArray<float>( values, nvalues ) );
}

void StructuredVolumeObject_updateMinMaxCoords( kvs::StructuredVolumeObject* self )
{
    kvsMessageDebug() << "StructuredVolumeObject_updateMinMaxCoords is called." << std::endl;
    self->updateMinMaxCoords();
}

void StructuredVolumeObject_updateMinMaxValues( kvs::StructuredVolumeObject* self )
{
    kvsMessageDebug() << "StructuredVolumeObject_updateMinMaxValues is called." << std::endl;
    self->updateMinMaxValues();
}

void StructuredVolumeObject_print( kvs::StructuredVolumeObject* self )
{
    kvsMessageDebug() << "StructuredVolumeObject_print is called." << std::endl;
    self->print( std::cout );
}

void StructuredVolumeObject_read( kvs::StructuredVolumeObject* self, const char* filename )
{
    kvsMessageDebug() << "StructuredVolumeObject_read is called." << std::endl;
    self->read( std::string( filename ) );
}

void StructuredVolumeObject_write( kvs::StructuredVolumeObject* self, const char* filename )
{
    kvsMessageDebug() << "StructuredVolumeObject_write is called." << std::endl;
    const bool ascii = true;
    const bool external = false;
    self->write( std::string( filename ), ascii, external );
}

}
