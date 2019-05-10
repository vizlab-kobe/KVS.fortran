#include <kvs/Isosurface>


extern "C"
{
kvs::Isosurface* Isosurface_new();
void Isosurface_delete( kvs::Isosurface* self );
void Isosurface_setIsolevel( kvs::Isosurface* self, float isolevel );
kvs::PolygonObject* Isosurface_exec( kvs::Isosurface* self, kvs::VolumeObjectBase* volume );
}
