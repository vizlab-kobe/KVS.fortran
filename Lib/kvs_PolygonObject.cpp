#include "kvs_PolygonObject.h"
#include <kvs/Message>


extern "C"
{

kvs::PolygonObject* PolygonObject_new()
{
    kvsMessageDebug() << "PolygonObject_new is called." << std::endl;
    return new kvs::PolygonObject();
}

void PolygonObject_delete( kvs::PolygonObject* self )
{
    kvsMessageDebug() << "PolygonObject_delete is called." << std::endl;
    if ( self ) delete self;
}

}
