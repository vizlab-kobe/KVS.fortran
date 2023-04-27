#include "kvs_Isosurface.h"
#include <kvs/Message>
#include <kvs/TransferFunction>


extern "C"
{

kvs::Isosurface* Isosurface_new()
{
    return new kvs::Isosurface();
}

void Isosurface_delete( kvs::Isosurface* self )
{
    if ( self ) delete self;
}

void Isosurface_setIsolevel( kvs::Isosurface* self, float isolevel )
{
    self->setIsolevel( isolevel );
}

void Isosurface_setTransferFunction( kvs::Isosurface* self, kvs::TransferFunction* tfunc )
{
    self->setTransferFunction( *tfunc );
}

kvs::PolygonObject* Isosurface_exec( kvs::Isosurface* self, kvs::VolumeObjectBase* volume )
{
    return self->exec( volume );
}

} // end of extern "C"
