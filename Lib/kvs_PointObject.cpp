#include "kvs_PointObject.h"
#include <kvs/Message>


extern "C"
{

kvs::PointObject* PointObject_new()
{
//    kvsMessageDebug() << "PointObject_new is called." << std::endl;
    return new kvs::PointObject();
}

kvs::PointObject* PointObject_copy( kvs::PointObject* other )
{
//    kvsMessageDebug() << "PointObject_copy is called." << std::endl;
    kvs::PointObject* point = new kvs::PointObject();
    point->shallowCopy( *other );
    return point;
}

void PointObject_delete( kvs::PointObject* self )
{
//    kvsMessageDebug() << "PointObject_delete is called." << std::endl;
    if ( self ) delete self;
}

void PointObject_print( kvs::PointObject* self )
{
//    kvsMessageDebug() << "PointObject_print is called." << std::endl;
    self->print( std::cout );
}

void PointObject_read( kvs::PointObject* self, const char* filename )
{
//    kvsMessageDebug() << "PointObject_read is called." << std::endl;
    self->read( std::string( filename ) );
}

void PointObject_write( kvs::PointObject* self, const char* filename )
{
//    kvsMessageDebug() << "PointObject_write is called." << std::endl;
    const bool ascii = true;
    const bool external = false;
    self->write( std::string( filename ), ascii, external );
}

void PointObject_setCoords( kvs::PointObject* self, const float* coords, const int size)
{
  kvs::ValueArray<kvs::Real32> v(coords, size);
  self->setCoords( v );
}

}
