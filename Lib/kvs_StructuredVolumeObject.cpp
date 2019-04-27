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

}

