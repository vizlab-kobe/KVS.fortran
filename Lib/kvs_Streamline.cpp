#include "kvs_Streamline.h"
#include <kvs/VolumeObjectBase>
#include <kvs/PointObject>
#include <kvs/TransferFunction>
#include <kvs/LineObject>
#include <kvs/StructuredVolumeObject>


extern "C"
{

kvs::Streamline* Streamline_new()
{
    return new kvs::Streamline();
}

kvs::Streamline* Streamline_copy( kvs::Streamline* other )
{
    auto* line = new kvs::Streamline();
    line->shallowCopy( *other );
    return line;
}

void Streamline_delete( kvs::Streamline* self )
{
    if ( self ) delete self;
}

void Streamline_setSeedPoints( kvs::Streamline* self, kvs::PointObject* points )
{
    self->setSeedPoints( points );
}

void Streamline_setTransferFunction( kvs::Streamline* self, kvs::TransferFunction* tfunc )
{
    self->setTransferFunction( *tfunc );
}

kvs::LineObject* Streamline_exec( kvs::Streamline* self, kvs::VolumeObjectBase* volume )
{
    return self->exec( volume );
}

} // end of extern "C"
