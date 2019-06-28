#include <kvs/OrthoSlice>
#include <kvs/Vector3>
#include <kvs/TransferFunction>


extern "C"
{
kvs::OrthoSlice* OrthoSlice_new();
void OrthoSlice_delete( kvs::OrthoSlice* self );
void OrthoSlice_setPlane( kvs::OrthoSlice* self, const float position, const int axis );
void OrthoSlice_setTransferFunction( kvs::OrthoSlice* self, kvs::TransferFunction* tf );
kvs::PolygonObject* OrthoSlice_exec( kvs::OrthoSlice* self, kvs::VolumeObjectBase* volume );
}
