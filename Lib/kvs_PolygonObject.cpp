#include "kvs_PolygonObject.h"
#include <kvs/Message>


extern "C"
{

kvs::PolygonObject* PolygonObject_new()
{
    kvsMessageDebug() << "PolygonObject_new is called." << std::endl;
    return new kvs::PolygonObject();
}

kvs::PolygonObject* PolygonObject_copy( kvs::PolygonObject* other )
{
    kvsMessageDebug() << "PolygonObject_copy is called." << std::endl;
    kvs::PolygonObject* polygon = new kvs::PolygonObject();
    polygon->shallowCopy( *other );
    return polygon;
}

void PolygonObject_delete( kvs::PolygonObject* self )
{
    kvsMessageDebug() << "PolygonObject_delete is called." << std::endl;
    if ( self ) delete self;
}

void PolygonObject_print( kvs::PolygonObject* self )
{
    kvsMessageDebug() << "PolygonObject_print is called." << std::endl;
    self->print( std::cout );
}

void PolygonObject_read( kvs::PolygonObject* self, const char* filename )
{
    kvsMessageDebug() << "PolygonObject_read is called." << std::endl;
    self->read( std::string( filename ) );
}

void PolygonObject_write( kvs::PolygonObject* self, const char* filename )
{
    kvsMessageDebug() << "PolygonObject_write is called." << std::endl;
    const bool ascii = true;
    const bool external = false;
    self->write( std::string( filename ), ascii, external );
}

}
