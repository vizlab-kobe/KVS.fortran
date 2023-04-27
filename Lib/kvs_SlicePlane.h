#include <kvs/SlicePlane>


extern "C"
{

kvs::SlicePlane* SlicePlane_new();
void SlicePlane_delete( kvs::SlicePlane* self );
void SlicePlane_setPlane( kvs::SlicePlane* self, float* p, float* n );
void SlicePlane_setTransferFunction( kvs::SlicePlane* self, kvs::TransferFunction* tfunc );
kvs::PolygonObject* SlicePlane_exec( kvs::SlicePlane* self, kvs::VolumeObjectBase* volume );

} // end of extern "C"
