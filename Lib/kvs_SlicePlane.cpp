#include <kvs/SlicePlane>
#include <kvs/Message>
#include <kvs/Vector3>
#include <kvs/TransferFunction>


extern "C"
{

kvs::SlicePlane* SlicePlane_new()
{
    return new kvs::SlicePlane();
}

void SlicePlane_delete( kvs::SlicePlane* self )
{
    if ( self ) delete self;
}

void SlicePlane_setPlane( kvs::SlicePlane* self, float* p, float* n )
{
    kvs::Vec3 point( p[0], p[1], p[2] );
    kvs::Vec3 normal( n[0], n[1], n[2] );
    self->setPlane( point, normal );
}

void SlicePlane_setTransferFunction( kvs::SlicePlane* self, kvs::TransferFunction* tfunc )
{
    self->setTransferFunction( *tfunc );
}

kvs::PolygonObject* SlicePlane_exec( kvs::SlicePlane* self, kvs::VolumeObjectBase* volume )
{
    return self->exec( volume );
}

} // end of extern "C"
