#include "kvs_OrthoSlice.h"
#include <kvs/Message>


extern "C"
{

kvs::OrthoSlice* OrthoSlice_new()
{
//    kvsMessageDebug() << "OrthoSlice_new is called." << std::endl;
    return new kvs::OrthoSlice();
}

void OrthoSlice_delete( kvs::OrthoSlice* self )
{
//    kvsMessageDebug() << "OrthoSlice_delete is called." << std::endl;
    if ( self ) delete self;
}

void OrthoSlice_setPlane( kvs::OrthoSlice* self, const float position, const int axis)
{
    self->setPlane(position, kvs::OrthoSlice::AlignedAxis(axis));
}

void OrthoSlice_setTransferFunction( kvs::OrthoSlice* self, kvs::TransferFunction* tf )
{
    self->setTransferFunction(*tf);
}

kvs::PolygonObject* OrthoSlice_exec( kvs::OrthoSlice* self, kvs::VolumeObjectBase* volume )
{
    return self->exec( volume );
}

}
