#include "kvs_RayCastingRenderer.h"
#include <kvs/TransferFunction>


extern "C"
{

kvs::VolumeRendererBase* RayCastingRenderer_new( bool sw )
{
    if ( sw ) { return new kvs::RayCastingRenderer(); }
    return new kvs::glsl::RayCastingRenderer();
}

void RayCastingRenderer_delete( kvs::VolumeRendererBase* self )
{
    if ( self ) delete self;
}

void RayCastingRenderer_setTransferFunction(
    kvs::VolumeRendererBase* self,
    kvs::TransferFunction* tfunc )
{
    self->setTransferFunction( *tfunc );
}

} // end of extern "C"
