#include "kvs_PolygonObject.h"


extern "C"
{

kvs::PolygonObject* PolygonObject_new()
{
    return new kvs::PolygonObject();
}

void PolygonObject_delete( kvs::PolygonObject* self )
{
    delete self;
}

}
