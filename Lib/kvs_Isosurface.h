#include <kvs/Isosurface>


extern "C"
{

kvs::Isosurface* Isosurface_new();
void Isosurface_delete( kvs::Isosurface* self );
void Isosurface_setIsolevel( kvs::Isosurface* self, float isolevel );
void Isosurface_setTransferFunction( kvs::Isosurface* self, kvs::TransferFunction* tfunc );
kvs::PolygonObject* Isosurface_exec( kvs::Isosurface* self, kvs::VolumeObjectBase* volume );

} // end of extern "C"
