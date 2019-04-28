#include "kvs_Isosurface.h"


extern "C"
{

kvs::Isosurface* Isosurface_new()
{
    return new kvs::Isosurface();
}

void Isosurface_delete( kvs::Isosurface* self )
{
    delete self;
}

void Isosurface_setIsolevel( kvs::Isosurface* self, float isolevel )
{
    self->setIsolevel( isolevel );
}

}
