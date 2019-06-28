#include <kvs/SlicePlane>
#include <kvs/Vector3>
#include <kvs/TransferFunction>


extern "C"
{
kvs::SlicePlane* SlicePlane_new();
void SlicePlane_delete( kvs::SlicePlane* self );
void SlicePlane_setPlane( kvs::SlicePlane* self, float* p, float* n );
void SlicePlane_setTransferFunction( kvs::SlicePlane* self, kvs::TransferFunction* tf );
kvs::PolygonObject* SlicePlane_exec( kvs::SlicePlane* self, kvs::VolumeObjectBase* volume );
}
