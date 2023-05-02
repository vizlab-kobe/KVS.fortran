#include <kvs/OrthoSlice>
#include <kvs/Vector3>
#include <kvs/TransferFunction>
#include <kvs/Message>


extern "C"
{

kvs::OrthoSlice* OrthoSlice_new()
{
    return new kvs::OrthoSlice();
}

void OrthoSlice_delete( kvs::OrthoSlice* self )
{
    if ( self ) delete self;
}

void OrthoSlice_setPlane( kvs::OrthoSlice* self, const float position, const int axis )
{
    self->setPlane( position, kvs::OrthoSlice::AlignedAxis( axis ) );
}

void OrthoSlice_setTransferFunction( kvs::OrthoSlice* self, kvs::TransferFunction* tfunc )
{
    self->setTransferFunction( *tfunc );
}

kvs::PolygonObject* OrthoSlice_exec( kvs::OrthoSlice* self, kvs::VolumeObjectBase* volume )
{
    return self->exec( volume );
}

} // end of extern "C"
