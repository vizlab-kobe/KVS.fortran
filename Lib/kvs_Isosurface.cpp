#include "kvs_Isosurface.h"
#include <kvs/Message>


extern "C"
{

kvs::Isosurface* Isosurface_new()
{
    kvsMessageDebug() << "Isosurface_new is called." << std::endl;
    return new kvs::Isosurface();
}

void Isosurface_delete( kvs::Isosurface* self )
{
    kvsMessageDebug() << "Isosurface_delete is called." << std::endl;
    if ( self ) delete self;
}

void Isosurface_setIsolevel( kvs::Isosurface* self, float isolevel )
{
    kvsMessageDebug() << "Isosurface_setIsolevel is called." << std::endl;
    self->setIsolevel( isolevel );
}

}
